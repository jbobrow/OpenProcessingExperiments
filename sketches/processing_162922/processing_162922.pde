
void setup(){
  size(200,200);
  background(0);
}
int ySpeed=1;
boolean Switch=true;
int x=(width/2);
int y=30;

void draw(){
  background(0);
  ellipse(width/2,y,30,30);
  if (Switch){
    y+=ySpeed;
  }
  else{
    y-=1;
  }
  if (y+30==height || y-30==0)
    Switch=!Switch;
}
  


