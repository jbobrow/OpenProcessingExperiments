
int i = 0;

void setup(){
  size(900,300);
  stroke(255,255,255);
  background(0,0,0);   
  line(0,0,0,height);
  line(0,height/2,width,height/2);
  frameRate(100);

}
void draw(){
  int radio = height/2; 

  i = i + 1;
    strokeWeight(5);
    stroke(0,255,0);
    point(i, -(cos(map(i,0,radio,0,PI/2))*radio)+radio);
    stroke(255,0,0);
    point(i, -(sin(map(i,0,radio,0,PI/2))*radio)+radio);
  
}

