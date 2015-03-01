
ArrayList t, h, z;
float r = 0, diam;

void setup() {
  size(600,300);                                  
  background(255);
  noStroke();
  t= new ArrayList();
  h = new ArrayList();
  z = new ArrayList();

  for (int i = 0; i < 6; i++) {
    t.add(new Zig());
  }
}

void draw() {
  z.add( new T());
  background(255);
  for (int i = 0; i < t.size(); i++) {
    Zig temp = (Zig) t.get(i);
    temp.update();
    temp.display();
    for (int j = i; j < t.size(); j++) {
          Zig hit = (Zig) t.get(i);
          float xpos = temp.xpos;
          float ypos = temp.ypos;
          if ((temp.x1 == hit.x1) ||(temp.x1 == hit.x2) || (temp.x1 == hit.x3) || (temp.x1 == hit.x4) ) {
            h.add(new Ellipse (xpos+temp.x1, ypos+temp.y1));

          }
         
          if ((temp.y1 == hit.y1) ||(temp.y1 == hit.y2) || (temp.y1 == hit.y3) || (temp.y1 == hit.y4) ) {
            h.add(new Ellipse (xpos+temp.x1, ypos+temp.y1));

          }
          if ((temp.y2 == hit.y1) ||(temp.y2 == hit.y2) || (temp.y2 == hit.y3) || (temp.y2 == hit.y4) ) {
            h.add(new Ellipse (xpos+temp.x2, ypos+temp.y2));

          }          
    }
    
    if (frameRate % 10000 == 0) {
        t.add(new Zig());
    }

  }
  
  for (int k = 0; k < h.size(); k++) {
    Ellipse hit = (Ellipse) h.get(k);
    hit.display();
  }
  
    for (int k = 0; k < z.size(); k++) {
    T hit = (T) z.get(k);
    hit.display();
    if (hit.ypos > height) {
      z.remove(k);
    }
  }
  

}

class T {
   float diam = random(2, 6);
   float xpos = random(10, width);
   float ypos = height/2 + random(-10, 10);
   float r  = 0;
   
  void display () {
       pushMatrix();
       rotate(r);
       r += .001;
      translate(xpos, ypos);
      fill(67, 175, 206, ypos * .58);
        rect(xpos+(width/2), frameRate * random(-.005, .005), diam, diam);
      popMatrix();
  }
}

class Ellipse {

   float xpos, ypos;
   float op = random(30, 70);
   float diam = random(2, 6);
   Ellipse(float xpos, float ypos) {
     this.xpos = xpos;
     this.ypos = ypos;
   }
   
   
   void display() {
    pushMatrix();
    translate(xpos, ypos);
    fill(67, 175, 206, op);
    ellipse(0, 0, diam,diam);
    popMatrix();
    
  }
  
}

class Zig {
  float xpos = random(width/4, width * 3/4), ypos = random((height/2)-10, (height/2)+10); 
  float x1,y1, x2, y2, x3, y3, x4, y4;
  Zig() {
    x1 = random(-2, 3);
    x2 = random(-4, 2);
    x3 = random(-4, 2);
    x4 = random(-4, 2);
    
    y1 = 0;
    y2 = 5;
    y3 = 10;
    y4 = 120;

  }
  
  void update() {
    
    x1 = x1+frameRate * random(-.005, .005) + random(-.005, .005) ;
    x2 = x2+frameRate  * random(-.005, .005) + random(-.005, .005);
    x3 = x3+frameRate * random(-.005, .005) + random(-.005, .005);
    x4 = x4+frameRate * random(-.005, .005) + random(-.005, .005);
    
    y1 += random(-.01, .01);
    y2 += random(-.01, .01);
    y3 += random(-.01, .01);
    y4 += random(-.01, .01);

  }
  
  void display() {
    pushMatrix();
    rotate(random(.001, .003));
    translate(xpos, ypos);
    fill(67, 175, 206);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix();
  }
  
}
