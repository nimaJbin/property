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



}
