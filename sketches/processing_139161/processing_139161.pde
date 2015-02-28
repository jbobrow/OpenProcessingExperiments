
void setup(){
size(600, 600);
}
void draw(){
 int x = 300;
 int y = 100;
  
  background(255);
  noStroke();
if (mouseY>400){
background(0);
}
if (mouseY>425){
background(50);
}
if (mouseY>450){
background(100);
}
if (mouseY>475){
background(150);
}
if (mouseY>500){
background(200);
}
if (mouseY>525){
background(255);
}



if (mouseY<100){
  fill(180);
}
else if (mouseY>100){
  fill(255);
}

  //head
  ellipse(x, y, 50, 50);    
  //line(280, 115, 275, 120);
  //line(275, 120, 280, 125);
  //line(280, 125, 285, 120); 

if (mouseY<170){
  fill(180);
}
else if (mouseY>170){
  fill(255);
}
  //body
  quad(x-50, y+30, x+50, y+30, x+10, y+150, x-10, y+150);


if (mouseY<230){
fill(140);
}
 else if (mouseY>230){
  fill(255);
 }
//left hand
  bezier(x-220, y+110, x-220, y+120, x-190, y+170, x-163, y+180);
  bezier(x-220, y+110, x-150, y+110, x-150, y+110, x-163, y+180);  
  //point(x-165, y+125);
  //line(x-220, y+110, x-165, y+125);
  
  if (mouseY<180){
  fill(180);
}
else if (mouseY>180){
  fill(255);
}
 //left arm
  quad(x-65, y+55, x-58, y+65, x-150, y+120, x-157, y+110);
  bezier(x-160, y+109, x-157, y+110, x-150, y+120, x-150, y+123);
  bezier(x-160, y+109, x-165, y+125, x-165, y+125, x-150, y+123); 
  
  if (mouseY<250){
fill(140);
}
 else if (mouseY>250){
  fill(255);
 }
  //right hand
  bezier(x+220, y+110, x+220, y+120, x+190, y+170, x+163, y+180);
  bezier(x+220, y+110, x+150, y+110, x+150, y+110, x+163, y+180);  
  //point(x-165, y+125);
  //line(x-220, y+110, x-165, y+125);



  if (mouseY<200){
  fill(180);
}
else if (mouseY>200){
  fill(255);
}

  //right arm
  //if (mouseX<100){
  //pushMatrix();
  //translate(x+65, y+55);
  // 60 - ( -90 )
  // pi/3 - ( -PI/2 )
  //float angle = map( mouseX, 0, width, PI/3, -PI/2 );
  //if (mouseX<100){
    //rotate(angle);
  //}
  //quad(0, 0, -7, 10, 85, 65, 92, 55);  
  //bezier(x+160, y+109, x+157, y+110, x+150, y+120, x+150, y+123);
  //bezier(x+160, y+109, x+165, y+125, x+165, y+125, x+150, y+123);
  //popMatrix();
  //}
  
  quad(x+65, y+55, x+58, y+65, x+150, y+120, x+157, y+110);  
  bezier(x+160, y+109, x+157, y+110, x+150, y+120, x+150, y+123);
  bezier(x+160, y+109, x+165, y+125, x+165, y+125, x+150, y+123);

if (mouseY<170){
  fill(180);
}
else if (mouseY>170){
  fill(255);
}
 //left shoulder
  bezier(x-50, y+30, x-80, y+50, x-60, y+74, x-36, y+70);

  //right shoulder
  bezier(x+50, y+30, x+80, y+50, x+60, y+74, x+36, y+70);

if (mouseY<130){
  fill(255, 119, 8);
}
 else if (mouseY>130){
  fill(255);
 }
  //left canister
  quad(x-20, y+15, x-60, y+40, x-40, y+60, x-15, y+20);
 
 if (mouseY<150){
  fill(255, 119, 8);
}
 else if (mouseY>150){
  fill(255);
 }
  //right canister
  quad(x+20, y+15, x+60, y+40, x+40, y+60, x+15, y+20);
  

if (mouseY<250){
fill(180);
}
 else if (mouseY>250){
  fill(255);
 }

  //left hip circle
  ellipse(x-25, y+170, 20, 20);
  
  
  if (mouseY<270){
fill(180);
}
 else if (mouseY>270){
  fill(255);
 }
  //right hip circle
  ellipse(x+25, y+170, 20, 20);
  
  
  if (mouseY<290){
    fill(255, 119, 8);
}
 else if (mouseY>290){
  fill(255);
 }

  //left knee
  triangle(x-50, y+230, x-60, y+205, x-35, y+210);
  
  
   if (mouseY<310){
    fill(255, 119, 8);
}
 else if (mouseY>310){
  fill(255);
 }
  //right knee
  triangle(x+50, y+230, x+60, y+205, x+35, y+210);
  
  
  if (mouseY<330){
  fill(180);
}
 else if (mouseY>330){
  fill(255);
 }
  //left ankle circle
  ellipse(x-50, y+270, 10, 10);
  
  
  if (mouseY<350){
  fill(180);
}
 else if (mouseY>350){
  fill(255);
 }
  //right ankle circle
  ellipse(x+50, y+270, 10, 10);
  
  
  if (mouseY<370){
  fill(140);
}
 else if (mouseY>370){
  fill(255);
 }
  //left foot
  bezier(x-80, y+330, x-85, y+265, x-15, y+265, x-20, y+330);
  line(x-80, y+330, x-20, y+330);
  rect(x-80, y+335, 60, 10);


  if (mouseY<390){
  fill(140);
}
 else if (mouseY>390){
  fill(255);
 }
  //right foot
  bezier(x+80, y+330, x+85, y+265, x+15, y+265, x+20, y+330);
  line(x+80, y+330, x+20, y+330);
  rect(x+20, y+335, 60, 10);
  
 

  }




