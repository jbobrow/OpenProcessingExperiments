
ArrayList branches = new ArrayList();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;

void setup(){
  size(740, 740);
  stroke(0, 150, 255, 65);
  for(int i = 0; i < 65; i++){branches.add(new Branch());}
}

void draw(){
  background(backgroundColor);
  for(int i = 0; i < branches.size(); i++){
    Branch b = (Branch) branches.get(i);
    pushMatrix();
    translate(width/4, height/4);
    rotate(radians(b.startAngle));
    b.branch(b.segments);
    popMatrix();
  }
}

class Branch {
  float segments, startAngle, angle, theta, num;
  Branch(){
    segments = random(30, 80);
    startAngle = random(-360, 360);
    angle = map(startAngle, -360, 360, -10, 10);
  }
  
  void branch(float len){
    len *= 0.75;
    float t = map(len, 1, 70, 1, 10);
    theta = angle + sin(len+num) * 5;
    strokeWeight(t);
    fill(0, 150, 255, 30);
    bezier(0, 0, 0, t, -len/2, t, 0, -len);
    bezier(0, 0, 0, t, len/2, t, 0, -len);
    fill(fillColor);
    ellipse(0, 0, t, t);
    translate(0, -len);
    if(len > 5){
      pushMatrix();
      rotate(radians(-theta));
      branch(len);
      popMatrix(); 
    }
    num += 0.005;
  }
}

void mousePressed(){
  if(doOnce && backgroundColor == 255){
    backgroundColor = 0;
    fillColor = 255;
    doOnce = false;
  }
  if(doOnce && backgroundColor == 0){
    backgroundColor = 255;
    fillColor = 0;
    doOnce = false;
  }
}
 
void mouseReleased(){
  doOnce = true;
}


