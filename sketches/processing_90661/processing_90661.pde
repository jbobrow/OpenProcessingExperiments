
size(400, 400);
PImage img = loadImage("flag.jpg");
PImage img2 = loadImage("board.jpg");
PImage img3 = loadImage("balloon.jpg");
img.blend(img2, 12, 12, 380, 380, 12, 12, 380, 380, MULTIPLY);
img.blend(img3, 12, 12, 320, 320, 12, 12, 320, 320, OVERLAY);
image(img, 0, 0);


