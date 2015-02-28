
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}



ArrayList<Ripple> ripples = new ArrayList();

void setup() {
 size(400,400);
 smooth();
}

void draw() {
  background(255); 
  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
    r.grow();
    if (r.fade<0){
ripples.remove(r);

}

    } 
  } 


void mousePressed() {
  ripples.add(new Ripple(mouseX,mouseY));
 
}



class Ripple {
  float x;
  float y;
  float rSize;
  float fade = 255;
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));

//location
  Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(r, g, b,fade);
    noFill();
    ellipse(x, y, rSize, rSize);
  }

  void grow() {
    rSize++;
    fade-=3;
    if (fade <= 0) {
      fade = 0;
    }
  }
}
