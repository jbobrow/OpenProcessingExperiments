
int x = 5;
float b = 3;
PFont sara;

void setup(){
  size(1023,768);
  background(1,18,1);
  size(800,600);
  sara = loadFont("04b03-90.vlw");
}

void draw(){
    //if(frameCount < 1) return;
  fill(15,15,52,10);
  rect(0,0,800,600);
  noStroke();
  
  fill(0,(b + 18) / 4,mouseY);
  textFont(sara);
  textSize(mouseX);
  text("23l C76",200,500);
  
  fill(0,(b + 18) / 4,mouseY);
  textFont(sara);
  textSize(mouseX);
  text("4218586",b,mouseX);
  
  fill(0,(b + 18) / 4,mouseY);
  textFont(sara);
  textSize(mouseY);
  text("251 YFG",b,mouseY);
  
}


