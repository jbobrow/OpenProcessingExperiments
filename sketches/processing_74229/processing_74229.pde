
int x = 100;

void setup (){
size (400, 400, P2D);
smooth (8);
background (255);
}

void draw (){
  
   if (mousePressed) {
    fill(0);
  } else {
    noStroke ();
    fill(255);
  }
  
ellipse (width/2 - 100, height/2, x, x);
ellipse (width/2 + 100, height/2, x, x);
ellipse (width/2, height/2 - 100, x, x);
ellipse (width/2, height/2 + 100, x, x);
  
 
  
  if (dist(width/2, height/2, mouseX, mouseY) < 100) {
    fill (0);
     x= x + 1;
  } else {
    fill (0);
  }
    
  if (dist(width/2, height/2, mouseX, mouseY) > 100) {
    fill (0);
     x= x - 1;
  } else {
    fill (0);
  }  
    
  
ellipse (width/2, height/2, x, x);



}
