
//

/*
MOUSE
drag : draw
KEYS
del, backspace : erase
s : save png

*/
//Global Variables
float x = 25;
float y = 25;
float counter = 8;
color[] palette ={#04071C, #D8DDFF, #C9E5D4, #F2ECC3, #E8CEC8, #B3A6CC};

//setup()
void setup() {
  size(800, 600);
  background(palette[0]);
}



//keyPressed()
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(palette[0]);
  if (key=='s' || key=='S') saveFrame("screenshot.png");
  
  switch(key){
  case '1':
  fill(palette[0]);
  stroke(palette[0]);
  rect(0, 0, 1280, 720);
  break;
  }
}



void draw() {
  textSize(20);
  textAlign(CENTER);
  text("MOUSE", width/2, 150); 
  text("drag : draw", width/2, 200); 
  text("KEYS", width/2, 250); 
  text("del, backspace : erase", width/2, 300); 
  text("s : save png", width/2, 350); 
  textSize(30);
  text("Press 1 and click on mouse", width/2, 450); 
  text("to create your own universal", width/2, 500);
  if(mousePressed){
    float r = random(1, 5);
    strokeWeight(random(5));
    fill(random(5));
    stroke(palette[int(r)]);
    x = random(width);
    y = random(height);
    float d = random(8);
    ellipse(x, y, d, d);
    counter++;
  }
}
