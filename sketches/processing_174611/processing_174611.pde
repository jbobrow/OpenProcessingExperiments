
int x, y;
int q, w, e;

void setup(){
  size(500, 500);
  background(255);
  smooth(); //<>//
  noStroke();
  q = 0;
  w = 0;
  e = 0;
  
  x = width/2;
  y = height/2;
}

void draw(){
  //background(255);
  //c = 255;
  //stroke(c, random(c), 100, random(c));
  //strokeWeight(1);
  //ellipse(x, y, random(500), random(500));
  //noFill();
}

void mouseMoved(){
  stroke(random(q), random(w), random(e), random(255));
  strokeWeight(1);
  ellipse(x, y, mouseX, mouseY);
  noFill();
}

//void mouseDragged(){
  //c -= 10;
  //if(c < 0){
  //c = 0;
  //}
//}


void keyPressed(){
  
  switch (key){
  case'd':
  background(255);
  break;
  }
  switch (key){
  case'q':
  q=255;
  break;
  }
  switch (key){
  case'w':
  w=255;
  break;
  }
  switch (key){
  case'e':
  e=255;
  break;
  }
}

void mouseReleased(){
  q = 0;
  w = 0;
  e = 0;
}


