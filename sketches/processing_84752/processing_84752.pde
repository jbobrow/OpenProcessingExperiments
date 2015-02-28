
color c;
String Text;

void setup() {
  size(400, 200);
  textSize(48);
  textLeading(34);
  background(0);
  colorMode(HSB, 100);
  c= color(random(100), 80, 80);
  Text= new String();
}
void draw() {
  if (keyPressed) { 
    // FOR JS
    Text += new String(key);
    // FOR JAVA
    //   Text+=key;
    text(key, 20, 10, 360, 350);
  }
  fill(c, 20);
  rect(-1, -1, width+1, height+1);
  fill(0);
  Text = Text.substring(max(0, Text.length()-60));
  text(Text, 20, 10, 360, 350);
}



