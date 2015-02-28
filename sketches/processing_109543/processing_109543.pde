

int tamano = 100;
float angulo = 0;
boolean flag = false;

int numberOfRect = 50;
float widthRect;
Rect[] rectangulo = new Rect[numberOfRect];

color[] palette = {#79B87A,#B3C280,#ABA279,#C2A780,#B88877};
int paletteColor = int(random(0,2));


void setup() {
  
  size(800, 600,P3D);
  background(palette[4]);
  frameRate(10);
  widthRect = width / numberOfRect;
  float x=0;

    for (int i =0; i<rectangulo.length; i++ ) {
      rectangulo[i]= new Rect(x,0,paletteColor,widthRect);  
      x+=widthRect;
      
      if (paletteColor==0) {
        paletteColor = 1;
      } else {
        paletteColor = 0;
      }
  }
  
}


void draw() {
  
  for (int i =0; i<rectangulo.length; i++ ) {
    rectangulo[i].update();
    rectangulo[i].display();
  }
  
  noStroke();
  
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(angulo);
  translate(-tamano/2, -tamano/2);
  fill(#ABA279);
  arc(50, 55, tamano, tamano, 0, HALF_PI,OPEN);
  fill(#C2A780);
  arc(50, 55, tamano, tamano, HALF_PI, PI,OPEN);
  fill(#ABA279);
  arc(50, 55, tamano, tamano, PI, PI+HALF_PI,OPEN);
  fill(#C2A780);
  arc(50, 55, tamano, tamano, PI+HALF_PI,2*PI,OPEN );
  popMatrix();
  
  angulo += QUARTER_PI/4;
  
  if (tamano==300) {
    flag = true;
  }else if(tamano==100) {
    flag = false;
  }
  
  
  if (flag) {
   tamano -= 10; 
  } else {
   tamano += 10; 
  }
  
 
}






class Rect {
  
  float xPosition;
  float yPosition;
  float widthRect1;
  int palettePosition;
  
  Rect(float x, float y, int paletteColor, float tempWidth) {
    xPosition = x;
    yPosition = y;
    palettePosition = paletteColor;
    widthRect1 = tempWidth;
  }
  
  void update() {
    
    if (palettePosition==0) {
      palettePosition = 1;
    } else {
      palettePosition = 0;
    }
    
    //palettePosition = paletteColor;
  }
  
  void display() {
    fill(palette[palettePosition]);
    noStroke();
    rect(xPosition,yPosition,widthRect1,height);
  }
  
  
}


