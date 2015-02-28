
/*
 * Movement, by Henrique Silva.
 * Move the rotating shape with mouse.
 * 
 
*/

int z=0;
float teta=0;
float teta_inc=0.02;
float x=-40;
float y=-100;

void setup() {
size(600,600);
background(0);
}

void draw() {

noStroke();
fill(0,5);
rect(0,0,width,height);

translate(mouseX,mouseY);
rotate(teta);

stroke(255);

beginShape(LINES);
vertex(0,0);
vertex(120,-40.0);
vertex(0,0);
vertex(100,70);
vertex(0,0);
vertex(-20.0,40.0);
vertex(0,0);
vertex(-150.0,-40.0);
vertex(0,0);
vertex(-40.0,-40.0);
endShape();

teta+=teta_inc;

}


