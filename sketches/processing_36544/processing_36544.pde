

     boolean doIt; 
float rx, ry, rx2, ry2, oldrx, oldry, oldrx2, oldry2; 
int mouseclicks, mouseclicks2;

void setup () {
  mouseclicks2=0;
  size (800, 800);
  background(255);
  smooth ();

  doIt = true;
}
void draw () {

  if (doIt) {
    for (int i=0; i<2; i++) {
      float rx=random(0, width);
      float ry=random(0, height);
      float rx1=random(0, width);
      float ry2=random(0, height);
      float rx3=random(0, width);
      float ry3=random(0, height);
      float rx4=random(0, width);
      float ry4=random(0, height);
      fill (200, 25);
      stroke (255);
      strokeWeight (random (2, 5));
      rect (rx, ry, rx2, ry2, rx3, ry3, rx4, ry4);
    }

    for (int i=0; i<mouseclicks; i++) {
      stroke (200);
      strokeWeight (random (2, 5));
      point(random(0, width), random(0, height));
    }
    for (int i=0; i<mouseclicks2; i++) {
      float rx1=random(0, width);
      float ry2=random(0, height);
      float ex=random (5, 10);
      float colorz=random(0, 250);

      noFill ();
      strokeWeight (1);
      stroke (200);
      ellipse (rx1, ry2, ex, ex);

      fill (rx1, colorz, ry2, 50);
      noStroke ();
      ellipse(rx1, ry2, ex, ex);
    }
    for (int i=0; i<15; i++) {
      rx=random(0, width);
      ry=random(0, height);
      rx2=random(0, width);
      ry2=random(0, height);



      float colorz=random(0, 250);
      fill (ry, colorz, rx, colorz);
      noStroke ();
      triangle (rx, ry, rx2, 100, 100, ry2);


      stroke (255);
      strokeWeight(8);
      noFill ();
      triangle (oldrx, oldry, oldrx2, 100, 100, oldry2);


      float cx= ((rx+rx2+100)/3);
      float cy=((ry+ry2+100)/3);



      noFill();
      stroke(random (0, 255));
      strokeWeight (1);

      quad (cx, cy, rx, ry, random (0, width), random (0, height), random (0, width), random (0, height));



      doIt = false;
    }
    for (int i=0; i<75; i++) {
      float rx=random(0, width);
      float ry=random(0, height);
      float rx1=random(0, width);
      float ry2=random(0, height);
      float ex=random (5, 10);  
      fill (255, random (50, 200));
      noStroke ();
      ellipse (rx, ry, ex, ex);

      noFill ();
      stroke (255, 100);
      ellipse (rx1, ry2, ex, ex);
    }

    {
      for (int i=0; i<2; i++) {
        float rx=random(0, width);
        float ry=random(0, height);
        float rx1=random(0, width);
        float ry2=random(0, height);
        float rx3=random(0, width);
        float ry3=random(0, height);
        float rx4=random(0, width);
        float ry4=random(0, height);
         float rx5=random(0, width);
        float ry5=random(0, height);
        float rx6=random(0, width);
        float ry6=random(0, height);
        float colorz=random(0, 250);
        noFill();
        stroke (255);
        rect (rx, ry, rx2, ry2);
        rect (rx3, ry3, rx4, ry4);
        rect (rx5, ry5, rx6, ry6);
      }
    }
  }
}
void mouseClicked() {
  oldrx=rx;
  oldry=ry;
  oldrx2=rx2;
  oldry2=ry2;
  background (255);
  doIt = true;
  mouseclicks=mouseclicks+10;
  mouseclicks2=mouseclicks2+4;
}
           
                
