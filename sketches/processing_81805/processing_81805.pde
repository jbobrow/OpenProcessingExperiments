
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65423*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float r;
float x;
float y;
float theta=360*30;
int multi = 1;

PGraphics offScreen;
PImage stove;
void setup() {
    size(600, 600,P2D);
    //strokeWeight(2);
    stove = loadImage("stove.png");
    noFill();
    smooth();
    background(0);
    frameRate(120);
    offScreen =  createGraphics(600, 600, P2D);
    offScreen.beginDraw();
    //offScreen.strokeWeight(2);
    offScreen.background(0);
    offScreen.noFill();
    offScreen.smooth();
    offScreen.endDraw();
    
}


void draw() {
  
    offScreen.beginDraw();
   offScreen.translate(width/2, height/2); // translate to center of screen
    image(stove,0,0);
    for (int i =0; i< 250; i++) {
      theta=theta+ multi*0.29;
              
      r = 360-theta/30;
        
          //limites para a espiral parar de ser desenhada 
          if (theta < 0 || theta >360*30) {
            multi = multi * -1; //alternando entre inteiro positivo e negativo: +1 -1
            break;
          }
                if (multi > 0) {
                   offScreen.stroke(0,0,0);
                   //offScreen.strokeWeight(3);
               
                }
                if (multi < 0) {
                  offScreen.stroke(211, 0, 0);
                  offScreen.strokeWeight(2);  
              }
               
              
      x =r*cos(radians(theta)); // radians para converter pi em radianos
      y =r*sin(radians(theta));
          
        
       offScreen.point (x, y);    
        
    }
   offScreen.endDraw();
  translate(width/2,height/2);
  pushMatrix();
  rotate(radians(theta));
 //translate(width/2,height/2);
  image(offScreen,-width/2,-height/2); 
  tint(211, 80);

  popMatrix();
} 

 

