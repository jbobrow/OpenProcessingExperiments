
void setup(){
size(200,200);
background(0);
colorMode(HSB,
width);
}


int x=0;
void
draw(){
  
fill(x,width,width);
ellipse(x,40,40,40);
x++;
quad(180-x,90,200-x,90,210-x,140,170-x,140);


fill(0);
arc(x, 40, 40, 40, TWO_PI-PI/6,7);

fill(62,1,96);
ellipse(x,32,10,10);
ellipse(-20,40,x,x);
fill(1);
ellipse(x+2,32,4,4);

fill(62,1,96);
ellipse(184-x,100,10,10);
ellipse(196-x,100,10,10);
fill(1);
ellipse(184-x,98,4,4);
ellipse(196-x,98,4,4);

}


