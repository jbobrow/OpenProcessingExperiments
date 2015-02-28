
void setup(){
  size(500,500);
background(255);
fill(0);
noStroke();
ellipse(width/2,height/2,350,350);
 for (int k=500; k>350; k-=1){
  float f=k-245;
  if(f<256){
  fill(f);
  }
  else{
  fill(255);
  }
  ellipse(width/2,height/2,k,k);
  }
}


void draw(){
   translate(width/2,height/2);
  noStroke();
  fill(127);
  ellipse(0,0,275,275);
  fill(0);
  ellipse(0,0,100,100);
  for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
pushMatrix();
rotate(radians(i)); // Um i rotieren
translate(0, 100); // Um Radius verschieben
rotate(radians(45));
fill(255);
noStroke();
rect(0, 0, 50, 50);
popMatrix();
}

rotate(radians(-90));
fill(#00E8FF);
stroke(#00E8FF);
ellipse(0,0,20,20);
pushMatrix();
 float sec = map(second(), 0, 60, 0, 360);
 rotate(radians(sec));
 strokeWeight(1);
 line(0,0,120,0);
 popMatrix();

pushMatrix();
 float min = map(minute(), 0, 60, 0, 360);
 rotate(radians(min));
  strokeWeight(3);
 line(0,0,100,0);
 popMatrix();
 
 pushMatrix();
 float h = map(hour(), 0, 12, 0, 360);
 rotate(radians(h));
  strokeWeight(5);
 line(0,0,70,0);
 popMatrix();

}
