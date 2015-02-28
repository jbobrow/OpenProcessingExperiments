
int a=120;
int b=200;

int num=1100;
Circ[] circles = new Circ[num]; 
  


int n=0;
int time=100;

void setup(){
  size(1200,1200);
  background(255);
  randomSeed(0);
  smooth();
  for (int i=0;i<num;i++){
circles[i]= new Circ(random(a,width-a),random(b,height-b),random(40,80));
  };
  for (int i=0;i<num;i++){
    stroke(0,30);
circles[i].display();
};

 for (int i=0;i<num;i++){
   for (int j=i+1;j<num-1;j++){
  if (circles[i].intersect(circles[j])){
    stroke(255);
    ellipse(circles[i].x,circles[i].y,1,1);
    ellipse(circles[j].x,circles[j].y,1,1);
    stroke(0,150);
    line(circles[i].x,circles[i].y,circles[j].x,circles[j].y);
  };
};
 
};
};

void draw(){

};

void makecirc(){
 circles[n]= new Circ(random(10,width),random(10,height),random(40,80));
};

class Circ {

  float x;
  float y;
  float rad;
  color c = #9AC6FA;

Circ(float temp_x,float temp_y,float temp_rad){
  x=temp_x;
  y=temp_y;
  rad=temp_rad;
};

void display(){

 fill(c,150);
 ellipse(x,y,rad,rad); 
 
};

boolean intersect(Circ b){

  if (dist(x,y,b.x,b.y) < (rad+b.rad)/2){
  return true;
}
  else return false;
};

};



