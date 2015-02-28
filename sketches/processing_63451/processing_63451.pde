
float a, b;
float cx, cy, x, y;
int numCurves;
color cl;
float cHue;
float step = 2;
float time;

PFont font;
PImage img1,img2;

int swap = 0;

void setup()
{
  size(800, 480);
  frameRate(26);
  
  cx = (width / 2) ;
  cy = (height / 2) ;

  a = 1;    // Phasen der Lissajous Figur
  b = 2;  

  numCurves = 340; //Auflösung der Kurve
  
  time = 0;
  step = 1;  // Änderungsrate
  
  cl = color(360,1,1);

  noFill();
  smooth();
  strokeWeight(0.5);
  colorMode(HSB, 360, 1, 1, 100);
  
  font = loadFont("DecimaNova-12.vlw");
  textFont(font,12);
  
  img1 = loadImage("1.jpg");
  img1.resize(width,0);
}

void draw() {
  fill(300);
  noStroke();
  rect(0,0,width,height);
  
  image(img1, 0,0);

  
  fill(20, 20);
  rect(0,height-20,width,20);
  fill(120,0,1);
  text("A: " + a +"  B: " +b , 20,height-6);
  
  noFill();

  translate(cx, cy);
  if (time >= 360) time = 0;

  if (swap == 1){
    cHue = map(radians(time), 0, TWO_PI, 0, 360);
  } else {
    cHue = 245;
  }    
  cl = color(cHue, 1, 1);

  beginShape();
  for (int i=0;i <= numCurves; i++) {    
    x = sin(a * i + radians(time)) * (cx -60);  
    y = sin(b * i + radians(time)) * (cy -40);  

    stroke(cl);
    curveVertex(x, y);
  }
  endShape();

  time += step;
  

}


void keyPressed() {
  if (key == 'a') a++;
  if (key == 'A') a--;
  if (key == 'b') b++;
  if(key == 'B') b--;
  
 
  /* if (key == '1') a = 1;
  if (key == '2') a = 2;
  if (key == '3') a = 3;
  if (key == '4') a = 4;
  if (key == '5') a = 5;
  if (key == '6') a = 6;
  if (key == '7') a = 7;
  if (key == '8') a = 8;
  if (key == '9') a = 9;
  if (key == '0') a = 10;
  
  // SHIFT + ZAHL änder b
  
  if (key == '!') b = 1;
  if (key == '"') b = 2;
  if (key == '§') b = 3;
  if (key == '$') b = 4;
  if (key == '%') b = 5;
  if (key == '&') b = 6;
  if (key == '/') b = 7;
  if (key == '(') b = 8;
  if (key == ')') b = 9;
  if (key == '=') b = 10; */
}

// Hue Range oder Rot
void mousePressed() {
  if (swap == 0) {
    swap = 1;
    
  } else {
    swap = 0;
  }
}




