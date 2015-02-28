
float x=0;
float y=55;


void setup(){
  size(100, 100);
}
void draw(){
 
  background (0, 250,50);
  line(x,y,x+20, y-40);
  line(x+10,y, x+30,y-40);
  line(x+20,y, x+40,y-40);
  line(x+30, y, x+50, y-40);
  line(x+40, y, x+60,y-40);
  if(x<100){
    x++;
  }

println(x);
}


