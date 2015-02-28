
//ships specs
int shipSize=10; //wich is the scalarFactor of the ship
int shipReds=0, shipGreens=0, shipBlues=0;
int rotateSpeed=100; //smaller numbers, increases speed (b/c it is fractions of a circle)
float linearSpeed=2; // x and y speed control


int keyStorMode=0;
int globalCounter=1;
float rotateVar=0;
float shipX=600/2;
float shipY=600/2;

//Global
int globalTest=0;
int secondGlobalCounter=20;

//LOCAL
int localMouseX, localMouseY;
int localDrop=1;
int localDropX=1;
int localDropY=1;
int slowGrow=150;

void setup(){
  size(600,600);
  background(255);
  
  pushMatrix();
  translate(width/2,height/2);
  ship(shipSize, shipReds, shipGreens, shipBlues);
  popMatrix();
}

void draw(){
  //background(255);
  
  if(mouseX>=0 && mouseX<=width && mouseY>=0 && mouseY<=height){
    background(255);
    pushMatrix();
      translate(mouseX,mouseY);
      rotate(rotateVar);
      ship(shipSize, shipReds, shipGreens, shipBlues);
    popMatrix();
  }
  
  if(mousePressed){
    localMouseX=mouseX-100;
    localMouseY=mouseY;
    
    for(int i=0; i<secondGlobalCounter; i++){
      localDropX=(int)random(
                      random(-400,-100),random(100,400));
      localDropY=(int)random(
                      random(-400,-100),random(100,400));
      pushMatrix();
        translate(localMouseX+localDropX,localMouseY+localDropY);
        //rotate(rotateVar);
        //fill(100);
        ship(shipSize, shipReds+100, shipGreens+100, shipBlues+100);
      popMatrix();
    }
    
    //localMouseX=localMouseX-localDrop;
    //localMouseY=localMouseY-localDrop;
    
    //println(globalTest);
  }
  
  secondGlobalCounter=secondGlobalCounter+2;
  
  if(secondGlobalCounter>slowGrow){
    secondGlobalCounter=20;
  }
  
  slowGrow=slowGrow+1;
}


void ship(float scalarFactor, int reds, int greens, int blues){
  if(globalCounter==1){
  
  float grow=scalarFactor/2;
  
  noStroke();
  //fill(255,255,255);
  //rect(-8*grow,-2*grow,8*2*grow,2.2*2*grow);
  
  fill(reds, greens, blues);
  beginShape();
      vertex(0, -1.5*grow);//front tip (starting clockwise)
      vertex(1.5*grow, 0.25*grow);//top left square pt
      vertex(6*grow, -0.5*grow);//wing tip
      vertex(1.0*grow, 2*grow);
      vertex(-1.0*grow, 2*grow);
      vertex(-6*grow, -0.5*grow);//wing tip
      vertex(-1.5*grow, 0.25*grow);//top right square pt
      vertex(0, -1.5*grow);//to close the ship
  endShape();
  noFill();
  }//to close the if
}

//void shipDrop(){
//}

