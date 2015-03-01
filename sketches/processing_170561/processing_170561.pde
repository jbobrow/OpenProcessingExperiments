
ifloat speedR, speedG, speedB;

void setup() { //runs once on start

size(600, 300);

speedR=random(.8,1.2);

speedG=random(.8,1.2);

speedB=random(.8,1.2);

}

void draw() { //Loop Continuously

background(#CCCCCC);

drawBalloon(#FF0000,0,speedR);

drawBalloon(#00FF00,100,speedG);

drawBalloon(#0000FF,200,speedB);

}

void drawBallon(color c, int yStart, float speed){ //runs when called

resetMatrix();

translate( yStart, (frameCount*speed*-1)+450);

if (frameCount*speed >= 600-90) { // stops loop for photo finish when winner finishes

noLoop();

}

fill(c);

ellipse(30, 60, 50, 50);

ellipse(80, 70, 30, 30);

}
