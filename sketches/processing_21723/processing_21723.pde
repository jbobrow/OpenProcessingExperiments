
float inc = 0.0;
float y = 0;
int time1 = 5000;
int time2 = 10000;
int time3 = 15000;
int time4 = 20000;
int time5 = 25000;
int time6 = 30000;
PImage back;

void setup(){
  size(500,600);
  smooth();
  back = loadImage("background.png");
}

void draw(){
  image(back,0,0);
  inc+=0.01;
  float angle = sin(inc)/80.0+sin(inc*0.8)/100.0;

 //grass from 500-400
 
 if((mouseX>400)&&(mouseX<500)&&(mouseY<height)&&(mouseY>200)){
 pushMatrix();
  translate(470,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11, 150);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
  }
  popMatrix();
 
 pushMatrix();
  translate(490,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
  pushMatrix();
  translate(420,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
 }
 else{
    pushMatrix();
  translate(470,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
  }
  popMatrix();
 
 pushMatrix();
  translate(490,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
  pushMatrix();
  translate(420,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
 }
  
  
//grass from 400-300

if((mouseX>300)&&(mouseX<400)&&(mouseY<height)&&(mouseY>200)){
 pushMatrix();
  translate(365,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
  pushMatrix();
  translate(400,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-35);
    translate(0,-35);
    rotate(angle);
  }
  popMatrix();
  
 }
 else{
    pushMatrix();
  translate(365,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();

  pushMatrix();
  translate(400,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-35);
    translate(0,-35);
    rotate(angle);
  }
  popMatrix();
 }
  
  
//grass from 300-200
if((mouseX>200)&&(mouseX<300)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(240,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
}
else{
  pushMatrix();
  translate(240,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
}
  
//grass from 200-100
if((mouseX>100)&&(mouseX<200)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(160,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
}
else{
  pushMatrix();
  translate(160,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
}
  
//grass from 100-0
if((mouseX>0)&&(mouseX<100)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(90,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
  pushMatrix();
  translate(40,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
   pushMatrix();
  translate(20,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
  }
  popMatrix();
}
else{
  pushMatrix();
  translate(90,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
  pushMatrix();
  translate(40,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
  }
  popMatrix();
  
   pushMatrix();
  translate(20,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
  }
  popMatrix();
}
  
int currenttime = millis();
if(currenttime>time1){
   if((mouseX>300)&&(mouseX<400)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(320,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,30);
    translate(0,-30);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(320,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,30);
    translate(0,-30);
    rotate(angle);
  }
    
  popMatrix();
  
}
}

if(currenttime>time2){
   if((mouseX>200)&&(mouseX<300)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(270,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(270,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
}

if(currenttime>time3){
   if((mouseX>100)&&(mouseX<200)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(130,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,30);
    translate(0,-30);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(130,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,30);
    translate(0,-30);
    rotate(angle);
  }
    
  popMatrix();
  
}
}

if(currenttime>time4){
   if((mouseX>100)&&(mouseX<200)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(200,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(200,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
}

if(currenttime>time5){
   if((mouseX>100)&&(mouseX<200)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(75,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(75,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,35);
    translate(0,-35);
    rotate(angle);
  }
    
  popMatrix();
  
}
}

if(currenttime>time6){
   if((mouseX>100)&&(mouseX<200)&&(mouseY<height)&&(mouseY>200)){
  pushMatrix();
  translate(340,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11,150);
    line(0,0,0,37);
    translate(0,-37);
    rotate(angle);
  }
    
  popMatrix();
  
}
 else{
 pushMatrix();
  translate(340,height);
  for(int i=10; i>0;i--){
    strokeWeight(i);
    stroke(2,167,11);
    line(0,0,0,37);
    translate(0,-37);
    rotate(angle);
  }
    
  popMatrix();
  
}
}
  
}

