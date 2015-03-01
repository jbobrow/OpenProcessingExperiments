
PImage errImg;

void setup() {
    background(255);
    size(700,400);
    String url = "http://headwrong.co/IE_ErrorDialog.JPG";
    errImg = loadImage(url, "jpg");
}

void draw() {
    image(errImg, mouseX, mouseY, 183, 126);
}
