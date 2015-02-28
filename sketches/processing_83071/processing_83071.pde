
float angle = 0.0;
float offset = 100;
float scalar = 550;
float speed = 0.01;
float xoff = 0.01;
float [] puntos = new float [10];


void setup() {
  background(43, 16, 59);
  size ( 4134,2953
    );
}
void draw() {
  

 
   float y1 = offset +sin(angle) *scalar;
  float y2 = offset +sin(angle + 0.4) *scalar;
  float y3 = offset +sin(angle + 0.8) *scalar;
  float y4 = offset +sin(angle + 1) *scalar;
  xoff = xoff + .02;
  float n = noise(xoff) * width;
  //line(n, 0, n, height);
  stroke(100, 1+0.5*y1, 100);


  for(int i = 0; i < puntos.length; i++){
ellipse(width/2+random(-3500,0), height/2+random(-2800,5000),10+.1*n,10+.1*n);


}


  //ellipse(-150,y1,n,n);
  ellipse(100+2*n,500+2*y2,60+n,60+n);
   //ellipse(5000+n,y2,80+n,80+n);
  //ellipse(y4+n, y3, 80, 80);
  fill(32, 1+0.5*y3, 84, 100);

  //quad(0+n,y1+n,0,6*y2+n,2,y1+50*n,y1,y3+n);


  angle += 5*speed;
}

// para guardar en PNG para impresión
void keyPressed() {
  if (key == 's') {
    save("normal.png");
    saveHiRes(5);
    exit();
  }
}

void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  draw();
  endRecord();
  hires.save("hires.png");
}
