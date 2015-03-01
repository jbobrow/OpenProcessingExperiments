
/*
 * Creative Coding
 * Week 6, Create a postcard
 * by Jackie Palman
 
 * 
 */
 /* @pjs preload="redBull.jpg";*/
 PImage myImg;
 
 Circ[] circArray; //an array of Circ


// setup function -- called once when the program begins
void setup() {

  // set the display window size in pixels
  size(737, 553);
  myImg = loadImage("redBull.jpg");


  
  //Create array of circs
    circArray = new Circ[200];
  for(int i=0; i<200; i++){
    circArray[i] = new Circ(random (735), random (550), random(80, 150));
  }
 
}


// draw function -- called continuously while the program is running
void draw() {
   // set the background 
  background(myImg);  // set background image
 noStroke();
 fill(255);
 textSize(32);
text("Home of Red Bull Racing", 40, 500);
   for (int i=0; i<200; i++){
    circArray[i].drawCirc();
  }
    int randomCirc;
  randomCirc = (int)random(0, 199);
  circArray[randomCirc].opacity = circArray[randomCirc].opacity-50;
      
      int randomCirc2;
  randomCirc2 = (int)random(0, 200);
  circArray[randomCirc2].opacity = circArray[randomCirc2].opacity-50;
   
      int randomCirc3;
  randomCirc3 = (int)random(0, 199);
  circArray[randomCirc3].opacity = circArray[randomCirc3].opacity-50;
fill(255,0,0);
textSize(32);
text("Greetings from Milton Keynes", 40, 40);
}
//Circs class

class Circ {
  float x, y;
  float size_circ;
  float opacity;
  
  Circ(float cX, float cY, float cSize){
    
    x = cX;
    y = cY;
    size_circ = cSize;
    opacity = 255;
    
  }
  
   

  
  void drawCirc(){
    fill(0, opacity);
    ellipse(x, y, size_circ, size_circ);
  }
  
}


