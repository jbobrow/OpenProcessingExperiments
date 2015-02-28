

void setup () {
  
size (400, 400);
}

void draw () {
  background (203,97,97);
  
float x= mouseX;
float y= mouseY;

fill (106, 4, 144);
noStroke ();
triangle (y-200,x+150, y-240, x+240, y-160, x+240);
fill (106, 4, 144);
triangle (y-160, x+170, y-180,x+170, y-180, x+190) ;
triangle (y-220, x+170, y-240, x+170,y-220, x+190);
fill (0);
ellipse (y-200, x+200,50, 60);

fill (0);
triangle (y-195, x+220, y-195, x+245, y-175,x+ 245);
triangle (y-205, x+220,y-225, x+245, y-205, x+245);
triangle (y-195, x+240, y-195, x+255,y-175, x+255);
triangle (y-205, x+240, y-225, x+255, y-205, x+255);

fill (255, 230, 222);
ellipse (y-160, x+150, 20,20);
ellipse (y-240, x+150, 20, 20);
ellipse ( y-200, x+150, 80, 70);
fill (0);
ellipse (y-180, x+150, 15, 15);
ellipse (y-220, x+150, 15, 15);
fill (255);
ellipse (y-180, x+150, 10, 10);
ellipse (y-220, x+150, 10, 10);
fill (0);
triangle (y-180, x+160, y-220, x+160, y-200, x+180);
fill(255);
triangle (y-185, x+160, y-190, x+160, y-190, x+165);
triangle (y-210, x+160, y-215, x+160, y-210, x+165);
fill (188, 11, 47);
triangle (y-190, x+170, y-210, x+170, y-200, x+180);
}



                
                
