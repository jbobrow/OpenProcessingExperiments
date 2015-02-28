
int x = 100;
int s = 2;

void setup (){
size (400, 400, P2D);
smooth (8);

background (255);
}

void draw (){
if (mouseY < 200 && mouseX > 200)
{
  background (17, 10, 255);
  } else if (mouseY >200 && mouseX <200) {
  background (7, 240, 222);
  }
  else {
  background (255);
  }
  
   if (mousePressed) {
    fill(200);
      x= x + 1;
      
  strokeWeight (s = s+2); 
  } else {
    fill(205, 203, 50, 0.4);
    strokeWeight (s);

  }

fill(214, 234, 0, 130); 
ellipse (width/2, height/2, x, x);






}
