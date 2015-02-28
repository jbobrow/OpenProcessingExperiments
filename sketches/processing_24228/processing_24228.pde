
int patternSeperationX = 20;
int patternSeperationY = 20;
int patternX =25;
int patternY =25;

void setup() {
  size(250,500);
  smooth();

  PImage b;
  b = loadImage("leftist.jpg");
  b.resize(250,500);

  background(b);

  noStroke();
  fill(255,255,0,80);
  triangle(-30,-30,250,150,250,250);
  triangle(-30,-30,200,800,350,550);
  triangle(-30,-30,250,50,250,-5);
  strokeWeight(3);
  stroke(45,170,40);
  line(0,220,10,220);
  line(10,220,20,230);
  line(20,230,65,240);
  line(65,240,110,275);
  line(110,275,150,275);
  line(150,275,250,320);
  line(0,20,80,0);
  line(80,1,160,0);
  line(0,20,90,23);
  line(90,23,150,27);
  line(150,27,200,30);
  line(200,30,250,30);
  stroke(0,100);
  strokeWeight(1);
  fill(0,80);
  rect(120,200,50,50);





  for(int i = 0; i < 250/patternSeperationX; i++){
      for(int j = 4; j < 230/patternSeperationY; j++){
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
  rect(0,random(10,20),random(15,25),random(15,25));
  rect(175,70,random(15,25),random(15,25));
}



