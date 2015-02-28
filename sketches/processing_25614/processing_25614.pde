
float sx = 0;
float sy = 0;
float m = 0;
float r = 0;
void setup(){
size(250, 250);
smooth();
rectMode(CENTER);
frameRate(60);
noCursor();
}

void draw(){

  fill(0, 5);
  noStroke();
 ////////////////////////////////////
 rect(0,0, height*2, width*2);
 
 sx = random(1,350);
 sy = random(1,200); 
 m = random(100, 125);
 noFill();
 strokeWeight(random(1,10));
 stroke(random(0,255),random(0,255),random(0,255),random(1,100));
 ellipse(125, 125, sx, sx); 
 
 translate(mouseX, mouseY);

 
 noStroke();
 fill(0, 150);
 float d = dist(mouseX, mouseY, pmouseX, pmouseY);
rotate(r); 
 r += random(-2,1);
 rect(60,60, sy+d*10, sy+d*10);
}
