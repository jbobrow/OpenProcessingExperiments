
float a;
float b;
float c;
float d;
 
float x;
float y;
 
void setup(){
size(100, 1000);
background(25,120,0);
translate(58, 48, 0);
 
noFill();
rect(50,50,50,50);
}
void draw() {
    a=random(255);
    b=random(255);
    c=random(255);
    d=random(255);
 
    x= random(255);
    y= random(255);
     
     
    noStroke();
    fill(b,c);
    ellipse(a,b,c,d);
  }

