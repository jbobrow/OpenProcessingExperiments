
//with rotate
 
void setup(){
  size(400,400);
    smooth();
  background(204,220,255);
  noStroke();
  //mountain
  triangle(0,100,0,400,400,400);
}

int x=0;
int y=0;
int speed=3;
  void draw() {
   snowboarder();
 }
void snowboarder(){
    if(mousePressed==true){
      background(204,220,255);
  frameRate(30);
  background(204,220,255);
  noStroke();
  //mountain
  triangle(0,100,0,400,400,400);
  //board
  strokeWeight(15);
  stroke(0);
  line(x,y+100,x+66,y+150);
  //body
  strokeWeight(8);
  line(x+20,y+80,x+76,y+120);
  line(x+48,y+100,x+0,y+100);
  line(x+48,y+100,x+66,y+150);
  //head
  strokeWeight(4);
  ellipseMode(CENTER);
  ellipse(x+68,y+80,40,40);
   x=x+speed;
   y=y+speed;
if (x>=400){
x=0;
}
if(y>400){
  y=0;
}
    }
    else
    {
  background(204,220,255);
  frameRate(30);
  background(204,220,255);
  noStroke();
  //mountain
  triangle(0,100,0,400,400,400);
  //board
  strokeWeight(15);
  stroke(0);
  line(x,y+100,x+66,y+100);
  //body
  strokeWeight(8);
  line(x+8,y+60,x+52,y+60);
  line(x+30,y+60,x+6,y+90);
  line(x+30,y+60,x+56,y+90);
  //head
  strokeWeight(4);
  ellipseMode(CENTER);
 ellipse(x+30,y+32,40,40);
    }
    
    
    
    
    }

