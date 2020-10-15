<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Property extends CI_Model

{

	public function save( $table, $data )
	{
		$result = $this->db->insert($table, $data);
		return $result ? $this->db->insert_id() : false;
	}



	public function get( $id )
	{
		$this->db->select( "property.*, address.*, property.id as id, address.id as propId" );
		$this->db->where( "property.id", $id );
		$this->db->from('property');
		$this->db->join('address', 'address.propertyId = property.id' );

		return $this->db->get()->row();
	}


}
