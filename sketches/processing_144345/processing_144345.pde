
/* 0pjs preload = "url.jpeg"; */
PImage img;
float x;
float y;
//float easing = .04;
//float angle = 0;
//float angleDirection = 1;
//float speed = .02;
float angle = 0;
float offset = 250; 
float scalar = 25;
float speed = .02;

float angle1 = 0;
float angleDirection = 1;
float speed1 = .01;


void setup(){
size(600, 600);
img = loadImage("url.jpeg");
}
void draw(){

  int x = 300;
  int y = 100;
  
 image(img, 0, 0, 800, 600);
  //background(255);
  noStroke();
//fill(255, 20);
//rect(0, 0, 600, 600);

    
   // if (mousePressed ){    //experimenting 
    //x = 500;
    //y = 100;

  //}


//body
pushMatrix();

if (mouseY<170){
  fill(180, 100);
}
else if (mouseY>170){
  fill(220, 100);
}
  quad(x-50, y+30, x+50, y+30, x+10, y+150, x-10, y+150);
angle += speed/8;
popMatrix();

//left hand

pushMatrix();
float x2 = offset+21 + sin(-angle + .8) * scalar;

if (mouseY<230){
fill(140, 100);
}
 else if (mouseY>230){
  fill(220, 100);
 }
  bezier(x2-220, y+110, x2-220, y+120, x2-190, y+170, x2-163, y+180);
  bezier(x2-220, y+110, x2-150, y+110, x2-150, y+110, x2-163, y+180);  
 
 angle += speed/8;
 popMatrix();
 
 
   //left arm

 pushMatrix();
 float x1 = offset+43 + sin(-angle) * scalar/2;

  if (mouseY<180){
  fill(220, 100);
}
else if (mouseY>180){
  fill(220,100);
} 
 
  quad(x1-65, y+55, x1-58, y+65, x1-150, y+120, x1-157, y+110);
  bezier(x1-160, y+109, x1-157, y+110, x1-150, y+120, x1-150, y+123);
  bezier(x1-160, y+109, x1-165, y+125, x1-165, y+125, x1-150, y+123); 
  
  angle += speed/8;
  popMatrix();
  
  
  
pushMatrix();
float x3 = offset+52 + sin(angle) * scalar/2;
//right arm
  if (mouseY<200){
  fill(220, 100);
}
else if (mouseY>200){
  fill(220, 100);
} 
  quad(x3+75, y+55, x3+68, y+65, x3+160, y+120, x3+167, y+110);
  bezier(x3+170, y+109, x3+167, y+110, x3+160, y+120, x3+160, y+123);
  bezier(x3+170, y+109, x3+175, y+125, x3+175, y+125, x3+160, y+123); 
  
angle += speed/8;
popMatrix();
  
  
    //right hand 
pushMatrix();
float x4 = offset + 80 + sin(angle + 6) * scalar;
   if (mouseY<250){
fill(140, 100);
}
 else if (mouseY>250){
  fill(220, 100);
 }

  line(x4-220, y+110, x4-165, y+125);
  bezier(x4+220, y+110, x4+220, y+120, x4+190, y+170, x4+163, y+180);
  bezier(x4+220, y+110, x4+150, y+110, x4+150, y+110, x4+163, y+180); 
angle += speed/8;
popMatrix();
 
  
   //left shoulder
pushMatrix();
float x5 = offset+50 + sin(-angle) * scalar/4;
if (mouseY<170){
  fill(180, 100);
}
else if (mouseY>170){
  fill(220, 100);
}
  bezier(x5-50, y+30, x5-80, y+50, x5-60, y+74, x5-36, y+70);
angle += speed/8;
popMatrix();

  //right shoulder
  pushMatrix();
  float x6 = offset+55 + sin(angle) * scalar/4;
  
  if (mouseY<170){
  fill(180, 100);
}
else if (mouseY>170){
  fill(220, 100);
}
  bezier(x6+50, y+30, x6+80, y+50, x6+60, y+74, x6+36, y+70);
angle += speed/8;
popMatrix();


 //head
pushMatrix();
float y10 = offset-175 + sin(-angle) * scalar;
if (mouseY<100){
  fill(200, 50);
}
else if (mouseY>100){
  fill(220, 100);
}
  ellipse(x, y10, 50, 50);    
  angle += speed/8;
popMatrix();



  //left canister
pushMatrix();

translate (x-20, y + 15);
float canisterAngle = map (frameCount%60, 0, 60, 0, TWO_PI); //speed of rotation
rotate(canisterAngle);


if (mouseY<130){
  fill(255, 119, 8, 100);
}
 else if (mouseY>130){
  fill(220, 100);
 }
  //quad(x-20, y+15, x-60, y+40, x-40, y+60, x-15, y+20);
  quad(0, 0, -40, 25, -20, 45, 5, 5);
  
  angle += speed/8;
  
  popMatrix();

  //right canister

pushMatrix();
translate(x+20, y+15);
float canister2Angle = map (frameCount%60, 0, 60, 0, TWO_PI); //speed of rotation  
rotate(-canister2Angle);
if (mouseY<150){
fill(255, 119, 8, 100);
}
else if (mouseY>150){
fill(220, 100);
 }
// quad(x+20, y+15, x+60, y+40, x+40, y+60, x+15, y+20);
quad(0, 0, 40, 25, 20, 45, -5, 5);
  angle += speed;
popMatrix();
  

pushMatrix();

//if (angle < PI){
//  scalar = 10;
//}
//else{
//  scalar = 50;
//}
float y1 = offset + sin(angle) * scalar/4;
float y2 = offset + sin(angle + .4) * scalar/2;

//left hip circle

if (mouseY<250){
fill(180, 100);
}
 else if (mouseY>250){
  fill(220, 100);
 }
  
    ellipse(x-25, y1, 20, 20);
  
  
//angle += speed;
// popMatrix();

  
  if (mouseY<270){
fill(180, 100);
}
 else if (mouseY>270){
  fill(220, 100);
 }
  //right hip circle
  
  ellipse(x+25, y1, 20, 20);
  
  
  


  //left knee
  
  if (mouseY<290){
    fill(255, 119, 8, 100);
}
 else if (mouseY>290){
  fill(220, 100);
 }


  triangle(x-40, y2+40, x-60, y2+40, x-45, y2+70);
   
   



  //right knee
    
   if (mouseY<310){
    fill(255, 119, 8, 100);
}
 else if (mouseY>310){
  fill(220, 100);
 }
  
  triangle(x+40, y2+40, x+60, y2+40, x+45, y2+70);
  
//  if (angle > TWO_PI){
//     angle = 0;
//   }
   angle += speed;
 popMatrix();
  
    
  if (mouseY<330){
  fill(180, 100);
}
 else if (mouseY>330){
  fill(220, 100);
 }
 
pushMatrix();
//if(angle < PI){
//  scalar = 10;
//}
//else{
//  scalar = 50;
//}
float y3 = offset + sin(angle + .8) * scalar;
  
  //left ankle circle
     if(mouseX<280){
  ellipse(x-50, y3+100, 10, 10);
     }
  else if(mouseX>280){
      ellipse(x-50, y3+100, 10, 10);
  }
    //if (angle > TWO_PI){
      //angle = 0;
    //}
   
    
  if (mouseY<350){
  fill(180, 100);
}
 else if (mouseY>350){
  fill(220, 100);
 }
  //right ankle circle
  ellipse(x+50, y3+100, 10, 10);

   angle += speed/8;
 popMatrix();
  
  if (mouseY<370){
  fill(140, 100);
}
 else if (mouseY>370){
  fill(220, 100);
 }
  //left foot
  pushMatrix();

float y4 = offset + sin(angle + .9) * scalar;
  
  bezier(x-80, y4+180, x-85, y4+120, x-15, y4+120, x-20, y4+180);
  line(x-80, y+330, x-20, y+330);
  rect(x-80, y4+185, 60, 10);

   
  //right foot

  if (mouseY<390){
  fill(140, 100);
}
 else if (mouseY>390){
  fill(220, 100);
 }
  
  bezier(x+80, y4+180, x+85, y4+120, x+15, y4+120, x+20, y4+180);
  line(x+80, y+330, x+20, y+330);
  rect(x+20, y4+185, 60, 10);
  
  
 angle += speed/8;

popMatrix();



  }
  




