
// Processing Demo

int[] Cx = new int[20];
int[] Cy = new int[20];

int active_circle = -1;
boolean locked = false;
int xOffset;
int yOffset;

void setup() {
    size(640, 480);
    background(255);
    stroke(0);
    for (int i=0; i<20; i++) {
        Cx[i] = -1;
    }
    Cx[0] = 100;
    Cy[0] = 100;
    Cx[1] = 200;
    Cy[1] = 200;
    Cx[2] = 300;
    Cy[2] = 300;
}

void draw() {
    background(255);
        if (!locked) {
                activeCircle();
        }
        fill(0, 0, 255);
    for (int i=0; i<20; i++) {
        if (Cx[i] >= 0 && active_circle != i) {
                        ellipse(Cx[i], Cy[i], 50, 50);
        }
    }
        if (active_circle > -1) {
                fill(255, 0, 0);
                ellipse(Cx[active_circle], Cy[active_circle], 50, 50); 
        }
}

void mousePressed() {
        activeCircle();
    if (active_circle > -1) {
        locked = true;
        xOffset = mouseX - Cx[active_circle];
        yOffset = mouseY - Cy[active_circle];
    } else {
        locked = false;
                active_circle = -1;
    }
}

void mouseDragged() {
    if (locked) {
        Cx[active_circle] = mouseX - xOffset;
        Cy[active_circle] = mouseY - yOffset;
    }
}

void mouseReleased() {
    locked = false;
}

void activeCircle() {
    active_circle = -1;
    for (int i = 0; i < 20; i++) {
        if (Cx[i] > -1 && pow(Cx[i]-mouseX,2) + pow(Cy[i]-mouseY,2) < 625) {
            active_circle = i;
                        break;
        }
    }
}
