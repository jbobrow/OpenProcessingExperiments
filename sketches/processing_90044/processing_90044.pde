
void setup () {
size (600, 600);
frameRate(20);
}
void draw () {
 background(0);
 text(str(hour()) + " " + str(minute()) + " " + str(second()), mouseX-20, mouseY);
 if (mousePressed && (mouseButton == LEFT)){ fill(255,0, 0); } else {
 fill(0, 255,0);
 for (int i=0; i <= 64; i++){ text(i%2, random(600),  random(600)); }}
}
