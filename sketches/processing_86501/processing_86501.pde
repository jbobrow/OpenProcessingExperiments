
//moving objects

int x1=0;
int x2=600;
int x3=600;
int x4=0;
int d = 100;

color c1 = color(random(255), random(255), random(255), 70);
color c2 = color(random(255), random(255), random(255), 70);
color c3 = color(random(255), random(255), random(255), 70);
color c4 = color(random(255), random(255), random(255), 70);

//if you want to do something only once, do it in setup
void setup() {
    size(600,200);
    noStroke();

 }
 

void draw() {
    background(255);
    
    fill(c1);
    ellipse(x1, height*1/5, d, d);
    x1++
    
    fill (c2);
    ellipse(x2, height*2/5, d, d);
    x2 -=2 //move faster
    
    fill(c3);
    ellipse(x3, height*3/5, d, d);
    x3--
    
    fill(c4);
    ellipse(x4, height*4/5, d, d);
    x4+=2;
}
