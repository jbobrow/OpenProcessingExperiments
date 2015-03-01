
ArrayList branches = new ArrayList();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;

void setup(){
  size(640, 640);
  stroke(0, 150, 255, 65);
  for(int i = 0; i < 65; i++){branches.add(new Branch());}
}

void draw(){
  background(backgroundColor);
  fill(fillColor);
  for(int i = 0; i < branches.size(); i++){
    Branch b = (Branch) branches.get(i);
    pushMatrix();
    translate(width/2, height);
    rotate(radians(b.startAngle));
    b.branch(b.segments);
    popMatrix();
  }
}

class Branch {
  float segments, startAngle, angle, theta, num;
  Branch(){
    segments = random(30, 100);
    startAngle = random(-90, 90);
    angle = map(startAngle, -90, 90, -10, 10);
  }
  
  void branch(float len){
    len *= 0.75;
    float t = map(len, 1, 70, 1, 10);
    theta = angle + sin(len+num) * 5;
    strokeWeight(t);
    //fill(0, 150, 255, 30);
    //bezier(0, 0, 0, t, -len/2, t, 0, -len);
    //bezier(0, 0, 0, t, len/2, t, 0, -len);
    line(0, 0, 0, -len);
    //fill(fillColor);
    ellipse(0, 0, t, t);
    translate(0, -len);
    if(len > 5){
      pushMatrix();
      rotate(radians(-theta));
      branch(len);
      popMatrix(); 
    }else{
      for(int i = 0; i < 360; i+=30){
        float x = sin(radians(i)) * 10;
        float y = cos(radians(i)) * 10;
        line(0, 0, x, y); 
      }
    }
    num += 0.003;
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


