
//CJ Jarmuth

//declare global variables
int eyeColor = 255; 
int browMove = -55;
int mouWidth = 50;
int antColor = 255;
boolean clicked = false;

//runs once
void setup(){
  size(300,300);
  background(149,153,207);

}

void keyPressed(){
  clicked =! clicked;
}

//runs forever
void draw(){
  
   if (clicked == false){
    eyeColor = 255;  
  }
   if (clicked == true){
    eyeColor = 100;  
  }
     if (clicked == false){
    browMove = -55;  
  }
     if (clicked == true){
    browMove = -30;  
  }
       if (clicked == false){
    mouWidth = 50;  
  }
     if (clicked == true){
    mouWidth = 5;  
  }
         if (clicked == false){
    antColor = 255;  
  }
     if (clicked == true){
    antColor = 100;  
  }

  translate(150,150);
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,0,200,200);
  
  //ears
  rectMode(CENTER);
  fill(150);
  rect(-130,0,10,20);
  
    rectMode(CENTER);
  fill(150);
  rect(130,0,10,20);
  
  rectMode(CENTER);
  fill(0);
  rect(110,0,20,50);
  
  rectMode(CENTER);
  fill(0);
  rect(-110,0,20,50);
  
  //mouth
  rectMode(CENTER);
  fill(255);
  rect(0,50,150,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(60,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(30,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(0,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(-30,50,5,mouWidth);
  
  rectMode(CENTER);
  fill(0);
  rect(-60,50,5,mouWidth);
  
  //eyes...kinda
  fill(0,0,0);
  ellipse(50,-15,50,50);
  
  fill(eyeColor,0,0);
  ellipse(50,-15,40,40);
  
  fill(0,0,0);
  ellipse(-50,-15,50,50);
  
  fill(eyeColor,0,0);
  ellipse(-50,-15,40,40);
  
  //antenna
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,-115,15,30);
  
  fill(antColor,antColor,0);
  ellipse(0,-130,30,30);
  
  //eyebrows
  rectMode(CENTER);
  fill(92);
  rect(50,browMove,60,20);
  
 
  rectMode(CENTER);
  fill(92);
  rect(-50,browMove,60,20);
  
  //neck
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,115,50,30);
  
  rectMode(CENTER);
  fill(150,150,150);
  rect(0,153,250,45);
  
  rectMode(CENTER);
  fill(0);
  rect(0,105,50,2);
  
  rectMode(CENTER);
  fill(0);
  rect(0,115,50,2);
  
  rectMode(CENTER);
  fill(0);
  rect(0,125,50,2);
}



