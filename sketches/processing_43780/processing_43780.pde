

int r = 63;
float [] xpos = new float [50];
float [] ypos = new float [50];
float [] xspeed = new float [50];
float [] yspeed = new float [50];


void setup () {
 // frameRate (60);
  size (700,700);
//  smooth ();
  noStroke();
  
  int i = 0;
  while (i< xpos.length) {  
    xpos [i] = random (0,300);
    ypos [i] = random (0,300);
    xspeed [i] = random (2,5);
    yspeed [i] = random (1,4);
    i=i+1;
  }
}
  

void draw () {
 background (255);
  
int i=0;
 while ( i < xpos.length-1) {
      fill (255-i*4,xpos[i]/3-i*2, ypos[i]/3-i*3);
      noStroke();
      ellipse (xpos[i], ypos[i], r, r);
      stroke(127);
      line (0,0,xpos[i], ypos[i]);
      line (0,700,xpos[i], ypos[i]);
      line (700,700,xpos[i], ypos[i]);
      line (700,0,xpos[i], ypos[i]);
      i=i+1;
   }
   
i=0;
 while ( i < xpos.length-1) {
       xpos [i]  = xpos[i] + xspeed[i];
       ypos [i] = ypos[i] +yspeed[i];
         if ((xpos[i] > width) || (xpos[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;    
  }
         if ((ypos [i]> height) || (ypos[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
  i=i+1;
}
}
   


