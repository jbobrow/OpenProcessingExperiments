
void setup() {
 size(400, 200);
 background(255);

}

void draw() {
  background(204);
  float x = mouseX;
    //ground
  smooth();
  stroke(0);
  line(0,151,400,151);
  //handle
  line(x+83,77,x+92,75);
  //upuan
  line(x+22,90,x+35,90); 

  //rear wheel
  fill(0);
  ellipse(x,125,50,50);
  fill(204);
  ellipse(x,125,45,45);
  ellipse(x,125,5,5);
  //front wheel
  fill(0);
  ellipse(x+100,125,50,50);
  fill(204);
  ellipse(x+100,125,45,45);
  ellipse(x+100,125,5,5);
  //body
  stroke(255,0,0);
  line(x,125,x+35,125);
  line(x+27,90,x+35,125);
  line(x+28,100,x,125);
  line(x+35,125,x+90,90);
  line(x+32,113,x+90,83);
  line(x+90,75,x+90,95);
  line(x+90,95,x+100,125);

  //pedal
  stroke(0);
  ellipse(x+35,125,10,10);
  line(x+35,125,x+47,135);
  line(x+44,136,x+49,134);


}

