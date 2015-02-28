

int patternSeperationX = 18;
int patternSeperationY = 18;

void setup() {
  size(250,500);
  smooth();

  PImage b;
  b = loadImage("leftist2.jpg");
  b.resize(250,500);
  background(b);

  noStroke();
  
  
  fill(255,255,0,80); 
  triangle(-185,0,250,0,500,200);
  triangle(-180,60,250,300,300,600);
  triangle(0,420,0,500,50,500);

  stroke(1);
  strokeWeight(3);
  stroke(0,0,255);
  line(0,200,20,195);
  line(18,195,200,180);
  line(200,180,250,180);
  line(0,200,30,220);
  line(30,220,120,220);
  line(120,220,250,230);
  line(250,250,35,280);
  line(35,280,100,290);
  line(100,290,160,290);
  line(160,290,200,270);
  line(200,270,250,275);
  stroke(35,170,40);
  line(0,320,20,320);
  line(20,320,250,430);
  line(0,30,50,32);line(50,32,70,35);
  line(70,35,100,30);line(100,30,120,28);
  line(120,28,200,10);line(200,10,225,8);
  line(225,8,250,0);line(0,0,30,0);
  line(30,0,50,5);line(50,5,140,5);
  line(140,5,160,0);line(160,0,180,0);
  line(180,0,230,5);






  for(int i = 0; i < 300/patternSeperationX; i++) {
    for(int j = 5; j < 175/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
  }
}
void draw()
{
}
void yourFunction() {
  strokeWeight(1);
  stroke(0,100);
 fill(0,80);
  rect(0,random(0,20),random(10,20),random(10,50));
}






