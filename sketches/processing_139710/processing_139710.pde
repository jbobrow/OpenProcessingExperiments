
int x = 0;
int y = 0;
 
void setup(){
  size(800,600);
   
}

void draw(){

  noCursor();
  noStroke();
  if(mousePressed){
    fill(random(0,100),random(0,100));
  }
 /* 
 else if(keyPressed)
  {
    if (key == TAB){
    fill(random(0,100),random(0,100),random(0,255));
    }
  }
  */
  else {
    fill(random(100,255),random(100,255));
  }
  rect(0+mouseX, 0, 10 , 600);
  //x = x + 15;
  
}



