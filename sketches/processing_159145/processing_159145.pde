
float a;
float b;
float c;
float d;

float x;
float y;

void setup(){
size(300, 300);
translate(58, 48, 0); 

noFill();
rect(40,20,30,50);
}
void draw() {
    a=random(255);
    b=random(255);
    c=random(255);
    d=random(255);

    x= random(width);
    y= random(height);
    
    
    stroke(2);
    fill(a,b,c,d);
    rect(a,b,c,d);
  }
      


