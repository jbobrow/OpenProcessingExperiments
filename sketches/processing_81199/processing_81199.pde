
Bioform bf0;
Bioform bf1;
Bioform bf2;
Bioform bf3;
Bioform bf4;
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
 
 
void setup() {
  background(0);
  size(400, 400);
   
    smooth();
    noStroke();
    fill(#FFFFFF, 50);
    colorMode(HSB, 360, 100, 100);
 
  bf1 = new Bioform(width, height);
  bf2 = new Bioform(width, height);
  bf3 = new Bioform(width, height);
 
  bf0 = new Bioform(width, height);
  //  float w = width;
  //float h = height;
}
 
void draw() {
  posax = random((5*width)/52);
  posay =(5*height)/26+random((5*width)/52);
 
  posbx = (8*width)/13+random(10);
  posby =.26*height+(5*width)/26+random((5*width)/52);
 
  poscx = (8*width)/13+0.218*width+random(-(5*width)/52, 0);
  poscy = (5*height)/26+random((5*width)/52);
 
  posdx = (8*width)/13+random(-(5*width)/52, 0);
  posdy =(5*height)/26+random(-(5*height)/52, (5*height)/52) ;
 
  posex = (8*width)/13+0.0637*width;
  posey = random((5*height)/26)+0.218*height;
 
 
  noLoop();
  background(0);
  smooth();
  noStroke();
  fill(#FFFFFF, 50);
  bf0 = new Bioform(width, height);
 
  bf1 = new Bioform(width, height);
  bf2 = new Bioform(width, height);
  bf3 = new Bioform(width, height);
  bf4 = new Bioform(width, height);
  bf0 = new Bioform(width, height);
 
  
  sc0= .61;
  println("A " + posax+" :" +posay+ " ||" +"D "   +posdx+ ": "+posdy);
  pushMatrix();
  translate(posax, posay);
  scale(sc0, sc0);
  bf0.appear();
  popMatrix(); 
  pushMatrix();
 
 
  translate(posbx, posby);
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf1.appear();
  popMatrix(); 
  pushMatrix();  
 
 
  translate(poscx, poscy);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf2.appear();
  popMatrix();
  pushMatrix();  
 
  translate(posdx, posdy);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf3.appear();
  popMatrix();
 
  pushMatrix();  
 
  translate(posex, posey);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf4.appear();
  popMatrix();
  /*
translate(width/4,height/4);
   scale(.5,.5);
   bf0.appear();
   scale(.7,.7);translate(width/10,height/10);
   bf1.appear();translate(width/10,height/10);
   scale(.7,.7);
   bf2.appear();
   filter(BLUR, 8);
   */
}
class Bioform {
  PGraphics graphics;
 
  float [] p1x;
  float [] p1y;
  float [] p2x;
  float [] p2y;
  float [] c1x;
  float [] c1y;
  float [] c2x;
  float [] c2y;
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.01;
  float col = map(noise(xnoise, ynoise), 0, 1, 200, 285);
  float bright = map(noise(xnoise*.5, ynoise*.5), 0, 1, 50, 85);
  float sat = map(noise(xnoise*.2, ynoise*.2), 0, 1, 50, 85);
 
  Bioform(float w, float h) { 
 
 
    graphics = createGraphics(2*width, 2*height, JAVA2D);
  xnoise = xnoise + inc;
    p1x = new float[4];
    p1x[0] = w/2+random(-w/8, w/4);
    p1x[1] =w+random(-w/8, w/4);
    p1x[2] = w/2+random(-w/8, w/4);
    p1x[3] =random(-w/4, w/4);
    //    p1x[4] = w/2+random(-w/4+w/4);
    //    p1x[5] =w/6+random(-w/4, w/4);
    //    p1x[6] = random(-w/4, w/4);
    //    p1x[7] =w/6+random(-w/4, w/4);
 
    p1y = new float[4];
    p1y[0] = random(-h/4, h/4);
    p1y[1] = h/2+random(-h/4, h/4);
    p1y[2] = h+random(-h/4, h/4);
    p1y[3] = h/2+random(-h/4, h/4);
    //    p1y[4] = h+random(-h/4, h/4);
    //    p1y[5] = (5*w)/6+random(-h/4, h/4);
    //    p1y[6] = h/2+random(-h/4, h/4);
    //    p1y[7] = h/6+random(-h/4, h/4);
 
    //    p2x = new float[4];
    //    p2x[0] =  w+random(-w/4, w/4);
    //    p2x[1] =  w/2+random(w/2-w/4, w/2+w/4);
    //    p2x[2] = random(-w/4, w/4);
    //    p2x[3] = w/2+random(-w/4, w/4);
    //
    //    p2y = new float[4];
    //    p2y[0] = h/2+random(-h/4, h/4);
    //    p2y[1] = h+random(-h/4, h/4);
    //    p2y[2] = h/2+random(-h/4, h/4);
    //    p2y[3] = 0+random(-h/4, h/4);
 
 
    c1x = new float[4];
    c1x[0] = (3*w)/4+random(-w/4, w/4);
    c1x[1] = w+random(-w/4, w/4);
    c1x[2] = w/4+random(-w/4, w/4);
    c1x[3] = random(-w/4, w/4);
 
    c1y = new float[4];
    c1y[0] = random(-h/4, h/4);
    c1y[1] = (3*h)/4+random(-h/4, h/4);
    c1y[2] = h+random(-h/4, h/4);
    c1y[3] = h/4+random(-h/4, h/4);
 
 
 
    c2x = new float[4];
    c2x[0] = w+random(-w/4, w/4);
    c2x[1] = (3*w)/4+random(-w/4, w/4);
    c2x[2] = random(-w/4, w/4);
    c2x[3] = w/4+random(-w/4, w/4);
 
    c2y = new float[4];
    c2y[0] = h/4+random(-h/4, h/4);
    c2y[1] = h+random(-h/4, h/4);
    c2y[2] = (3*h)/4+random(-h/4, h/4);
    c2y[3] = random(-h/4, h/4);
   // appear();
  }
 
 
 
  void appear() {
  
    beginShape();
    vertex(p1x[0], p1y[0]);
    for (int i=0;i<4;i++) {
 
      if (i==0||i==3) {
        curveVertex(p1x[i], p1y[i]);   
        curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);
 
 
       curveVertex(p1x[(i+2)%4], p1y[(i+2)%4]);
      }
 
      curveVertex(p1x[i], p1y[i]);
      //curveVertex(p1x[i], p1y[i]);
      // curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);
    }
    endShape(CLOSE);
    
  }  }
 
 

    
 
 
 
void mousePressed()
{
  redraw();
}


