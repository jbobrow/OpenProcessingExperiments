
//circular motion based off of http://www.openprocessing.org/sketch/106191
int h = 50;
int constant = 24;
float angle = 0.5;
int scalar = 20;
float speed = 0.1;

void setup() {
  background(0);
  size(400,400);
  smooth();
  noStroke();
 

}

void draw() {
  background(0); 
 
 


  for(int i = 0; i <= width; i = i += h) {
  for(int j = 0; j <= height; j = j += h) {
    fill(i,j,mouseX,mouseY);
    stroke(2);
    rect(i,j,h,h);
    }
  }
  
  for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
    fill(0,0,0,200);
    stroke(2);
    ellipse(i,j,h,h);
    }
  }
  
  for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
    fill(255);
    stroke(2);
    ellipse(i,j,h/2,h/2);
    }
  }
  
  //circular motion based off of Heisei from openprocessing.org

   for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
  float x = constant + sin(angle) * scalar;
  float y = constant + cos(angle) * scalar;
  fill(x*20,0,y*10,x+1000);
  ellipse(i+x-23,j+y-25,h/5,h/5);
  angle = angle + speed;
  
  }
   }
  
    for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
    fill(255,0,0,255);
    stroke(2);
    line(i+(mouseX-200),j+(mouseY-200),i,j);
    }
  }
  
 
  
  //green circles
  for(int i = h/2; i <= width+400; i = i += h) {
  for(int j = h/2; j <= height+400; j = j += h) {
    fill(0,0,255,100);
    stroke(2);
    ellipse(i+(mouseX)-200,j+(mouseY)-200,h/2,h/2);
    }
  }
  
  for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
    fill(55,0,0,255);
    stroke(2);
    line(i+(mouseX/2),j+(0),i,j);
    }
  }
  
  for(int i = h/2; i <= width; i = i += h) {
  for(int j = h/2; j <= height; j = j += h) {
    fill(mouseX,0,0,200);
    stroke(2);
    ellipse(i+(mouseY-200),j+(0),h/4,h/4);
    }
  }
  
  
  
  
  
}

void mousePressed() {
  h -= 5;

  
}
 




