

float BlueCircleRad = 3;
Boolean BlueCircle= false;


float PinkCircleRad = 3;
Boolean PinkCircle= false;

float GreenCircleRad = 3;
Boolean GreenCircle= false;

float YellowCircleRad = 3;
Boolean YellowCircle= false;




void setup (){
  size (600, 600);
  smooth ();
  //noStroke();
  background(255);  
  
}

void draw () {
  noStroke();
  fill (255,10 );
  rect (0, 0, width, height); 
  strokeWeight(random (15));
  
  drawBlueCircle();
  drawPinkCircle();
  drawGreenCircle();
  drawYellowCircle();
}



/// draw the blue sketch

void drawBlueCircle(){
  color BlueCircleColor = color (0, 0, random(255)  , 100);
  float BlueCircleIncreaseRad = random (15);
  
   if (!BlueCircle) return;
  float BlueCircleX = random ((width/4-30),(width/4+15));
  float BlueCircleY = random ((height/4-15),(height/4+15));
  BlueCircleRad += BlueCircleIncreaseRad;
  noFill();
  stroke( BlueCircleColor);
  ellipse(BlueCircleX, BlueCircleY, BlueCircleRad,BlueCircleRad);
}


/// draw the pink sketch
void drawPinkCircle(){
  color PinkCircleColor = color (random(150,255), 0, random(90,100), 100);
  float PinkCircleIncreaseRad = random (10);
  
   if (!PinkCircle) return;
  float PinkCircleX = random((3*height/4-15), (3*height/4+15));
  float PinkCircleY = random((3*height/4-15), (3*height/4+30));
  PinkCircleRad += PinkCircleIncreaseRad;
  noFill();
  stroke( PinkCircleColor);
  ellipse(PinkCircleX, PinkCircleY, PinkCircleRad,PinkCircleRad);
}


/// draw the green sketch

void drawGreenCircle(){
  color GreenCircleColor = color ( 0, random(100,200), 0, 100);
  float GreenCircleIncreaseRad = random (10);
  
   if (!GreenCircle) return;
  float GreenCircleX = random(width/5,width/4);
  float GreenCircleY = random(2.5*height/4,3*height/4);
  GreenCircleRad += GreenCircleIncreaseRad;
  noFill();
  stroke( GreenCircleColor);
  ellipse(GreenCircleX, GreenCircleY, GreenCircleRad,GreenCircleRad);
}

/// draw the blue sketch

void drawYellowCircle(){
  color YellowCircleColor = color (random(200,255),random(200,255) ,0 , 100);
  float YellowCircleIncreaseRad = random (15);
  
   if (!YellowCircle) return;
  float YellowCircleX = random ((3*height/4-15), (3*height/4+15));
  float YellowCircleY = random ((height/4-15),(height/4+15));
  YellowCircleRad += YellowCircleIncreaseRad;
  noFill();
  stroke(YellowCircleColor);
  ellipse(YellowCircleX, YellowCircleY, YellowCircleRad, YellowCircleRad);
}

  
  
void keyTyped() {
  if (key == 'b') {
    BlueCircle = true;
    }
    
  if (key == 'p') {
    PinkCircle = true;
    }
    
  if (key == 'g') {
    GreenCircle = true;
    }
    
  if (key == 'y') {
    YellowCircle = true;
    }
}


void keyReleased() {
  if (key == 'b') {
   BlueCircleRad = 5;   
   }
   
   if (key == 'p') {
   PinkCircleRad = 5; 

   }
   
   if (key == 'g') {
   GreenCircleRad = 5; 

   }
    if (key == 'y') {
   YellowCircleRad = 5; 

   }
} 

