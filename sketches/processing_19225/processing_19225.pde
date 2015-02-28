
import processing.opengl.*;
import ddf.minim.*;
//import fullscreen.*; 


Minim minim;
AudioInput in;
Triangle[] triangleArray;
int audioSensibility;
//FullScreen fs; 

boolean isRefreshEnabled;
boolean isAudioInputEnabled;

int trianglesMax;
//void setup() se ejecuta una sola vez
void setup(){
  isRefreshEnabled = true;
  isAudioInputEnabled = true; 
  trianglesMax = 256;
  audioSensibility = 150;
  
  //Tamanio de la pantalla y se usa OPENGL para una mejor performance
  size(640,480, OPENGL); 
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, trianglesMax);
  
//  fs = new FullScreen(this); 
//  fs.enter();

  background(0);
  smooth(); //Antialiasing a toda la pantalla
    
  triangleArray = new Triangle[trianglesMax];
  
  for (int i=0; i<triangleArray.length; i++){
    triangleArray[i] = new Triangle(random(width),random(height));
  }
  
} 

void draw(){
  if (isRefreshEnabled){
    background(0);
  }
 
  for (int i=0; i<triangleArray.length;i++){
    triangleArray[i].moveTo(triangleArray[i].centerX, triangleArray[i].centerY+5);
    
    if (isAudioInputEnabled){
      triangleArray[i].setSize(in.left.get(i)*audioSensibility);
    }
    
    triangleArray[i].display();
  }
  
}

void mousePressed() {
  background(0);  
  for (int i=0; i<triangleArray.length;i++){
    triangleArray[i].moveTo(random(width), triangleArray[i].centerY);
  }
}

void keyPressed(){
 
 switch(key){
   case 'a':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(1);   
     }
     break;
   
   case 's':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(2);   
     }
     break;

   case 'd':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(3);   
     }
     break;
     
   case 'q':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(4);   
     }
     break;
     
   case 'w':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(5);   
     }
     break;
     
   case 'e':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(6);   
     }
     break;
   
   case 'p':
     isRefreshEnabled = !isRefreshEnabled;
     break;
     
   case 'o':
     isAudioInputEnabled = !isAudioInputEnabled;
     if (!isAudioInputEnabled){
       for (int i=0; i<triangleArray.length; i++){
         triangleArray[i].setSize(10);
       }
     }
     break;
     
   case 'z':
     for (int i=0; i<triangleArray.length;i++){
       triangleArray[i].setColorMode(0);   
     }   
     break;
     
   case '1':
     if (audioSensibility > 10){
       audioSensibility -= 10;
       println("Audio Sensibility: " + audioSensibility);
     }
     break;
     
   case '2':
     audioSensibility += 10;
     println("Audio Sensibility: " + audioSensibility);
     break;     
 }  
}

class Triangle{
  int colorM;
  
  float triangleSize;
  
  float centerX;
  float centerY;
  
  float x1;
  float y1;
  
  float x2;
  float y2;
  
  float x3;
  float y3;
  
  Triangle(float x, float y){
    centerX = x;
    centerY = y;
    
    triangleSize = 10; 
    
    x1 = x;
    y1 = y-triangleSize;
    
    x2 = x-triangleSize;
    y2 = y+triangleSize;
    
    x3 = x+triangleSize;
    y3 = y+triangleSize;

    colorM = 0;

   
  }
  
  void display(){
    
    switch (colorM){
      case 1:
        //BLUE
        stroke(0);
        fill(0,0, random(255));
        break;

      case 2:
        //RED
        stroke(0);
        fill(random(255),0, 0);
        break;
        
      case 3:
        //GREEN
        stroke(0);
        fill(0,random(255), 0);
        break;

      case 4:
        //RED + GREEN
        stroke(0);
        fill(random(255), random(255), 0);
        break;
  
      case 5:
        //RED + BLUE
        stroke(0);
        fill(random(255), 0, random(255));
        break;
  
      case 6:
        //GREEN + BLUE
        stroke(0);
        fill(0, random(255), random(255));
        break;   
        
      case 0:
      default: 
        stroke(random(255));
        fill(random(255),random(255),random(255));      
    }
    
    triangle(x1,y1,x2,y2,x3,y3);
  }
  
  void moveTo(float x, float y){
    centerX = x;
    centerY = y;

    if (centerY > height){
      centerY = 0;
      centerX = random(width); 
    }
    
    
    x1 = centerX;
    y1 = centerY-10;
    
    x2 = centerX-10;
    y2 = centerY+10;
    
    x3 = centerX+10;
    y3 = centerY+10;    
  }
  
  void setColorMode (int iColorMode){
    colorM = iColorMode; 
  }
  
  void setSize (float fSize){
    triangleSize = fSize;
    
    y1 = centerY-triangleSize;
    
    x2 = centerX-triangleSize;
    y2 = centerY+triangleSize;
    
    x3 = centerX+triangleSize;
    y3 = centerY+triangleSize; 
  }
}

