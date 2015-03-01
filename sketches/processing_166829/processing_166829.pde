
float i = 0.1;

void setup(){
size(500, 500, P3D);
background(0);
}

void draw(){
fill(0, 1, 0, 100, 1);
alpha(100);
translate(width/2, height/2);
rotateX(i);
rotateY(i);
rotateZ(i);
strokeWeight(10);
stroke(random(240, 250), 240, random(100),50);
box(200, 10, 100, 1);
i += 0.01;
}



