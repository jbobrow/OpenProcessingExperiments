

// import processing.opengl.*;
PImage flock;

PFont font; 
int mode4pickA; int mode4pickB;
int mode = 1;
int currentMax=1;
int nextnext = 0; //point for comparison when making a random new point
int maxBez=50;  //initial length of array
bezPoint[] bezPoints = new bezPoint[maxBez];
int cubeRotate = 0;
boolean doAddNow = false; //left button doer
boolean doSubNow = false; //right button doer
int letterPlace=0;

void setup() {
  flock = loadImage("flock.png");
  font = loadFont("Arial-BoldItalicMT-32.vlw");
  textFont(font); 
  for (int x = 0; x < bezPoints.length; x++) {
    bezPoints[x] = new bezPoint(random(900),            //initializing randomly the points.
                    random(900),random(900),
                    random(900),random(900)-400,
                    random(900)-400,random(900),
                    random(900),random(900)-400);
                                              }
                                          
  colorMode(RGB, 100,100,100,100);
  size(screen.width,screen.height,P3D); 
  background(0);

}

	
void draw() {
 // if(keyPressed==true) {
 // letterPlace=int(random(bezPoints.length-1));      KEYING OPTION IF WANTED?
 //  text(key, bezPoints[letterPlace].pointX,
 //                      bezPoints[letterPlace].pointY,
 //                      bezPoints[letterPlace].pointZ);} 
  emissive(10,20,10);
  noCursor();
  lights();
    if (mousePressed == true) {  // If the mouse is pressed, 
    background(0);                  // turn on lights 
   } 
  fill(0,100,0,20); stroke(0,100,0,20);
  updateBez();             
 if (mode== 1) {
      makeForm();  } //make a 3d shape out of the bezPoints array
       else if (mode==2){
           makeForm2();  }
              else if (mode==3){
                makeForm3();  }
                 else if (mode==4){
                   makeForm4();  }
                   else if (mode==5){
                   makeForm5();  }
                    else if (mode==6){
                   makeForm6();  }
  if(keyPressed) {
    if (key == 'r' || key == 'R') {     
   cubeRotate=cubeRotate+1;
     if(cubeRotate== 2) {
       cubeRotate=0;}}}
 }      
   
   
void updateBez () {
    for (int x=0; x < bezPoints.length; x++) {
    bezPoints[x] = new bezPoint(
                       bezPoints[x].controlX1+random(4)-2,
                       bezPoints[x].controlX2+random(4)-2,
                       bezPoints[x].controlY1+random(4)-2,
                       bezPoints[x].controlY2+random(4)-2,
                       bezPoints[x].controlZ1+random(4)-2,
                       bezPoints[x].controlZ2+random(4)-2,
                       bezPoints[x].pointX+random(4)-2,
                       bezPoints[x].pointY+random(4)-2,
                       bezPoints[x].pointZ+random(4)-2);
  }  
}

void makeForm() {
      beginShape();

       vertex(bezPoints[1].pointX,bezPoints[1].pointY,bezPoints[1].pointZ);
        for (int x = 0; x < currentMax; x++){
         
          bezierVertex(bezPoints[x].controlX1,
                       bezPoints[x].controlX2,
                       bezPoints[x].controlY1,
                       bezPoints[x].controlY2,
                       bezPoints[x].controlZ1,
                       bezPoints[x].controlZ2,
                       bezPoints[x].pointX,
                       bezPoints[x].pointY,
                       bezPoints[x].pointZ
                        );
       }
      endShape();}
      
void makeForm2() {
      beginShape();
       vertex(bezPoints[1].pointX,bezPoints[1].pointY,bezPoints[1].pointZ);
        for (int x = 0; x < currentMax; x++){
          vertex(
                       bezPoints[x].pointX,
                       bezPoints[x].pointY,
                       bezPoints[x].pointZ
                        );
       }
      endShape();}
      
void makeForm3() {
        for (int x = 0; x < currentMax; x++){
                      fill(40,10,20,70);
                      stroke(40,10,20,50);
                      pushMatrix();
                     
                      translate(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ);
                       
                      
                      rotateX(360*cos(millis()*0.00001));
                      rotateY(360*cos(millis()*0.00001));
                      rotateZ(360*cos(millis()*0.00001)); 
                      box(20);
                      popMatrix();
                      if (x==bezPoints.length-2){
                          line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
                                bezPoints[0].pointX,bezPoints[0].pointY,bezPoints[0].pointZ); }
                        else {
                           line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
                                bezPoints[x+1].pointX,bezPoints[x+1].pointY,bezPoints[x+1].pointZ); }
                     
      }
}

