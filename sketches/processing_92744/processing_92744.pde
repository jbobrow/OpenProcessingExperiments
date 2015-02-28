
//Samantha Ticknor
//sticknor
//Homework 8
// copyright 2013


//Press 'f' to switch to for loop design
//Press 'w' to switch to while loop design

int design, x;
float xoff = 0.0, i , j;


void setup(){
  background(255);
  size(400, 400);
  noiseSeed(-50);
  design = 1;
  x = 0;
}

void draw(){
    if (design == 1){
      dots();
      fill(69, 205, 222, 100);
      rect(0, 0, 400, 400);
    }
    else if(design == 2){
       fill(255);
       rect(0, 0, 400, 400);
       squares();
     }
}

void squares(){
  int x = 0;
  while (x < width) {
    stroke (255);
    fill (255, random(75), random(155));
    rect (x, 5, 10, 10);
    rect (x, 25, 10, 10);
    rect (x, 45, 10, 10);
    rect (x, 65, 10, 10);
    rect (x, 85, 10, 10);
    rect (x, 105, 10, 10);
    rect (x, 125, 10, 10);
    rect (x, 145, 10, 10);    
    rect (x, 165, 10, 10);
    rect (x, 185, 10, 10);
    rect (x, 205, 10, 10);
    rect (x, 225, 10, 10);
    rect (x, 245, 10, 10);
    rect (x, 265, 10, 10);
    rect (x, 285, 10, 10);
    rect (x, 305, 10, 10);
    rect (x, 325, 10, 10);
    rect (x, 345, 10, 10);
    rect (x, 365, 10, 10);
    rect (x, 385, 10, 10);    
    rect (x, 405, 10, 10);
    x = x + 13;
  }
}


void dots(){ 
     for (i =10; i < 400; i+= 20){
         for (j = 10; j < 400; j+= 20){
            smooth();
            noStroke();
            fill(10);
            ellipse(i, j, 10, 10);
            fill(30);
            ellipse(i, j, 9, 9);
            fill(50);
            ellipse(i, j, 8, 8);
            fill(70);
            ellipse(i, j, 7, 7);
            fill(90);
            ellipse(i, j, 6, 6);
            fill(110);
            ellipse(i, j, 5, 5);
            fill(130);
            ellipse(i, j, 4, 4);
            fill(150);
            ellipse(i, j, 3, 3); 
            fill(170);
            ellipse(i, j, 2, 2); 
            fill(255);
         }
}
}

void keyPressed(){
  if (key == 'f'){
     design = 1; 
  }
  else if (key == 'w'){
     design = 2;
  } 
}

