
float r;
float T=60;
float w;
float w_vel;
float posx;
float posy;
int x;
float theta;

void setup(){  
size(400,400);
w=2*PI;
w_vel=2*PI*1/T;
r=height*0.25;


}

void draw(){
background(0);
stroke(255);
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);

translate(width/2, height/2);
for(theta=0;theta<=2*PI;theta+=w_vel)
{point(r*cos(theta),r*sin(theta));}
stroke(255);
update();
mover();
display();


}

void display(){
fill(200);
ellipse(posx,posy,20,20);

}

void mover(){
w+=w_vel;
}

void update(){
 posx=r*cos(w);
posy=r*sin(w);

}



