
int look = 0;
int x = 0;
int Blinky = color(255,0,0);

void setup() {
  size(200, 200);
  noStroke();
  
}

void draw() {
  fill(255,0,0);
  background(255);
  
  rect(50+x,70,10,90);
  rect(60+x,40,10,130);
  rect(70+x,30,10,140);
  rect(80+x,20,10,140);
  rect(90+x,20,10,130);
  rect(100+x,10,10,150);
  rect(110+x,10,10,160);
  rect(120+x,10,10,160);
  rect(130+x,10,10,150);
  rect(140+x,20,10,130);
  rect(150+x,20,10,130);
  rect(160+x,30,10,140);
  rect(170+x,40,10,130);
  rect(180+x,70,10,90);
  
  //left eye
  fill(255);
  rect(60+look*10+x, 50, 10, 30);
  rect(70+look*10+x, 40, 10, 50);
  rect(80+look*10+x, 40, 10, 50);
  rect(90+look*10+x, 50, 10, 30);
  //right eye
  rect(120+look*10+x, 50, 10, 30);
  rect(130+look*10+x, 40, 10, 50);
  rect(140+look*10+x, 40, 10, 50);
  rect(150+look*10+x, 50, 10, 30);
  //pupils
  fill(0, 0, 255);
  rect(60+look*20+x, 60, 20, 20);
  rect(120+look*20+x, 60, 20, 20);
  
  if(mouseX<120+x){
    look=0;
  }
  else if(mouseX>120+x){
    look = 2;
  } else {
    look = 1;
  }
  
  if (mouseX < 120+x){
    x=x-1;
  }
  if (mouseX > 120+x) {
    x=x+1;
  }
}

void mousePressed(){
  if(mousePressed == true){
    Blinky = color(255,255,0);
  }
}

