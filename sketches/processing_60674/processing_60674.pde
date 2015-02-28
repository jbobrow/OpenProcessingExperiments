

int x1 = 0;
int y1 = 0;
int w1 = 720;
int h1 = 440;

int x2 = 720;
int y2 = 000;
int w2 = 720;
int h2 = 440;


int x3 = 0;
int y3 = 440;
int w3 = 720;
int h3 = 440;

int x4 = 720;
int y4 = 440;
int w4 = 720;
int h4 = 440;


 
void setup() {
  size(1440, 880);

}
 
void draw() {
  background(255,0,0);
  noStroke();
  
  
  if (mouseX >= x1 && mouseX <= x1 + width/2 && mouseY >= y1 && mouseY <= y1 + height/2) {
     fill(0,255,0);
     rect(x1, y1, width/2, height/2);
  }
 
  else if (mouseX >= x2 && mouseX <= x2 + width/2 && mouseY >= y2 && mouseY <= y2 + height/2) {
     fill(0,0,255);
     rect(x2, y2, width/2, height/2);
  }
 
  else if (mouseX >= x3 && mouseX <= x3 + width/2 && mouseY >= y3 && mouseY <= y3 + height/2) {
     fill(0,255,255);
     rect(x3, y3, width/2, height/2);
  }
   
  else if (mouseX >= x4 && mouseX <= x4 + width/2 && mouseY >= y4 && mouseY <= y4 + height/2) {
     fill(255,0,255);
     rect(x4, y4, width/2, height/2);
  }
  
}



