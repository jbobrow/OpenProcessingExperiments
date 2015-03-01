
float a=0;
float b=0;
float c=0;


void setup(){
  size(500,500);
  background(0);

}

void draw(){  
 colorMode(HSB,360,100,100);
//spiral square
  translate(height/2,width/2);
  rotate(radians(a));
  stroke(random(255),random(255),random(255));
  strokeWeight(0.5);
  noFill();
  rectMode(CENTER);
  rect(0,0,a,a);
a+=.5;
//after the center spiral(a) is larger than the screen size, circles, and dots go into effect
if (a > 500){
  smooth();
  noStroke();
 //setup for fading background
  fill(0,10);
  rect(0,0,width,height);
  fill(random(255),random(255),random(255));
  ellipse(random(width),random(height),10,10);
 //causes the rotating spirals
  translate(width,height/2);
  rotate(radians(b));
  noFill();
  stroke(random(255),random(255),random(255));
  strokeWeight(1);
  ellipse(250,250,b,b);
  b+=1;
  }
  // starts after (b)/circles is greater than 500, starts the second set of spining squares
  if (b>500){
    strokeWeight(.75);
    stroke(random(255),random(255),random(255));
    noFill();
    rectMode(CENTER);
    rect(250,250,c,c);
    translate(width,height/2);
    rotate(radians(c));
    c+=1.5;
  }
   
}



