
int i; //iteration variable
float x; //droplet

void setup(){
  size (500,500); //size of the page
  background (57,193,112); //color of the page
  frameRate(3); //how fast the circle comes
  strokeWeight(2); //how wide
}

void draw (){
  stroke(2); //thickness
  if (random(0,1)<0.5) { //pick color
    stroke(0); //black
  } else {
    stroke(130,40,180); //color
  }
  for (i=0;i<10;i++) {
    x = random (0,30); //how big 
      ellipse(random(0,500),random(0,599),x,x); //random
      fill(242,242,105); //color
  }
}

 

 

