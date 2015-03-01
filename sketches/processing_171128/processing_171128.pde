
void setup(){
  size(400,400);
  background(60,80,100);
}

void draw(){
  background(60,80,100);
  demDice(mouseX,mouseY);
  int diceRoll = rollAD6(6);
  if(mousePressed && mouseButton == LEFT){
    println(diceRoll);
  }
}

void demDice(int x, int y){
  pushMatrix();
  translate(x,y);
  fill(255);
  for(int i = 0; i < 100; i += 10){
    strokeWeight(7);
    strokeJoin(ROUND);
    rect(0,0,i,i);
  }
  fill(0);
  if(keyPressed && key == '1'){
    ellipse(45,45,10,10);
  }else if(keyPressed && key == '2'){
    ellipse(45,30,10,10);
    ellipse(45,60,10,10);
  }else if(keyPressed && key == '3'){
    ellipse(25,25,10,10);
    ellipse(45,45,10,10);
    ellipse(65,65,10,10);
  }else if(keyPressed && key == '4'){
    ellipse(25,25,10,10);
    ellipse(65,25,10,10);
    ellipse(25,65,10,10);
    ellipse(65,65,10,10);
  }else if(keyPressed && key == '5'){
    ellipse(25,25,10,10);
    ellipse(65,25,10,10);
    ellipse(25,65,10,10);
    ellipse(65,65,10,10);
    ellipse(45,45,10,10);
  }else if(keyPressed && key == '6'){
    ellipse(30,25,10,10);
    ellipse(30,45,10,10);
    ellipse(30,65,10,10);
    ellipse(60,25,10,10);
    ellipse(60,45,10,10);
    ellipse(60,65,10,10);
  }
  popMatrix();
}

int rollAD6(int sides) {
  int d = 1 + int(random(sides));
  return d;
}


