
//blur is off!

Bioform bf0;
Bioform bf1;
Bioform bf2;
Bioform bf3;
Bioform bf4;
Bioform bf0a;
Bioform bf1a;
Bioform bf2a;
Bioform bf3a;
Bioform bf4a;
Bioform bf0b;
Bioform bf1b;
Bioform bf2b;
Bioform bf3b;
Bioform bf4b;
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

  size(400, 400);
  colorMode(HSB);

  //  float w = width;
  //float h = height;
}

void draw() {
  posax = random((5*width)/52);  //position of first object set
  posay =(5*height)/26+random((5*width)/52);

  posbx = (8*width)/13+random(10); //position of second object set
  posby =.26*height+(5*width)/26+random((5*width)/52);

  poscx = (8*width)/13+0.218*width+random(-(5*width)/52, 0); //position of third object set
  poscy = (5*height)/26+random((5*width)/52);

  posdx = (8*width)/13+random(-(5*width)/52, 0); //position of fourth object set
  posdy =(5*height)/26+random(-(5*height)/52, (5*height)/52) ;

  posex = (8*width)/13+0.0637*width; //position of fifth object set
  posey = random((5*height)/26)+0.218*height;

  noLoop();
  background(posex, posay, posdy);
  smooth();
  noStroke();
  bf0 = new Bioform(width, height);
  bf1 = new Bioform(width, height);
  bf2 = new Bioform(width, height);
  bf3 = new Bioform(width, height);
  bf4 = new Bioform(width, height);
  bf0 = new Bioform(width, height);
  bf1a = new Bioform(width, height);
  bf2a = new Bioform(width, height);
  bf3a = new Bioform(width, height);
  bf4a = new Bioform(width, height);
  bf0a = new Bioform(width, height);
  bf1b = new Bioform(width, height);
  bf2b = new Bioform(width, height);
  bf3b = new Bioform(width, height);
  bf4b = new Bioform(width, height);
  bf0b = new Bioform(width, height);

  //379;

  sc0= .6; // scale increment
  println("A " + posax+" :" +posay+ " ||" +"D "   +posdx+ ": "+posdy);
  pushMatrix();
  translate(posax, posay);
  fill(#FF0000, 50);
  scale(.45, .45);
  bf0.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf0a.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf0b.go();
  popMatrix();  
  pushMatrix();


  translate(posbx, posby);
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf1.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf1a.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf1b.go();
  popMatrix();  
  pushMatrix();   


  translate(poscx, poscy);
  scale(sc0, sc0); 
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf2.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf2a.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf2b.go();
  popMatrix();
  pushMatrix();   

  translate(posdx, posdy);
  scale(sc0, sc0); 
  scale(sc0, sc0); 
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf3.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf3a.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf3b.go();
  popMatrix();

  pushMatrix();   

  translate(posex, posey);
  scale(sc0, sc0); 
  scale(sc0, sc0); 
  scale(sc0, sc0); 
  scale(sc0, sc0);
  scale(sc0, sc0);
  bf4.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf4a.go();
  scale(.7, .7);
  translate(width/10, height/10);
  bf4b.go();
  popMatrix();

//  filter(BLUR, 8);
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


  Bioform(float w, float h) {  


    graphics = createGraphics(2*width, 2*height, JAVA2D);

    p1x = new float[4];
    p1x[0] = w/2+random(-w/8, w/4);
    p1x[1] =w+random(-w/8, w/4);
    p1x[2] = w/2+random(-w/8, w/4);
    p1x[3] =random(-w/4, w/4);

    p1y = new float[4];
    p1y[0] = random(-h/4, h/4);
    p1y[1] = h/2+random(-h/4, h/4);
    p1y[2] = h+random(-h/4, h/4);
    p1y[3] = h/2+random(-h/4, h/4);
    
    appear();
  }



  void appear() {
    graphics.beginDraw();
    graphics.smooth();
    graphics.noStroke();

    graphics.colorMode(HSB, 360, 100, 100);

    graphics.beginShape();
    graphics.vertex(p1x[0], p1y[0]);
    for (int i=0;i<4;i++) {

      if (i==0||i==3) { 
        graphics.fill(p1x[i], p1y[i], 100, 50); //red through lime green
        graphics.curveVertex(p1x[i], p1y[i]);    
        graphics.curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);


        graphics.curveVertex(p1x[(i+2)%4], p1y[(i+2)%4]);
      }
 
      graphics.curveVertex(p1x[i], p1y[i]);
    }
    graphics.endShape(CLOSE);

    graphics.endDraw();
  }

  void go() {

    image(graphics, 0, 0);
  }
}


void mousePressed()
{
  redraw();
}


