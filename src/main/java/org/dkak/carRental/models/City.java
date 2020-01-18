package org.dkak.carRental.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.ws.rs.Path;


@Entity
@Table(name = "city")
@Path("city")
public class City {
	
	@Id
	@Column(name="CITY_ID")
	private String id;
	@Column(name="CITY_NAME")
	private String name;
	
	 
	public City() {
		
	}
	
	public City(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	@OneToMany(mappedBy="city")
    private List<Store> stores = new ArrayList<Store>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
