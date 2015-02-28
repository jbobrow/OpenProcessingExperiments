
PFont Futura;
int h;

void setup () {
  size(640,480);
    background(255);
  strokeWeight(1);
  smooth();
  
  Futura = loadFont("Futura-Medium-45.vlw");
textFont(Futura);
}
void draw () {
noFill();  
stroke(0);


pushMatrix();  
translate(320,240);
fill(255);
ellipse(0,0,80,80);
fill( 0,134,279);
text(h,-10,20);
popMatrix(); 
  
  fill(0);
 
  translate(width/2,height/2);
  if (hour()>12) h = hour() - 12;
  else h=hour();

  
  // rotate  min
    float m = map(minute(), 0, 60, 0, 360);
  rotate(radians(m-90));
  // draw seconds
  pushMatrix();
  translate(125,0);
  rotate(radians(-m));
  fill(255);
  noStroke();
  strokeWeight(5);
  ellipse(0,0,200,200);


for (int s = 0; s<second(); s++){
  float sa = map(s, 0, 60, 0, 360);
  float x = cos(radians(sa)) * 100;
  float y = sin(radians(sa)) * 100;
  stroke(0,137,239,20);

  line(0, 0, x, y);

}

  popMatrix();




}



