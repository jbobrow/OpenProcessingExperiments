
int diameter = 50;
int xPosone = 10;
int yPosone = 10;
int xPostwo = 10;
int yPostwo = 10;
int xPosthree = 10;
int yPosthree = 10;
int xPosfour = 10;
int yPosfour = 10;
int xPosfive = 10;
int yPosfive = 10;
int xPossix = 10;
int yPossix = 10;
int xPosseven = 10;
int yPosseven = 10;

int horizdirection1 =12;
int vertdirection1 =10;
int horizdirection2 =5;
int vertdirection2 =4;
int horizdirection3 =14;
int vertdirection3 =10;
int horizdirection4 =9;
int vertdirection4 =10;
int horizdirection5 =8;
int vertdirection5 =5;
int horizdirection6 =2;
int vertdirection6 =14;
int horizdirection7 =14;
int vertdirection7 =2;
int x =10;
int y = 10;
float h = random(1,14);
float v = random(1,14);

//float redVal;
//float greenVal, blueVal;
void setup() {
  size(600, 500);
  stroke(255);
  smooth();
  background(0);
}

void draw() {
   
   //redVal=random(128, 255);
   //greenVal=random(mouseX,width);
   xPosone+=horizdirection1;
   if(xPosone>=width){
     horizdirection1= horizdirection1*-1;
   }
   if(xPosone<=0){
     horizdirection1 = horizdirection1*-1;
     
   }
   yPosone+=vertdirection1;
    if(yPosone>=height){
     vertdirection1= vertdirection1*-1;
   }
   if(yPosone<=0){
     vertdirection1 = vertdirection1*-1;
     
   }
   xPostwo+=horizdirection2;
   if(xPostwo>=width){
     horizdirection2= horizdirection2*-1;
   }
   if(xPostwo<=0){
     horizdirection2 = horizdirection2*-1;
     
   }
   yPostwo+=vertdirection2;
    if(yPostwo>=height){
     vertdirection2= vertdirection2*-1;
   }
   if(yPostwo<=0){
     vertdirection2 = vertdirection2*-1;
     
   }
   xPosthree+=horizdirection3;
   if(xPosthree>=width){
     horizdirection3= horizdirection3*-1;
   }
   if(xPosthree<=0){
     horizdirection3 = horizdirection3*-1;
     
   }
   yPosthree+=vertdirection3;
    if(yPosthree>=height){
     vertdirection3= vertdirection3*-1;
   }
   if(yPosthree<=0){
     vertdirection3 = vertdirection3*-1;
     
   }
   xPosfour+=horizdirection4;
   if(xPosfour>=width){
     horizdirection4= horizdirection4*-1;
   }
   if(xPosfour<=0){
     horizdirection4 = horizdirection4*-1;
     
   }
   yPosfour+=vertdirection4;
    if(yPosfour>=height){
     vertdirection4= vertdirection4*-1;
   }
   if(yPosfour<=0){
     vertdirection4 = vertdirection4*-1;
     
   }
   xPosfive+=horizdirection5;
   if(xPosfive>=width){
     horizdirection5= horizdirection5*-1;
   }
   if(xPosfive<=0){
     horizdirection5 = horizdirection5*-1;
     
   }
   yPosfive+=vertdirection5;
    if(yPosfive>=height){
     vertdirection5= vertdirection5*-1;
   }
   if(yPosfive<=0){
     vertdirection5 = vertdirection5*-1;
     
   }
    xPossix+=horizdirection6;
   if(xPossix>=width){
     horizdirection6= horizdirection6*-1;
   }
   if(xPossix<=0){
     horizdirection6 = horizdirection6*-1;
     
   }
   yPossix+=vertdirection6;
    if(yPossix>=height){
     vertdirection6= vertdirection6*-1;
   }
   if(yPossix<=0){
     vertdirection6 = vertdirection6*-1;
     
   }
    xPosseven+=horizdirection7;
   if(xPosseven>=width){
     horizdirection7= horizdirection7*-1;
   }
   if(xPosseven<=0){
     horizdirection7 = horizdirection7*-1;
     
   }
   yPosseven+=vertdirection7;
    if(yPosseven>=height){
     vertdirection7= vertdirection7*-1;
   }
   if(yPosseven<=0){
     vertdirection7 = vertdirection7*-1;
     
   }
  noStroke();
  
  //diameter=mouseX*2;
  fill(0,255,0,40); //green
  ellipse(xPosone,yPosone , diameter, diameter);
  
  fill(255,255,0,40);//yellow
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
  //test add balls
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
