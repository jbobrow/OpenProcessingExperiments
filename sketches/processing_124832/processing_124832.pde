
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Image from http://moon.com/maps/caribbean/puerto-rico/
// Copyright Jose Periterra (November 20, 2013) All Rights Reserved

float [] xCoords = {297, 294, 434.4, 471.6, 670.8, 648, 674.4, 624, 640.8, 662.4, 624, 788.4, 404.4, 637.2, 439.2, 730.8, 859.2};
float [] yCoords = {408.253, 330.804, 320.594, 473.744, 361.434, 320.594, 342.035, 349.182, 367.56, 403.295, 439.03, 367.56, 465.576, 484.975, 377.77, 429.841, 427.799};
float [] data1 = {18.201, 30, 30, 25, 25, 40, 30, 34, 23, 14, 65, 12, 43, 47, 11, 65, 25};
float [] data2 = {-67.14, 30, 25, 26, 40, 30, 18, 11, 73, 40, 49, 22, 27, 87, 74, 42};
int [] data3 = {78647, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23};

PImage p;

void setup()
{
  size(1200, 1021);
  p = loadImage("puerto-rico-map.jpg");
  image(p, 0, 0);
  
}

void draw()
{
  image(p, 0, 0);
  drawGrid();
  drawCursor();
  
//  xCoords guide lines
//  stroke(0, 0, 0);
//  strokeWeight(1);
//  line(width*0.245, 0, width*0.245, height);
//  line(width*0.335, 0, width*0.335, height);
//  line(width*0.337, 0, width*0.337, height);
//  line(width*0.362, 0, width*0.362, height);
//  line(width*0.366, 0, width*0.366, height);
//  line(width*0.393, 0, width*0.393, height);
//  line(width*0.52, 0, width*0.52, height);
//  line(width*0.531, 0, width*0.531, height);
//  line(width*0.534, 0, width*0.534, height);
//  line(width*0.54, 0, width*0.54, height);
//  line(width*0.552, 0, width*0.552, height);
//  line(width*0.559, 0, width*0.559, height);
//  line(width*0.562, 0, width*0.562, height);
//  line(width*0.609, 0, width*0.609, height);
//  line(width*0.657, 0, width*0.657, height);
//  line(width*0.716, 0, width*0.716, height);

//  yCoords guide lines
//  line(0, height*0.314, width, height*0.314);
//  line(0, height*0.324, width, height*0.324);
//  line(0, height*0.335, width, height*0.335);
//  line(0, height*0.342, width, height*0.342);
//  line(0, height*0.354, width, height*0.354);
//  line(0, height*0.36, width, height*0.36);
//  line(0, height*0.37, width, height*0.37);
//  line(0, height*0.395, width, height*0.395);
//  line(0, height*0.402, width, height*0.402);
//  line(0, height*0.419, width, height*0.419);
//  line(0, height*0.421, width, height*0.421);
//  line(0, height*0.43, width, height*0.43);
//  line(0, height*0.456, width, height*0.456);
//  line(0, height*0.464, width, height*0.464);
//  line(0, height*0.475, width, height*0.475);

}

void drawCursor()
{
  strokeWeight(2);
  stroke(255, 255, 255);
  line(0, mouseY, mouseX - 20, mouseY);
  line(width, mouseY, mouseX + 20, mouseY);
  line(mouseX, 0, mouseX, mouseY - 20);
  line(mouseX, height, mouseX, mouseY + 20);
  
  strokeWeight(1);
  stroke(255, 0, 0);
  line(mouseX - 20, mouseY, mouseX - 10, mouseY);
  line(mouseX + 10, mouseY, mouseX + 20, mouseY);
  line(mouseX, mouseY - 20, mouseX, mouseY - 10);
  line(mouseX, mouseY + 10, mouseX, mouseY + 20);
  
  stroke(255, 255, 255);
  strokeWeight(5);
  line(mouseX - 20, mouseY, mouseX - 40, mouseY);
  line(mouseX + 20, mouseY, mouseX + 40, mouseY);
  line(mouseX, mouseY - 20, mouseX, mouseY - 40);
  line(mouseX, mouseY + 20, mouseX, mouseY + 40);
}

void drawGrid()
{
  for (int i = 0; i < 1200; i += 120)
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(i, 0, i, height);
  }
  
  for(int i = 0; i < 1021; i += 102.1)
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(0, i, width, i);
  }
}

void mousePressed()
{
  for (int i = 0; i < xCoords.length; i++)
  {
    if (dist(mouseX, mouseY, xCoords[i], yCoords[i]) < 10)
    {
      fill(255, 255, 255, 200);
      rect(0, 0, width, height);
      fill(187, 215, 239);
      noStroke();
      ellipse(xCoords[i], yCoords[i], width*0.1, width*0.1);
      textSize(15);
      textAlign(CENTER, CENTER);
      fill(0, 0, 0);
      text("Latitude/Longitude", xCoords[i], yCoords[i] - 25);
      fill(255, 0, 0);
      text(data1[i] + " lat, " + data2[i] + " long", xCoords[i], yCoords[i] - 10);
      fill(0, 0, 0);
      text("Population", xCoords[i], yCoords[i] + 5);
      fill(255, 0, 0);
      text(data3[i], xCoords[i], yCoords[i] + 20);
      noLoop();
    }
  }
}

void mouseReleased()
{
  loop();
}


