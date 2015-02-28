
float x = 0;
float y;
color farbe1 = color(255,0,0);


void setup() {
  
  size(960,500);
  y = width/2;
  println(y);
  frameRate(50);
}


void draw() {
  
  //noStroke();
  y = mouseY+random(-30,30);
  x = mouseX+random(-30,30);
  fill(random(255),random(255),random(255));
  float r = random(0,10);
  ellipse(x,y,r,r);
  stroke(mouseX,mouseY,0);
  float dicke = random(20);
  strokeWeight(dicke);
  line(mouseX,mouseY,pmouseX,pmouseY);
  println(x);
  
  if(x>=width){
  
  x = 0;
  
  
  }
  
  
}

void keyPressed(){
  
  if(key=='1'){
    farbe1 = color(255,0,0);
  }
  
  if(key=='2'){
    farbe1 = color(255,255,0);
  }
    if(key==' '){
    farbe1 = color(random(255),random(255),random(255));
  }
    if(key=='s'){
      saveFrame("Bild###.jpg");
    }
  
  
}



