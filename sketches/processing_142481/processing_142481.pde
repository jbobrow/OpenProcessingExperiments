
/* 0pjs preload = "url.jpeg"; */
PImage img;
float x;
float y;
float easing = .01;
//float angle = 0;
//float angleDirection = 1;
//float speed = .02;
float angle = 0;
float offset = 60; 
float scalar = 40;
float speed = .05;


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

    
    if (mousePressed ){    //experimenting 
    x = 500;
    y = 100;

  }

//if (keyPressed && (key == CODED)){
  //if (keyCode == LEFT){
    //x--;
  //} else if (keyCode == RIGHT) {
   // x++;
 // }
//}

float targetX = mouseX*8;    //experimenting
x += (targetX - x) * easing;
float targetY = mouseY*8;
y += (targetY - y) * easing;



if (mouseY<100){
  fill(230, 100);
}
else if (mouseY>100){
  fill(220, 100);
}
  //head
  ellipse(x, y, 50, 50);    
  //line(280, 115, 275, 120);
  //line(275, 120, 280, 125);
  //line(280, 125, 285, 120); 

if (mouseY<170){
  fill(180, 100);
}
else if (mouseY>170){
  fill(220, 100);
}
  //body
  quad(x-50, y+30, x+50, y+30, x+10, y+150, x-10, y+150);


if (mouseY<230){
fill(140, 100);
}
 else if (mouseY>230){
  fill(220, 100);
 }
//left hand
  bezier(x-220, y+110, x-220, y+120, x-190, y+170, x-163, y+180);
  bezier(x-220, y+110, x-150, y+110, x-150, y+110, x-163, y+180);  
  //point(x-165, y+125);
  //line(x-220, y+110, x-165, y+125);
  
 
 
  if (mouseY<180){
  fill(220, 100);
}
else if (mouseY>180){
  fill(220,100);
}
 //left arm
 
  
  //translate(-55, 50);
  //rotate(angle);
  quad(x-65, y+55, x-58, y+65, x-150, y+120, x-157, y+110);
  bezier(x-160, y+109, x-157, y+110, x-150, y+120, x-150, y+123);
  bezier(x-160, y+109, x-165, y+125, x-165, y+125, x-150, y+123); 
  
  //angle += speed * angleDirection;
  //if ((angle > QUARTER_PI) || (angle < 0 )){
  
//  }


  if (mouseY<200){
  fill(220, 100);
}
else if (mouseY>200){
  fill(220, 100);
}

  //right arm
  if (mouseX<width){
  pushMatrix();
  translate(x+55, y+50);
   //60 - ( -90 );
   //pi/3 - ( -PI/2 );
  float angle = map( mouseX*2, 0, width, PI/3, -PI/2 );
  if (mouseX<width){
    rotate(angle);   
  }
  quad(0, 0, -7, 10, 85, 65, 92, 55);  
  bezier(95, 54, 92, 55, 85, 65, 85, 68);
  bezier(95, 54, 100, 70, 100, 70, 85, 68);
  
   if (mouseY<250){
fill(140, 100);
}
 else if (mouseY>250){
  fill(220, 100);
 }
  //right hand 
  bezier(155, 55, 155, 65, 125, 115, 98, 125);
  bezier(155, 55, 85, 55, 85, 55, 98, 125);  
  //point(x-165, y+125);
  //line(x-220, y+110, x-165, y+125);
  //bezier(x+220, y+110, x+220, y+120, x+190, y+170, x+163, y+180);
  //bezier(x+220, y+110, x+150, y+110, x+150, y+110, x+163, y+180); 

  popMatrix();
  }
  
  //quad(x+65, y+55, x+58, y+65, x+150, y+120, x+157, y+110);  
  //bezier(x+160, y+109, x+157, y+110, x+150, y+120, x+150, y+123);
  //bezier(x+160, y+109, x+165, y+125, x+165, y+125, x+150, y+123);

if (mouseY<170){
  fill(180, 100);
}
else if (mouseY>170){
  fill(220, 100);
}
 //left shoulder
  bezier(x-50, y+30, x-80, y+50, x-60, y+74, x-36, y+70);

  //right shoulder
  bezier(x+50, y+30, x+80, y+50, x+60, y+74, x+36, y+70);

