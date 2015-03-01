
PImage glasses;
PImage hair;
PImage headphones;
PImage happy;
PImage mouth;


/* @pjs preload="glasses.png"; */  
/* @pjs preload="hair.png"; */  
/* @pjs preload="headphones.png"; */  
/* @pjs preload="happy.png"; */
/* @pjs preload="mouth.png"; */  

//Assignment 6: Vincent Ong -- Self Portrait

void setup (){
  size(600, 600);
  smooth();
  noStroke();
  background(240);
  glasses = loadImage("glasses.png");
  hair = loadImage("hair.png");
  headphones = loadImage("headphones.png");
  happy = loadImage("happy.png");
  mouth = loadImage("mouth.png");
}

void draw(){
  background(240);

 
   //Ears
  fill(#fff0be);
  ellipse(140, 340, 50, 50);
  ellipse(450, 340, 50, 50);
  fill(#ffaa96);
  ellipse(140, 340, 30, 30);
  ellipse(450, 340, 30, 30);
  
 
  //Head
  fill (#fff0be);
  ellipse(300,350,300,400);
  
   //Hair
  image(hair, 75, 30, 435, 350);
  
  //Eyes
  fill(255);
  //ellipse(225, 330, 100, 100);
  //ellipse(375, 330, 100, 100);
  
  //Pupils
  fill (0);
  if (mouseX > 180 && mouseX < 280 && mouseY > 285 && mouseY < 375){
  ellipse (mouseX, mouseY, 20, 8);
  ellipse (mouseX+150, mouseY, 20, 8);
  noCursor();
  }
  else if (mouseX > 340 && mouseX < 440 && mouseY > 285 && mouseY < 375){
  ellipse (mouseX-150, mouseY, 20, 8);
  ellipse (mouseX, mouseY, 20, 8);
  noCursor();
  }
  else {
    cursor();
    ellipse (225,330, 20, 12);
    ellipse (375, 330, 20, 12);
  }
  
  //Nose
 

  //Mouth
  fill(0);
  ellipse(300, 480, 20, 10);
  
   //Headphones
   if (mouseX > 110 && mouseX < 160 || mouseX > 430 && mouseX < 480){
     if (mouseY > 305 && mouseY < 365){
        image (headphones, 30 ,60, 540, 340);
        fill (#fff0be);
        ellipse(225, 330, 100, 100);
        ellipse(375, 330, 100, 100);
        image (happy, 200 ,305, 50, 50);
        image (happy, 350 ,305, 50, 50);
        ellipse(300, 450, 200, 200);
        image (mouth, 230 , 400);
     }
   }
  
  image(glasses, 150, 280, 300, 112);
  
  
}


