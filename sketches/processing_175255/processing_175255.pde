
int d=50;
int c=50;
int b=50;
int a=50;

void setup () {
  noStroke();
  size(400,400);
}
void draw () {
    if (mousePressed) {
    a=a+3;    
    b=b+8;
    c=c+6;
    d=d+4;
    }

    background(0,255,255);
    fill(255,0,0);
    rect(b-101,196,30,7);
    fill(255,0,0);
    rect(b-101,152,30,7);
    fill(255,0,0);
    rect(b-101,237,30,7);
    fill(255,0,0);
    rect(c-102,196,30,7);
    fill(255,0,0);
    rect(c-102,152,30,7);
    fill(255,0,0);
    rect(c-102,237,30,7);
    fill(255,0,0);
    rect(d-103,196,30,7);
    fill(255,0,0);
    rect(d-103,152,30,7);
    fill(255,0,0);
    rect(d-103,237,30,7);   
    fill(255,234,0);
    ellipse(a-100,199,35,35);
    fill(0,255,255);
    ellipse(a-100,199,20,20);    
    fill(255,234,0);
    ellipse(a-100,158,35,35);
    fill(0,255,255);
    ellipse(a-100,157,20,20);    
    fill(255,234,0);
    ellipse(a-100,240,35,35);
    fill(0,255,255);
    ellipse(a-100,240,20,20);    
    fill(13,255,0);
    rect(0,302,526,200);
}
