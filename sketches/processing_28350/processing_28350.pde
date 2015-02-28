
int x = 30; 
float y = 0; 
int velocidad = 2; 
float velocidady = 0.1;
int B=30;
int H=30;

void setup() {
size(200,200);
}
void draw() {
background(0);
noStroke();
fill(255,0,0);
ellipse(x,y,B,H);
x = x + velocidad;
y = y + velocidady;
if((x > width) ||(x<10)&&(x>190)||(x<10)) {
velocidad=velocidad*-1;
H=50;
}
if((y>height)||(y<0)){
velocidady=velocidady*-0.25;
H=50;
}
H=constrain(H-2,30,64);

}

