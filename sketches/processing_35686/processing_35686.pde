
size(640,450);
smooth();
ellipseMode(CENTER);

background(255);

//neck
pushMatrix();
translate(width/2, height/2);
fill(255,200,180);
rect(-40,0,80,height);
popMatrix();

//feature
pushMatrix();
translate(width/2, height/2);
stroke(0);
fill(255,200,180);
ellipse(0,0,300,400);
popMatrix();

//right eye
pushMatrix();
translate(width/2-70, height/2);
rotate(-PI/10);
strokeWeight(5);
line(-20,-30,20,-30);
stroke(0);
fill(255);
ellipse(0,20,50,30);
noStroke();
fill(0);
ellipse(0,20,30,30);
popMatrix();

//left eye
pushMatrix();
translate(width/2+70, height/2);
rotate(PI/10);
strokeWeight(5);
stroke(0);
line(-20,-30,20,-30);
stroke(0);
fill(255);
ellipse(0,20,50,30);
noStroke();
fill(0);
ellipse(0,20,30,30);
popMatrix();

//mouth
pushMatrix();
translate(width/2, height/2+130);  
stroke(255,100,100);
fill(100,0,0);
ellipse(0,0,50,10);
popMatrix();

//nose
pushMatrix();
noStroke();
fill(128,100,90);
translate(width/2,height/2+30);
triangle(0,0,0,50,5,40);
popMatrix();

//hair
pushMatrix();
translate(width/2, height/2);
strokeWeight(1);
noFill();
stroke(0);

for(int i=0; i<1000; i++) {
  float theta = i*PI/1000;
  float dx = cos(theta);
  float dy = 800*cos(theta)*cos(theta)*cos(theta)*cos(theta)-200;
  beginShape();
  curveVertex(150*dx,-200*sin(theta));
  curveVertex(150*dx,-200*sin(theta));
  curveVertex(150*dx,dy/4);
  curveVertex(200*dx,dy);
  curveVertex(200*dx,dy);
  endShape();
}
popMatrix();

pushMatrix();
translate(width/2+100,height/2-100);
fill(255,128,0);
noStroke();
ellipse(0,0,30,30);
int num=10;
fill(255,255,0);
for(int i=0; i<num; i++) {
  ellipse(20*cos(i*TWO_PI/num),20*sin(i*TWO_PI/num),10,10);
}

popMatrix();

