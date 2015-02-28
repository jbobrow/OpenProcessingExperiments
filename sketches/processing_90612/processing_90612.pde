
//Laura Laham
//Homework # 4
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham

//In this case, there is a spiral being drawn using different colors that are 
//picked at random. They can be drawn by pressing the 'L' button. 
//The 'b' button can be pressed to erase what had been drawn should you
//feel the need to re-draw those parts.
//By clicking your mouse, you delete everything on the canvas and start over.

private float prevX, prevY, newX, newY, k;
private float distance = 20;
private float radius = distance/2;
private float alph = 0;
private float speed = 500;

void setup() {
  size(400, 400);
  background(0);
  strokeWeight(2);
  stroke(255);
  frameRate(10);
  prevX = radius;
  prevY = 0;
}

void draw() {
  translate(width/2, height/2);

  if (keyPressed) {
    if (key == 'l')
    {
      stroke(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      strokeWeight(3);
      k = speed/radius;
      radius += k;
      newX = radius*cos(radians(alph));
      newY = -radius*sin(radians(alph));
      line(prevX, prevY, newX, newY);
      prevX = newX;
      prevY = newY;
      alph+=25;
    }

    if (key == 'b')
    {
      stroke(0);
      strokeWeight(10);
      newX = -radius*cos(radians(alph));
      newY = radius*sin(radians(alph));
      line(prevX, prevY, -newX, -newY);
      k = speed/radius;
      radius -= k;
      prevX = -newX;
      prevY = -newY;
      alph-=25;
    }
  }
  if (mousePressed) {
    background(0);
    prevX = 0;
    prevY = 0;
    alph = 0;
    radius = distance/2;
    newX = radius*cos(radians(alph));
    newY = -radius*sin(radians(alph));
  }
}
