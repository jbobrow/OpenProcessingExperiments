
int x = 20, y = 20;
int a = 1, b = 1;
int map_x = 500, map_y = 250;

void setup(){
    size(map_x,map_y);
    println("setup");
}

void draw(){
    background(255,255,255);
    if(mousePressed){
        x = mouseX;
        y = mouseY;
    }
    if(x == map_x || x == 0){
        a = -a;
    }
    if(y == map_y || y == 0){
        b = - b;
    }
    x = x + a;
    y = y + b;
    fill(0,0,0);
    ellipse(x,y,10,10);
}
