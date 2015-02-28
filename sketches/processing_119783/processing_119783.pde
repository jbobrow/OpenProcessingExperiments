
float eye1xpos;
float eye1ypos;
float eye2xpos;
float eye2ypos;

void setup() {
  size(600,600);
  smooth();
  background(255);
  frameRate(1);
}

void draw() {
  background(255);
  eye1xpos = width*0.33;
  eye1ypos = random(height*0.39,height*0.35);
  eye2xpos = width*0.66;
  eye2ypos = random(height*0.39,height*0.35);
  if (random(10)>4) {
    drawHair();
  }
  strokeWeight(height*0.019);
  drawHead();
  drawMouth();
  if (random(10)>5) {
    drawEyebrows();
  }
  drawNose();
  drawEyes();
  //noLoop();
}

void mouseClicked() {
  saveFrame("line-######.png");
}

void drawHead() {
  fill(255,random(200,230),random(22,200));
  if (random(10)>5){
    bezier(random(width*0.25, width*0.35), random(height*0.35, height*0.55), 
      random(width*0.01, width*0.03), random(height*0.01,height*0.02), 
      random(width*0.01, width*0.02), random(height*0.9,height*0.96), 
      random(width*0.25, width*0.3), random(height*0.55, height*0.75));
      bezier(random(width*0.65, width*0.75), random(height*0.35, height*0.55), 
      random(width*0.95, width*0.99), random(height*0.01,height*0.02), 
      random(width*0.91, width*0.99), random(height*0.9,height*0.96), 
      random(width*0.65, width*0.73), random(height*0.55, height*0.75));
  }
  ellipse(width/2,height/2,random(width*0.55,width*0.75),random(height*0.8,height*0.99));
}

void drawEyebrows() {
  line(random(width*0.24,width*0.26),
  random(height*0.2,height*0.25),
  random(width*0.35,width*0.45),
  random(height*0.2,height*0.27));
  
  line(random(width*0.6,width*0.7),
  random(height*0.2,height*0.25),
  random(width*0.7,width*0.75),
  random(height*0.2,height*0.27));
}

void drawMouth() {
  if (random(10)>3){
    bezier(random(width*0.3, width*0.40), random(height*0.60, height*0.80), 
    random(width*0.10, width*0.3), random(height*0.90,height*0.99), 
    random(width*0.6, width*0.7), random(height*0.6,height*0.8), 
    random(width*0.60, width*0.75), random(height*0.70, height*0.80));
  } else if (random(10)>4){
    fill(0);
    ellipse(random(width*0.4,width*0.55),
    random(height*0.7,height*0.8),
    random(width*0.05,width*0.1),
    random(height*0.05,height*0.1));
  } else {
    fill(0);
    line(random(width*0.35,width*0.44),
      random(height*0.69,height*0.8),
      random(width*0.6,width*0.69),
      random(height*0.69,height*0.8));
  }
}

void drawNose() {
  if (random(10)>8){
    line(random(width*0.4,width*0.5),height*0.6,width*0.6,height*0.6);
    line(random(width/2,width/1.7),height*0.4,width*0.6,height*0.6);
  } else {
    noFill();
    bezier(random(width*0.4, width*0.45), random(height*0.54, height*0.55), 
      random(width*0.32, width*0.35), random(height*0.65,height*0.76), 
      random(width*0.8, width*0.89), random(height*0.69,height*0.8), 
      random(width*0.49, width*0.55), random(height*0.35, height*0.39));
  }
}

void drawHair() {
  stroke(random(80));
  strokeWeight(height*0.25);
  //fill(random(100));
  noFill();
  bezier(random(width*0.15, width*0.18), random(height*0.5, height*0.7), 
    random(width*0.01, width*0.02), random(height*0.01,height*0.02), 
    random(width*0.99, width*0.999), random(height*0.01,height*0.02), 
    random(width*0.82, width*0.86), random(height*0.39, height*0.45));
  //arc(width*0.3, height*0.3, width*0.7, height*.03, PI+QUARTER_PI, TWO_PI);
}

void drawEyes() {
  if (random(10)>8) {
    line(random(width*0.24,width*0.26),
    random(height*0.3,height*0.36),
    random(width*0.35,width*0.45),
    random(height*0.3,height*0.36));
    
    line(random(width*0.6,width*0.7),
    random(height*0.3,height*0.36),
    random(width*0.7,width*0.75),
    random(height*0.3,height*0.36));
  } else  {
    fill(255);
    ellipseMode(CENTER);
    if (random(10)<8) {
      line(width*0.3,height*0.35,width*0.6,height*0.35);
    }
    ellipse(eye1xpos,eye1ypos,random(width*0.1,width*0.3),random(height*0.1,height*0.3));
    ellipse(eye2xpos,eye2ypos,random(width*0.1,width*0.3),random(height*0.1,height*0.3));
    // Draw eyeballs
    fill(0);
    ellipse(eye1xpos+random(-7,7),eye1ypos,
    random(width*0.01,width*0.03),
    random(height*0.01,height*0.03));
    ellipse(eye2xpos+random(-7,7),eye2ypos,
    random(width*0.01,width*0.03),
    random(height*0.01,height*0.03));
  }
}
class Face {
  
}


