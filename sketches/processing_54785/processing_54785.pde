
void setup (){
  size(600,700); 
}

void draw(){
}

void mousePressed(){
  background(random(255),random(255),random(255));
    fill(255,255,255);
    textSize(200);
    text("GO",random(600),random(575));
    textSize(200);
    text("GO",random(600),random(575));
  }
 
void keyPressed(){
  textSize(150);
  text("dancer",50,675);
}


