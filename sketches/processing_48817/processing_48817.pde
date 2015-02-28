
  //author:Robertlun,ncku arch
//purpose: homework. grass
//concept: click mouse to get more  grasses and locate the fruits.
//reference: from the teacher"Sheng-Fen Nik Chien."
  
  float x, y;
  float lastx = -800;
  float lasty = +800;
void setup() {
  size(500,600);
  background(255);
  strokeWeight(2);
  smooth();
  noLoop();
//frameRate(2);

}
 
void draw() {
  strokeWeight(1);
stroke(150);  
fill(random(100,255),10,10);
ellipse( mouseX,mouseY,16,16);
fill(random(100,255),random(50,100),10);
ellipse( mouseX-random(-30,30),mouseY+random(-20,20),10,13);

  float radius = 130;
  int centX = 230;
  int centY = 350;
 
  stroke(20, 120, 50);
  radius = 20;
 
  float radiusNoise = random(20);
  for (float ang=0; ang<=360*4; ang+=2) { 
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*200) - 50;                
    float rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    if (lastx > -800) {
//line(x,y,lastx,lasty);
line(x+10,y+10,x + random(50) - 10, y - 20 - random(60));
stroke(random(10,50), random(150) ,random(25),160);
line(x,y,x + random(10) - 5, y - 20 - random(20));
    }
    lastx = x;
    lasty = y;
   
  }
}


void mousePressed() {
  redraw();
  
      
}


