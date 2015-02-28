
Bioform bf0;
Bioform bf1;
Bioform bf2;
Bioform bf3;

float posax;
float posay;
float posbx;
float posby;
float poscx;
float poscy;
float sc0;


void setup() {
  background(0);
  size(400, 400);

  bf1 = new Bioform(width, height);
    bf2 = new Bioform(width, height);
      bf3 = new Bioform(width, height);
   
        bf0 = new Bioform(width, height);
//  float w = width;
//float h = height;
}
 
void draw() {
  posax = random(width/4,(2*width)/3);
  posay =random(height/16,(height/3+height/2));
  
   posbx = random(posax/1.5);
  posby =random(posay/1.5);
  
   poscx = random(posbx/3);
  poscy =random(posby/3);
  

  noLoop();
  background(0);
smooth();
noStroke();
fill(#FFFFFF,50);
     bf0 = new Bioform(width, height);

  bf1 = new Bioform(width, height);
    bf2 = new Bioform(width, height);
      bf3 = new Bioform(width, height);
   
        bf0 = new Bioform(width, height);




  if(posax > width/2){
        sc0=.3;
    pushMatrix();
    translate(posbx,posby);
 scale(.15,.15);
    bf1.appear();
     popMatrix();
     pushMatrix();
     translate(poscx,poscy);
     scale(.1,.1);
     bf2.appear();
     popMatrix();
  } else{sc0=.5;}
  println(posax +" " +(2*width)/4);
  pushMatrix();
translate(posax,posay);
scale(sc0,sc0);
    bf0.appear();
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
 
 
  float [] p1x;
  float [] p1y;
  float [] p2x;
  float [] p2y;
  float [] c1x;
  float [] c1y;
  float [] c2x;
  float [] c2y;
 
  Bioform(float w, float h) {  
    p1x = new float[4];
    p1x[0] = w/2+random(-w/4, w/4);
    p1x[1] =w+random(-w/4, w/4);
    p1x[2] = w/2+random(-w/4, w/4);
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
  }
 
  void appear() {
    beginShape();
       vertex(p1x[0], p1y[0]);
   for (int i=0;i<4;i++) {
  
    if(i==0||i==3){ 
      curveVertex(p1x[i], p1y[i]);    
     curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);

    
    curveVertex(p1x[(i+2)%4], p1y[(i+2)%4]);
  
}

curveVertex(p1x[i], p1y[i]);
//curveVertex(p1x[i], p1y[i]);
// curveVertex(p1x[(i+1)%4], p1y[(i+1)%4]);

    }
    endShape(CLOSE);
  }
}

class Form{

/* [] bio;
 Form() {  

 }
 
 void forming(){
 for(int i=0;i<=4;i++);
if 
*/
 }


void mousePressed()
{
  redraw();
}


