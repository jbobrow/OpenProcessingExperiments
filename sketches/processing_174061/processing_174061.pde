
float position;
int m = millis();
int totalTime = 10000;

void setup (){
 size (1200, 500);
}

void draw (){
  int passedTime = millis() - m;
    
  fill(0, 102, 153);
  rect(20,0,1180,255,0,0,0,20);
  rect(20,260,1180,260,20,0,0,0);
  
  fill(255);
  textSize(20);
  text("Try to get your cursor from start to the end without touching the blue zone", 300,20);
  text("Note: THE GAME STARTS EVALUATING AFTER 10 SECONDS", 400,480);
  textSize(32);
  text("Start",50,240);
  text("End",1130,240);
  
   position = mouseY;
  
  if (passedTime > totalTime){
  
    println(m);
    
  if ((position<260)  && (position>255)){
  println(position);
  }
  else {
  fill(153,0,0);
  textSize(70);
  text("Game over", 460,240);
  textSize(30);
  text("Restart the Game", 500,320);
  }
  }
  

  
}



