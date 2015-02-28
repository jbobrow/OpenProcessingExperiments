


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

  size(300, 800); 
  smooth(); 
  frameRate(30); 
  background(0); 
  noFill();
  _angnoise = random(10); 
  _radiusnoise = random(10);
  _xnoise = random(100); 
  _ynoise = random(100);

  pickedColors = new color[250];
  setColors();
  

}


void setColors() { 
  for (int i = 0; i < 200; i++) {                             
    pickedColors[i] = myColors[(int) random (myColors.length)];
  }
}

void draw() {
  
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



  for (int i = 0; i<5; i++) {
    stroke (pickedColors [i], random(100));

    strokeWeight(.25); 
    line(x1, y1, x2, y2);
    
    
  }
}

void keyPressed() {
if (key == 'c') {   //repicking all colors
   //background(0);
   setColors();
   redraw();
}
}



