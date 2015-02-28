
int x = 20, y = 20;
int dx = 0, dy = 0;

void setup(){

}

void draw(){
    dx = 0;
    dy = 0;
    background(0,0,0);
    size(300,200);
    rect(50,0, 25, 300);
    if(keyPressed){
        fill(255,0,0);
        if(key == 'd' && x < 40){
            dx = 1;
        } else if(key == 'a' && x > 10) {
            dx = -1;
        } else if (key == 'w' && y > 10) {
            dy = -1;
        } else if (key == 's' && y < 190) {
            dy = 1;
        }
    }
    else{
        fill(0,255,0);
    }
    x = x + dx;
    y = y + dy;
    ellipse(x,y,20,20);
}
