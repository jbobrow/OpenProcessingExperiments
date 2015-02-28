
//PImage online;

void setup() {
  size(380, 380);
  background(255);
  //fill(128);
  //String url = "http://osaa.dk/wiki/images/OSAA_LOGO.png";
  //online = loadImage(url);
  noLoop(); 
}

void draw() {
  //background(online);
  fill(0, 255, 0);
  beginShape();
    vertex(187,128);
    vertex(180,93);
    vertex(195,78);
    vertex(189,45);
    vertex(168,39);
    vertex(161,10);
    vertex(316,59);
    vertex(297,77);
    vertex(277,71);
    vertex(252,94);
    vertex(256,114);
    vertex(227,140);
  endShape(CLOSE);
}

