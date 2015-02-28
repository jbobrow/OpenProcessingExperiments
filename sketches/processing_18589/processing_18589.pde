
void setup()
{
  size(250,250);
  background(#69C9F7);
  frameRate(40);
}
void draw()
{
  smooth();
  noFill();
  strokeWeight(0.4);
  stroke(#FF0000);
  ellipse(random(150),random(150),20,20);
    strokeWeight(0.6);
    ellipse(random(200),random(200),10,10);
    ellipse(random(250),random(250),5,5);
    strokeWeight(0.7);
     stroke(255);
          line (250,250,random(250),random(250));
  translate(100,100);
  rotate(0.5);
}
void mousePressed(){
  background(155);
}

