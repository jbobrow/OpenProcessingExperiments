
PImage creature;
PFont helvet;
float [] recX = new float [1];
float [] recY = new float [1];
float recWidth;
float recHeight;
float newHeightDiff;
float timePassed = 0;
boolean revive = true;
int counter = 0;
boolean pressed = false;

void setup(){
  size(400, 300);
  background(255);
  creature = loadImage("creature.jpg");
  recWidth = 50;
  recHeight = 200;
  helvet = createFont("Helvet", 14);
}


 
void mousePressed(){
     if (key == 'r' || key=='R'){
      pressed = true;
      counter++;
     }
  
}
 
 




void draw(){
  fill(255, 0, 0);
  if(recHeight > 0){
  image(creature, 25, 25);
  }
  rect(275, 25, 50, 200);
  
  fill(0, 0, 255);
  rect(250, 225, 100, 50);
  
  timePassed = millis() - timePassed;
  if(pressed == true){
    timePassed = 0;
   pressed = false; 
  }
  newHeightDiff =  timePassed/50;
  
   
  
    

  fill(34, 129, 20);
  for(int i = 0; i<=newHeightDiff; i++){
   if(recHeight - i > 0){
    rect(275, 25, recWidth, recHeight-i);
    textFont(helvet);
    fill(255, 255, 255);
    text("Feed", 285, 255);
  
   }
   if(counter == 3){
    revive = false; 
   }
  else if(revive == true){
    fill(255, 255, 255);
  text("Revive", 285, 255);
  
  }
  
  else{
   fill(0,0,0);
  text("Your pet died to many times", 10, 350);
  }
    
   
}
  
  
}

