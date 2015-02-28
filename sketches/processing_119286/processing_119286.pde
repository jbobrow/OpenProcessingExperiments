
void setup() 
 {
       size(500, 500);
 }

  
  
  void draw()
{
background(0);
stroke(255);


fill(62, 62, 57);
noStroke();
ellipse(250, 250, 400, 400); 
fill(194, 252, 59);
ellipse(250, 50, 10, 10);
ellipse(450, 250, 10, 10);
ellipse(250, 450, 10, 10);
ellipse(50, 250, 10, 10);

stroke(255);
line(250, 250, mouseX, mouseY);



//links oben
stroke(255);
line(50, 50, 250, 50);
line(50, 75, 250, 75);
line(50, 100, 250, 100);
line(50, 125, 250, 125);
line(50, 150, 250, 150);
line(50, 175, 250, 175);
line(50, 200, 250, 200);
line(50, 225, 250, 225);
//rechts unten
line(250, 275, 450, 275);
line(250, 300, 450, 300);
line(250, 325, 450, 325);
line(250, 350, 450, 350);
line(250, 375, 450, 375);
line(250, 400, 450, 400);
line(250, 425, 450, 425);
line(250, 450, 450, 450);

}
