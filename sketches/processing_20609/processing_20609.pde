
/* variable multiple lineas centrales
efrain garcia 
02/02/2011

*/

int xsize = 500;
int ysize = 500;

int hx = xsize/2;
int hy = ysize/2;

void setup () {
  
  size (xsize, ysize);
  background (0);
  smooth();
}

void draw (){
  noStroke();
  rectMode(CENTER);
  //fill(255,50);
  //rect(hx,hy,xsize,ysize);
  
  
 // noStroke();
 


}

void keyPressed () {
 
  if (key == 'k') {
  

strokeWeight (2);
stroke(255,25);
line (0, 0, mouseX,mouseY);
stroke(255,0,0,25);
line (0, ysize, mouseX,mouseY);
stroke(0,255,0,25  );
line (xsize, 0, mouseX,mouseY);
stroke( 0,0, 255,25 );
line (xsize, ysize, mouseX,mouseY);
  
  
}
 stroke(random(255),0,random(0,100),90);
strokeWeight(25);
line(mouseX-5, mouseY ,mouseX+5, mouseY);
line(mouseX, mouseY+5 ,mouseX, mouseY -5 );



  



if (key == 's') {
  
  saveFrame ();
}
}

