
int z=20;


void setup(){
  size (300, 600);
  background (255);
  smooth ();
  noStroke ();
}

void draw (){

 fill (27, 228, 188, 60);
 triangle (0, 0, width/2, height, width, 0);
 fill(27, 228, 188, 20);
 triangle (z, z, width/2, height, width-z, z);
 fill(27, 228, 188, 30);
 triangle (2*z, 2*z, width/2, height, width-2*z, 2*z);
 fill(27, 228, 188, 40);
 triangle (3*z, 3*z, width/2, height, width-3*z, 3*z);
 fill(27, 228, 188, 50);
 triangle (4*z, 4*z, width/2, height, width-4*z, 4*z);
 fill(27, 228, 188, 60);
 triangle (5*z, 5*z, width/2, height, width-5*z, 5*z);
 fill(27, 228, 188, 70);
 triangle (6*z, 6*z, width/2, height, width-6*z, 6*z);
 fill(27, 228, 188, 80);
 triangle (7*z, 7*z, width/2, height, width-7*z, 7*z);
 
 fill (93, 68, 0, 80);
 triangle (0, height, 0, 0, width/2, height);
 fill (93, 68, 0, 20);
 triangle (0, height-z, 0, 0, width/2-z, height-z);
 fill (93, 68, 0, 30);
 triangle (0, height-2*z, 0, 0, width/2-2*z, height-2*z);
 fill (93, 68, 0, 40);
 triangle (0, height-3*z, 0, 0, width/2-3*z, height-3*z);
 fill (93, 68, 0, 50);
 triangle (0, height-4*z, 0, 0, width/2-4*z, height-4*z);
 fill (93, 68, 0, 60);
 triangle (0, height-5*z, 0, 0, width/2-5*z, height-5*z);
 fill (93, 68, 0, 70);
 triangle (0, height-6*z, 0, 0, width/2-6*z, height-6*z);
 fill (93, 68, 0, 80);
 triangle (0, height-7*z, 0, 0, width/2-7*z, height-7*z);
 
 fill (93, 68, 0, 80);
 triangle (width, height, width, 0, width/2, height);
 fill (93, 68, 0, 20);
 triangle (width, height-z, width, 0, width/2+z, height-z);
 fill (93, 68, 0, 30);
 triangle (width, height-2*z, width, 0, width/2+2*z, height-2*z);
 fill (93, 68, 0, 40);
 triangle (width, height-3*z, width, 0, width/2+3*z, height-3*z);
 fill (93, 68, 0, 50);
 triangle (width, height-4*z, width, 0, width/2+4*z, height-4*z);
 fill (93, 68, 0, 60);
 triangle (width, height-5*z, width, 0, width/2+5*z, height-5*z);
 fill (93, 68, 0, 70);
 triangle (width, height-6*z, width, 0, width/2+6*z, height-6*z);
 fill (93, 68, 0, 80);
 triangle (width, height-7*z, width, 0, width/2+7*z, height-7*z);
 
 stop (); 

}

void keyPressed(){
if(key == 's' || key == 'S')
{
endRecord();
}
}

