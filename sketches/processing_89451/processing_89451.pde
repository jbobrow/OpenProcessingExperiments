
float wordX, wordY, targetX, targetY, speed;
PFont font;
boolean carrying;

void setup(){
 
 size(300, 600);
 wordX = 150;
 wordY = 0;
 speed = 1;
 font = loadFont("Impact-48.vlw");
 textFont(font, 48);
 textAlign(CENTER);
 
}

void draw(){
  
  background(255);
  fill(0);
  text("HEAVY", wordX, wordY);
  
  
  if(carrying == false && mousePressed == true && mouseX > wordX - 80 && mouseX < wordX + 80 && mouseY > wordY - 30 && mouseY < wordY +30){
     carrying = true;
  }
   
   if (carrying){
     wordX = mouseX + random(0, (height-mouseY)/30);
     wordY = ((height - mouseY)/1.5)+ mouseY;
     
    speed = 0;
  }
  
  if(mousePressed == false || mouseY <10 || mouseY > 590 || mouseX < 10 || mouseX > 290){
    carrying = false;
    gravity();
  }
}
 

void gravity(){
  
  wordY = constrain(wordY + speed, 0, 600);
  speed = speed + 4;
  
}


