package com.buskstop.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PremiumStageReservation {

		private int reservationNo; //옵션 번호
		private int stageState; //예약상태 : 0 - 신청가능(거절), 1 - 신청중(수락대기), 2 - 대관완료(수락)
		private String UserId; //예약신청자 ID
		private int establishNo; //사업장번호
		@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
		private Date reservationRegTime;//예약 신청자 신청시간
		
		
		public PremiumStageReservation() {}


		public PremiumStageReservation(int reservationNo, int stageState, String userId, int establishNo,
				Date reservationRegTime) {
			super();
			this.reservationNo = reservationNo;
			this.stageState = stageState;
			UserId = userId;
			this.establishNo = establishNo;
			this.reservationRegTime = reservationRegTime;
		}


		public int getReservationNo() {
			return reservationNo;
		}


		public void setReservationNo(int reservationNo) {
			this.reservationNo = reservationNo;
		}


		public int getStageState() {
			return stageState;
		}


		public void setStageState(int stageState) {
			this.stageState = stageState;
		}


		public String getUserId() {
			return UserId;
		}


		public void setUserId(String userId) {
			UserId = userId;
		}


		public int getEstablishNo() {
			return establishNo;
		}


		public void setEstablishNo(int establishNo) {
			this.establishNo = establishNo;
		}


		public Date getReservationRegTime() {
			return reservationRegTime;
		}


		public void setReservationRegTime(Date reservationRegTime) {
			this.reservationRegTime = reservationRegTime;
		}


		@Override
		public String toString() {
			return "PremiumStageReservation [reservationNo=" + reservationNo + ", stageState=" + stageState
					+ ", UserId=" + UserId + ", establishNo=" + establishNo + ", reservationRegTime="
					+ reservationRegTime + "]";
		}


		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((UserId == null) ? 0 : UserId.hashCode());
			result = prime * result + establishNo;
			result = prime * result + reservationNo;
			result = prime * result + ((reservationRegTime == null) ? 0 : reservationRegTime.hashCode());
			result = prime * result + stageState;
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
			PremiumStageReservation other = (PremiumStageReservation) obj;
			if (UserId == null) {
				if (other.UserId != null)
					return false;
			} else if (!UserId.equals(other.UserId))
				return false;
			if (establishNo != other.establishNo)
				return false;
			if (reservationNo != other.reservationNo)
				return false;
			if (reservationRegTime == null) {
				if (other.reservationRegTime != null)
					return false;
			} else if (!reservationRegTime.equals(other.reservationRegTime))
				return false;
			if (stageState != other.stageState)
				return false;
			return true;
		}
		
}
