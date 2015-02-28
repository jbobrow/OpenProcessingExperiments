
int x = 0;
int speed = 4;

void setup(){
size(600,600);
smooth();

}

void draw(){
 background(255);
mover();
rebotar();
display();
}

void mover(){
  x = x + speed;
}

void rebotar(){
if ((x > width) || (x <0)){
speed=speed * - 1;
}
}

void display(){
noStroke();
fill(0);
ellipse(x,300,320,320);
ellipse(x-100,150,150,150);
ellipse(x+100,150,150,150);
fill(255);
ellipse(x-75,250,100,mouseY);
ellipse(x+75,250,100,40);
fill(0);
ellipse(x-75,250,20,20);
ellipse(x+75,250,20,20);
fill(255);
ellipse(x,320,50,50);

strokeWeight(5);
stroke(255);
line(x-150,400,x+150,400);

}
