
void setup(){
  size(250,250);
  frameRate(60);
  smooth();
  background(255);
}

void draw(){

  
  
  //blue circles
  
  
  noStroke();
ellipse(41.5,41.5,83,83);
fill(71,161,218);

  noStroke();
ellipse(124.5,41.5,83,83);
fill(71,161,218);

  noStroke();
ellipse(207.5,41.5,83,83);
fill(71,161,218);

  noStroke();
ellipse(124.5,124.5,83,83);
fill(71,161,218);

  noStroke();
ellipse(124.5,207.5,83,83);
fill(71,161,218);

  noStroke();
ellipse(41.5,207.5,83,83);
fill(71,161,218);





//orange lines


stroke(253,183,56);
strokeWeight(5);
line(0,41.5,250,41.5);

stroke(253,183,56);
strokeWeight(5);
line(125,0,125,250);

stroke(253,183,56);
strokeWeight(5);
line(125,208.3,0,208.3);

stroke(253,183,56);
strokeWeight(5);
line(41.7,250,41.7,168);


}

