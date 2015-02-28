
// What's On T.V.?
// By William Iannuzzi
// July 3, 2010

boolean button = false;  //T.V. is off by default

void setup ()  {
  size (500,500);
  rectMode(CENTER);
  smooth();
}

void draw()  {
  background(105,155,98);
  
//Draw The Television
   
   //T.V. Base
    stroke(0);
    fill(20);
    triangle(width/2,height/4,width/2-90,height/2+70, width/2+90,height/2+70);
    
    //Antennae
    stroke(128);
    strokeWeight(2);
    line(width/2,height/3 - 100, width/2-140, height/3-160);
    line(width/2,height/3 - 100, width/2+140, height/3-160);
    
    //Body
    fill(0);
    rect(width/2,height/3,280,200);
   
    //Blue Power button
    noStroke();
    fill(34,81,155);
    rect(373,246,24,20);
 
// Draw The Screen and Fuzzy Picture When Power Is Turned On

  // fuzzy picture when power is on
  if (button)  {
    for(int x = width/2 - 103; x < width/2 + 104; x+=5)  {
      for(int y = height/3 - 62; y < height/3 + 65; y+=5)  {
        fill(random(255),random(255),random(255));
        rect(x,y,5,5);
      }
    }
  } else {
    //draw grey screen when power is off
  fill(182);
  rect(width/2,height/3,210,130);
   }
   
// Draw Movable Hand

  //arm
  stroke(97,21,152);
  strokeWeight(50);
  line(width/2 + 160, height + 50, mouseX+40,mouseY+62);
  
  //fist
  noStroke();
  fill(252,178,143);
  ellipse(mouseX+40,mouseY+62,78,50); 
  
  //knuckles
  stroke(0);
  strokeWeight(1);
  arc (mouseX+27,mouseY+40,15,5,PI,2*PI);
  arc (mouseX+47,mouseY+40,15,5,PI,2*PI);
  arc (mouseX+63,mouseY+45,12,5,190*PI/180,365*PI/180);
  
  //index finger
  strokeWeight(20);
  stroke(252,178,143);
  line(mouseX+15,mouseY+67,mouseX,mouseY-2); 
  
  //fingernail
  noStroke();
  fill(255,225,214);
  ellipse (mouseX,mouseY-2,17,15);
  
  //cuticle
  stroke(0);
  strokeWeight(1);
  arc(mouseX,mouseY,17,13,0,PI);  
}

// When blue button is pressed, the power switches on and off
void mousePressed ()  {
  if (mouseX > 361 && mouseX < 385 && mouseY > 236 && mouseY < 256)  {
    button = !button;
  }
}

  


