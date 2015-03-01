

float xpos;
float ypos;

float elsize;

void setup(){
  background(0);
  size(600, 600);
  smooth();
  xpos = 0;
  ypos = 0;
  elsize = 10;
}


void draw(){
  stroke(250, 250, 130, 50);
  randel(300, 500);
  stroke(10, 20, 250, 50);
  randel(800, 700);
  stroke(20, 240, 10, 50);
  randel(mouseX+200, mouseY+300); 
}
  
  
void randel(float xxpos, float yypos){
 noFill(); 
 ellipse(noise(xpos)*xxpos, noise(ypos)*yypos, noise(elsize)*30, noise(elsize)*30);
 
 xpos += random(-1, 1);
 ypos -= 0.1;
 
 elsize += 0.1;
}

void mousePressed(){
  stroke(250, 20, 30, 110);
  randel(mouseX+200, mouseY+100);
}


