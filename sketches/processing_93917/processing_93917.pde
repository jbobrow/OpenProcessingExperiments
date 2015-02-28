
int a = (int) random (200,800);
int b = (int) random (200,800);
int c = (int) random (200,800);
int d = (int) random (200,800);
int e = (int) random (200,800);
int f = (int) random (200,800);
int g = (int) random (200,800);
PFont font;
void setup(){
   size (1300, 1300);
  font = createFont ("Arial", 50, true);
  background (0);
  fill(255);
  stroke(255);
 
 
  
}
void draw (){
  textSize (200);
  textAlign(CENTER, CENTER);
  text ("New", a, b);
  textSize (170);
  textAlign(CENTER, CENTER);
  text ("People", b, c);
  textSize (140);
  textAlign(CENTER, CENTER);
  text ("Jobs", c, d);
  textSize (110);
  textAlign(CENTER, CENTER);
  text ("America", d, e);
  textSize (80);
  textAlign(CENTER, CENTER);
  text ("Work", e, f);
  textSize (50);
  textAlign(CENTER, CENTER);
  text ("Government", f, g);
    textSize (20);
  textAlign(CENTER, CENTER);
  text ("Education", g, a);
  textSize(10);
  textAlign(LEFT, TOP);
  text ("by Mihir Khetarpal", 0, 0);
  
}

