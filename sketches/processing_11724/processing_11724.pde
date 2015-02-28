

int drawingMode = 0;

float grow1;
float grow2;
float greens;
float blues;
float expandW;
float expandH;
float across;
float upDown;
float one;
float two;
float little;
float littleH;
float little2;
float little3;

void setup(){
  size(800, 600);
  smooth();
  background(33, 206, 205);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  colorMode(RGB);
  grow1=40;
  grow2=60;
  little=10;
  littleH=50;
  little2=10;
  little3=50;
  across=random(0, 800);
  upDown=random(0, 600);
  one=random(0, 800);
  two=random(0, 600);

  
}


void draw(){
  //alpha value low # is transparent 255 is fully opaque 
  
  //background(255, 252, 240);
    
  if (drawingMode == 0) {
   symmetricRipple();
  } else if (drawingMode == 1) {
    asymmetricRipple();
  }
  //println(grow2);
}

void keyReleased() {
  //look for the space bar
  if (key == ' ') {
    if (drawingMode == 0) {
      drawingMode = 1;
      
     // changeSymmetricComposition();
    } else if (drawingMode == 1) {
    
      drawingMode = 0;
      fill(34, 194, 237);
      rect(400, 300, 800, 600);
     // changeAsymmetricComposition();
    }
  }
}

void symmetricRipple(){  
  
  if(grow2==150){
    rippleRect();
    //SwitchColors();
  }
 
  rippleRect();
  
   if(grow1<width/2){
      grow1+=8; }
  //if(grow1>400)
  if(grow2<=height){
    grow2+=10;
  }
  
  if(grow2==height){
     grow2=60;
     grow1=40;
    SwitchColors();
    //ellipse(50, 50, 60, 100);
  } 
}

void SwitchColors(){
  blues= random(98, 255);
  greens= random(69, 140);
}

void rippleRect(){
  fill(15, greens, blues, 1);
  
  rect(200, 300, grow1, grow2);
 
  fill(20, greens, blues, 1);
  rect(600, 300, grow1, grow2);
    }
    
   void asymmetricRipple(){
     
    sillySquares();
    
    
   }
    
    void sillySquares(){
     fill(34, 194, 237);
      rect(400, 300, 800, 600);
       fill(255);
      rect(across, upDown, 100, 100);
     fill(0);
    rect(across, upDown, little, littleH);
     
     
     if (little < 100){
       little++;
       littleH++;}
      if (little >= 100){
        fill(255);
        rect(across, upDown, little2, little3);
        little2++;
        little3++;
        
        if (little2 == 100) {
          little = 0;
          little2 = 0; 
          little3 = 0;
          across=random(0, 800);
          upDown=random(0, 600);
        }
        
        //little--;
       // littleH--;
     }
     
     
     
        //if(littl
        println(little);
    
        
        
    
     fill(255);
      rect(one, two, 100, 100);
     fill(0);
    rect(one, two, little, littleH);
      
    }
   
  

