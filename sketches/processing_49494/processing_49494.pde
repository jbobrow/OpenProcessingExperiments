
int x = 200;
int y = 200;
int w = 200;
int h = 200;

void setup (){
 size (400, 400);
  smooth ();
  background (255);
 rectMode (CENTER);
 
}


void draw (){
background (255);
 line (200, 0, 200, 400); 
 line (0, 200, 400, 200);
 
 if ((mouseX<x) && (mouseY<y)) {
   
 fill (0);
 rect (x/2, y/2, w/2, h/2);
 
} else if ((mouseX > x) && (mouseY < y )){
  
  fill (0);
  rect (300, 100, 100, 100);
  
} else if ((mouseX < x ) && (mouseY > y)) {
  fill (0);
  rect (100, 300, 100, 100);
}

else if ((mouseX > x) && (mouseY > y)){
 fill (0);
rect (300, 300, 100, 100); 
}

else {
 background (255);
 
}
}

