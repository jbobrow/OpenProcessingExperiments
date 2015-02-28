
void setup()
{
size (450, 300);
}

int r = 300;
int g = 120;
int b = 100;
  

void draw() {
  if (mouseX < 250) {
   r = 90;
   g = 220;
   b = 100;
  
 
  } 
  else {
    r = 200;
    g = 100;
   b  = 60;
  }
  
  println(mouseX);
   if (mouseX > 250) {
     background (200,139,24);
   } else  {
     background (109, 300, 100);
   }
  
  fill(2,200,40);
  rect(180, 180, 100, 50);

  fill(r,g,b);
  line(180, 180, 200, 150);
  
  fill(r,g,b);
  line(280, 180, 260, 150);

  fill(r,g,b);
  ellipse(230, 120, 80, 80);
  
  fill(r,g,b);
  triangle(180, 235, 230, 280, 230, 235);
  
  fill(r,g,b);
  triangle(280, 235, 230, 280, 230, 235);
  
  noFill();
  arc(280, 135, 50, 80, 0, PI/2);
  
  noFill();
  arc(265, 125, 70, 65, 0, PI/2);
  
  noFill();
  arc(152, 170, 70, 10, 0, PI/2);
  
  noFill();
  arc(150, 148, 100, 30, 0, PI/2);
  
  fill(126);
  ellipse(309, 124, 20, 20);
  
  fill(126);
  ellipse(141, 170, 20, 20);
 }



