
Bioform [] bf;
int num = 13;

PGraphics graphics;
float posax;
float posay;

float posbx;
float posby;
float poscx;
float poscy;
float posdx;
float posdy;
float posex;
float posey;
float sc0;

float xnoise;
float ynoise;
float inc;
PGraphics graphics2;



void setup() {
  background(#FFFFFF);
  size(500, 500);
  noLoop();
  bf = new Bioform[num];
  for (int i=0;i<num;i++) {
    bf[i]=new Bioform(random(width/2), random(width/2));
  }
  colorMode(HSB, 360, 100, 100);
}



void draw() {

  background(#FFFFFF);
  smooth();
  noStroke();

  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.01;


  posax = random(width/12, (2*width)/3);
  posay =random(height/12, (2*height)/3);

  posbx = random(width/2, (3*width)/4);
  posby =random(height/20, height/4);

  poscx = random(width/12, width/5);
  poscy = random(height/8, (3*height)/5);

  graphics2 = createGraphics(2*width, 2*height, JAVA2D);

  for (int i=0;i<num;i++) {
    bf[i].go(random(width), random(height));
  }



  //  if (posax>width/3 && posay>height/3 || posax>width/2 ||posay>width/2) {
  //    pushMatrix(); 
  //    translate(random(width/2, (3*width)/5), random(height/2, (3*height)/5)); 
  //    scale(.37, .37);  
  //    for (int i=0;i<4;i++) {
  //      
  //
  //
  //      bf0.go();translate(width/4,height/4);
  //      scale(.6, .6);
  //    }
  //    popMatrix(); 
  //
  //    pushMatrix();   
  //   translate(posbx, posby);
  //      scale(.3, .3); 
  //    for (int i=0;i<4;i++) {
  //      
  //        
  //      bf1.go();translate(width/4,height/4);
  //scale(.6, .6);
  //    }
  //    popMatrix();  
  //    pushMatrix();  translate(poscx, poscy);
  //      scale(.2, .2); 
  //    for (int i=1;i<5;i++) {
  //
  //      
  //      bf2.go();translate(width/4,height/4);
  //scale(.6, .6);
  //    }
  //    popMatrix();
  //  } 
  //  else {
  //
  //    pushMatrix();translate(posax, posay);
  //      scale(.5, .5);
  //    for (int i=0;i<4;i++) {
  //      
  //      bf0.go();translate(width/4,height/4);
  //scale(.6, .6);
  //    }
  //    popMatrix();
  //  }
  filter(BLUR, 9);
//  graphics2.beginDraw();
//  graphics2.colorMode(HSB, 360, 100, 100);
//  for (int y = 0; y<height;y++) {
//    for (int x=0;x<width;x++) {
//      float col = map(noise(xnoise, ynoise), 0, 1, 200, 300);
//      float bright = map(noise(xnoise*.2, ynoise*.1), 0, 1, 50, 85);
//      float sat = map(noise(xnoise*.2, ynoise*.1), 0, 1, 50, 85);
//      graphics2.stroke(col, sat, bright);
//      graphics2.point(x, y);
//      xnoise = xnoise + inc;
//    }
//    xnoise = 0;
//    ynoise = ynoise+inc;
//  }
//  graphics2.endDraw();
//  blend(graphics2, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
}
class Bioform {
  PGraphics graphics;
  color colour;
  float [] p1x;
  float [] p1y;
  float [] p2x;
  float [] p2y;
  float [] c1x;
  float [] c1y;
  float [] c2x;
  float [] c2y;



  Bioform(float w, float h) {  

    graphics = createGraphics((int)(1.25*w), (int)h, JAVA2D);
    p1x = new float[5];
    p1x[0] = w/2+random(w/4);
    p1x[1] =w+random(w/4);
    p1x[2] = w/2+random(w/4);
    p1x[3] =random(w/4);
    p1x[4] =random(w/4);


    p1y = new float[5];
    p1y[0] = random(h/4);
    p1y[1] = h/2+random(h/4);
    p1y[2] = h+random(h/4);
    p1y[3] = h/2+random(h/4);
    p1y[4] = h/2+random(h/4);

    colour = color(random(200), 100, 75, 80);
    appear();
  }


  void appear() {
    graphics.beginDraw();
    graphics.smooth();
    graphics.noStroke();
    graphics.colorMode(HSB, 360, 100, 100);
    graphics.fill(colour);
    println("colour value 2 " + colour);
    graphics.beginShape();
    graphics.vertex(p1x[0], p1y[0]);
    for (int i=0;i<5;i++) {

      if (i==0||i==3) { 
        graphics.curveVertex(p1x[i], p1y[i]);    
        graphics.curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);


        graphics.curveVertex(p1x[(i+2)%4], p1y[(i+2)%4]);
      }

      graphics.curveVertex(p1x[i], p1y[i]);
    }
    graphics.endShape(CLOSE);


    graphics.endDraw();
  }

  void go(float x, float y) {
    image(graphics, x, y);
  }
}



void mousePressed()
{
  redraw();
}


