
float incremento1=0.0;

void setup(){
size(600,650);
noFill();
smooth();
}

void draw(){
background(0);
strokeWeight(3);
fill(255,0,0);
arc(200,200,300,300,0,QUARTER_PI+incremento1);
incremento1+=0.01;

fill(0,0,255);
arc(200,500,200,200,0,QUARTER_PI+incremento1);
incremento1+=0.01;

fill(0,255,0);
arc(450,380,100,100,0,QUARTER_PI+incremento1);
incremento1+=0.01;

}

