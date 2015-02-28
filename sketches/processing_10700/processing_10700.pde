
class Party {
  String name;
  color col;
  int seatCount;
  boolean active;
  String leader;
  String fullname;
  
  Party(String name, int seatCount) {
    this.name = name;
    this.seatCount = seatCount;
    col = color(255); // default to white
    active = false;
  }
  
  Party(String name, int seatCount, String fullname, String leader, color col) {
    this.name = name;
    this.seatCount = seatCount;
    this.fullname = fullname;
    this.leader = leader;
    this.col = col;
    active = false;
  }
  
  public String getPartyName() {
    return name;
  }
  
  public void setSeatCount(int seatCount) {
    this.seatCount = seatCount;
  }
  
  public int getSeatCount() {
    return seatCount;
  }
  
  public void setFullName(String fullname) {
    this.fullname = fullname;
  }
  
  public String getFullName() {
    return fullname;
  }
  
  public void setLeader(String leader) {
    this.leader = leader;
  }
  
  public String getLeader() {
    return leader;
  }
  
  public void setColor(color col) {
    this.col = col;
  }
  
  public color getColor() {
    return col;
  }
  
  public boolean toggleActive() {
    return active = !active;
  }
  
  public void setActive(boolean active) {
    this.active = active;
  }
  
  public boolean isActive() {
    return active;
  }
}

