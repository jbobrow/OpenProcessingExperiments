
void setup() {
    size(300, 300);
}

void draw() {
    background(0);
    for (int popo = 0; popo < 36; popo++) {
    
        rect((popo%6)*50, (int(popo/6))*50,50 ,50);
    }

}
