
byte unaVariable;

void setup() {

size(400,400);

unaVariable= 10;

}


void draw() {

background(0);

ellipse(200,200,unaVariable,unaVariable);

unaVariable += 1;

}
