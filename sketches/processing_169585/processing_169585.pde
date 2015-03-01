
void setup() {
 size(500,500);
background(255);
smooth();
}

void draw() {
pushMatrix();
  fill(255,50);
  noStroke();
  ellipse(width/2,height/2,25,25);
  popMatrix();
  
  pushMatrix();
fill(150,50,150,1);
stroke(0);
 translate(width/2,height/2);
 float Stunde=map(hour(),0,23,0,2*PI);
 rotate(Stunde);
 ellipseMode(CENTER);
ellipse(0,0,80,480); 
popMatrix();
 
 pushMatrix();
  //background(255);
  fill(160,20,160,10);
 stroke(0);
 translate(width/2,height/2);
 float sekunde=map(second(),0,59,0,2*PI);
 rotate(sekunde);
 ellipseMode(CENTER);
ellipse(0,0,30,250); 
popMatrix();


pushMatrix();
fill(200,50,50,10);
stroke(0);
 translate(width/2,height/2);
 float Minute=map(minute(),0,59,0,2*PI);
 rotate(Minute);
 ellipseMode(CENTER);
ellipse(0,0,100,350); 
popMatrix();

pushMatrix();
  strokeWeight(2);
  translate(width/2,height/2);
 float stunde=map(hour(),0,23,0,2*PI);
 strokeCap(ROUND);
  stroke(255,20);
  rotate(stunde);
  line(0,0, 0, -240);
  popMatrix();

pushMatrix();
  strokeWeight(2);
  translate(width/2,height/2);
 float ninute=map(minute(),0,59,0,2*PI);
 strokeCap(ROUND);
  stroke(255,15);
  rotate(ninute);
  line(0,0, 0, -175);
  popMatrix();

pushMatrix();
  strokeWeight(2);
  translate(width/2,height/2);
 float Sekunde=map(second(),0,59,0,2*PI);
 strokeCap(ROUND);
  stroke(255,15);
  rotate(Sekunde);
  line(0,0, 0, -125);
  popMatrix();
/*  
   float kreis=map(mouseX,1,12,0,2*PI);
  rotate(kreis);
  pushMatrix();
  ellipseMode(CENTER);
  fill(202,30,170);

  ellipse(475,height/2,30,30);
  popMatrix();
  */

}

