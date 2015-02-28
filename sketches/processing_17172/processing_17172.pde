
//import processing.pdf.*;
void setup() {
 size(900,900);
 background(255);
 frameRate(10);
}
void draw() {



  noStroke();
  float yPos=0;
  float iterations=100;
  float step=height/iterations;


  // gradient lines in the back
  for (int j=0;j<iterations;j++) {

    if (j%2==0) {
      fill(255);
    }
    else {
      fill(0,255/iterations*j,255);
    }

    rect(0,step*j,width,step);
  }


  // quad in between layers
  float wid=random(1,50);
  float hei=30;
  float sca=12;
  float x1=random(1,width/sca);
  float y1=random(1,height/sca);
  float angle=random(0,PI/2);
  float shift=hei*sin(angle);  

  fill(255,255,255,125);
  quad(sca*x1,sca*y1,   sca*(x1+wid),sca*y1,   sca*(x1+wid)+shift*sca,sca*(y1+hei),   sca*x1,sca*(y1+hei));


  // lines in frot
  for (float k=0;k<=10;k++) {
    
    float yStart=step*int(random(iterations*0.1*k,iterations*0.1*(k+1)));
    yPos=yStart;

    float hei_sub=int(random(2,10));
    float stepnew=step*int(random(1,3));

    for (int l=1;l<hei_sub;l++) {

      if (l%2==0) {
        fill(255);
      }
      else {
        fill(0,255/iterations*l,0);
      }

      rect(0,yPos,width,stepnew);
      yPos=yPos+stepnew;
    }
  }

}

