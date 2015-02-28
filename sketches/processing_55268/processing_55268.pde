
//homework 11 rwandrew
//copyright russell andrews 2012

final int MAX = 100;

float [] x;
float [] y;
float [] dia;
float [] ddia;
float [] dx;
float [] dy;
color [] col;

void setup () {
  size(600,600);
  noStroke();
  background(120, 120, 255);
  smooth();

  
  x = new float [MAX];
  initializeFloatArray(x, 0, width);
  
  y = new float [MAX];
  initializeFloatArray(y, 0, height);
  
  dx = new float [MAX];
  initializeFloatArray(dx, 0.2, 0.6);
  
  dy = new float [MAX];
  initializeFloatArray(dy, 0.2, 0.6);
  
  dia = new float [MAX];
  initializeFloatArray(dia, 0, height*.1);
  
  ddia = new float [MAX];
  initializeFloatArray(ddia, 0.3, 1.2);
  
  col = new color [MAX];
  initializeColorArray();
}

void draw(){
  prepScreen();
  drawEllipse();
  growEllipse();
  moveEllipse();

}

void initializeFloatArray(float [] temp, float low, float high){
  for(int i = 0; i < temp.length; i++){
    temp[i] = random(low, high);
  } 
}


void initializeColorArray(){
  for (int i = 0; i < col.length; i++){
    col[i] = color( 255, 255, 255, random(70));
  }
}

void drawEllipse(){
  for(int i = 0; i < x.length; i++){
    fill(col[i]);
    ellipse(x[i], y[i], dia[i], dia[i]);
  }
 
}

void growEllipse(){
   for(int i = 0; i < x.length; i++){
     dia[i] += ddia[i];
     if(dia[i] > random(height*.2, height*.5)){
      dia[i] = 0; 
     }
     }
       
  }

void moveEllipse(){
  for(int i = 0; i < dx.length; i++){
    x[i] += dx[i];
    if(x[i] > width){
      x[i] = 0;
    }
    y[i] += dy[i];
    if(y[i] > height){
      y[i] = 0;
    }
  }
}

void prepScreen(){
  fill(100, 100, 255, 10);
  rect(0, 0, width, height);
}


