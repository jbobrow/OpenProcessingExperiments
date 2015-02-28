
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RPoint puntoA;
float avance;
float ang;
float xoff, moff, aoff;

RShape grp;


void setup() {
  size (900,500);

  RG.init(this);

  smooth();  

  grp=RG.getText("FUR", "BigCaslon.ttf", 300, CENTER);
}



void draw() {
  background(0);
  fill(0,0,0,5);
  noStroke();
   rect(0,0,width,height);
  translate(width/2,height/2+100);
   RG.shape(grp);

aoff = aoff + 0.01;

float advance = map(noise(aoff), 0,1, 0.0001, 0.003);

  for(float t=0; t<0.999; t+=advance) {

    puntoA = grp.getPoint(t);
    // fill(255);
    for(int i=0; i<3;i++) {
      //ellipse(puntoA.x, puntoA.y, 10,10);

      xoff = xoff+0.1;
      moff = moff+0.1;

      stroke(abs(sin(noise(xoff)*3)*255),abs(cos(noise(xoff)*1.5)*255),abs(tan(noise(xoff)*1.1)*255));
      //println(abs(sin(xoff)*150));
      pushMatrix();

      RPoint tang = grp.getTangent(t);

      translate(puntoA.x, puntoA.y);

      ang=atan2(tang.y,tang.x);

      float variacionAng = map(noise(xoff/10.0), 0.0, 1.0, -50.0 , 50.0);

      rotate(ang+radians(variacionAng));
      // println(ang+radians(variacionAng));
      // println(noise(xoff));
      
      float _l = map(noise(xoff), 0, 1, 0,20);
      float _n = map(noise(xoff), 0, 1,  2, 7);
      

      raiz(_l, _n);
    
      popMatrix();
    }
  }
}

void raiz (float _l, float _n) {

  if (_n<=0) {
    return;
  }
  float ang=5;
  line (0,0,0,_l);

  pushMatrix();
  translate(0,_l);
  rotate(PI/(3+(random(3,7)) ));
  raiz(_l, _n-1);
  popMatrix();

  pushMatrix();
  translate(0,_l);
  rotate(-PI/(3+ (random(3,7)) ) );
  raiz(_l, _n-1);

  popMatrix();
  //noLoop();
  //  println("doingit"+random(1,5));
}


