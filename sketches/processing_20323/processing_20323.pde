
/* variable multiple examples 2
efrain garcia 
junary 27 2011

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
 
 stroke (random (0,200),random (200),random (150,255)  );
strokeWeight (3);
//horizontal lines
line (mouseX-10, mouseY+10 ,mouseX-10, mouseY-5  );

line (mouseX+10, mouseY+10 ,mouseX+10, mouseY-5  );
//vertical down lines
line (mouseX, mouseY+ 15, mouseX-10, mouseY+10  );

line (mouseX, mouseY+ 15, mouseX+10, mouseY+10 ); 
//vertical up lines
line (mouseX, mouseY- 10, mouseX-10, mouseY-5  );

line (mouseX, mouseY-10, mouseX+10, mouseY-5 ); 



 stroke (255,20  );
strokeWeight (1);
fill( 255, random(255), random(255)   );
line (mouseX, mouseY, 40,40);
fill( 255, random(255), random(255)   );
line (mouseX, mouseY,30, 30);
fill( random(255),random(250) , 255  );
line (mouseX, mouseY, 30, 30 );
fill( 0, 255, random(250)   );
line (mouseX, mouseY, 15, 15 ); 


if (key == 's') {
  
  saveFrame ();
}
}

                
                
