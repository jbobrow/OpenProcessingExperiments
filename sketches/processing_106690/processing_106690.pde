
int x = 20;
int y = 20;
int a = 1;
int b = 1;

void setup(){
    size(300,200);
    println("setup");
}

void draw(){
    background(255,255,255);
    if(x == 300 || x == 0){
        a = -a;
    }else {
    }
    if(y == 200 || y == 0){
        b = - b;
    }else {
    }
    x = x + a;
    y = y + b;
    fill(0,0,0);
    ellipse(x,y,10,10);
}
