
void setup(){
    size(800,600);
        background(255); 
 
}

float x=width/2;
float y=height/2;

color red=color(255,0,0);
color green=color(0,255,0);
color blue=color(0,0,255);
color colorX=color(0);
float alp=255;
float r=10;

void draw(){

  
  fill(255);  
  if (mouseX>760 && mouseX<790 && mouseY>560 && mouseY<590){
  rect(750,550,45,45);
  fill(210);
  rect(750,550,45,9);
  rect(750,568,45,9);
  rect(750,586,45,9);
  }
  else{
    stroke(255);
    rect(745,545,55,55);
    stroke(0);
  rect(760,560,30,30);
  }
  
  fill(red);
  if (mouseX>10 && mouseX<40 && mouseY>10 && mouseY<40){
    rect(9,9,32,32);
  }
  else{ 
    stroke(255);
    rect(9,9,32,32);
    stroke(0);
  rect(10,10,30,30);
  }
  
  
  fill(green);
   if (mouseX>50 && mouseX<80 && mouseY>10 && mouseY<40){
    rect(49,9,32,32);
  }
  else{
     stroke(255);
    rect(49,9,32,32);
    stroke(0);
  rect(50,10,30,30);
  }
  
  
  fill(blue);
   if (mouseX>90 && mouseX<120 && mouseY>10 && mouseY<40){
    rect(89,9,32,32);
  }
  else{
     stroke(255);
    rect(89,9,32,32);
    stroke(0);
  rect(90,10,30,30);
  }
  
  
  fill(125);
   if (mouseX>130 && mouseX<160 && mouseY>10 && mouseY<40){
    rect(129,9,32,32);
  }
  else{
     stroke(255);
    rect(129,9,32,32);
    stroke(0);
  rect(130,10,30,30);
  }
  
  
  fill(150);
  ellipse(200,25,30,30);  
  fill(0);
  ellipse(240,25,30,30);
  ellipse(290,25,30,30);  
  ellipse(320,25,30,30);
  fill(255);
  stroke(255);
  rect(280,20,20,10);
  rect(310,20,20,10);
  rect(315,15,10,20);
  
  fill(255);
  rect(700,0,90,70);
  stroke(0);
//  x=x+ (mouseX-x)/20;   //follow
//  y=y+ (mouseY-y)/20;
  fill(colorX,alp);
//  ellipse(x,y,r,r);

  ellipse(740,30,r,r);
}


 void mouseClicked(){
    if (mouseX>760 && mouseX<790 && mouseY>560 && mouseY<590){
    background(255);
    }
    if (mouseX>10 && mouseX<40 && mouseY>10 && mouseY<40){
    colorX=red;
  }
    if (mouseX>50 && mouseX<80 && mouseY>10 && mouseY<40){
     colorX=green;
   }
    if (mouseX>90 && mouseX<120 && mouseY>10 && mouseY<40){
      colorX=blue;
    }
    if (mouseX>130 && mouseX<160 && mouseY>10 && mouseY<40){
      colorX=(255);
    }
      if (mouseX>275 && mouseX<305 && mouseY>5 && mouseY<40){
        if (r>5){
          r=r-5;
      }
      }
        if(mouseX>305 && mouseX<335 && mouseY>5 && mouseY<40) {
          if (r<50){
            r=r+5;
          }
        
      }
       if (mouseX>185 && mouseX<215 && mouseY>5 && mouseY<40){
         alp=125;
       }
         if (mouseX>225 && mouseX<255 && mouseY>5 && mouseY<40){
         alp=255;
       }
 }
 
 
 
 void mouseDragged(){
   noStroke();
   fill(colorX,alp);
   ellipse(mouseX,mouseY,r,r);
   
 }


