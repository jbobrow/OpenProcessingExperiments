

ArrayList<Elektronisch> all = new ArrayList();
float rx = 0;
float ry = 0;
float x, y;
float rotX,rotY;
float r, g, b, r2, g2, b2, r3, g3, b3;
PImage bg;
color k1, k2, k3;
color[] colorlist = {#FCFF55, #FA4F00, #64FF77};

void setup() {
  
  size(1440,900,P3D);
  ellipseMode(RADIUS);
  rectMode(CORNER);
  
  rotX = 0;
  rotY = 0;
  
  for(int i = 0; i < 300; i++) {
    Elektronisch x = new Elektronisch(95+random(10), int(20+random(25)));
    all.add(x);
  }
  
  k1 = colorlist[0];
  k2 = colorlist[1];
  k3 = colorlist[2];
  bg = loadImage("backgrounds/1.png");
}

void colorPicker() {
   r = random(255);
   g = random(255);
   b = random(255);
   r2 = random(255);
   g2 = random(255);
   b2 = random(255);
   r3 = random(255);
   g3 = random(255);
   b3 = random(255);
   
   k1 = color(r, g, b);
   k2 = color(r2, g2, b2);
   k3 = color(r3, g3, b3);
}

void draw() {
  
  //if(frameCount%50 == 0){}
  background(bg);

  pushMatrix();
  translate(width/2,height/2);
  rotateY(radians(rotX));
  rotateX(radians(rotY));
  
  if (keyPressed) {
    
    if(key == ' ') {
      rotX += mouseX-pmouseX;
      rotY += mouseY-pmouseY;
    }
    
    if(key == 'r' || key == 'R') {
      rotY = 0;
      rotX = 0;
    }
    
    if(key == 'c' || key == 'C') {
      colorPicker();
    }
  }
  
  for(int i = 0; i < all.size(); i++) {
    Elektronisch x = all.get(i);
    x.draw(k1, k2, k3, i);
  } 
  popMatrix();
}
class Elektronisch {
  
  float x, y, z;
  float sx, sy, sz;
  ArrayList<Float> xlocs;
  ArrayList<Float> ylocs;
  ArrayList<Float> zlocs;
  int amount, count;
  
  Elektronisch(float deel, int a) {
      x = random(10, 1430);
      y = random(10, 890);
      z = 0;
      
      sx = width/deel;
      sy = height/deel;
      sz = sx;
      
      xlocs = new ArrayList();
      ylocs = new ArrayList();
      zlocs = new ArrayList();
      amount = a;
      count = 0;
  }
  
  
  void move() {
    if(random(1) <= 0.5) {
      for(int i = 0; i < 2; i++) {
        x+= sx/2;
      }
    }else{
      for(int i = 0; i < 2; i++) {
        y+= sy/2;
      }
    }
        
    if(random(1) <= 0.5) {
      z-= sz/2; 
    }else{
      z+= sz/2; 
    }
  }
  
  
  void check() {
    if(x<50 || x > width-50) {
      sx = -sx;
    }
    if(y<50 || y > height-50) {
      sy = -sy;
    }
  }
  
  
  void createlist() {
    
    if(count < amount) {
      xlocs.add(x);
      ylocs.add(y);
      zlocs.add(z);
      count++;
     }else{
      xlocs.remove(0);
      ylocs.remove(0);
      zlocs.remove(0);
      count--;
    }
  }
  
  void mousePressed() {
    x = mouseX;
    y = mouseY;
    z = 0;
  } 
  
  void mousePressed2() {
    x = mouseX;
    y = mouseY;
  }
  
  
  void draw(color a,color b, color c, int ii) {
    
    check();
    move();
    pushMatrix();
    translate(-width/2, -height/2);
    for(int i = 0; i < xlocs.size(); i++) {
      if(i > 0) {
        // eerste punt vd lijn
        float tx = xlocs.get(i);
        float ty = ylocs.get(i);
        float tz = zlocs.get(i);
        //tweede punt vd lijn
        float ttx = xlocs.get(i-1);
        float tty = ylocs.get(i-1);
        float ttz = zlocs.get(i-1);
        fill(255,30);
        
        if(ii <= 100) {
          stroke(a);
        }
        if(ii > 100 && ii <= 200) {
          stroke(b);
        }
        if(ii > 200 && ii <= 300) {
          stroke(c);
        }
        
        strokeWeight(2);
        strokeCap(SQUARE);
        line(tx, ty, tz, ttx, tty, ttz);  
      }
    }
    
    popMatrix();
    createlist();
    
    if (mousePressed == true) {
      if(key == 'f' || key == 'F') {
        mousePressed2();
      }else{
        mousePressed();
      }
    }
  }  
}

class Elektronisch {
  
  float x, y, z;
  float sx, sy, sz;
  ArrayList<Float> xlocs;
  ArrayList<Float> ylocs;
  ArrayList<Float> zlocs;
  int amount, count;
  
  Elektronisch(float deel, int a) {
      x = random(10, 1430);
      y = random(10, 890);
      z = 0;
      
      sx = width/deel;
      sy = height/deel;
      sz = sx;
      
      xlocs = new ArrayList();
      ylocs = new ArrayList();
      zlocs = new ArrayList();
      amount = a;
      count = 0;
  }
  
  
  void move() {
    if(random(1) <= 0.5) {
      for(int i = 0; i < 2; i++) {
        x+= sx/2;
      }
    }else{
      for(int i = 0; i < 2; i++) {
        y+= sy/2;
      }
    }
        
    if(random(1) <= 0.5) {
      z-= sz/2; 
    }else{
      z+= sz/2; 
    }
  }
  
  
  void check() {
    if(x<50 || x > width-50) {
      sx = -sx;
    }
    if(y<50 || y > height-50) {
      sy = -sy;
    }
  }
  
  
  void createlist() {
    
    if(count < amount) {
      xlocs.add(x);
      ylocs.add(y);
      zlocs.add(z);
      count++;
     }else{
      xlocs.remove(0);
      ylocs.remove(0);
      zlocs.remove(0);
      count--;
    }
  }
  
  void mousePressed() {
    x = mouseX;
    y = mouseY;
    z = 0;
  } 
  
  void mousePressed2() {
    x = mouseX;
    y = mouseY;
  }
  
  
  void draw(color a,color b, color c, int ii) {
    
    check();
    move();
    pushMatrix();
    translate(-width/2, -height/2);
    for(int i = 0; i < xlocs.size(); i++) {
      if(i > 0) {
        // eerste punt vd lijn
        float tx = xlocs.get(i);
        float ty = ylocs.get(i);
        float tz = zlocs.get(i);
        //tweede punt vd lijn
        float ttx = xlocs.get(i-1);
        float tty = ylocs.get(i-1);
        float ttz = zlocs.get(i-1);
        fill(255,30);
        
        if(ii <= 100) {
          stroke(a);
        }
        if(ii > 100 && ii <= 200) {
          stroke(b);
        }
        if(ii > 200 && ii <= 300) {
          stroke(c);
        }
        
        strokeWeight(2);
        strokeCap(SQUARE);
        line(tx, ty, tz, ttx, tty, ttz);  
      }
    }
    
    popMatrix();
    createlist();
    
    if (mousePressed == true) {
      if(key == 'f' || key == 'F') {
        mousePressed2();
      }else{
        mousePressed();
      }
    }
  }  
}


