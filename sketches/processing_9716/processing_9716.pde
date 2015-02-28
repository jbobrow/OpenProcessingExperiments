
class Node {
  PVector   loc;
  ArrayList rooms;
  
  public Node(float x, float y) {
    loc = new PVector(x*smult,y*smult);
    rooms = new ArrayList();
  }
  
  public void render() {
    fill(0);
    rectMode(CORNER);
    rect(loc.x-5,loc.y-1,10,2);
    rect(loc.x-1,loc.y-5,2,10);
  }
  
  public Room[] getRooms() {
    return (Room[]) rooms.toArray();
  }
  
  public void addRoom(Room r) {
    if (! rooms.contains(r) )
      rooms.add(r);
  }
  
  public String toString() {
    return "Node@"+(loc.x/smult)+","+(loc.y/smult);
  }
}

