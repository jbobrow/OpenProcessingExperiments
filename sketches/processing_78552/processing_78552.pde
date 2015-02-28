
PImage [] images = new PImage [10]; 
int r;
PFont font;
float angle = 0;

float _angnoise, _radiusnoise; 
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254; 


color[]myColors = { 
  #01a2ff, #84ff00, #ffbf35, #ff6935, #ffffff,#ff1ff7
};
color[]pickedColors;
float diam = 10;


void setup() {

  size(400, 800, P2D);
  font = loadFont("CenturyGothic-Bold-48.vlw");
  textFont(font);
  smooth(); 
  frameRate(24); 
  background(0); 
  noFill();
  _angnoise = random(10); 
  _radiusnoise = random(10);
  _xnoise = random(100); 
  _ynoise = random(100);

  pickedColors = new color[250];
  setColors();
  for (int i = 0; i < images.length; i ++)
  {
    images[i] = loadImage( i +".jpg");
  }
  

}


void setColors() { 
  for (int i = 0; i < 200; i++) {                             
    pickedColors[i] = myColors[(int) random (myColors.length)];
  }
}

void draw() {
  

  r=int(random(10));
  image(images[r], 0, 0);
  r++;

  pushMatrix();  
    translate(width/2, 200);
    rotate(radians(angle));  
    textSize(35);
    fill(0, 50);
    text(" T  I  M  E ", 0, 0);
  popMatrix();

  angle = angle + 5;
  fill(0,random(5));
noStroke();
rectMode(CENTER);
rect(150,400,diam%1000,diam%1000); 
 diam+=80;
   
  
  _radiusnoise += 0.005;
  _radius = (noise (_radiusnoise) *600) +1;
  _angnoise += 0.005;
  _angle += (noise (_angnoise) * 6) - 3; 

  if (_angle > 360) { 
    _angle -= 360;
  }

  if (_angle < 0) { 
  _angle += 360;
  }
  _xnoise += 0.01;
  _ynoise += 0.01;

  float centerX = width/2 + (noise(_xnoise) * 100) - 100; 
  float centerY = height/2 + (noise(_ynoise) * 100) - 50;
  float rad = radians(_angle);
  float x1 = centerX + (_radius * cos(rad)); 
  float y1 = centerY + (_radius * sin(rad));
  float opprad = rad + PI;
  float x2 = centerX + (_radius * cos(opprad)); 
  float y2 = centerY + (_radius * cos(opprad));
  float z1 = 0;



  for (int i = 0; i<5; i++) {
    stroke (pickedColors [i], random(100));

    strokeWeight(.25); 
    line(x1, y1, x2, y2);
    bezier (x2, y2, 20+y1 , x2,y2, x1 + 50, x1,y1 );
    bezier (x2, y2, 20+z1 , x2,y2, x1 + 50, x1,y1 );
    //strokeWeight(1);
    //line(mouseX, mouseY, x2, y2);
    z1 = z1+20;
  }
}

void mousePressed() {

   setColors();
   redraw();

}




