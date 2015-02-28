
int diameter = 50;
int xPosone = 260;
int yPosone = 280;

int xPostwo = 300;
int yPostwo = 300;

int xPosthree = 340;
int yPosthree = 280;

int xPosfour = 340;
int yPosfour = 280;

int xPosfive = 260;
int yPosfive = 280;

int xPossix = 260;
int yPossix = 280;

int xPosseven = 340;
int yPosseven = 280;

int xPoseight = 300;
int yPoseight = 340;

int horizdirection1 =5;
int vertdirection1 =5;
int horizdirection2 =5;
int vertdirection2 =5;
int horizdirection3 =5;
int vertdirection3 =5;
int horizdirection4 =5;
int vertdirection4 =5;
int horizdirection5 =5;
int vertdirection5 =5;
int horizdirection6 =5;
int vertdirection6 =5;
int horizdirection7 =5;
int vertdirection7 =5;
int horizdirection8 =5;
int vertdirection8 =5;
/*int x =10;
int y = 10;
float h = random(1,14);
float v = random(1,14);

//float redVal;
//float greenVal, blueVal;*/
void setup() {
  size(600, 500);
  stroke(255);
  smooth();
  
}

void draw() {
   background(0);
   //redVal=random(128, 255);
   //greenVal=random(mouseX,width);
  
     
   //head
   xPostwo+=horizdirection2;
   if(xPostwo>=500){
     horizdirection2= horizdirection2*-1;
   }
   if(xPostwo<=100){
     horizdirection2 = horizdirection2*-1;
     
   }
   yPostwo+=vertdirection2;
    if(yPostwo>=400){
     vertdirection2= vertdirection2*-1;
   }
   if(yPostwo<=100){
     vertdirection2 = vertdirection2*-1;
     
   }//end head
   
   //left eye?
   xPosone+=horizdirection1;
   if(xPosone>=500){
     horizdirection1= horizdirection1*-1;
   }
   if(xPosone<=100){
     horizdirection1 = horizdirection1*-1;
     
   }
   yPosone+=vertdirection1;
    if(yPosone>=400){
     vertdirection1= vertdirection1*-1;
   }
   if(yPosone<=100){
     vertdirection1 = vertdirection1*-1;
     
   }//end left eye
   //right eye
   xPosthree+=horizdirection3;
   if(xPosthree>=500){
     horizdirection3= horizdirection3*-1;
   }
   if(xPosthree<=100){
     horizdirection3 = horizdirection3*-1;
     
   }
   yPosthree+=vertdirection3;
    if(yPosthree>=400){
     vertdirection3= vertdirection3*-1;
   }
   if(yPosthree<=100){
     vertdirection3 = vertdirection3*-1;
     
   }//end right eye
   //
   xPosfour+=horizdirection4;
   if(xPosfour>=500){
     horizdirection4= horizdirection4*-1;
   }
   if(xPosfour<=100){
     horizdirection4 = horizdirection4*-1;
     
   }
   yPosfour+=vertdirection4;
    if(yPosfour>=400){
     vertdirection4= vertdirection4*-1;
   }
   if(yPosfour<=100){
     vertdirection4 = vertdirection4*-1;
     
   }// end
   //
   xPosfive+=horizdirection5;
   if(xPosfive>=500){
     horizdirection5= horizdirection5*-1;
   }
   if(xPosfive<=100){
     horizdirection5 = horizdirection5*-1;
     
   }
   yPosfive+=vertdirection5;
    if(yPosfive>=400){
     vertdirection5= vertdirection5*-1;
   }
   if(yPosfive<=100){
     vertdirection5 = vertdirection5*-1;
     
   }//end
   //
   xPossix+=horizdirection6;
   if(xPossix>=500){
     horizdirection6= horizdirection6*-1;
   }
   if(xPossix<=100){
     horizdirection6 = horizdirection6*-1;
     
   }
   yPossix+=vertdirection6;
    if(yPossix>=400){
     vertdirection6= vertdirection6*-1;
   }
   if(yPossix<=100){
     vertdirection6 = vertdirection6*-1;
     
   }//end
   //
   xPosseven+=horizdirection7;
   if(xPosseven>=500){
     horizdirection7= horizdirection7*-1;
   }
   if(xPosseven<=100){
     horizdirection7 = horizdirection7*-1;
     
   }
   yPosseven+=vertdirection7;
    if(yPosseven>=400){
     vertdirection7= vertdirection7*-1;
   }
   if(yPosseven<=100){
     vertdirection7 = vertdirection7*-1;
     
   }//end
   //
   xPoseight+=horizdirection8;
   if(xPoseight>=500){
     horizdirection8 = horizdirection8*-1;
   }
   if(xPoseight<=100){
     horizdirection8 = horizdirection8*-1;
     
   }
   yPoseight+=vertdirection8;
    if(yPoseight>=400){
     vertdirection8 = vertdirection8*-1;
   }
   if(yPoseight<=100){
     vertdirection8 = vertdirection8*-1;
     
   }

  noStroke();
  
  //diameter=mouseX*2;
  //start face one
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      fill(255);
    }
  } else {
    fill(250, 200, 100);
  }
ellipse(xPostwo, yPostwo, 200, 200);

fill(255);
noStroke();
ellipse(xPosone, yPosone, 55, 30);

fill(255);
noStroke();
ellipse(xPosthree, yPosthree, 55, 30);

fill(0, 75, 240);
stroke(0, 100);
ellipse(xPosfour, yPosfour, 25, 20);

fill(0, 75, 240);
stroke(0, 100);
ellipse(xPosfive, yPosfive, 25, 20);

fill(0);
noStroke();
ellipse(xPossix,yPossix,10, 10);

fill(0); 
noStroke();
ellipse(xPosseven, yPosseven, 10, 10);

fill(255, 150, 75); //mouth
stroke(255, 150, 100);
ellipse(xPoseight, yPoseight, 100, 10);
//end face one

  
  /*fill(255,255,0,40);//yellow
  ellipse(xPostwo,yPostwo , diameter, diameter);
  
  fill(255,40);//white
  
  ellipse(xPosthree,yPosthree , diameter, diameter);
  
  fill(255,0,255,40);//purple
  ellipse(xPosfour,yPosfour , diameter, diameter);
  
  fill(0,0,255,40);//blue
  ellipse(xPosfive,yPosfive , diameter, diameter);
  
  fill(255,0,0,40);//red
  ellipse(xPossix,yPossix , diameter, diameter);
  
  fill(0,40);//black
  ellipse(xPosseven,yPosseven , diameter, diameter);
  //test add balls */
  /*if(0 <= 10){
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(x,y, 50, 50);
    
     x+=h;
   if(x>=width){
     h= h*-1;
   }
   if(x<=0){
     h = h*-1;
     
   }
   y+=v;
    if(y>=height){
     v= v*-1;
   }
   if(y<=0){
     v = v*-1;
     
   }
  }*/
}
