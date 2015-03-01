
/*@pjs preload="https://i.imgur.com/XbEGARI.jpg";*/
PImage myImage, myImage2;

void setup() {
    size(300, 227);
    background(255);
    myImage = loadImage("https://www.i.imgur.com/XbEGARI.jpg");
    fill(0);
}

void draw() {
    background(255);
    text(frameCount, 10, 10);
    if (frameCount < 60) return;
    
    myImage2 = myImage;
    myImage2 = myImage2.copy();
    
    int halfImage = width*height/2;

    image(myImage2, 0, 0);


    loadPixels();
    // Nothing after this works

    for (int i = 0; i < halfImage; i++) {
        pixels[i+halfImage] = pixels[i];
    }

    updatePixels();
}
