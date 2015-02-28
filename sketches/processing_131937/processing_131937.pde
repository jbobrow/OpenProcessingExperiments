
void setup(){
  size(800,680);

  rect(15,15,25,25);
  rect(65,15,25,25);
  rect(115,15,25,25);
}

void draw(){
  background(169,200,5);
  

  
  for(int i=2; i<mouseY/10; i= i+1) {
    if (i<15 )
      {
        fill(255,41,41);
      }
      else
      {
      fill(25,41,41);
      }
  
     ellipse(126, 50*i, 18, 18);
  }
}

