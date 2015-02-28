
color fillVal = color(136);
color orange = color(255,173,49);
color magenta = color(255,8,243);
color cyan = color(8,250,255);

int posX; // x-position for ellipse #1
int posY; // y-position for ellipse #1

int recX; // x-position for rectangle
int recY; // y-position for rectangle

int recA; // x-position for rectangle #2
int recB;

int speed1; // x-speed for ellipse #1
int speed2; // y-speed for ellipse #1

int speed3; // x-speed for rectangle
int speed4; // x-speed for rectangle #2
int speed5;

void setup(){
  
  size(500,500);
  smooth();
  
  posX = 10; // ellipse #1
  posY = 100; // ellipse #1
  speed1 = 4; // ellipse #1
  speed2 = 8; // ellipse #1
  
  recX = 10; // rectangle
  recY = 195; // rectangle
  speed3 = 12;  // rectangle
  
  recA = 10; // rectangle #2
  speed4 = 6; // rectangle #2
  
  recB = 10; // rectangle #2
  speed5 = 14; // rectangle #2

}

void draw(){
  
  background(0);
    noStroke();
  for (int y = 0; y <= height; y += 20){
    for (int x = 0; x <= width; x += 20){
      fill(39);
      ellipse(x,y,10,10);
    }
  }
  
  fill(0);
  rect(0,190,width,60);
    
  fill(fillVal);
  ellipse(posX,posY,25,25);
  
  fill(orange);
  rect(recX,recY,70,20);
  
  fill(magenta);
  rect(recA,recY+20,100,20);
  
  fill(cyan);
  rect(recB,recY+40,40,20);
  
  fill(136);
  rect(0,195,width,1);
  rect(0,215,width,1);
  rect(0,235,width,1);
  rect(0,255,width,1);
  
  fill(136); // bear ears #1
  ellipse((width/5)-35,height*0.68,45,45);
  ellipse((width/5)+35,height*0.68,45,45);
  ellipse((width/2)-35,height*0.68,45,45);
  ellipse((width/2)+35,height*0.68,45,45);
  ellipse((width*0.8)-35,height*0.68,45,45);
  ellipse((width*0.8)+35,height*0.68,45,45);
  
  fill(80); // bear ears #2
  ellipse((width/5)-35,height*0.68,25,25);
  ellipse((width/5)+35,height*0.68,25,25);
  ellipse((width/2)-35,height*0.68,25,25);
  ellipse((width/2)+35,height*0.68,25,25);
  ellipse((width*0.8)-35,height*0.68,25,25);
  ellipse((width*0.8)+35,height*0.68,25,25);
  
  fill(136); // bear base #1
  ellipse(width/5,height*0.75,100,100);
  ellipse(width/2,height*0.75,100,100);
  ellipse(width*0.8,height*0.75,100,100);
  
  fill(80); // bear base #2
  ellipse(width/5,height*0.75,85,85);
  ellipse(width/2,height*0.75,85,85);
  ellipse(width*0.8,height*0.75,85,85);
  
  fill(150); // bear mouth
  ellipse(width/5,height*0.78,55,45);
  ellipse(width/2,height*0.78,55,45);
  ellipse(width*0.8,height*0.78,55,45);
  
  fill(40); // bear mouth
  rect((width/5)-2,height*0.76,4,20);
  rect((width/2)-2,height*0.76,4,20);
  rect((width*0.8)-2,height*0.76,4,20);
  
  fill(30); // bear nose
  ellipse(width/5,height*0.75,18,15);
  ellipse(width/2,height*0.75,18,15);
  ellipse(width*0.8,height*0.75,18,15);
  
   // bear eyes
  ellipse((width/5)-23,height*0.73,12,12);
  ellipse((width/5)+23,height*0.73,12,12);
  ellipse((width/2)-23,height*0.73,12,12);
  ellipse((width/2)+23,height*0.73,12,12);
  ellipse((width*0.8)-23,height*0.73,12,12);
  ellipse((width*0.8)+23,height*0.73,12,12);
  
  
    // posX = posX + speed1
  posX += speed1;
  
  // posY = posY + speed2
  posY += speed2;
  
  if((posX + 14) > width || (posX - 14) < 0){
    speed1 = -speed1;
  }
  
  if((posY + 14) > height/3 || (posY - 14) < 0){
    speed2 = -speed2;
  }
  
  recX += speed3;
  if((recX + 10) > width || (recX - 10) < 0){
    speed3 = -speed3;
  }
  
  recA += speed4;
  if((recA + 10) > width || (recX - 10) < 0){
    speed4 = -speed4;
  }
  
  recB += speed5;
  if((recB + 10) > width || (recX - 10) < 0){
    speed5 = -speed5;
  }
}

void keyPressed(){
  
  if (key == CODED) {
    if (keyCode == LEFT) {
      fillVal = magenta;
    } else if (keyCode == RIGHT) {
      fillVal = cyan;
    }
  } else {
    fillVal = orange;
  }
}
