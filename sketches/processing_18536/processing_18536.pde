
void setup(){
  size(300,300);
  int x = 120;
  colorMode(RGB,100);
  
  noFill();
  stroke(100,0,0);
  ellipse(x,height/2,50,50);
  
  noFill();
  stroke(100,100,0);
  rectMode(CENTER);
  rect(x + 50,height/2,50,50);
  
  noFill();
  stroke(0,0,100);
  rect(x*2,height/2,50,50);
  
  noFill();
  stroke(0,100,0);
  rect(width - x,height/2,50,50);

  //static forms created in void setup;

}

void draw(){
  noFill();
  stroke(70,0,70);
  rect(mouseX,height/2 + 50,300,10);
  
  //horizontal banding produced by shapes following mouseX;
  
  if (mousePressed == true)  {
    noFill();
    stroke(70,0,70);
  } else  {
    noFill();
    noStroke();
  }
  rect(width/2 - 100,mouseY,50,10);

  //vertical banding produced through mousePressed; position follows mouseY;
}



