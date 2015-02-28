
class SkierLocation {

  String origin, name, movedto;
  float elevation;  
  float elevation1;
  float display, display2;
  float x;
  float y;
  float z; 
  float rotation;
  float turn;
  
  ArrayList<SkierLocation> neighbors = new ArrayList();
  //traveling sales men problem



  void render() {
    pushMatrix();

display = elevation;
name = origin;

if(key =='a' || key == 's' || key == 'd' || key == 'f' || key == 'g' || key == 'h' || key == 'j'){
      display = elevation1;
      name = movedto;
    }if(key == 'z'){
      display = elevation;
    }
    
    translate(x ,y ,display);
    noStroke();
    //println(getElevationChange());
    //fill(map(distanceFromHome),0,1000,0,53),25,120,200);
    fill(30, 160, 255-sqrt(getElevationChange()));
    
    if(mousePressed){
      box(300);}
      else{
    box(100);
  }


    rotateZ(-zr);
    rotateX(-xr);   
    fill(50,255);
    text(name, 100, -10);
    popMatrix();
    
    /*pushMatrix();
    strokeWeight(1.5);
    fill(0);
    stroke(100,100,100,400);
    line(x,y,elevation1,x,y,elevation);
    popMatrix();*/
  }
  
  
    void addNeighbor(SkierLocation newNeighbor) {
     neighbors.add(newNeighbor); 
  }
  
  ArrayList<SkierLocation> getNeighbors() {
     return neighbors; 
  }
  
  float getElevationChange() {
    return elevation1 - elevation; 
  }
  
  int howManyNeighbors() {
    return neighbors.size();
}

  }
  
  








//---------------------------Notes--------------------------
/* Pause to use mouse view places
roll over to see place
key command to show distance
key command to show place (or if you could do both together without
getting an overlap*/




