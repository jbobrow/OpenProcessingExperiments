
int patternSeperationX =20;
int patternSeperationY =20;

void setup() {
  size(250,500);
  smooth();

  PImage b;
  b = loadImage("rightist.jpg");
  b.resize(250,500);
  background(b);

  fill(255,255,0,80);
  noStroke();
  triangle(-680,0,250,0,250,280);
  triangle(0,475,35,500,0,500);
  fill(0,100);
  noStroke();
  triangle(0,222,0,255,10,226);
  triangle(10,226,0,255,50,240);
  triangle(0,255,50,240,50,270);
  strokeWeight(3);
  line(0,220,18,180);
  triangle(22,183,5,220,50,235);
  triangle(12,183,0,190,0,210);
  stroke(0,0,255);
  line(0,405,200,500);
  line(0,172,60,175);
  line(60,175,250,195);

   for(int i = 0; i < 250/patternSeperationX; i++){
      for(int j = 3; j < 120/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
}
void draw()
{}
void yourFunction(){
 fill(0,80);
 stroke(0,100);
 strokeWeight(1);
  rect(0,random(40,60),random(15,25),random(15,25));
}

