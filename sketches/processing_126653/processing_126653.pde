
float i = 0;
float a = 1; // A variable para separacion del eje x, entre mas aumenta mas se separa
float h = 6; // H variable para separacion del eje Y, entre mas aumenta mas se separa

void setup() {
size(600,600);
frameRate(300);
smooth();
}


void draw() {
  

translate(width/2,height/2);
rotate(i); 

//fill(random(255),random(255),random(255));
//noFill();
//stroke(random(255),random(255),random(255));
stroke(68);
rectMode(CENTER);
rect(0 + i*a,0 + i*h, 20, 30);
i += 0.01;


}
