
//frameRate is for slowly changing colors
void setup(){
size(200,200);
frameRate(2);
}

//random colors
void draw() {
background (random(256), random(256), random(256));
}
