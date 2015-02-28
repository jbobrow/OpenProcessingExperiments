

int a = 1;
int b = 900;

void setup(){
size(900,450);
background(0); 
smooth();

 
}


void draw(){   
noStroke();

fill(random(55,200),0,0,20);
rectMode(CENTER);
rect(a, 225, random(0,100),random(0,400));

fill(random(55,200),0,0,20);
rectMode(CENTER);
rect(b, 225, random(0,100),random(0,400));

a = a + 3;
b = b - 3;
}
