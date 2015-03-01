
float x=0, fase=0;

void setup(){
 size(600, 400);
 frameRate(30);
}

void draw(){
  background(250, 150, 0);
  fase=fase+0.2;
  for(x=0; x<=600; x=x+0.01){
    point(300+1*pow(1.3, x)*cos(2*x-fase), 200+1*pow(1.3, x)*sin(2*x-fase));
  } 
}
//I made the spiral of Archimedes
