
int xpos = 0;
int seconds;

void setup(){
size(700,400);
noCursor();
smooth();
background(255);

}void draw() { 
  
  seconds = second();
  fill(255,30);

  line(mouseX, mouseY, pmouseX, pmouseY);
  
  rect (10,10,10,10);
  rect (500,300,10,10);
  rect (100,300,10,10);
  rect (200,100,10,10);
  rect (400,200,10,10);
  rect (500,200,10,10);
  rect (550,300,10,10);
  rect (220,300,10,10);
  rect (100,250,10,10);
  rect (230,30,10,10);
  rect (580,360,10,10);
  rect (500,300,10,10);
  rect (650,50,10,10);
  rect (600,100,10,10);
  rect (600,400,10,10);
  
  
  
  fill(40, 50, 50);
  pushMatrix();
  rect(xpos,390,5*seconds,10); // 300
  popMatrix();
  
text("connect the dots, press to play again", 250, 10);
}

void mousePressed() {
    background(255);
  }

