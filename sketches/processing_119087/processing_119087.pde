
void setup(){
size(500,500);
background(255);
}

void draw(){
  
  background(255);
  fill(255);
  stroke(1);
  line(0,0,height,height);
  line(width,0,0,height);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  noStroke();
  ellipse(width/2,height/2,355,355);
  
  pushMatrix();
 float ecke = map(mouseX, 0, 8, 0, PI/31.1);
 translate(width/2,height/2);
 rotate(ecke);
 fill(127);
 rectMode(CENTER);
 rect(0,-200,50,50);
  rect(200,0,50,50);
  rect(0,200,50,50);
  rect(-200,0,50,50);
  popMatrix();
  
 pushMatrix();
 translate(width/2,height/2);
 fill(75);
 ellipse(0,0,150,150);
 float winkel = map(second(), 0, 8, 0, 2*PI);
 rotate(winkel);
 fill(#96FF74);
 noStroke();
 rectMode(CORNERS);
 rect(0,0,100,2);
 popMatrix();

 
 
 

}
