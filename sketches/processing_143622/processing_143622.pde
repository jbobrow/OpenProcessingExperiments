
/*@pjs font="http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf"*/
int counter;
String place;
Window g;
PFont mono;

void setup() {  //setup function called initially, only once
  size(600, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  rectMode(CORNER);
  mono = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf", 12, true);
  g = new Window("Test").bg = [1, 2, 3];
}

void draw() {  //draw function loops 
  fill(127, 127, 200);
  stroke(0);
  background(255);
  button("Hello", "?", 5, 200);
}

void button(String txt, String action, int x, int y) {
    int wide = (width/4)-4;
    int high = (height/18)-4;
    rect(x, y, wide, high);
    if(mouseX >= x && mouseX <= x+wide && mouseY >= y && mouseY <= y+high) {
        fill(255);
    } else {
        fill(0);
    }
    text(txt, x+2, y+4*high/5);
}

class Window {
  int top = 0;
  int left = 0;
  boolean fullscreen = true;
  int[] bg = new int[3];
  int[] fill = new int[3];
  int[] stroke = new int[3];
  String place = "";
  int width = width;
  int height = height;
  boolean disabled = false;
  String title = "New Window";
  
  Window(String title) {
    this.title = title;
    return this;
  }
  
}
