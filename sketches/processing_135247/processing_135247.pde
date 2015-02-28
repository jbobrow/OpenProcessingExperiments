
int post_x=200;
int post_y=0;
int perro =100;

float vel=0;
void setup(){
size(600,600);
background(0);
smooth();
}
void draw(){
noStroke();
fill(255);
ellipse(post_x,post_y-vel,perro,perro);
vel++;
}
void mousePressed(){
fill(0,10,255);
ellipse(mouseX,mouseY,perro,perro);

}
