
ArrayList<Blade> bush = new ArrayList<Blade>();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;


void setup() {
  size(640, 640);
  stroke(0, 150, 255, 65);
  /* Fast the computer the more you can add, 65 is a good allrounded number. */
  for (int i = 0; i < maxSize; i++) {
    bush.add(new Blade(random(40, 180)));
  }
}

void draw() {
  /* Looks wicked in both white and black, we change the fill to. */
  background(backgroundColor);
  fill(fillColor);
  for(int i = 0; i < bush.size(); i++){
    Blade b = (Blade) bush.get(i);
    b.draw(); 
  }
}

class Blade {
  float segments, angle, num;

  Blade(float segments) {
    this.segments = segments;
    angle = random(-20, 20);
  }

  void draw(){
    pushMatrix();
    translate(width/2, height);
    branch(segments);
    popMatrix();
  }
  
  void branch(float len) {
    len *= 0.75;
    
    float t = map(len, 1, maxSize, 1, 5);
    float c = angle+sin(len+num) * 5;
    strokeWeight(t);
    
    /* Draw the line first then overlap the joints with white cirlces. */
    line(0, 0, 0, -len);
    ellipse(0, 0, t, t);
    
    /* We make the next location and if len > 5 then we make a new segment to our branch */
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(c));
      /* A function that calls itself with the same parameters. */
      branch(len);
      popMatrix();
    }
    num+=0.001;
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


