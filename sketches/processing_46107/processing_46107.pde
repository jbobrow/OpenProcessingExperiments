
import seltar.motion.*;
Motion Pendel1;
Motion Pendel2;
Motion Pendel3;
Motion Pendel4;
Motion Pendel5;
Motion Pendel6;

float r = 35*0.3;
float [] x = new float [100];
float [] y = new float [100];
float [] xspeed = new float [100];
float [] yspeed = new float [100];

void setup()
{
   // frameRate (150);
  size(screen.width,screen.height);  
  Pendel1 = new Motion(width/2,height/2);
  Pendel1.setDamping(0.1);
  Pendel2 = new Motion(width/2,height/2);
  Pendel2.setDamping(0.3);
  Pendel3 = new Motion(width/2,height/2);
  Pendel3.setDamping(0.5);
  Pendel4 = new Motion(width/2,height/2);
  Pendel4.setDamping(0.7);
  Pendel5 = new Motion(width/2,height/2);
  Pendel5.setDamping(0.9);
  Pendel6 = new Motion(width/2,height/2);
  Pendel6.setDamping(1.3);

  smooth();
    noStroke();
      int i = 0;
  while (i< x.length) {  
    x [i] = random (0,0);
    y [i] = random (0,0);
    xspeed [i] = random (2,100);
    yspeed [i] = random (1,10);
    i=i+1;
  }
}

void draw()
{
int i=0;
 while ( i < x.length-1) {
      fill (random(0,255));
      noStroke();
      ellipse (x[i], y[i], r, r);
      stroke(30);
      i=i+1;
   }
   
i=0;
 while ( i < x.length-1) {
       x [i]  = x[i] + xspeed[i];
       y [i] = y[i] + yspeed[i];
         if ((x[i] > width) || (x[i] < 0)) {
    xspeed[i] = xspeed[i] * -1;    
  }
         if ((y [i]> height) || (y[i] < 0)) {
    yspeed[i] = yspeed[i] * -1;
  }
  i=i+1;
}
  if(!mousePressed) background(0);  
        fill (random(0,255),random(0,255),random(0,255) );
      noStroke();
  Pendel1.springTo(mouseX,mouseY);
  Pendel1.move();
  line(mouseX,mouseY,Pendel1.getX(),Pendel1.getY());
  ellipse(Pendel1.getX(),Pendel1.getY(),15+Pendel1.getDistance(),15+Pendel1.getDistance());

  Pendel2.springTo(mouseX,mouseY);
  Pendel2.move();
  line(mouseX,mouseY,Pendel2.getX(),Pendel2.getY());
  ellipse(Pendel2.getX(),Pendel2.getY(),10+Pendel2.getDistance(),10+Pendel2.getDistance());

  Pendel3.springTo(mouseX,mouseY);
  Pendel3.move();
  line(mouseX,mouseY,Pendel3.getX(),Pendel3.getY());
  ellipse(Pendel3.getX(),Pendel3.getY(),7+Pendel3.getDistance(),7+Pendel3.getDistance());

  Pendel4.springTo(mouseX,mouseY);
  Pendel4.move();
  line(mouseX,mouseY,Pendel4.getX(),Pendel4.getY());
  ellipse(Pendel4.getX(),Pendel4.getY(),5+Pendel4.getDistance(),5+Pendel4.getDistance());

  Pendel5.springTo(mouseX,mouseY);
  Pendel5.move();
  line(mouseX,mouseY,Pendel5.getX(),Pendel5.getY());
  ellipse(Pendel5.getX(),Pendel5.getY(),3+Pendel5.getDistance(),3+Pendel5.getDistance());

  Pendel6.springTo(mouseX,mouseY);
  Pendel6.move();
  line(mouseX,mouseY,Pendel6.getX(),Pendel6.getY());
  ellipse(Pendel6.getX(),Pendel6.getY(),1+Pendel6.getDistance(),1+Pendel6.getDistance());

}

