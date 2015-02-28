
// MORE ROBOTS!

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(#F57B3E);
  
  float x = mouseX;
  float y = mouseY;
  
  // eye tentacle things
  
  noFill();
  strokeWeight(20);
  stroke(#3CC1C6);
  bezier(width*0.5,height*0.5,width*0.25,height*0.25,y,x,y,x);
  bezier(width*0.5,height*0.5,width*0.75,height*0.75,width-x,height-y,width-x,height-y);
  bezier(width*0.5,height*0.5,width*0.5,height,x*0.5,y*0.5,x*0.5,y*0.5);
  
  // feet
  
  noFill();
  stroke(#3CC1C6);
  strokeWeight(30);
  bezier(220,400,100,420,180,550,150,550);
  bezier(350,350,200,300,400,400,400,500);
  noStroke();
  fill(#3CC1C6);
  rectMode(CENTER);
  rect(150,550,100,50);
  rect(400,500,100,50);
  
  // body
  
  stroke(0);
  strokeWeight(5);
  fill(#3CC1C6);
  beginShape();
  vertex(150,300);
  vertex(250,250);
  vertex(350,240);
  vertex(400,300);
  vertex(350,400);
  vertex(220,420);
  vertex(150,300);
  endShape();
  
  // happy face / sad face
  
  if (x > 300) {
    noStroke();
    fill(0);
    bezier(250,325,250,400,350,400,350,325);
  } else if (x < 300) {
    noStroke();
    fill(0);
    bezier(250,325,250,250,350,250,350,325);
  }
  
  // moving eyes
  
  noStroke();
  fill(#3CC1C6);
  ellipse (y,x,75,75);
  fill(255);
  ellipse(y,x,65,65);
  fill(0);
  ellipse(y,x,50,50);
  
  fill(#3CC1C6);
  ellipse(width-x,height-y,75,75);
  fill(255);
  ellipse(width-x,height-y,65,65);
  fill(0);
  ellipse(width-x,height-y,50,50);
  
  fill(#3CC1C6);
  ellipse(x*0.5,y*0.5,75,75);
  fill(255);
  ellipse(x*0.5,y*0.5,65,65);
  fill(0);
  ellipse(x*0.5,y*0.5,50,50);
}


