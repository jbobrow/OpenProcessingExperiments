

PImage acc;
int nivmax;
float xc, yc, zc, buta, angly;
Decoupe limage;
float tempo;
boolean stop;


void setup() {
     size(850, 850, P3D);
     xc= width/2.0f;
     yc=height/2.0f;
     zc=-400f;
     nivmax=5;
     stop=false;
     angly=0;	
   
   
     acc= new PImage();
     acc=loadImage("maquille.jpg");
     limage=new Decoupe(acc);
}
void draw() {

     background(255,200,200);
     translate(xc, yc, zc);
     buta=0.01f * (mouseX - width/2);
     angly+=0.05f*cos(buta);
     rotateY(angly);
     rotateZ(PI);			
     if (!stop)tempo += 0.03;	
     scale(1.2f);	
     limage.dessiner(0, 0, 0);
}
void mousePressed() {
     stop=!stop;
}


//*****************************************************************	
class Decoupe {

     PImage img;
     PImage[] quart;
     float diag;
     int w;
     public Decoupe(PImage img) {
          this.img=img;
          quart=new PImage[4];
          w=img.width/2;
          diag=w*sqrt(0.5f);
     }

     public void  dessiner(float x, float y, int niv) {
         noStroke();// stroke(155, 130, 50);//
          float wn=w/pow(2, niv);
          float diagn=diag/pow(2, niv);
          fill(255, 250);
          beginShape(QUADS);
          texture(acc);	
          vertex(0, 2*diagn, 0, x, y        );
          vertex(2*diagn, 0, 0, x+2*wn, y       );
          vertex(0, -2*diagn, 0, x+2*wn, y+2*wn );
          vertex(-2*diagn, 0, 0, x, y+2*wn );
          endShape(); 
          fill(255, 200);	
          pushMatrix();
          translate(0, 2*diagn, 0);
          rotateX(-tempo);
          //line(-diagn,0,0,diagn,0,0);
          if (niv<nivmax) {	
               translate(0, -diagn, 0);
               dessiner(x, y, niv+1);
          }
          else {	
               beginShape(QUADS);
               texture(acc);	
               vertex(0, 0, 0, x, y        );
               vertex(diagn, -diagn, 0, x+wn, y       );
               vertex(0, -2*diagn, 0, x+wn, y+wn );
               vertex(-diagn, -diagn, 0, x, y+wn );
               endShape();
          }
          popMatrix();

          pushMatrix();

          translate(2*diagn, 0, 0);	
          rotateY(tempo);
          if (niv<nivmax) {	
               translate(-diagn, 0, 0);
               dessiner(x+wn, y, niv+1);
          }
          else {
               beginShape(QUADS);
               texture(acc);
               vertex(-diagn, diagn, 0, x+wn, y);	
               vertex(0, 0, 0, x+2*wn, y);
               vertex(-diagn, -diagn, 0, x+2*wn, y+wn);
               vertex(-2*diagn, 0, 0, x+wn, y+wn);

               endShape();
          }
          popMatrix();

          pushMatrix();

          translate(0, -2*diagn, 0);	
          rotateX(tempo);
          //line(-diagn,0,0,diagn,0,0);
          if (niv<nivmax) {	
               translate(0, diagn, 0);
               dessiner(x+wn, y+wn, niv+1);
          }
          else {
               beginShape(QUADS);
               texture(acc);
               vertex(0, 2*diagn, 0, x+wn, y+wn);
               vertex(diagn, diagn, 0, x+2*wn, y+wn);

               vertex(0, 0, 0, x+2*wn, y+2*wn);
               vertex(-diagn, diagn, 0, x+wn, y+2*wn);	
               endShape();
          }
          popMatrix();	

          pushMatrix();

          translate(-2*diagn, 0, 0);	
          rotateY(-tempo);
          //line(0,-diagn,0,0,diagn,0);
          if (niv<nivmax) {	
               translate(diagn, 0, 0);	
               dessiner(x, y+wn, niv+1);
          }
          else {
               beginShape(QUADS);
               texture(acc);
               vertex(diagn, diagn, 0, x, y+wn);	
               vertex(2*diagn, 0, 0, x+wn, y+wn);
               vertex(diagn, -diagn, 0, x+wn, y+2*wn);
               vertex(0, 0, 0, x, y+2*wn);

               endShape();
          } 
          popMatrix();
     }
}