void makeForm4 () {

  stroke(30,50,90,80);
   for (int x = 0; x < currentMax; x++){
       strokeWeight(10);
      if (x==bezPoints.length-2){
         line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
             bezPoints[0].pointX,bezPoints[0].pointY,bezPoints[0].pointZ); }
         else {
              line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
                    bezPoints[x+1].pointX,bezPoints[x+1].pointY,bezPoints[x+1].pointZ); }
      strokeWeight(1);    
        mode4pickA= int(random(bezPoints.length));
        mode4pickB= int(random(bezPoints.length));
         line(bezPoints[mode4pickA].pointX,bezPoints[mode4pickA].pointY,bezPoints[mode4pickA].pointZ,
                    bezPoints[mode4pickB].pointX,bezPoints[mode4pickB].pointY,bezPoints[mode4pickB].pointZ); }
        
                    
  
   }
   
   void makeForm5() {
        for (int x = 0; x < currentMax; x++){
                      fill(40,10,20,50);
                      stroke(40,10,20,50);
                      image(flock,bezPoints[x].pointX,bezPoints[x].pointY);}}
  
 void makeForm6() {
   background(100);
          for (int x = 0; x < currentMax; x++){
                      
                      fill(0,0,0,70);
                      stroke(40,10,20,50);
                      pushMatrix();
                     
                      translate(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ);
                       
                      
                      rotateX(360*cos(millis()*0.00001));
                      rotateY(360*cos(millis()*0.00001));
                      rotateZ(360*cos(millis()*0.00001)); 
                      box(20);
                      popMatrix();
                      if (x==bezPoints.length-2){
                          line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
                                bezPoints[0].pointX,bezPoints[0].pointY,bezPoints[0].pointZ); }
                        else {
                           line(bezPoints[x].pointX,bezPoints[x].pointY,bezPoints[x].pointZ,
                                bezPoints[x+1].pointX,bezPoints[x+1].pointY,bezPoints[x+1].pointZ); }
                     
      }
     beginShape();
       vertex(bezPoints[1].pointX,bezPoints[1].pointY,bezPoints[1].pointZ);
        for (int x = 0; x < currentMax; x++){
          vertex(
                       bezPoints[x].pointX,
                       bezPoints[x].pointY,
                       bezPoints[x].pointZ
                        );
       }
      endShape();
    }
  
  

void smoothFade () {
  fill(0,80*sin(millis()*0.001));
  rect(-2,-2,width+2,height+2);
}

void newMaker (int which) {
                       bezPoints[which].controlX1= (random(width)+mouseX)*0.5;
                       bezPoints[which].controlX2= (random(width)+mouseX)*0.5;
                       bezPoints[which].controlY1= (random(height)+mouseY)*0.5;
                       bezPoints[which].controlY2= (random(height)+mouseY)*0.5;
                       bezPoints[which].controlZ1= random(900)-200;
                       bezPoints[which].controlZ2= random(900)-200;
                       bezPoints[which].pointX= (random(width)+mouseX)*0.5;
                       bezPoints[which].pointY=(random(height)+mouseY)*0.5;
                       bezPoints[which].pointZ= random(900)-200;}
    

class bezPoint {
  float controlX1;
  float controlX2;
  float controlY1;
  float controlY2;
  float controlZ1;
  float controlZ2;
  float pointX;
  float pointY;
  float pointZ;
  bezPoint(float cx1,float cx2,float cy1,float cy2,float cz1,float cz2,float px,float py,float pz) {
    controlX1 = cx1;
    controlX2 = cx2;
    controlY1 = cy1;
    controlY2 = cy2;
    controlZ1 = cz1;
    controlZ2 = cz2;
    pointX = px;
    pointY = py;
    pointZ = pz; }
    
  void fresh() {
  float controlX1 =random(200);
  float controlX2 =random(200);
  float controly1 =random(200);
  float controlY2 =random(200);
  float controlZ1 =random(200);
  float controlZ2 =random(200);
  float pointX =random(200);
  float pointY =random(200);
  float pointZ =random(200);}
} 
  
  
                    
  
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (nextnext == bezPoints.length-1) {
        nextnext= 0; }
        else {nextnext = nextnext+1;
      newMaker(nextnext);
    }

     }
    else if (keyCode == LEFT) {
       if (nextnext == 0) {
        nextnext= bezPoints.length-1; } 
        else {nextnext = nextnext-1;}
         for(int xx=0;xx<10;xx++){
         newMaker(int(random(bezPoints.length-1)));
       }
       
    }
   else if (keyCode == SHIFT) {
       mode= mode + 1;
       if (mode==7) { mode=1; }
       }
   else if (keyCode == ALT) {
       mode= mode - 1;
       if (mode==0) { mode=5; }
       }    
       
    else if (keyCode == UP) {
      if (currentMax == bezPoints.length-1)
          {currentMax = 0;}
         else {currentMax=currentMax+1;}}
    else if (keyCode == DOWN) {
      if (currentMax == 0)
          {currentMax = bezPoints.length-1;;}
         else {currentMax=currentMax-1;}}
    
       }
       
    } 

 


