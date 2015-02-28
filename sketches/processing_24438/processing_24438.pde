
int z=20;

void setup(){
  size (300, 600);
  background (255);
  smooth ();
}

void draw () {
  
  strokeWeight (15);
  stroke (93, 68, 0, 90);
  line (width, 0, 0, height);
  stroke (93, 68, 0, 80);
  line (width-z, 0, 0+z, height);
  stroke (93, 68, 0, 70);
  line (width-2*z, 0, 0+2*z, height);
  stroke (93, 68, 0, 60);
  line (width-3*z, 0, 0+3*z, height);
  stroke (93, 68, 0, 50);
  line (width-4*z, 0, 0+4*z, height);
  stroke (93, 68, 0, 40);
  line (width-5*z, 0, 0+5*z, height);
  stroke (93, 68, 0, 30);
  line (width-6*z, 0, 0+6*z, height);
  stroke (93, 68, 0, 20);
  line (width-7*z, 0, 0+7*z, height);
  stroke (93, 68, 0, 10);
  line (width-8*z, 0, 0+8*z, height);
  
  stroke (234, 200, 0, 90);
  line (0, 0, width, height);
  stroke (234, 200, 0, 80);
  line (z, 0, width-z, height);
  stroke (234, 200, 0, 70);
  line (2*z, 0, width-2*z, height);
  stroke (234, 200, 0, 60);
  line (3*z, 0, width-3*z, height);
  stroke (234, 200, 0, 50);
  line (4*z, 0, width-4*z, height);
  stroke (234, 200, 0, 40);
  line (5*z, 0, width-5*z, height);
  stroke (234, 200, 0, 30);
  line (6*z, 0, width-6*z, height);
  stroke (234, 200, 0, 20);
  line (7*z, 0, width-7*z, height);
  stroke (234, 200, 0, 10);
  line (8*z, 0, width-8*z, height);  
  
  stroke (93, 68, 0, 10);
  line (width, height/3, 0, height/1.5);
  stroke (93, 68, 0, 20);
  line (width, height/3-z, 0, height/1.5+z);
  stroke (93, 68, 0, 30);
  line (width, height/3-2*z, 0, height/1.5+2*z);
  stroke (93, 68, 0, 40);
  line (width, height/3-3*z, 0, height/1.5+3*z);
  stroke (93, 68, 0, 50);
  line (width, height/3-4*z, 0, height/1.5+4*z);
  stroke (93, 68, 0, 60);
  line (width, height/3-5*z, 0, height/1.5+5*z);
  stroke (93, 68, 0, 70);
  line (width, height/3-6*z, 0, height/1.5+6*z);
  stroke (93, 68, 0, 80);
  line (width, height/3-7*z, 0, height/1.5+7*z);
  stroke (93, 68, 0, 90);
  line (width, height/3-8*z, 0, height/1.5+8*z);
  stroke (93, 68, 0, 100);
  line (width, height/3-9*z, 0, height/1.5+9*z);
  
  stroke (234, 200, 0, 10);
  line (0, height/1.5, width, height/3);
  stroke (234, 200, 0, 20);
  line (0, height/1.5-z, width, height/3+z);
  stroke (234, 200, 0, 30);
  line (0, height/1.5-2*z, width, height/3+2*z);
  stroke (234, 200, 0, 40);
  line (0, height/1.5-3*z, width, height/3+3*z);
  stroke (234, 200, 0, 50);
  line (0, height/1.5-4*z, width, height/3+4*z);
  stroke (234, 200, 0, 60);
  line (0, height/1.5-5*z, width, height/3+5*z);
  stroke (234, 200, 0, 70);
  line (0, height/1.5-6*z, width, height/3+6*z);
  stroke (234, 200, 0, 80);
  line (0, height/1.5-7*z, width, height/3+7*z);
  stroke (234, 200, 0, 90);
  line (0, height/1.5-8*z, width, height/3+8*z);
  stroke (234, 200, 0, 100);
  line (0, height/1.5-9*z, width, height/3+9*z);
  stroke (234, 200, 0, 110);
  line (0, height/1.5-10*z, width, height/3+10*z);
  stroke (234, 200, 0, 120);
  line (0, height/1.5-11*z, width, height/3+11*z);
  stroke (234, 200, 0, 130);
  line (0, height/1.5-12*z, width, height/3+12*z);
  stroke (234, 200, 0, 140);
  line (0, height/1.5-13*z, width, height/3+13*z);
  stroke (234, 200, 0, 150);
  line (0, height/1.5-14*z, width, height/3+14*z);
  stroke (234, 200, 0, 160);
  line (0, height/1.5-15*z, width, height/3+15*z);
  stroke (234, 200, 0, 170);
  line (0, height/1.5-16*z, width, height/3+16*z);
  stroke (234, 200, 0, 160);
  line (0, height/1.5-17*z, width, height/3+17*z);
  stroke (234, 200, 0, 150);
  line (0, height/1.5-18*z, width, height/3+18*z);
  stroke (234, 200, 0, 60);
  line (0, height/1.5-19*z, width, height/3+19*z);
  
  stop ();
  
}

void keyPressed(){
if(key == 's' || key == 'S')
{
endRecord();
}
}

