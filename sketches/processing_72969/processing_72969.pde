
void setup(){
  size(600,600);
  smooth();
}

void draw(){
  for(int x = 0; x < 100; x ++){
    for(int y = 1; y < 100; y ++){
      
      fill(random(750));
      noStroke();

      quad(300,100,x*2,y*2,x*2,y*2,y*5,100);        
    rect(x*10,y*100,100,5);
  ellipse(x*10,y*10,5,5);
  fill(0);
line(mouseX=2,mouseY+2,mouseX/2,mouseY/1);
    }
  }
}
