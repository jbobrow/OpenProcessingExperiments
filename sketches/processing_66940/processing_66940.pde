
float[]circleX = {50,100,150,200,250,300};
int y;
boolean direction = false;

void setup(){
  size(350,600);
  smooth();
  noStroke();
}
void draw(){
  background(0);
  for(int i =0; i < 6; i++){
    fill(255, random(255),random(255));
    ellipse(circleX[i],y,20,20);
    if(y>=0 && direction==false){y+=5;}
    if(y>=590){direction=true;}
    if(y<=590 && direction==true){y-=5;}
    if(y<=10){direction=false;}
    }
}

