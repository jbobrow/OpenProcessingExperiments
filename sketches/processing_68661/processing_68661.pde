
float incremento1=0.0;

void setup(){
size (400,400);
smooth();
background(0);
}
void draw(){

 fill(255,0,0);
 arc(200,200,250,250,0,incremento1);
 incremento1+=0.01;

fill(0,255,0);
arc(90,320,50,50,0,incremento1);
 incremento1+=0.01;
 
 fill(10,24,148);
arc(310,320,50,50,0,incremento1);
 incremento1+=0.01;

}



