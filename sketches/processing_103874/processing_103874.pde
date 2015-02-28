
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15161*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage reference;
int SPEED = 0;
int TESTS = 5;
//the percent that colours must have in common to link together
float ACCURACY = 85;
float DISTANCE = 300;
//stops from getting stuck on a single colour
//int MAXTRIES = 1000;
int MAXTRIES = 200;

int locTest;
color colTest;
int xTest;
int yTest;
float testTot;

color col;
int loc;
int x;
int y;

int count = 0;
int tries = 0;
boolean newPix = true;

void setup(){
  reference = loadImage("reference.jpg");
  //size(reference.width,reference.height);
  loadPixels();
  size(225,500,P3D);
  background(255);  
  strokeWeight(1);
}


void draw(){  
  loadPixels();
  if(mousePressed == true && (mouseX<width) && (mouseX>0) && (mouseY<height) && (mouseY>0)){
    if(SPEED < 500) SPEED ++;
    if(DISTANCE > 33) DISTANCE -= .12;
    
    for(int i = 0; i < SPEED; i++){
      if(newPix || tries > MAXTRIES){
        newPix = false;
        tries = 0;
        //choose a random pixel to test for
        //locTest = int(random(reference.pixels.length));
        //grab its colour/position
        //colTest  = reference.pixels[locTest ];
        //xTest  = locTest  % reference.width;
        //yTest  = locTest / reference.width;    
        
        xTest = (int)mouseX;
        yTest = (int)mouseY;
        locTest = yTest*width + xTest;
        colTest  = reference.pixels[locTest ];
        
        //generates the value for that colour
        float rV = colTest >> 16 & 0xFF;
        float gV = colTest >> 8 & 0xFF;
        float bV = colTest & 0xFF;
        testTot = rV + gV + bV;
      }
          
      //choose a random pixel
      loc = int(random(reference.pixels.length));
      col = reference.pixels[loc];
      
      //test    
      if(colorTest(col)){      
        x = loc % reference.width;
        y = loc/ reference.width;
        if(dist(xTest,yTest,x,y) <= DISTANCE){
          stroke(col,40);
          //enable to make spiderweb like drawings
          //stroke(brightness(col),50);
          line(xTest,yTest,x,y);
          count++;
        }
      }
    

      //resets counter
      if(count > TESTS){
        newPix = true;
        count = 0;
      }
      tries++;
    }
  }
  //updatePixels();
}

//tests colour similarities 
boolean colorTest(color _col){
  
  float rV = _col >> 16 & 0xFF;
  float gV = _col >> 8 & 0xFF;
  float bV = _col & 0xFF;  
  float tot = rV + gV + bV;
 
 //check similarity
 float perc = (testTot/tot) *100;
 
 if(perc >= ACCURACY ){
   return true;
 }else return false;
}



