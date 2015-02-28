
import remixlab.proscene.*;
Scene scene;
PImage pimage;
int nb;
float distx, wim, him, scal;
InteractiveFrame[] repere, quartdetour;
Quaternion[] quart;
float[] disp;
void setup() {
     size(850, 850, P3D);
     pimage=new PImage();
     pimage= loadImage("masque.gif");
     scene=new Scene(this);
     scene.setAxisIsDrawn(false);
     scene.setGridIsDrawn(false);
     scene.setRadius(50);
     distx=50;
     wim=pimage.width;
     him=pimage.height;
     nb=6;
       scal=0.55;
     disp=new float[nb];
     disp[0]=distx;
     
     for (int i=1;i<nb;i++) { 
         disp[i]=disp[i-1]*scal;
        
     };
     quart=new Quaternion[4];
     for (int i=0;i<4;i++) { 
          quart[i]=new Quaternion(new PVector(0, 0, 1), (PI*i)/2.0);
     };
     repere=new InteractiveFrame[nb];
     quartdetour=new InteractiveFrame[nb];
     for (int i=0;i<nb;i++) {
          repere[i]=new InteractiveFrame(scene);
          quartdetour[i]=new InteractiveFrame(scene);
          quartdetour[i].setReferenceFrame(repere[i]);
          if (i>0)repere[i].setReferenceFrame( quartdetour[i-1]);
     }

     float disp=distx;
     for (int i=1;i<nb;i++) {
          repere[i].setTranslation(disp+disp*scal, disp+disp*scal, 0); 
          disp*=scal;
     }
     frameRate(20);
     scene.camera().setPosition(new PVector(0,0,500));
     scene.camera().setOrientation(new Quaternion(new PVector(0,0,500),-PI/4));
}



void draw() {
     background(255);
     pushMatrix();
     repere[0].setRotation(new Quaternion(new PVector(-1,-1,0),millis()/4000.0f));
     repere[0].applyTransformation();
     beginShape();
     texture(pimage);
     vertex(-distx, -distx, 0, 0, 0);
     vertex(distx, -distx, 0, wim, 0);
     vertex(distx, distx, 0, wim, him);
     vertex(-distx, distx, 0, 0, him);
     endShape();
   

  
   
     for (int k=0;k<4;k++) {
          pushMatrix();
          quartdetour[0].setRotation(quart[k]);
          quartdetour[0].applyTransformation();
          pushMatrix();
          repere[1].setRotation(new Quaternion(new PVector(1,1,1),millis()/4000.0f));
          repere[1].applyTransformation();
          beginShape();
          texture(pimage);
          vertex(-disp[1], -disp[1], 0, 0, 0);
          vertex(disp[1], -disp[1], 0, wim, 0);
          vertex(disp[1], disp[1], 0, wim, him);
          vertex(-disp[1], disp[1], 0, 0, him);
          endShape();
          
          for (int e=0;e<4;e++) {
               pushMatrix();

               quartdetour[1].setRotation(quart[e]);
               quartdetour[1].applyTransformation();
               pushMatrix();
                   repere[2].setRotation(new Quaternion(new PVector(-1,1,0),millis()/1000.0f));
               repere[2].applyTransformation();
               beginShape();
               
               texture(pimage);
               vertex(-disp[2], -disp[2], 0, 0, 0);
               vertex(disp[2], -disp[2], 0, wim, 0);
               vertex(disp[2], disp[2], 0, wim, him);
               vertex(-disp[2], disp[2], 0, 0, him);
               endShape();
              //------------------------- 
               for (int f=0;f<4;f++) {
               pushMatrix();

               quartdetour[2].setRotation(quart[f]);
               quartdetour[2].applyTransformation();
               pushMatrix();
                   repere[3].setRotation(new Quaternion(new PVector(-1,1,0),millis()/4000.0f));
               repere[3].applyTransformation();
               beginShape();
                 //disp=disp*scal;
               texture(pimage);
               vertex(-disp[3], -disp[3], 0, 0, 0);
               vertex(disp[3], -disp[3], 0, wim, 0);
               vertex(disp[3], disp[3], 0, wim, him);
               vertex(-disp[3], disp[3], 0, 0, him);
               endShape();
               //------------------------- 
               for (int g=0;g<4;g++) {
               pushMatrix();

               quartdetour[3].setRotation(quart[g]);
               quartdetour[3].applyTransformation();
               pushMatrix();
                   repere[4].setRotation(new Quaternion(new PVector(-1,1,0),millis()/4000.0f));
               repere[4].applyTransformation();
               beginShape();
               
               texture(pimage);
               vertex(-disp[4], -disp[4], 0, 0, 0);
               vertex(disp[4], -disp[4], 0, wim, 0);
               vertex(disp[4], disp[4], 0, wim, him);
               vertex(-disp[4], disp[4], 0, 0, him);
               endShape();
               //------------------------- 
               for (int d=0;d<4;d++) {
               pushMatrix();

               quartdetour[4].setRotation(quart[d]);
               quartdetour[4].applyTransformation();
               pushMatrix();
                   repere[5].setRotation(new Quaternion(new PVector(-1,1,0),millis()/4000.0f));
               repere[5].applyTransformation();
               beginShape();
               
               texture(pimage);
               vertex(-disp[5], -disp[5], 0, 0, 0);
               vertex(disp[5], -disp[5], 0, wim, 0);
               vertex(disp[5], disp[5], 0, wim, him);
               vertex(-disp[5], disp[5], 0, 0, him);
               endShape();
                popMatrix();
                popMatrix();
          }
              
              //----------------------- 
                popMatrix();
                popMatrix();
          }
              
              //----------------------- 
                popMatrix();
                popMatrix();
          }
              
              //----------------------- 
               popMatrix();
                popMatrix();
          }
             
               popMatrix();
               popMatrix();
             
              
          }
          
       
          popMatrix();
     }
/*void keyPressed(){
     
   saveFrame("christmas-####.jpg/*");   
      
     
;}*/

