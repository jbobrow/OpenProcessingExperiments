
int y = 0;
int x = 0;
int r = 0;
int g = 0;

int dir = 3;
float changeColor = 3;
float back= 0;

void setup() {
  size(500,500);
  frameRate(5);
  smooth();
  background(back);
  
  
}

void draw(){
 
  //cambia stroke
  stroke(g,g,g);
  g+=changeColor;
  if(g == 0 || g >= 255){
  changeColor *=-1;
  }
 
  
  //dibuja lineas
  line(0,y,width,y);
  
  line(0,y,500,height);
  y += dir;
  
  //cuando llegue a los extremos regresa
  if(y >= height || y == 0){
    dir *= -1;
  }
 
 
 

}


