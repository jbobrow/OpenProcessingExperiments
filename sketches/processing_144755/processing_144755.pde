
boolean flipFlop = false;
int eyeBallDiam;



void setup (){
   size(300,300);


  
}
void draw (){
  
if(flipFlop == false){
  eyeBallDiam = 50;
}
 else{ 
  eyeBallDiam = 20;
 } 
  translate(150,150);
  noStroke();
  ellipse(-100,5,15,100);
  ellipse(100,5,15,100);
  rect(-120, -10, 20, 20);
  rect(100, -10, 20, 20);
  fill(250,0,0);
  ellipse(0,0,200,200);
  fill(255,255,255);
  fill(0,0,0);
  fill(255,255,255);
  fill(0);
  fill(255);
  rect(20, -30, eyeBallDiam,eyeBallDiam);
  rect(-70, -30, eyeBallDiam, eyeBallDiam);
  rect(-25, 50, 55, 20);
  fill(0,0,0);
  rect(-25, 50, 5, 20);
  rect(25, 50, 5, 20);
  rect(12.5, 50, 5, 20);
  rect(-12.5, 50, 5, 20);
  rect(1, 50, 5, 20);

  
  if (mousePressed == false) {
    fill(0);
  } else {
    fill(255);
  }
    
  if (mousePressed && (mouseButton == LEFT)){
    fill(255, 250, 255);
  }
   if (mousePressed && (mouseButton == RIGHT)){
    fill(25, 250, 25);
  }
  


 
  ellipse(-45,5,20,20);
  ellipse(45,5,20,20);
  text("I am a Robot", -30, 120);
  int value = 0;
}

void keyPressed(){
  flipFlop =! flipFlop;
  
}





