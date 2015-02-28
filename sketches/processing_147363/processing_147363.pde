
int matrix = [];

void setup() {

    size(400,400);
    textAlign(CENTER,CENTER);
    
    for (int y = 0; y < 4; y++) {
        matrix[y] = [];
        for (int x = 0; x < 4; x++) {
            if (y == 3 && y == x) {
                matrix[y][x] = 0;
            } else {
                matrix[y][x] = y*4+x+1;
            }
        }
    }
    
}

void draw() {
    println(mouseX + ", " + mouseY);
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            fill(255,255,255);
            rect(x*width/4,y*height/4,(width/4)-1,(height/4)-1);
            if (matrix[y][x] != 0) {
                fill(0,0,0);
                text(matrix[y][x],x*width/4+width/8,y*height/4+height/8);
            }
        }
    }
    
}

void mousePressed() {
    
    int y,x;
    
    if (mouseY <= height/4) {
        y = 0;
    } else if (mouseY <= height/2) {
        y = 1;
    } else if (mouseY <= 3*height/4) {
        y = 2;
    } else {
        y = 3;
    }
    
    if (mouseX <= width/4) {
        x = 0;
    } else if (mouseX <= width/2) {
        x = 1;
    } else if (mouseX <= 3*width/4) {
        x = 2;
    } else {
        x = 3;
    }
    
    println(x + ", " + y);
    
    if (y > 0) {
        if (matrix[y-1][x] == 0) {
            matrix[y-1][x] = matrix[y][x];
            matrix[y][x] = 0;
            return;
        }
    }
    
    if (y < 4) {
        if (matrix[y+1][x] == 0) {
            matrix[y+1][x] = matrix[y][x];
            matrix[y][x] = 0;
            return;
        }
    }
    
    if (x > 0) {
        if (matrix[y][x-1] == 0) {
            matrix[y][x-1] = matrix[y][x];
            matrix[y][x] = 0;
            return;
        }
    }
    
    if (x < 4) {
        if (matrix[y][x+1] == 0) {
            matrix[y][x+1] = matrix[y][x];
            matrix[y][x] = 0;
            return;
        }
    }
    
}
