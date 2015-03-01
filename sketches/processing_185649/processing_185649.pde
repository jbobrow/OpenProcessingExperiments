
float r,g,b, rd;

void setup() {  //setup function called initially, only once
 size(640, 480);
 frameRate(30);
}

void draw() {  //draw function loops 
  background(160);
  stroke(0);
  line(width/2,0,width/2,height);
  fill(r,g,b);
  //rectMode(CENTER);
  noStroke();
  //rect(width/2,height/2,rd,rd);
  
  //ellipse(mouseX, mouseY, 20, 20);
  if(mouseX < width/2){
     fill(255,0,0);
     rect(0,0,width/2,height);
  } else {
     fill(0,255,125);
     rect(width/2,0,width/2,height);
  }

}

void mousePressed(){ //event function
  r = random(255);
  g = random(255);
  b = random(255);
  println(frameRate);
}
 
