
ArrayList<Ripple> ripples = new ArrayList();
PImage img;

void setup() {
 size(1500,400);
 smooth();//{
  
 // img = loadImage("colorful-india.jpg"); 
  
  
  //size(img.width, img.height); 
//}

}

void draw() {
  background(0,0,0); 
  // {
  //image(img, 50, 0);
//}
  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
    r.grow();
  } 
}

void mousePressed() {
  ripples.add(new Ripple(200,200));
}
void keyPressed () {
  if(key== 's') {
    saveFrame ("Midterm-####.pdf");
    }
    }


class Ripple {
  float x;
  float y;
  float rSize;
  float fade = 100;
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  int left = int(random(100,300));


  Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    strokeWeight (10);
    stroke (random (0,255), random (0,255), random (0,255));
   fill(r,g,b,fade);
    ellipse (600, 0, rSize, rSize);
    ellipse (700, 0, rSize, rSize);
    ellipse (800, 0, rSize, rSize);
    ellipse (600, 400, rSize, rSize);
    ellipse (700, 400, rSize, rSize);
    ellipse (800, 400, rSize, rSize);
    //stroke (255);
    //line (1500, left, rSize, rSize);
   //rect (-10,200, rSize, rSize);
    //ellipse (400, 0, rSize, rSize);
    //rect (0, 400, rSize, rSize);
    fill(r,g,b,fade);
   // line (x, y, rSize, rSize);
  }

  void grow() {
    rSize+=5;
    fade--;
    if (fade <= 0) {
      fade = 0;
    }
  }
}


