
PShape heart;
PImage candy;
PImage tear;
PShape face;


void setup(){
  size (640,480);
  smooth();
  heart=loadShape("heart.svg"); 
  candy=loadImage("candyy.png");
  tear =loadImage("tear.png");
  face =loadShape("face.svg"); 

}

void draw () {
 background(255);

 shapeMode(CORNER);
 shape(face,30,300);
 
 shapeMode(CENTER);
 image(candy,mouseX,mouseY);
 
  float NudgeX=0;
  float NudgeY=0;
  
  
  float centerX1 = 161;
  float centerX2 = 479;
  float centerY = 202;
  float distance= dist(mouseX,mouseY,320,240);
  
  float radius = 30;
  float radius1 = 50;
  

  float angle1 = atan2(mouseY- centerY, mouseX- centerX1);
  float angle2 = atan2(mouseY- centerY, mouseX- centerX2);
  float angle3 = atan2(centerY-mouseY , centerX1-mouseX);

// black eyeballs
 noStroke();
 fill(0);
 ellipse(161,202,146,146);
 ellipse(479,202,146,146);

   // the magic circle equation
  float x1 = centerX1 + cos(angle1) * radius;
  float x2 = centerX2 + cos(angle2) * radius;
  float y = centerY + sin(angle1) * radius;
  float x3 = centerX1 + cos(angle3) * radius1;
  float x4 = centerX1 + cos(angle3) * 40;
  float x5 = centerX1 + cos(angle3) * 30;
  float x6 = centerX2 + cos(angle3) * radius1;
  float x7 = centerX2 + cos(angle3) * 40;
  float x8 = centerX2 + cos(angle3) * 30;
  
  float y3 = centerY + sin(angle3) * 20;

//pupil left
 noStroke();
 fill(255);
 ellipse(x1,y,66,66);  //(187,214,66,66);
 
//pupil right 
 noStroke();
 fill(255);
 ellipse(x2,y,66,66);
 image(candy,mouseX,mouseY);
 
 
 if (mousePressed){
      
      NudgeX= random(-5,5);
      NudgeY= random(-5,5);
//pupil left
 noStroke();
 fill(255);
 ellipse(x1+NudgeX,y+NudgeY,66,66);  //(187,214,66,66);
 
//pupil right 
 noStroke();
 fill(255);
 ellipse(x2+NudgeX,y+NudgeY,66,66);
   
   
      image(tear,-10,0);
      shapeMode(CORNER);
      shape(face,30,300);
      image(candy,mouseX,mouseY); 
  

  }
 
 
 else if(distance< 130 ){

   float nudgeX= random(50,55); // movement
    
    noStroke();
    fill(0);
    ellipse(x1,y,70,70);
    ellipse(x2,y,70,70);
    
    
    shape(heart,x1+5,y+5, nudgeX, nudgeX);//x,y,width,height
    shape(heart,x2,y+10, nudgeX, nudgeX);
    image(candy,mouseX,mouseY);}
   
    else{




// reflection 
 noStroke();
 fill(255);
 ellipse(x3,y3-2,28,40);//(123,200,28,40);
 ellipse(x6,y3-2,28,40);//(516,200,28,40);
 ellipse(x4,y3-35,15,15);//(126,167,15,15);
 ellipse(x7,y3-35,15,15);//(509,167,15,15);
 ellipse(x5,y3-44,8,8);//(153,158,8,8);
 ellipse(x8,y3-44,8,8);//(491,158,8,8);
 image(candy,mouseX,mouseY);
 }

 







}



