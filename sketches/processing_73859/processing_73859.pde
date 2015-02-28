
float angle=0.0;

void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  noStroke();
  fill(0, 12);
  rect(0, 0, width, height);
  PFont brothers=loadFont("BrothersSuperSlant-48.vlw");
  textFont(brothers); 
  angle= angle+0.03; //rotation speed
  translate(100, 40);
  rotate(angle);
  
    //letter H
  fill(#10A5B4);
  textSize(90);
  text('H', 0, 60);
  
    //letter E
  fill(#B4108C);
  textSize(200);
  text('E', 80, 60);


    //letter L
  fill(#FFBD05);
  textSize(150);
  text('L', 200, 60);
  
  //letter L
  fill(#2EFF05);
  textSize(300);
  text('L', 280, 60);
  
  //letter o
  fill(#FF0505);
  textSize(250);
  text('O', 450, 60);
}


