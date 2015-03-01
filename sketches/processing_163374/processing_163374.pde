
// Click on the image to give it focus,
// and then press any key.

int value = 0;

void setup() {
size(500,500);
background(255);
}

void draw() {
    fill(255,100,50)
    rect(50,50,100,100);
    }

void (keyPressed == true) {
    if (value==0) {
    value = 255;
    } else{
    value = 0;
    }
}
