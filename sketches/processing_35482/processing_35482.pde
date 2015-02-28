
void setup () {
  
  size (500,500);
  
}

void draw () {
  
background (0);
smooth ();
strokeWeight (50);
stroke (86,149,69);
fill (249,250,124);
ellipse (250,250,450,450);

fill (255,0,141);
stroke (0);
strokeWeight (10);

ellipse(mouseX, mouseY,150,150);

float x = mouseX;
float y = mouseY;

line (x+10,y+0,x+10,y+40);
strokeWeight (15);
stroke (255);
fill (0);
triangle (x+100,y+100,x+50,y+150,x+150,y+250);
}     
                
