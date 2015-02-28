
int x = 300;
int y = x+10;

void setup(){
  size(400,400);
  strokeWeight(2);
  smooth();
  background(0);
}

void draw(){
  drawCircle();
  drawInsideCircle();
}

void drawCircle(){
  ellipse(width/2, height/2, 300,300);
  stroke(255);
}

void drawInsideCircle(){
    for(int x = 300;x > mouseX || x > mouseY; x+= -8){
      ellipse (width/2,height/2,x,x);
      stroke(x/3,x+10,x);
      fill(x*10,x,x*2);
    }
}

    


