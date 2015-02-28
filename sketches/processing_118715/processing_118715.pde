
// draw through maze dont hit anything
int level = 0;
PVector player = new PVector(30,30);
PVector mouse;
PVector start, end;
boolean flag = false;
float counter = 0.0;

void setup() {
  size(640,480);
  smooth();
}

void draw() {
  background(0);
  fill(255);
  stroke(255);
  mouse = new PVector(mouseX,mouseY);
  // basic level
  if(level==0) {
    counter+=1.0;
    start = new PVector(30,30);
    end = new PVector(width-30,height-30);
    float h = height/2 + height/2*(sin(counter/60.0));
    noStroke();
    rect(0,0,width,60);
    rect(0,height-60,width,60);
    ellipse(width/2,h,90,90);
  }
  if(level==1) {
    //
    counter++;
    start = new PVector(30,height/2);
    end = new PVector(width-30,height/2);
    strokeWeight(60);
    noFill();
    beginShape();
    for(float x=0.0; x <= width; x+= width/20.0) {
      float y = height/2;
      float d = (width/2 - x)/(width/2);
      d = 1-abs(d);
      y += d*100*sin((x+counter)/50.0);
      curveVertex(x, y);
    }
    endShape();
  }
  if(level==2) {
    //
    counter++;
    start = new PVector(30,height/2);
    end = new PVector(width-30,height/2);
    fill(255);
    noStroke();
    rect(width/2,height/2,width,60);
    fill(0);
    rect(width/2,height/2,width-160,60);
    fill(255);
    float inter = width/4;
    rectMode(CENTER);
    for(int i = 1; i <= 3; i++) {
      float x = i * inter;
      pushMatrix();
      translate(x,height/2);
      rotate(counter/100.0);
      rect(0,0,inter+10,60.0);
      popMatrix();
    }
  }
  //
  fill(255,0,0);
  noStroke();
  ellipse(player.x, player.y, 20,20);
  fill(0,255,0);
  ellipse(end.x, end.y, 30,30);
  if(mousePressed & player.dist(mouse) < 30) {
    flag = true;
  }
  if(flag) {
    player = mouse.get();
    if(!mousePressed) flag = false;
  }
  //
  loadPixels();
  for(float a = 0.0; a < TWO_PI; a+=PI/4) {
    //
    int x = int(player.x + 12*cos(a));
    int y = int(player.y + 12*sin(a));
    stroke(0,255,0);fill(0,255,0);
    if(pixels[width*y + x] == color(0)) {
      player= start.get();
      flag = false;
    }
  }
//  updatePixels();
  // progress
  if(end.dist(player) < 30) {
    level++;
  }
}

