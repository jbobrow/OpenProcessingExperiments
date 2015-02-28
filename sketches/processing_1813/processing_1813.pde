
int topR = 0;
int topG = 0; 
int topB = 0;
int leftR = 0;
int leftG = 0; 
int leftB = 0;
int rightR = 0;
int rightG = 0; 
int rightB = 0;
int bottomR = 0; 
int bottomG = 0; 
int bottomB = 0;
int exlR = 255; 
int exlG = 20; 
int exlB = 80;
int exrR = 255;
int exrG = 20; 
int exrB = 80;
int exbR = 255;
int exbG = 20; 
int exbB = 80;
int extR = 255;
int extG = 20; 
int extB = 80;

void setup() {
  size(200,200);
}

void draw() {
  background(0);
  noStroke();
  display();
 }


void display() {
  fill(exlR,exlG,exlB); 
  rect(0,height/4+40,20,40);
  rect(20,height/4+60,20,20);
  fill(exrR,exrG,exrB);
  rect(width-20,height/4,20,60);
  fill(exbR,exbG,exbB);
  rect(width/4+40,height-20,40,40);
  rect(width/4+60,height-40,20,20);
  fill(extR,extG,extB);
  rect(width/4,0,100,20);
  fill(topR,topG,topB);
  rect(width/4,height/4-20,40,20);
  rect(width/4+60,height/4-20,40,20);
  rect(width/4+40,height/4,20,20);
  fill(leftR,leftG,leftB);
  rect(width/4,height/4+40,20,20);
  rect(width/4-20,height/4,20,40);
  fill(rightR,rightG,rightB); 
  rect(width/4+80,height/4+40,20,20);
  rect(width/4+100,height/4,20,40);
  fill(bottomR,bottomG,bottomB);
  rect(width/4+20,height/4+60,20,20);
  rect(width/4+60,height/4+60,20,20);
  rect(width/4+40,height/4+80,20,20);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
       topR = 255;
       topG = 20; 
       topB = 80;
       extR = 0; 
       extG = 0; 
       extB = 0; 
    } else if (keyCode == UP) {
       bottomR = 255;
       bottomG = 20; 
       bottomB = 80;
       exbR = 0; 
       exbG = 0; 
       exbB = 0;
    } 
    else if (keyCode == LEFT) {
       rightR = 255;
       rightG = 20; 
       rightB = 80;
       exrR = 0; 
       exrG = 0; 
       exrB = 0; 
    } 
    else if (keyCode == RIGHT) {
       leftR = 255;
       leftG = 20; 
       leftB = 80; 
       exlR = 0; 
       exlG = 0; 
       exlB = 0;  
  }
}
}



