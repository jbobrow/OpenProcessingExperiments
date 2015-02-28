
int x,y;
int timer = 0;

void setup(){
  size(600, 600);
  background(25, 25, 112);
  noStroke();
  smooth();
}

void draw(){
  fill(126, 192, 238,100);
  if(timer > 3*30 && timer <= 6*30){
   fill(198, 226, 255,100);
  }else if(timer > 6*30 && timer <= 9*30){
   fill(162, 181, 205,100);
  }else if(timer > 9*30){
   fill(142, 229, 238,100);
  }
  
  if(timer > 12*30) timer = 0;
  
  timer ++;
  
  if(key == '1') { //pen
    rect(mouseX, mouseY, 50, 50,7);
  }
}  

void mouseDragged(){ //keshigomu
  fill(25, 25, 112);
  rect(mouseX, mouseY, 50, 50,7); 
}







