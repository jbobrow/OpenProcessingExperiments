

int done = 0;

void setup() {
    size(500,500);
}

void draw() {
    if(done == 0) {
        line(random(width),random(height));
    }
    done=1;
}
