

int heat;

void setup() {
  size(700, 700);
  background(0);
  noStroke();
  heat = 0;
 
}

void draw() {  
  if (mousePressed==true) { 
    heat++;
    println("event");
  }
  
  if(heat == 5){
    fill(0, 0, 255);
  }
  
  if(heat == 10){
    fill(0, 245, 255);
  }
  
  if(heat == 15){
    fill(118, 238, 0);
  }
  
  if(heat == 20){
    fill(255, 255, 0);
  }
  
  if(heat == 25){
    fill(255, 140, 0);
  }
  
  if(heat == 30){
    fill(255, 0, 0);
  }
   
  if (mousePressed==true){ 
    ellipse(mouseX, mouseY, random(10, 30), random(10, 30));
  }
  

  //IF MOUSE RELEASED = RE-SET HEAT
  //CREATE 10% BLACK BACKGROUND
  

}




