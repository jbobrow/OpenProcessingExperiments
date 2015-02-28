
float speed = 5;
float y = 200;
void setup () {
size (400, 400);
smooth();
}
void draw () {

background (30,154,232);

strokeWeight (10);
stroke(120-y,9+y,250+y);

for (int i =1; i <5; i++) {line (width/2, height/2, y, y);
}

y = y+speed;
;

if ((y>width-50) || (y<50)) {
speed = speed *-1;
}
}
