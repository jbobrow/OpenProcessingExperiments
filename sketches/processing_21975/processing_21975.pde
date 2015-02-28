
// Pictorial3DView Sample / Written by n_ryota

//------------------------------------------
PGraphics A;
PGraphics B;

//------------------------------------------
void setup() {
  size(600, 600);
  A = createGraphics(280, 280, P3D);
  B = createGraphics(280, 280, P2D);
  fill(0);
}

//------------------------------------------
void draw() {
  // draw A
  A.beginDraw();
  A.background(255);
  A.stroke(64);
  A.strokeWeight(3);
  A.ambientLight(80, 70, 60); 
  A.directionalLight(128, 128, 128, 0, 0.5, -0.5); 
  A.translate(A.width/2, A.height/2);
  A.scale(0.1+abs(sin(millis()*0.0001)));
  A.rotateX(millis()*0.001);
  A.rotateY(millis()*0.0001);
  A.box(100, 100, 100);
  A.endDraw();
  image(A, 10, 10);
  text("A", 20, 30);

  // draw B
  A.loadPixels();
  B.beginDraw();
  B.noStroke();
  B.translate(-3,-3);
  for(int y=0; y<A.height; y+=7) { 
    for(int x=0; x<A.width; x+=7) {
      int pos = (y * A.width) + x;
      color c = A.pixels[pos];
      c = lerpColor(c, color(random(255), random(255), random(255)), random(0.1));
      B.fill(c);
      B.stroke(c);
      B.strokeWeight(random(1, 3));
      B.line(x-2+random(5), y-2+random(5), x+4+random(5), y+4+random(5));
    }
  }
  B.endDraw();
  image(B, A.width+20, 10); 
  text("B", A.width+20+10, 30);
  
  // draw A + B
  image(A, 10, A.height+20); 
  tint(255, 128);
  image(B, 10, A.height+20); 
  text("A+B", 20, A.height+30+10);
  tint(255);
}