if (mouseY<130){
  fill(255, 119, 8, 100);
}
 else if (mouseY>130){
  fill(220, 100);
 }
  //left canister
  quad(x-20, y+15, x-60, y+40, x-40, y+60, x-15, y+20);
 
 if (mouseY<150){
  fill(255, 119, 8, 100);
}
 else if (mouseY>150){
  fill(220, 100);
 }
  //right canister
  quad(x+20, y+15, x+60, y+40, x+40, y+60, x+15, y+20);
  

float y1 = offset + sin(angle) * scalar;
float y2 = offset + sin(angle + .4) * scalar;
float y3 = offset + sin(angle + .8) * scalar;

//left hip circle

if (mouseY<250){
fill(180, 100);
}
 else if (mouseY>250){
  fill(220, 100);
 }
  
  if(mouseX<200){
    ellipse(x-25, y+170, 20, 20);
  }
  else if (mouseX>200){
    ellipse(x-25, y+150, 20, 20);
}
  

  
  
  if (mouseY<270){
fill(180, 100);
}
 else if (mouseY>270){
  fill(220, 100);
 }
  //right hip circle
  if(mouseX<320){
  ellipse(x+25, y+170, 20, 20);
  }
  else if(mouseX>320){
    ellipse(x+35, y+170, 20, 20);
  }
  if (mouseY<290){
    fill(255, 119, 8, 100);
}
 else if (mouseY>290){
  fill(220, 100);
 }

  //left knee
   if(mouseX<240){
  triangle(x-50, y+230, x-60, y+205, x-35, y+210);
   }
    else if (mouseX>240){
    triangle(x-50, y+210, x-60, y+185, x-35, y+190);
    }
    
   if (mouseY<310){
    fill(255, 119, 8, 100);
}
 else if (mouseY>310){
  fill(220, 100);
 }
  //right knee
  if (mouseX<340){
  triangle(x+50, y+230, x+60, y+205, x+35, y+210);
  }
  else if (mouseX>340){
      triangle(x+70, y+230, x+80, y+205, x+55, y+210);
  }
    
  if (mouseY<330){
  fill(180, 100);
}
 else if (mouseY>330){
  fill(220, 100);
 }
  //left ankle circle
     if(mouseX<280){
  ellipse(x-50, y+270, 10, 10);
     }
  else if(mouseX>280){
      ellipse(x-50, y+250, 10, 10);
  }
    
  if (mouseY<350){
  fill(180, 100);
}
 else if (mouseY>350){
  fill(220, 100);
 }
  //right ankle circle
  if (mouseX<380){
  ellipse(x+50, y+270, 10, 10);
  }
  else if(mouseX>380){
    ellipse(x+90, y+270, 10, 10);
  }
  
  if (mouseY<370){
  fill(140, 100);
}
 else if (mouseY>370){
  fill(220, 100);
 }
  //left foot
  if(mouseX<320){
  bezier(x-80, y+330, x-85, y+265, x-15, y+265, x-20, y+330);
  line(x-80, y+330, x-20, y+330);
  rect(x-80, y+335, 60, 10);
  }
else if(mouseX>320){
   bezier(x-80, y+310, x-85, y+245, x-15, y+245, x-20, y+310);
  line(x-80, y+310, x-20, y+310);
  rect(x-80, y+315, 60, 10);
}
  if (mouseY<390){
  fill(140, 100);
}
 else if (mouseY>390){
  fill(220, 100);
 }
  //right foot
  if (mouseX<400){
  bezier(x+80, y+330, x+85, y+265, x+15, y+265, x+20, y+330);
  line(x+80, y+330, x+20, y+330);
  rect(x+20, y+335, 60, 10);
  }
  else if(mouseX>400){
 bezier(x+140, y+330, x+145, y+265, x+75, y+265, x+80, y+330);
  line(x+140, y+330, x+80, y+330);
  rect(x+80, y+335, 60, 10);
  }
//angle += speed;
//}

  }
  




