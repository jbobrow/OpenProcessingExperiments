
int x,y;
int c;
int i;
int timer = 0;
 
void setup(){
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  
  c = 0;
}
 

 
void mouseDragged(){
  if(mouseButton == LEFT){
  fill(255,255,255, 100);
  ellipse(mouseX, mouseY, 50, 50);
  }
  

  i = i + 10;
  if(i > 100){
    i = -i;
  }
  if(mouseButton == RIGHT){
    fill(0,0,0,100);
    ellipse(mouseX, mouseY, 50, 50);
  }
}

void draw(){
  fill(255, 157, 250,70);
  if(timer > 3*30 && timer <= 6*30){
   fill(227, 157, 255,70);
  }else if(timer > 6*30 && timer <= 9*30){
   fill(209, 157, 255,70);
  }else if(timer > 9*30){
   fill(255,157,214,70);
  }
   
  if(timer > 12*30) timer = 0;
   
  timer ++;
   
  if(key == 'a') {
    ellipse(mouseX, mouseY, 50, 50);
  }


 if(key == CODED){
    if(keyCode == ALT){
      background(0);
  }
} 
}



