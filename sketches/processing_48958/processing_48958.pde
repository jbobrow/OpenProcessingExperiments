
void mPress (Ball b) {
    b.si=1;
    b.xpos=mouseX;
    b.ypos=mouseY;
    float t=random(2*PI);
    b.xpeed=3*sin(t);
    b.ypeed=3*cos(t);
    b.c=color(random(360),50,100);
}

