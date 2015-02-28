
int counter;

void setup() {
    size(600,450);
    rectMode(CENTER);
    fill(0);
}

void draw() { 
    box(50, height/2, 12);
    background(255);
}

void box(int x, int y, int size){
int count = 0;
rect(x, y, size, size);

if  (count < 50)
    {
        box(x+(size/8),y,size+(random(20));
    }

}
