
float angle = random(0,2.0);

void setup(){
  size(800, 600);
 //frameRate(5);
  smooth();
  background(255,255,255);
}


void draw(){

  float r = random(150,193);
  float g = random(64,65);
  float b = random(65,193);
  float o = random(225,255);
  float x = random(0,175);
  float y = random(10,30);
  
  if(keyPressed) {
    if (key == 'r'){  //draw only if key is pressed
  translate(mouseX, mouseY);  //draw on mouse  
  rotate(angle);
  stroke(r,g,b,o);
  strokeWeight(random(2));
  line(x,x,y,y);
  
  angle += 0.4;
  
  }

if (key == 'e'){  //draw only if key is pressed
  translate(mouseX, mouseY);  //draw on mouse
  float w = random(0,175);
  float h = random(10,30);
  rotate(sin(angle));
  stroke(0,g,0,o);
  strokeWeight(2);
  line(x,x,y,y);
  
  angle += 0.4;
  
  }
  
if (key == 'u'){  //draw only if key is pressed
  translate(mouseX, mouseY);  //draw on mouse
  float w = random(0,175);
  float h = random(10,30);
  rotate(sin(angle));
  stroke(0,0,b,o);
  strokeWeight(2);
  line(x,x,y,y);
  
  angle += 0.4;
  
  }
 
}
  }


void keyPressed(){
  if(key == 'i'){
  filter(INVERT);
  }
  if(key == 'l'){
  filter(BLUR, 1);
  }
  if(key == 's'){
  filter(GRAY);
  }
  if(key == 'h'){
  filter(THRESHOLD);
  }
}


