

////// Miguel Vilacha 
////// IDEP 2010
//////scratching OYa = bezier

//Variable
int x = 255;

void setup() {
  size(500,400);
  background(255);
  colorMode(HSB,100,94,85); 
  smooth();
}

//Juego 

void draw(){
  if (x > 400) {
    x = -90;
  } else {
  x++;
  }
   
  background(0);
  for (int v=-100; v <10000; v+=30){
  stroke(v,100,600);
  strokeWeight(3);
  bezier(v, 0,x+5,x+9900,v,500, v, 500);
 
  }
}






