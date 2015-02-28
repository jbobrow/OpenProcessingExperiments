
//by Esther Lui :3

float a = 0;
float b = 0;

void setup() {
  size(400, 200);
  background(247, 255, 255);
    noStroke();
      smooth();
  noiseDetail(14);
}
 
void draw() {

  b = b + 0.2;
  
  b = b + .02;
  if (b > 100) { 
    b = 0; 
  }
  fill(255,255,255, 20);  
  rect(0,0,width,height);  
  fill(0,random(250),random(250), 30);
  ellipse(mouseX,mouseY, 30, random(30));




   
}
 
                 
