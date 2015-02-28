
Snow[] h1 = new Snow[5];
Snow[] h2 = new Snow[6];
Snow[] h3 = new Snow[8];
 
void setup() 
{
  size(600, 600);
  frameRate(30);
   
   
  for (int i=0; i<h1.length; i++) {
      h1 [i] = new Snow(random(600),0, random(10));
  }
    for (int j=0; j<h2.length; j++) {
      h2 [j] = new Snow(random(600),0, random(10));
  }
  for (int k=0; k<h3.length; k++) {
      h3 [k] = new Snow(random(600),0, random(10));
  }
}

void draw() { 
  
  smooth();
  background(0);
  
  for (int i=0; i<h1.length; i++) {
  h1[i].update(); 
  }
  for (int j=0; j<h2.length; j++) {
  h2[j].update();
  }  
  for (int j=0; j<h3.length; j++) {
  h3[j].update();
  }  
} 
 
class Snow { 
  float xpos,ypos, speed; 
  Snow (float x,float y, float s) {  
    xpos = x;
    ypos = y; 
    speed = s; 
  } 
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    noStroke();
  
    ellipse(xpos, ypos, 15,15); 
  } 
} 

