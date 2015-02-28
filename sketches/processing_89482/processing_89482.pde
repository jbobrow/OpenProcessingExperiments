
int yPos = 0;
PFont font;
font = loadFont("FFScala.ttf");
 
void setup() {  //setup function called initially, only once
  size(400,300);
  smooth();
  background(126);
  textFont(font, 60);
}

void draw() {  //draw function loops 
  yPos = mouseY;
  if (yPos < 100){
    background(0);
  }
  else if (yPos >= 200) {
    background(0,0,255);
  }
  else{
     background(255,0,0); 
     println(mouseY); 
  }
  stroke(255,0,0);

//line to show area divisions
  line(0,100,400,100);  
  line(0,200,400,200);

//Write the text
  fill(255,0,0);
  textAlign(CENTER);
  text("Black",200,75);
  text("Blue",200,175);
  text("White",200,275);
}
