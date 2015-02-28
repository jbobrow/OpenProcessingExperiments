
//Laura Laham
//Homework # 8
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham

int deltaX = 5;
int x = 50;
  int deltaRad=5;


void function1(){
  background(160, 30, 125);
  for(int k = 0; k < width; k+=10){
   for(int i = 0; i < height; i+=20){
   fill(255);
   noStroke();
   ellipse(k,i,2,2);
   } 
  }
  fill(0);
  for(int l = 0; l < height; l+=10){
   ellipse(x+deltaX,l, 2,2);
  }
  x += deltaX;
   if(x+deltaX > width)
   deltaX = -deltaX;
   if(x+deltaX<0)
   deltaX = - deltaX;
}

void function2(){
  background(160, 30, 125);
int count = 0;
noStroke();
fill(255);
while(count < 10)
  {
   pushMatrix();
   translate(width/2 + count*10,height/2 + count*10);
   rotate(radians(60+count*10+deltaRad));
   ellipse(0+deltaRad, 0, 5,5);
   rotate(-radians(60+count*10+deltaRad));
   translate(-(width/2 + count*10),-( height/2 + count*10));
   popMatrix();
  deltaRad+=1;
  count++;
  }
}

void setup(){
  size(400,400);
  background(160, 30, 125);
  
}


void draw(){
  
    background(160, 30, 125);
    fill(255);
    text("Press a or b", 150, 200);
if (keyPressed && key == 'a')
{
function1();
}
if (keyPressed && key == 'b')
{
function2();
}
}
