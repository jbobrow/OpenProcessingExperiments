
PFont f;
PShape l;
PImage photo;

void setup(){
  size(600,450);
  rectMode(CENTER);
f = createFont("Ariel",72);
l = loadShape("Ladybug.svg");
 smooth();
  photo = loadImage("Elvis.jpg");
  int dimension = photo.width* photo.height;
  photo.loadPixels();
  photo.updatePixels();
  noStroke();
}

void draw(){
  if(key=='q'){
    memory();
  }if(key=='w'){
    goal();
  }if(key=='e'){
    recognition();
  }else{
  }
}

void memory(){
  background(255);
 float e = dist(380,380,mouseX,mouseY);

fill(0);
ellipse(80,80,72,72);
ellipse(230,80,72,72);
ellipse(380,80,72,72);
ellipse(530,80,72,72);
ellipse(80,230,72,72);
ellipse(230,230,72,72);
ellipse(380,230,72,72);
ellipse(530,230,72,72);
ellipse(80,380,72,72);
ellipse(230,380,72,72);

ellipse(530,380,72,72);
 if(e<=36){
  shape(l,270,270);
}else{
  ellipse(380,380,72,72);
}
}

void goal(){
    background(0);
  if(mousePressed){
  fill(255);
textFont(f,72);
textAlign(CENTER,CENTER);
text("The End",300,225);
  }else{
      noStroke();
    fill(255,0,0);
    beginShape();
    vertex(270,220);
    vertex(330,250);
    vertex(270,280);
    endShape(CLOSE);
  }
}

void recognition(){
  float pointillize= map(mouseX,0,width,8,34);
  int x = int(random(photo.width));
  int y = int(random(photo.height));
  color pix = photo.get(x,y);
  fill(pix,120);
  ellipse(x,y,pointillize,pointillize);
  
}


