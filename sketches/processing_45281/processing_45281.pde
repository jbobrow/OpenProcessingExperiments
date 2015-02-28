
//asteroidal influx
//Sergi Calavia
float vy = 10;
float vx = 1;
float x = 100;
float y = 200;
float frictiony = -.6;
float frictionx = .998;
float gravity = .04;
float mili, seconds;
float ellipse;


void setup(){
size(800,600);
background(0,0,255);
smooth();
strokeWeight(30);
fill(250,238,0);
stroke(255,0,0,63);
ellipse(650,530,750,800);
}
void draw(){
smooth();
mili = millis(); 
seconds = mili/100; 


vy += gravity; 
vx *= frictionx; 
x += vx;

if(y > width){
y = height;
vy *=frictiony; 
}
if(x>width){
x=width;
vx *=frictionx;
}
strokeWeight(30);
fill(250,238,0);
stroke(255,0,0,63);

ellipse(x,y,70,70);
ellipse(x,y,60,60);
ellipse(x,y,50,50);


ellipse(420,500,seconds*2,seconds*2);
ellipse(400,320,seconds,seconds);
ellipse(600,240,seconds*3,seconds*3);


}

void mousePressed(){
vx -=2;

ellipse(x,y,200,200);

}

