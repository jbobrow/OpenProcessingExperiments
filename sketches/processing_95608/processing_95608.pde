
float dir=1; //direction of change
float tinto=0; //black

void setup(){
  size(450,400); //size of the page
  background(255,0,0); //background color
  frameRate(20); //how fast
  noStroke(); //there are no lines
}

void draw(){
  ellipse(220,220,150,150); //circle 1
  ellipse(155,140,100,100); //circle 2
  ellipse(290,130,100,100); //circle 3
  tinto=tinto+dir*3; //set new color
  if(tinto<0){ //set to 0
    dir=1;
  }
  if(tinto>64){ //set to 64
    dir=-1;
  }
   fill(0,tinto,0); //set of the color
}

