package com.buskstop.vo;

import java.io.Serializable;

public class Follow implements Serializable{

	private String userId;
	private String followerId;
	public Follow() {
	}
	public Follow(String userId, String followerId) {
		this.userId = userId;
		this.followerId = followerId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFollowerId() {
		return followerId;
	}
	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((followerId == null) ? 0 : followerId.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		Follow other = (Follow) obj;
		if (followerId == null) {
			if (other.followerId != null)
				return false;
		} else if (!followerId.equals(other.followerId))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Follow [userId=" + userId + ", followerId=" + followerId + "]";
	}
	
}
