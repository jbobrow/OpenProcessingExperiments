
int x = 20, y = 20;
int dx = 0, dy = 0;

void draw(){
    dx = 0;
    dy = 0;
    background(0,0,0);
    if(keyPressed){
        fill(255,0,0);
        if(key == 'd'){
            dx = 1;
        } else if(key == 'a') {
            dx = -1;
        } else if (key == 'w') {
            dy = -1;
        } else if (key == 's') {
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
