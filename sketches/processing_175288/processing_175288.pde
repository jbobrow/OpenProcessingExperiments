
void setup(){
size(500,500);
}
var y = 0;

var speed = 15;

void draw () {
    background(127, 204, 255);
    
    fill(66, 66, 66);
    ellipse(200, y, 50, 50);
    if (y>400) {
        speed= -10;
    }
    if (y<0) {
        speed= +10;
    }
    // move the ball
    y = y + speed;
};



