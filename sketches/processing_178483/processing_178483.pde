

ArrayList<Sesame> yummy = new ArrayList(); 

final int COUNT = 200; 
final float X = 200; 
final float Y = 50; 
final float G = 0.02; 

void setup() 
{
  size(900, 700, P3D);
}

void draw() 
{
  gimbap();
   
  for(Sesame scatter : yummy)
  {  
    scatter.vx += 0; 
    scatter.vy += G; 
    scatter.x += scatter.vx; 
    scatter.y += scatter.vy; 

    if(scatter.lifetime>0)
    { 
      translate(0, 0, random(-30, 30));
      stroke(232, 118, 30);
      strokeWeight(8);
      fill(scatter.lifetime); 
      triangle(scatter.x, scatter.y,scatter.x+1,scatter.y-1, scatter.x+2, scatter.y); // draw sesames
      scatter.lifetime -= 5; // decrease lifetime 
    }
  } 
}

void mousePressed() 
{ 
  translate(width/2, height/2);
  
  for(int i = 0; i < COUNT; i++)
  { 
    float r = random(0, TWO_PI); 
    float R = random(0, 80); 
    yummy.add(new Sesame(mouseX-600, -mouseY, R*tan(r), R*cos(r))); 
   } //number of sesames
} 

void gimbap()
{
  background(232, 215, 55);
  lights();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateZ(map(mouseY, 0, height, 0, -PI));
  strokeWeight(50);
  fill(255, 255, 255);
  
  stroke(0);
  drawCylinder(180, 180, 200, 160);// gim
  
  stroke(255);
  drawCylinder(130, 80, 200, 160);// bap
  
  stroke(255, 228, 0);
  drawCylinder(2, 2, 200, 160);// danmuji
  
  stroke(99, 58, 0);
  strokeWeight(20);
  translate(50, 0, 40);
  drawCylinder(7, 7, 200, 160);// R wooung

  stroke(99, 58, 0);
  translate(0, 0, -80);
  drawCylinder(7, 7, 200, 160);// L wooung
  
  stroke(255);
  strokeWeight(10);
  drawCylinder(23, 23, 200, 160);// L eye-white
  
  stroke(0);
  strokeWeight(5);
  drawCylinder(30, 30, 200, 160);// L eye-black
  
  stroke(255);
  strokeWeight(10);
  translate(0, 0, 80);
  drawCylinder(23, 23, 200, 160);// R eye-white
  
  stroke(0);
  strokeWeight(5);
  drawCylinder(30, 30, 200, 160);// R eye-black
  
  stroke(255, 113, 113);
  strokeWeight(60);
  translate(-55, 0, 25);
  drawCylinder(2, 2, 200, 160);// R ham
  
  stroke(255, 113, 113);
  translate(0, 0, -130);
  drawCylinder(2, 2, 200, 160);// L ham
  
  stroke(255, 94, 0);
  strokeWeight(50);
  translate(-50, 0, 38);
  drawCylinder(2, 2, 200, 160);// carrot
  
  stroke(0, 180, 0);
  translate(0, 0, 54);
  drawCylinder(2, 2, 200, 160);// cucumber
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) 
{
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  
  beginShape(QUAD_STRIP);
  for (float i = 0; i < sides+1; i += 0.1) 
  {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
}

class Sesame
{ 
  float x; 
  float y; 
  float vx; 
  float vy; 
  float lifetime = 600; 

  Sesame(float x, float y, float vx, float vy)
  { 
    this.x = x; 
    this.y = y; 
    this.vx = vx; 
    this.vy = vy; 
  } 
} 

