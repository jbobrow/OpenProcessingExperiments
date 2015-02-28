
int value1;
int value2;

void setup(){
  size(500,600);
  value1 = 0;
  value2 = 0;
  
  fill(0,102,153,90);
  text("TOUCH ME",65,45);
}

void draw(){
  fill(random(0,255));
  rect(50,50,100,100);
  
}


//go through the statement only when mouse is pressed on button
void mousePressed(){
  
  
  if(value1 == 0 && mouseX >50 && mouseX <150 && mouseY >50 && mouseY <150){
    value1 = 255;
    
    rect(random(width),random(height),100,100);
  }
  else{
    value1 = 0;
    
   
  }

  
}
