
/* @pjs preload="http://us.123rf.com/400wm/400/400/mkistryn/mkistryn1008/mkistryn100800072/7621124-tuscan-countryside-sovana-village-italy.jpg";
 */
void setup() {
  size(400, 400);
  PImage img;
  img = loadImage("http://us.123rf.com/400wm/400/400/mkistryn/mkistryn1008/mkistryn100800072/7621124-tuscan-countryside-sovana-village-italy.jpg");
  background(img);;
}
void draw() {
fill(157,0,90);
strokeWeight(1);
stroke(0,0,0);
rect(67,352,277,43);

strokeWeight(1);
stroke(0,0,0);
line(202,145,235,145);

fill(43,116,175);
strokeWeight(1);
stroke(0,0,0);
rect(154,145,104,207);

fill(255,255,255);
triangle(295, 145, 116, 145, 206, 54);

strokeWeight(20);
stroke(0,0,0);
line(102,14,201,114);

strokeWeight(20);
stroke(0,0,0);
line(294,9,202,101);

strokeWeight(20);
stroke(0,0,0);
line(308,193,215,100);

strokeWeight(20);
stroke(0,0,0);
line(215,114,123,206);

}

