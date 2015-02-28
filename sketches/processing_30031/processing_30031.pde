
int diameter=100;
int x;
int y = 50;

void setup(){
  size(200, 100);
  smooth();
}

void draw(){ 
  for(x=diameter/2; x<width; x=(x+diameter+diameter/2)){
    diameter = diameter/2; 
    if (diameter<4){}
    else{
    ellipse(x, y, diameter*2, diameter*2);
    }
  }
}    


