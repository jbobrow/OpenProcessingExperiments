
int counter;

void setup() {  //setup function called initially, only once
  size(500, 200);
  background(255);  //set background white
  
}

void draw() {  
variableEllipse(mouseX,mouseY,pmouseX,pmouseY);
     }
 void variableEllipse(int x,int y,int px,int py); {
 float r = random(255);
 float s = random(255);
 float t = random(255);
 fill(r,s,t);
 ellipse(x,y,speed);
  }
