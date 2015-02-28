

//Adam Oaks

void setup(){
  
size(300,300);
smooth();
}

float x=120;


void draw(){
  
  background(204,204,255);
  
  rectMode(CENTER);
  fill(255,0,0);
ellipse(x,height/2,50,50);


fill(255,255,0);
rect(x+50,height/2,50,50);


fill(0,0,255);
ellipse(x*2,height/2,50,50);

fill(0,255,0);
rect(width-x,height/2,50,50);


fill(255,102,0);
ellipse(x/2,height/2,50,50);

  fill(83,0,93);
  rect(mouseX,mouseY,30,30);
}



