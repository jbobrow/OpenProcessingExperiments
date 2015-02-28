
// Random Walker (Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

Walker[] walkers = new Walker[400];
Walker w;
float xoff;// for perlin noise
float xincrement = 0.003;// incrementer for perlin noise
color c;// color
float a;// color alpha changes based on perlin noise
float r;// color red changes based on perlin noise
float g;// color green changes based on perlin noise
float b;// color blue changes based on perlin noise

void setup() {
  size(600,600);
  smooth();
  xoff = 0;
  // Create a walker object
  for(int i = 0; i < walkers.length; i++){ 
    xoff += xincrement;
    a = noise(xoff)*255;// color changes based on perlin noise
    r = noise(xoff)*255;// color changes based on perlin noise
    g = noise(xoff/4)*255;// color changes based on perlin noise
    b = noise(xoff/2)*255;// color changes based on perlin noise
    color c = color(r, g, b, 255);

    walkers[i] = new Walker(noise(xoff)*800, c, random(360));
  }
}

void draw() {
  //background(255);
  fill(5, 25);
  rect(0,0,width,height);
  // Run the walker object
  for(int i = 0; i < walkers.length; i++){
    walkers[i].walk(); 
    walkers[i].render();
  }
  filter(DILATE);
}

void mousePressed() {
  for(int i = 0; i < walkers.length; i++){ 
    xoff += xincrement;
    a = noise(xoff)*255;// color changes based on perlin noise
    r = noise(xoff)*255;// color changes based on perlin noise
    g = noise(xoff/4)*255;// color changes based on perlin noise
    b = noise(xoff/2)*255;// color changes based on perlin noise
    color c = color(r, g, b, 255);

    walkers[i].radius = noise(xoff/2)*300;
    walkers[i].value = c;
  }
}


// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// A random walker class!

class Walker {
  PVector loc;

  float radius;
  float angle;
  float wiggle;
  float wAngle;
  color value;
  Walker(float _radius, color _value, float _angle) {
    value = _value;
    radius = _radius;
    angle = _angle;
    wAngle = random(0,360);
    loc = new PVector((cos(radians(angle)) * radius) + width/2,(sin(radians(angle)) * radius) + height/2);
  }

  void render() {

    stroke(20,200);
    fill(value);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(radians(angle));
    rect(0,0,abs((wiggle*wiggle*wiggle) + 50),abs((wiggle*wiggle*wiggle) + 15));
    
    popMatrix();
    //ellipse(loc.x,loc.y,abs((wiggle*wiggle*wiggle) - 5),abs((wiggle*wiggle*wiggle) - 5));
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector vel = new PVector(random(-1,10),random(-10,1));
    //loc.add(vel);
    // add wiggle
    wAngle += 5;
    wiggle = cos(radians(wAngle)) * 2;
    radius += wiggle;
    angle += .5+(wiggle/10);
    loc = new PVector((cos(radians(angle)) * (radius + wiggle)) + width/2,(sin(radians(angle)) * (radius + wiggle)) + height/2);
    //loc.add(wiggle);
    loc.add(vel);
    // Stay on the screen
    loc.x = constrain(loc.x,0,width-1);
    loc.y = constrain(loc.y,0,height-1);
  }
}
