
class fsm{
  
  int numPngs=27;
  PImage[] images= new PImage[numPngs];
  String imageName;
  


int x=0, y=0;
float size1;
float size2;
float angle;
color hexColor;
int alph;

float xCenter=0;
float  yCenter=0;
float xCenter21=0;
float yCenter21=0;
float xCenter23=0;
float yCenter23=0;


float mouserX=0;
float mouserY=0;

int x2, y2;
float xPos, yPos;
float anglePos;
  
float speed=3.0;
float easing=.0175;

  fsm(int xposition, int yposition, float scaler, float angler, color hexer, int alp1){
  x=xposition;
  y=yposition;
  size1=scaler;
  size2=size1;
  angle=angler;
  hexColor=hexer;
  alph=alp1;
 
  }
  
  void pngLoader(){

   for(int i=0; i<images.length; i++){
    imageName="fsmfood"+nf(i+1,3)+".png";
    images[i]=loadImage(imageName);
   }
  }

  
 void position(){
   for(int i=0; i<images.length; i++){
     

     xPos=mouserX;
     yPos=mouserY;
     
     
     anglePos=angle;
    placement(i);
    movingAround();
    jitteryMovement();
    scaler();
    

    
    xPos+=x2;
    yPos+=y2;
    
    
    if(i==21){
      xCenter21=xPos;
      yCenter21=yPos;}
      if(i==23){
        xCenter23=xPos;
        yCenter23=yPos;
        xCenter=(xCenter21+xCenter23)/2;
        yCenter=(yCenter21+yCenter23)/2;
      }

    pushMatrix();
    rotate(angle);
    translate(constrain(xPos,0, width/1.15), constrain(yPos,0,height/1.2));
   
    scale(size2*1.5,size2);
    tint(hexColor, alph);
    image(images[i],0,0);
    noTint();
      popMatrix();
 

  
 
 }
}


void jitteryMovement(){
xPos+=random(-.01,01);
yPos+=random(-.01,01);
anglePos+=random(-.01,.01);
}
  
  
 void scaler(){
   if(mousePressed && dist(xCenter, yCenter, mouseX, mouseY)>150)
     size2+=random(-.01, .01);
   else if(size2!=size1)
       size2+=(size1-size2)*easing;
       
       
 }
 
 
 void movingAround(){
   if(mousePressed && dist(xCenter, yCenter, mouseX, mouseY)<200){
   xPos=mouseX-(width/2);
   yPos=mouseY-(height/2);
   mouserX=xPos;
   mouserY=yPos;
   
   }
   else{
   xPos+=cos(angle)*speed;
   yPos+=sin(angle)*speed;
   }
   

if(xPos>width || xPos<-width/2 || yPos>height || yPos<-height/2) speed*=-1;
 }



void placement(int i){

      if(i==0){
        x2=100;
        y2=90; }
        else if(i==1){
          x2=225;
        y2=95; }
        else if(i==2){
          x2=80;
        y2=95; }
        else if(i==3){
          x2=300;
        y2=105; }
        else if(i==4){
          x2=60;
        y2=165; }
        else if(i==5){
          x2=100;
        y2=110; }
        else if(i==6){
          x2=180;
        y2=105; }
        else if(i==7){
          x2=175;
        y2=142; }
        else if(i==8){
          x2=145;
        y2=95; }
        else if(i==9){
          x2=245;
        y2=55; }
        else if(i==10){
          x2=40;
        y2=115; }
        else if(i==11){
          x2=275;
        y2=165; }
        else if(i==12){
          x2=35;
        y2=95; }
        else if(i==13){
          x2=235;
        y2=159; }
        else if(i==14){
          x2=225;
        y2=125; }
        else if(i==15){
          x2=285;
        y2=170; }
        else if(i==16){
          x2=215;
        y2=80; }
        else if(i==17){
          x2=160;
        y2=75; }
        else if(i==18){
          x2=130;
        y2=55; }
        else if(i==19){
          x2=210;
        y2=25; }
        else if(i==20){
          x2=115;
        y2=20; }
        else if(i==21){
          x2=140;
        y2=40; }
        else if(i==22){
          x2=105;
        y2=90; }
        else if(i==23){
          x2=240;
        y2=40; }
        else if(i==24){
          x2=90;
        y2=85; }
        else if(i==25){
          x2=180;
        y2=95; }
        else if(i==26){
          x2=200;
          y2=110;}
x2+=x;
y2+=y;
}
}

