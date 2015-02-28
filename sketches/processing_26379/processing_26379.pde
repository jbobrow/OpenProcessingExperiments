
Wolf wolf, wolf2, wolf3;
PImage beast;


void setup(){
size(800,800);
wolf= new Wolf(width/2,100);
wolf2= new Wolf(width/2,200);
wolf3= new Wolf(width/2,300);
smooth();

beast = loadImage("beast.png");


}

void draw(){
background(0);
//image(beast,0,0,85,105);
wolf.display();
wolf.move();
wolf2.display();
wolf2.move();
wolf3.display();
wolf3.move();

}

class Wolf{
float vy,vx,x,y,friction,frictionX,gravity;

//constructor
Wolf(float xpos, float ypos){
x=xpos;
y=ypos;
vy=0;
vx=2;
friction = -.9;
frictionX = .998;
gravity = .1;

}

void display(){
image(beast,x,y,85,105);
}
void move(){
vy+=gravity;
vx *= frictionX;
x += vx;
y += vy;

if(y>height){
y=height;
vy *= friction;
}

if(x> width){
x=width;
vx *=friction;
}


//if (mousePressed=true){
  //y=(y-25);
 

//}

}
}


