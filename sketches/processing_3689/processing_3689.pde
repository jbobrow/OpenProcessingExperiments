

void setup(){background(0);size(400,400,P2D);}void draw(){fill((1+sin(float(millis())/2000))*123);ellipse(mouseX,mouseY,40,40);filter(DILATE);filter(BLUR);}

