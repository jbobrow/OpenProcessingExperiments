
Mouse twoHundred [] = new Mouse [200];

void setup (){
  
 size (800,800);
 
 smooth ();
 
 for (int i=0; i<twoHundred.length;i++) {
   twoHundred[i] = new Mouse();
   twoHundred[i].prime(random(800),random(800),random(60),random(255),random(20));
 }
 
}

void draw () {
  
  background (random(255),random(180),random(150));
  
  for (int i=0; i<twoHundred.length;i++){
   twoHundred[i].update(); 
  }
  

  
}
class Mouse {
  float posX;
  float posY;
  float bigness;
  float colors;
  float movement;


  void prime (float _posX, float _posY, float _bigness, float _colors, float _movement) {
    posX = _posX;
    posY = _posY;
    bigness = _bigness;
    colors = _colors;
    movement = _movement;
  }

  void update () {
    
    

    //head
    fill (colors-100, colors-70, colors-20);
    ellipse (posX, posY, bigness*3, bigness*3);
    /*ellipse (posX-40, posY-40, bigness*3/2, bigness*3/2);
    ellipse (posX+40, posY-40, bigness*3/2, bigness*3/2);
    */

    //movement
    posX += movement * random(-5,5) ;
    posY += movement * random(-5,5);

    //collision logic 
    if (posX >800-0.1 || posY >800-0.1) {
      movement *= -1;
    }
    if (posX <0.1 || posY <0.1) {
      movement *=-1;
    }
    /*initially had a creature that looked like a mouse but everytime i adjusted the 
     size the aspects would go crazy, submitting this first and going to work on it more 
     to get my mouse face to appear.
     
     //Left ear
     noStroke();
     fill (200, 100, 50);
     ellipse (posX/2 -140, posY/2 -190, bigness*3, bigness*3);
     
     //Right Ear
     noStroke();
     fill (200, 100, 50);
     ellipse (posX/2 +140, posY/2 -190, bigness*3, bigness*3);
     
     //Right Eye
     noStroke();
     fill (255);
     ellipse (posX/2 +70, posY/2 -60, bigness*0.7, bigness*0.7);
     
     fill (0);
     ellipse (posX/2 +70, posY/2 -60, bigness*0.4, bigness*0.4);
     
     //Left Eye
     noStroke();
     fill (255);
     ellipse (posX/2 -70, posY/2 -60, bigness*0.7, bigness*0.7);
     
     fill (0);
     ellipse (posX/2 -70, posY/2 -60, bigness*0.4, bigness*0.4);
     
     //Nose
     noStroke();
     fill (0);
     rectMode (CENTER);
     rect (posX/2, posY/2, bigness*0.5, bigness*0.5);
     
     //Mouth
     noStroke();
     fill (255);
     rect (posX/2, posY/2+60, bigness*2, bigness *0.3);
     
     */
  }
}



