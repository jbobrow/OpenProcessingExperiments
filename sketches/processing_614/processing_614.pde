
PImage feed;

void setup() {
	size(screen.width/2,screen.height/2,P3D);
	feed = new PImage(width-20,height-20);
	colorMode(HSB);
}

void draw() {
    noStroke();
    fill(color(random(256),255,255,32));
    image(feed,0,0,width,height);
    ellipse(mouseX+random(-10,10),mouseY+random(-10,10),20+random(20),20+random(20));
    feed = g.get(10,10,width-20,height-20);
}


