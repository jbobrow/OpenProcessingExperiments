
void setup(){
  size(900,600);
  background(0);
}

void draw(){
  if (key == 'q' || key == 'Q'){
      sudoku();}
  else if (key == 'w' || key == 'W'){
      attention();}
  else if (key == 'e' || key == 'E'){
      workingmemory();}
}

void sudoku(){
  stroke(0);
  strokeWeight(4);
  fill(#A3A4A5);
    fill(255);
    for(int i=0; i<100; i=i+5){
    for(int j=0; j<100; j=j+5){
      rect(i*20,j*20,100,100);
    }
    }
    strokeWeight(10);
    line(300,0,300,900);
    line(600,0,600,900);
    line(0,300,900,300);
    line(0,600,900,600);
    fill(#3BA76B);
    textSize(50);
     
    text("4", 135, 66);
    text("8", 235, 66);
    text("3", 335, 66);
    text("7", 635, 66);
    text("6", 835, 66);
    text("7", 135, 166);
    text("1", 235, 166);
    text("4", 735, 166);
    text("9", 835, 166);
    text("6", 235, 266);
    text("5", 635, 266);
    text("8", 735, 266);
    text("6", 35, 366);
    text("2", 235, 366);
    text("5", 335, 366);
    text("1", 635, 366);
    text("7", 735, 366);
    text("3", 35, 466);
    text("9", 235, 466);
    text("1", 335, 466);
    text("7", 435, 466);
    text("4", 535, 466);
    text("6", 635, 466);
    text("8", 835, 466);
    text("7", 35, 566);
    text("1", 135, 566);
    text("6", 435, 566);
    text("2", 535, 566);
    text("3", 835, 566);
    
  if (mousePressed){
    fill(0);
    text("2", 735, 466);
    text("2", 835, 266);
    text("4", 235, 566);
    text("3", 435, 366);
    text("3", 635, 166);
    text("5", 735, 566);
    text("5", 135, 466);
    text("5", 35, 166);
    text("9", 635, 566);
    text("8", 335, 566);
    text("9", 535, 366);
    text("2", 35, 66);
    text("9", 35, 266);
    text("3", 135, 266);
    text("7", 335, 266);
    text("4", 435, 266);
    text("1", 535, 266);
    text("6", 135, 366);
    text("4", 835, 366);
    text("6", 335, 166);
    text("2", 435, 166);
    text("8", 535, 166);
    text("9", 435, 66);
    text("1", 735, 66);
    text("5", 535, 66);
  }
}

void attention(){
    background(0);
  fill(mouseX,mouseY);
  float e=dist(200,200,mouseX,mouseY);
  rect(230,80,80,80);
  rect(380,80,80,80);
  rect(530,80,80,80);
  rect(80,230,80,80);
  rect(230,230,80,80);
  rect(380,230,80,80);
  rect(530,230,80,80);
  rect(80,380,80,80);
  rect(230,380,80,80);
  rect(530,380,80,80);
   if(e>10){
    rect(80,80,230,230);
  }   else{
        rect(380,380,80,80);
  }
}

void workingmemory(){
  noStroke();
  fill(random(0,255), random(0, 255), random(0, 255));
  rect(mouseX,mouseY,100,200);
  fill(255);
  textSize(14);
  text("Move mouse.", 100,100);
}





