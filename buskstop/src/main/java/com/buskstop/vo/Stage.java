package com.buskstop.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Stage implements Serializable{
	private int stageNo;
	private String stageName;
	private String stageLocation;
	private int stageCost;
	private int stageArea;
	private String stageImage;
	private MultipartFile multiImage;
	private String instrument;
	private String stageContent;
	private int stageParking;
	private int stageDrinking;
	private int stageFoodSell;
	private int stageFoodRestriction;
	private int stageReservation;
	private User stageSellerId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date stageRegTime;
	
	public Stage() {
	}

	public Stage(int stageNo, String stageName, String stageLocation, int stageCost, int stageArea, String stageImage,
			MultipartFile multiImage, String instrument, String stageContent, int stageParking, int stageDrinking,
			int stageFoodSell, int stageFoodRestriction, int stageReservation, User stageSellerId, Date stageRegTime) {
		this.stageNo = stageNo;
		this.stageName = stageName;
		this.stageLocation = stageLocation;
		this.stageCost = stageCost;
		this.stageArea = stageArea;
		this.stageImage = stageImage;
		this.multiImage = multiImage;
		this.instrument = instrument;
		this.stageContent = stageContent;
		this.stageParking = stageParking;
		this.stageDrinking = stageDrinking;
		this.stageFoodSell = stageFoodSell;
		this.stageFoodRestriction = stageFoodRestriction;
		this.stageReservation = stageReservation;
		this.stageSellerId = stageSellerId;
		this.stageRegTime = stageRegTime;
	}

	@Override
	public String toString() {
		return "Stage [stageNo=" + stageNo + ", stageName=" + stageName + ", stageLocation=" + stageLocation
				+ ", stageCost=" + stageCost + ", stageArea=" + stageArea + ", stageImage=" + stageImage
				+ ", multiImage=" + multiImage + ", instrument=" + instrument + ", stageContent=" + stageContent
				+ ", stageParking=" + stageParking + ", stageDrinking=" + stageDrinking + ", stageFoodSell="
				+ stageFoodSell + ", stageFoodRestriction=" + stageFoodRestriction + ", stageReservation="
				+ stageReservation + ", stageSellerId=" + stageSellerId + ", stageRegTime=" + stageRegTime + "]";
	}

	public int getStageNo() {
		return stageNo;
	}

	public void setStageNo(int stageNo) {
		this.stageNo = stageNo;
	}

	public String getStageName() {
		return stageName;
	}

	public void setStageName(String stageName) {
		this.stageName = stageName;
	}

	public String getStageLocation() {
		return stageLocation;
	}

	public void setStageLocation(String stageLocation) {
		this.stageLocation = stageLocation;
	}

	public int getStageCost() {
		return stageCost;
	}

	public void setStageCost(int stageCost) {
		this.stageCost = stageCost;
	}

	public int getStageArea() {
		return stageArea;
	}

	public void setStageArea(int stageArea) {
		this.stageArea = stageArea;
	}

	public String getStageImage() {
		return stageImage;
	}

	public void setStageImage(String stageImage) {
		this.stageImage = stageImage;
	}

	public MultipartFile getMultiImage() {
		return multiImage;
	}

	public void setMultiImage(MultipartFile multiImage) {
		this.multiImage = multiImage;
	}

	public String getInstrument() {
		return instrument;
	}

	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}

	public String getStageContent() {
		return stageContent;
	}

	public void setStageContent(String stageContent) {
		this.stageContent = stageContent;
	}

	public int getStageParking() {
		return stageParking;
	}

	public void setStageParking(int stageParking) {
		this.stageParking = stageParking;
	}

	public int getStageDrinking() {
		return stageDrinking;
	}

	public void setStageDrinking(int stageDrinking) {
		this.stageDrinking = stageDrinking;
	}

	public int getStageFoodSell() {
		return stageFoodSell;
	}

	public void setStageFoodSell(int stageFoodSell) {
		this.stageFoodSell = stageFoodSell;
	}

	public int getStageFoodRestriction() {
		return stageFoodRestriction;
	}

	public void setStageFoodRestriction(int stageFoodRestriction) {
		this.stageFoodRestriction = stageFoodRestriction;
	}

	public int getStageReservation() {
		return stageReservation;
	}

	public void setStageReservation(int stageReservation) {
		this.stageReservation = stageReservation;
	}

	public User getstageSellerId() {
		return stageSellerId;
	}

	public void setstageSellerId(User stageSellerId) {
		this.stageSellerId = stageSellerId;
	}

	public Date getStageRegTime() {
		return stageRegTime;
	}

	public void setStageRegTime(Date stageRegTime) {
		this.stageRegTime = stageRegTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((instrument == null) ? 0 : instrument.hashCode());
		result = prime * result + ((stageSellerId == null) ? 0 : stageSellerId.hashCode());
		result = prime * result + stageArea;
		result = prime * result + ((stageContent == null) ? 0 : stageContent.hashCode());
		result = prime * result + stageCost;
		result = prime * result + stageDrinking;
		result = prime * result + stageFoodRestriction;
		result = prime * result + stageFoodSell;
		result = prime * result + ((stageImage == null) ? 0 : stageImage.hashCode());
		result = prime * result + ((stageLocation == null) ? 0 : stageLocation.hashCode());
		result = prime * result + ((stageName == null) ? 0 : stageName.hashCode());
		result = prime * result + stageNo;
		result = prime * result + stageParking;
		result = prime * result + ((stageRegTime == null) ? 0 : stageRegTime.hashCode());
		result = prime * result + stageReservation;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Stage other = (Stage) obj;
		if (instrument == null) {
			if (other.instrument != null)
				return false;
		} else if (!instrument.equals(other.instrument))
			return false;
		if (stageSellerId == null) {
			if (other.stageSellerId != null)
				return false;
		} else if (!stageSellerId.equals(other.stageSellerId))
			return false;
		if (stageArea != other.stageArea)
			return false;
		if (stageContent == null) {
			if (other.stageContent != null)
				return false;
		} else if (!stageContent.equals(other.stageContent))
			return false;
		if (stageCost != other.stageCost)
			return false;
		if (stageDrinking != other.stageDrinking)
			return false;
		if (stageFoodRestriction != other.stageFoodRestriction)
			return false;
		if (stageFoodSell != other.stageFoodSell)
			return false;
		if (stageImage == null) {
			if (other.stageImage != null)
				return false;
		} else if (!stageImage.equals(other.stageImage))
			return false;
		if (stageLocation == null) {
			if (other.stageLocation != null)
				return false;
		} else if (!stageLocation.equals(other.stageLocation))
			return false;
		if (stageName == null) {
			if (other.stageName != null)
				return false;
		} else if (!stageName.equals(other.stageName))
			return false;
		if (stageNo != other.stageNo)
			return false;
		if (stageParking != other.stageParking)
			return false;
		if (stageRegTime == null) {
			if (other.stageRegTime != null)
				return false;
		} else if (!stageRegTime.equals(other.stageRegTime))
			return false;
		if (stageReservation != other.stageReservation)
			return false;
		return true;
	}

	
	
	
}
