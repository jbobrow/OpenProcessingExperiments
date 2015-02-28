

PImage img;  
float deg = 0;
float degDelta = 0;
float degDeltaMax = 20;


void setup() {
  size(500,500);
  img = loadImage("5.jpg");
    strokeWeight(20.0);
  stroke(255, 100);
}

void draw() {
  background(0);
  image(img,0,0);
  
 
 pushMatrix();
 fill(#000000);
 
  translate(width/2, height/1.75);
  rotate(radians(deg));
  rectMode(CENTER);
  arc(-10, 0, 150, 150, -PI, 0);
  scale(-1, -1);
  arc(-10, 0, 150, 150, -PI, 0);
  popMatrix();
  
  if(mousePressed){
    if(degDelta<degDeltaMax){
      degDelta += 0.18;
    }
    else if(degDelta>degDeltaMax){
      degDelta=degDeltaMax;
    }
  }
  else{
    if(degDelta>0){
      degDelta -= 0.10;
    }
    else if (degDelta<0){
      degDelta=0;
    }
  }
  
  deg += degDelta;
  println(degDelta);
 

}

  




