
ArrayList<PImage> images = new ArrayList<PImage>();
String[] files = { "sunset.jpg", "tunnel.png"};
int pointer = 0;
DialFace steadyClock, jitterClock, tinyClock;

void setup() {
    for (String file : files) {
        images.add( loadImage(file) );
    }
    size(500, 333);
    // in desktop version, the following line would be the one to use
//    size(images.get(0).width, images.get(0).height);
    steadyClock = new DialFace(200, 200, width/3*2, height/3*2, 0);
    jitterClock = new DialFace(150, 150, 150, 200, 255);
    tinyClock = new DialFace(120, 120, 0, height/3, 255);
    strokeCap(ROUND);
    smooth();
    frameRate(15);
}

void draw() {
    image(images.get(pointer), 0, 0, width, height);
    steadyClock.update();
    jitterClock.move(int(random(4)-2), int(random(4)-2));
    tinyClock.move(1, 0);
    if ( tinyClock.getPos()[0] > width+tinyClock.getW()/2 ) {
      tinyClock.setPos(-tinyClock.getW()/2, tinyClock.getPos()[1]);
    }
}

void mouseClicked() {
    pointer = ( pointer == images.size()-1 ) ? 0 : pointer+1 ;
}

