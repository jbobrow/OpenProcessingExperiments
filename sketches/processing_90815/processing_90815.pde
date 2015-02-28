
//Jennifer Kang
//jmkang
//©jennifer kang
//Hw_8


int x, y, tX, tY, dia;
void setup ( )
{
  size (400,400);
  background (255);
  dia=20;
  x=20;
  y=20;
  tX=25;
  tY=30;
  loop ();
  frameRate (20);  
  
 

}



void draw() {
  whiletxPhase ( );
  y = ( y + tX ) % height; 
}

void whiletxPhase ( )
{
  int x = 10;
  while (x<width)
  {
    noStroke ( );
    triangle (x-50,y-y/50,width, height/2, dia/20,dia/20);
    line (x+10,y+5,width/10, height/2, dia/2,dia/10);
    fill (random(255), random(255), random(255));
    ellipse (x+2,y+10,dia*.5,dia*.5);
    // rect(x,y,width,height);
    rect (x,y,dia,dia);
    
       ellipse( frameCount%width, mouseY,  mouseX-mouseY, mouseY- mouseX);

    x=x+tX;
  }
}


void keyPressed ( )
{
 if (key == ' '){

   background (255);
 fill (random(255), random(255), random(255) );
 }

}







 // rect (frameCount % width, width/2, 30, 30);




