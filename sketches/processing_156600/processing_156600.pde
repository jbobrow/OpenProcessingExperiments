


color ourColor;
int r, g, b;
int changeAmountR = 10;
int changeAmountG = 10;
int changeAmountB = 10;

void setup() {
    size(600, 600);
}
void draw() {
    ourColor = color(r, g, b);
    background(ourColor);

    if ((r > 255) || (r < 0)) {
        changeAmountR *= -1;
        println("Red is changing by " + changeAmountR);
    }

    if (g > 255 || g < 0) {
        changeAmountG *= -1;
        println("Green is changing by " + changeAmountG);
    }
    if (b > 255 || b < 0) {
        changeAmountB *= -1;
        println("Blue is changing by " + changeAmountB);
    }
}

void keyPressed() {
    switch (key) {
    case 'r' :
        println("r " + r);
        r += changeAmountR;
        break;
    case 'g' :
        println("g " + g);
        g += changeAmountG;
        break;
    case 'b' :     
        println("b " + b);
        b += changeAmountB;
        break;
    }
}

