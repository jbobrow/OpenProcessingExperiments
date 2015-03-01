
/* @pjs preload="luckycharms.jpg, sock.jpg"; font = "ProstoOne-Regular.ttf"; */

PImage luckycharms;
PImage sock;
luckycharms = loadImage("luckycharms.jpg");
sock = loadImage("sock.jpg");
prosto = createFont("ProstoOne-Regular.ttf");
textFont(prosto, 25);

background(255, 255, 255);

size(400, 400);


image(luckycharms, 120, 110, 161, 226);
image(sock, 150, 0, 100, 100);

fill(0, 0, 0);
text("Cereal Souvenir Sock!", 50, 380);

fill (0, 0, 255);
rect(0, 0, 55, 55);

fill (0, 0, 255);
rect(345, 0, 55, 55);




