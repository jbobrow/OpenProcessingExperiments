
void setup() {
size(700, 700);

}

//void draw() {
//translate(0.5*width, 0.5*height);
//beginShape(TRIANGLES);
//vertex(-10, 20);
//vertex(10, 20);
//vertex(0, 40);
//vertex(-10, -20);
//vertex(10, -20);
//vertex(0, -40);
//endShape();
//}

void draw(){
for(i=0; i<10; i++){
beginShape(TRIANGLES);
vertex(-10*i, 20*i);
vertex(10*i, 20*i);
vertex(0, 40*i);
vertex(-10*i, -20*i);
vertex(10*i, -20*i);
vertex(0*i, -40*i);
endShape();
}}
