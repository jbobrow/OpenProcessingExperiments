
int up = 1;
int right = 2;
int down = 3;
int left = 4;
int tile = 32;
int x = 6 * tile;
int y = 5 * tile;
int dx = 0;
int dy = 0;
int lastX = x;
int lastY = ((y / tile) - 1) * tile;
int moveDirection = 0;
int destX = x / tile;
int destY = y / tile;
int mouseTileX = 0;
int mouseTileY = 0;
boolean hasClicked = false;
void setup() {
    size(400, 400);
}

void draw() {
x+= dx;
y+= dy;

mouseTileX = floor(mouseX / tile);
mouseTileY = floor(mouseY / tile);

if(moveDirection == up) {
    destX = (lastX / tile);
    destY = (lastY / tile) - 1;
} else

if(moveDirection == right) {
    destX = (lastX / tile) + 1;
    destY = (lastY / tile);
} else

if(moveDirection == down) {
    destX = (lastX / tile);
    destY = (lastY / tile) + 1;
} else

if(moveDirection == left) {
    destX = (lastX / tile) - 1;
    destY = (lastY / tile);
} else {
    destX = lastX / tile;
    destY = lastY / tile;
}


if(mousePressed) {
    if(!hasClicked) {
        hasClicked = true;
        //destX = mouseTileX;
        //destY = mouseTileY;
    }
}

if(x == destX * tile) {
        lastX = x;
    
}

if(y == destY * tile) {
        lastY = y;
    
}
lastX = 3;
lastY = 5;
setVelocityByTile(lastX, lastY);
background(0);

fill(0,0,255);
rect(destX * tile, destY * tile, tile, tile);
fill(100,100,100);
rect(lastX, lastX, tile, tile);
fill(0,255,0);
rect(mouseTileX * tile, mouseTileY * tile, tile, tile);
fill(255);

rect(x, y, tile, tile);
}

void setVelocityByTile(int tX, int tY) {
    int tileCenterX = (tX * tile) + tile / 2;
    int tileCenterY = (tY * tile) + tile / 2;
    int centerX = (x) + tile / 2;
    int centerY = (y) + tile / 2;
    
    if(centerX  < tileCenterX ) dx = 1;
    else if(centerX  > tileCenterX ) dx = -1;
    else if(centerY < tileCenterY ) dy = 1;
    else if(centerY > tileCenterY ) dy = -1;
    if(x == tX * tile) dx = 0;
    if(y == tY * tile) dy = 0;
}

void mouseReleased() {
    hasClicked = false;
}

void keyPressed() {
    if(keyCode == LEFT) {
        moveDirection = left;
    } else if(keyCode == RIGHT) {
        moveDirection = right;
    } else if(keyCode == UP) {
        moveDirection = up;
    } else if(keyCode == DOWN) {
        moveDirection = down;
    }
}

void keyReleased() {
    moveDirection = 0;
}
