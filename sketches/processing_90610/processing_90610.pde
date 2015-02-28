
//Laura Laham
//Homework # 3
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham

//In this case, there is an etch-a-sketch that uses the mouse location to 
//draw a continuous line image. 
//By clicking the space bar, you delete everything on the canvas and start over.
//There is also a feature that constrains the drawing to be within a certain
//region of the canvas to simulate a real etch-a-sketch experience.

int prevX = height/2;
int prevY = width/2;
int newX = height/2;
int newY = width/2;
int analogValueX = 200;
int analogValueY = 200;

void setup()
{
  size(400,400);
  background(255,0,0);
  smooth();
  fill(200);
  strokeWeight(3);
  stroke(0);
  rect(25,50,350,300);
  strokeWeight(0);
  fill(255);
  ellipse(50,height-25,30,30);
  ellipse(width-50,height-25,30,30);
}

void draw()
{

  strokeWeight(1);
  newX = mouseX;
  newY = mouseY;
  prevX = pmouseX;
  prevY = pmouseY;
  
newX = constrain(newX, 25,width-25);
newY = constrain(newY, 50,height-50);
prevX = constrain(prevX, 25,width-25);
prevY = constrain(prevY, 50,height-50);

line(prevX,prevY,newX,newY);

if(keyPressed && key == ' ')
{
fill(200);
rect(25,50,350,300);
}
}
