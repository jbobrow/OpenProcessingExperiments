
/* Carvajal Santos Christian Uziel
	 Circulos PACMAN'S*/

float increm1=0.0;
float increm2=0.0;
float increm3=0.0;

void setup(){
size (300,300);  
noFill();
smooth();
background(255);

}
void draw(){
//background(255);
fill(255,0,0);
arc (100,130,60,60,0+increm1,(PI/4)+increm1);
increm1+=0.05;
fill(0,255,0);
arc (200,150,80,80,QUARTER_PI+increm2,PI+HALF_PI+increm2);
increm2+=0.02;
fill(0,0,255);
arc (150,50,90,90,QUARTER_PI+increm3,PI+HALF_PI+increm3);
increm3+=0.02;
//arc(50,50,80,80,PI/4,PI+HALF_PI);
}


