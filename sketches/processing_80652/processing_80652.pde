
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/40283*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
PImage img1;


//integers

int keyX = 206;
int keyY = 650;
int holeX = 236; 
int holeY = 294;
PImage a;
PImage b;
PImage c;
PImage d;



//setup

void setup(){
  size (460,816);
  noCursor();
 
  smooth();
  a = loadImage("spot.png");
  b = loadImage("grain.png");
  c = loadImage("chopsticks.png");
  d = loadImage("chopsticks2.png");
  img0 = loadImage("face3.jpg");
 img1 = loadImage("face4.jpg");

}



//draw loop

void draw(){
  background(img0);
 image (b, keyX,keyY);
  image (a, holeX,holeY);
  //if (mousePressed ==false){
  //image (c, mouseX-8, mouseY-8);
  //}
  //if (mousePressed ==true){
  //image(d, mouseX-8,mouseY-8);
  //}
 
  
  if (mousePressed == true && dist(mouseX,mouseY,keyX,keyY)<20){
    keyX=mouseX-10;
    keyY=mouseY-10;
  }
  
  //the moment the rice touches the mouth spot...
  if (dist(keyX, keyY, holeX, holeY)<15){
    for (int holeX = 0; holeX < width; holeX = holeX+50) {
      for (int holeY = 0; holeY < height; holeY = holeY+50) {
   
        //noStroke();
        //fill(150);
      }
    }
        //composition adjustment
     background(img1);
        
        
  }
            //repeat hand functions so that they are on top, probably a cleaner way to do this...
        if (mousePressed ==false){
          image (c, mouseX-8, mouseY-8);
  }
  if (mousePressed ==true){
    image(d, mouseX-8,mouseY-8);
  }
          
         
  }
    
        




 

  
  




