<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Restserver\Libraries\REST_Controller;

require APPPATH . '/libraries/REST_Controller.php';


class Api extends \Restserver\Libraries\REST_Controller
{


	public function __construct()
	{
		parent::__construct();
		header("Access-Control-Allow-Origin: *");
		$this->load->model('property');
	}



	public function create_post()
	{

		$this->load->library('form_validation');

		$this->form_validation->set_rules('house_name_number', 'house_name_number', 'required|trim');
		$this->form_validation->set_rules('postcode', 'postcode', 'required|trim');


		if ( ! $this->form_validation->run() ) {

			$this->form_validation->set_error_delimiters('', '');

			$this->answer(false,400, validation_errors());

		} else {

			$houseNameNumber = $this->input->post('house_name_number');
			$postCode = $this->input->post('postcode');
			$time = time();


			if ( $propertyId = $this->property->save( 'property', ['createdAt' => $time]) )
			{

				$inputData = [
					'propertyId' 		=> $propertyId,
					'house_name_number' => $houseNameNumber,
					'postcode' 			=> $postCode
				];

				$result = $this->property->save( 'address', $inputData);


				if ($result)
				{
					$data = [
						'id' 		=> $result,
						'createdAt' => $time,
						'owners' 	=> '',
						'address' 	=> [
							'house_name_number' => $houseNameNumber,
							'postcode' 			=> $postCode,
						]];


					$this->answer(true,201, 'Property was created.', $data);

				} else {
					$this->answer(false,400, 'Error recording information, try again.');
				}
			} else {
				$this->answer(false,400, 'Database Not Available.');
			}
		}
	}



	public function show_get()
	{
		$id = $this->get('id');

		$result = $this->property->get($id);


		if ($result) {
			$data = [
				"id" => $result->id,
				"createdAt" => $result->createdAt,
				'owners' => '',
				'address' =>
					[
						"house_name_number" => $result->house_name_number,
						"postcode" => $result->postcode,
					]
			];

			$this->answer(true,200, 'Selected property', $data);
		} else {
			$this->answer(false,404, 'Not found.');
		}
	}



	public function all_get()
	{
		$props = $this->property->all();
		$data = array();

		foreach ($props as $prop) {

			$propertyData = [
				"id" => $prop->id,
				"createdAt" => $prop->createdAt,
				'owners' => '',
				'address' =>
					[
						"house_name_number" => $prop->house_name_number,
						"postcode" => $prop->postcode,
					]
			];

			array_push($data, $propertyData);
		}


		$this->answer(true, 200 , 'All Property', $data);
	}



	public function delete_delete($id)
	{
		$result = $this->property->delete($id);


		if ($result) {
			$this->answer(true,200, 'Deleted');
		} else {
			$this->answer(false, 404,'Not found.');
		}
	}



	public function update_put($id)
	{

		$houseName = $this->put('house_name_number');
		$postCode = $this->put('postcode');


		$data = [];

		if (!empty($houseName)) {
			$data['house_name_number'] = $houseName;
		}

		if (!empty($postCode)) {
			$data['postcode'] = $postCode;
		}


		$result = $this->property->update($id, $data);

		if ($result) {
			$this->answer(true,200, 'Updated', $data);
		} else {
			$this->answer(false,404, 'Not found.');
		}
	}



	public function answer($success, $http_code, $message = '', $data = '')
	{

		$answer = ['success' => $success, 'message' => $message, 'data' => $data];
		$this->set_response($answer, $http_code);

	}

}
