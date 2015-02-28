
void setup(){
  background(0);
  size(101,101); //the extra pixel to each side is just so you can see the stroke on the shapes on the edges. When it's 100x100 you don't see it.
  smooth();

  //here begins the grid of shapes 
  for (int i=0; i<4; i++){ //4 shapes in either direction fills the canvas
    pushMatrix(); //saves the translated state
    for(int j=0; j<4; j++){
      makeShape();
      translate(0,25); //moves it down
    }
    popMatrix(); //takes us back to the last pushMatrix
    translate (25,0); //moves it over
  }    
}

void makeShape(){//the shape to play with. I doodled in on graph paper and translated that into coordinates here
  beginShape();
  vertex(5,0);
  vertex(5,20);
  vertex(10,20);
  vertex(10,5);
  vertex(15,0);
  vertex(20,0);
  vertex(25,5);
  vertex(25,20);
  vertex(20,25);
  vertex(20,5);
  vertex(15,5);
  vertex(15,20);
  vertex(10,25);
  vertex(5,25);
  vertex(0,20);
  vertex(0,5);
  vertex(5,0);
  endShape();
}
