
import processing.video.*;
Capture video;

float txe = 0;
float tye = 0;
float alpha = 0.4;

int taille1 = 70 ;
int taille2 = 80 ;

int rouge = 10;
color col;
int taille = 100 ;

Forme rond1 = new Forme (100,100,color(255,0,0));
Forme rond2 = new Forme (450,350,color(0,0,255));
Forme rond3 = new Forme (320,240,color(0,255,0));
Forme rond4 = new Forme (200,390,color(0,255,255));

void setup() {
  size(640, 480);
  smooth();
  video = new Capture (this, width, height, 30);
  video.start();
  noStroke();
  smooth();  
}


void draw() {

  rond1.display();
  rond2.display();
  rond3.display();
  rond4.display();
  
  if (taille1 > 130) {
    taille1 = 70;
  }

  if (taille2 > 140) {
    taille1 = 70;
  }
  
   if  ((width/2-(txe-width/2)) < 120  && (width/2-(txe-width/2)) > 80 && tye < 120 && tye > 80) {
col = color(255,255,0);
rond1.changeCouleur();
  }
   if  ((width/2-(txe-width/2)) < 500  && (width/2-(txe-width/2)) > 400 && tye < 400 && tye > 300) {
col = color(random(255),random(255),random(255));
rond2.changeCouleur();
  }
  
    if  ((width/2-(txe-width/2)) < 340  && (width/2-(txe-width/2)) > 300 && tye < 260 && tye >220) {
rond3.changeTaille();
  }
  
   if  ((width/2-(txe-width/2)) < 340  && (width/2-(txe-width/2)) > 300 && tye < 260 && tye >220) {
rond4.changePaillette();
  }
  
  if  ((width/2-(txe-width/2)) < 220  && (width/2-(txe-width/2)) > 180 && tye < 410 && tye >370) {
rond4.changeFond();
  }
  
  if (video.available()){
    float hmax = 0;
    int tx = 0;
    int ty = 0;
    video.read();
    video.loadPixels();
    int index = 0;
    
    for (int y =0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++){
        float h = hue(video.pixels[index]);
       if (h > hmax) {
        hmax = h; tx = x; ty = y;
       }
      index++;
      }
    }
    
   scale(-1,1);
   translate(-640,0);
   image(video, 0, 0, width, height);
   //tint(10, 10, 70); 
   txe = (1-alpha)*txe + alpha*tx;
   tye = (1-alpha)*tye + alpha*ty;
   
   if (txe>width/2) {
     rouge = 255;
     
   } else {
     rouge = 10;
   }
   
  noFill();
  stroke (rouge, 255, 151, 180);
  ellipse(txe, tye, taille1, taille1 );
  ellipse(txe, tye, taille2, taille2 );
  
  }
}

  class Forme {
    float x;
    float y;
    color couleur;
    
    Forme (float nouvX, float nouvY, color nouvCouleur){
      x = nouvX;
      y = nouvY;
      couleur = nouvCouleur;
    }
    
    void display(){
      
      fill(couleur);
      noStroke();
      ellipse(x,y,40,40);
      
    }
    void changeCouleur(){
      fill(col);
      filter(GRAY);
      noStroke();
      ellipse(x,y,40,40);
    }
    
     void changeTaille(){
      ellipse(x,y,taille,taille);
    }
    
     void changePaillette(){
      ellipse(random(640),random(480),40,40);
    }
    
    void changeFond(){
      tint(random(255),random(255),random(255));
    }
    
  }
 
  
  


