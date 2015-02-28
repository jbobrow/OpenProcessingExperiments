
void setup(){
  size(350,250);
  background(0xEE);
  frameRate(24);
}
void draw(){
  textFont(createFont("",50));
  fill(0x00, 10);
  text("I would like to\nslowly\nyou.",0,50);
  filter(BLUR, 1);
} 


