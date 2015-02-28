
Sunrise sunrise; 
int totalStars=20;
int totalMeteors=20;
boolean sunAlphaSwitch;
Meteor[] meteors= new Meteor[totalMeteors];
Stars[] stars = new Stars[totalStars];


void setup() {
  size(700, 450);
  sunrise= new Sunrise();
  sunAlphaSwitch=true; 
  for (int i=0; i <totalStars; i++) {
    stars[i]= new Stars();
  } 
  for (int i=0; i <totalMeteors; i++) {
    meteors[i]= new Meteor();
  }
}


void draw() {
  background(29, 11, 44);
  ellipseMode(CENTER);
  rectMode(CENTER);  

  ////draw the stars\\\\
  for (int i=0; i <totalStars; i++) {
    stars[i].drawStar();
  } 


  ////fade the stars with the sunrise\\\\   
  sunrise.fadeStars();


  //////draw the meteors\\\\\\
  for (int i=0; i <totalMeteors; i++) {

    meteors[i].moveMeteor();
    meteors[i].drawMeteor();
    meteors[i].meteorTail();
  }

  for (int i=0; i <totalMeteors; i++) {

    if ( meteors[i].yPos > height+300) { // if the meteor gets too far it'll restart
      meteors[i]= new Meteor();
    }
  }

    ///////////////lighter colors near bottom\\\\\\\\\\\\\\\\  
    sunrise.drawLight();
    sunrise.fadeLight(); 


    ///////////////foreground landmass\\\\\\\\\\\\\\\\\
    fill(4, 4, 26);
    ellipse(150, 500, 1300, 200);
  }

class Meteor{
  float xPos;
  float yPos;
  float speed;
  float w;
  float origX;
  float origY;
  float tailAlpha;
  float r;
  float g;
  float b;
  
  Meteor(){
   xPos= random(20, 1050); //meteors will always start in the top right
   yPos=-10; //meteors will always start out of frame
   speed= random(4, 10); //meteors generate at different speeds
   w=random(3, 12);
   
   r= random(152, 255);
   g=random(152, 255);
   b=random(152, 255); 
   
   origX= xPos;
   origY= yPos;
   tailAlpha=70;//sets the original tail transparency so it can fade out
   } 
  
  void drawMeteor(){
    //////// HEAD \\\\\\\
    fill(250, 70);
    ellipse(xPos, yPos, w, w);//the main body of the meteor
    ellipse(xPos, yPos, w/3, w/3); //the center glowy core of the meteor
    
    
    /////// BODY \\\\\\\
    fill(250, 50);
    ellipse(xPos+2, yPos-2, 2*(w/3), 2*(w/3));//biggest part of the taper
    ellipse(xPos+4, yPos-4, (w/2), (w/2));//medium taper
    ellipse(xPos+7, yPos-7, (w/3), (w/3));//smallest taper

  }
  
 void meteorTail(){
  fill(r, g, b, tailAlpha);
  
  ///////////draw tail
   beginShape();
   vertex(xPos-(w/2), yPos-(w/2));
   vertex(xPos+(w/2), yPos+(w/2));
   vertex(origX, origY);
   vertex(origX-10, origY);
   vertex(xPos-(w/2), yPos-(w/2));
   endShape();
 
   if(yPos> 20 && yPos<100){
    tailAlpha= 75;
   } 
   else if (yPos>100 && yPos<150){
     tailAlpha =75;
   }
   else if (yPos>150 && yPos<200){
     tailAlpha=60;
   }
   else if (yPos>200 && yPos<250 ){
     tailAlpha=55;
   }
   else if (yPos>250 && yPos<300){
     tailAlpha=50;
   }
   else if (yPos>300 && yPos<325){
     tailAlpha=45;
   }
   else if (yPos>325 && yPos<350){
     tailAlpha=40;
   }
   else if (yPos>350 && yPos<375){
     tailAlpha=35;
   }
   else if (yPos>375 && yPos<400){
     tailAlpha=30;
   }
    else if (yPos>400 && yPos<410){
     tailAlpha=25;
   }
   else if (yPos>410 && yPos<420){
     tailAlpha=20;
   }
   else if (yPos>420 && yPos<450){
     tailAlpha=15;
   }
    else if (yPos>450 && yPos<500){
     tailAlpha=10;
   }
    else if (yPos>500 && yPos<650){
     tailAlpha=7;
   }
   else if (yPos>650 && yPos<675){
     tailAlpha=4;
   }
   else if (yPos>675 && yPos<700){
     tailAlpha=0;
   }
   
 }
 
  void moveMeteor(){
    xPos-=speed;
    yPos+=speed;
  }
  
  
  
  
  
}
class Stars{
float starAlpha;
float starX;
float starY;
float starW;
  Stars(){
    //sets the initial star position and alpha to random
    starAlpha= random(20, 70);
    starX=random(10, width-10);
    starY=random(10, height-10);
    starW=random(3, 7);
  }
  void drawStar(){
   fill(250, starAlpha);
   //two layers to the star, the bright center and the pale outer ring
   ellipse(starX, starY, starW,starW);
   ellipse(starX, starY, starW/3,starW/3);
  }
  
 
}
class Sunrise {
  float bgAlpha;
  float sunAlpha; 

  Sunrise(){
    bgAlpha=0;
    sunAlpha=0.2;

  }
  
  void drawLight(){
    
  //////sets the initial alpha, each ellipse layer will stack on top and makes a gradient  
  fill(255, 170, 113, sunAlpha);
  noStroke();
  ellipse(150, 497, 1300, 200);
  ellipse(150, 495, 1300, 200);
  ellipse(150, 490, 1300, 200);
  ellipse(150, 480, 1300, 200);
  ellipse(150, 470, 1300, 200);
  ellipse(150, 465, 1300, 200);
  ellipse(150, 450, 1300, 200);
  ellipse(150, 430, 1300, 200);
  }
  
  void fadeLight(){
    //if the alpha is less than zero or greater than 20 it reverses the "direction" of the fade
    if (sunAlphaSwitch == true){
     sunAlpha+=.05;
     bgAlpha+=.7;
    }
    if (sunAlpha >= 20){
      sunAlphaSwitch = false;
    }
    
     if( sunAlphaSwitch==false) {
      sunAlpha-=.05;
      bgAlpha-=.7;

    }
    
    if (sunAlpha <= 0){
     sunAlphaSwitch = true; 
    }
      }
      
////////draws a transparent rectangle that varies in transparancy\\\\\\
  void fadeStars(){
    fill(29, 11, 44, bgAlpha);
    rect(width/2, height/2, width, height);
    
  }
}


