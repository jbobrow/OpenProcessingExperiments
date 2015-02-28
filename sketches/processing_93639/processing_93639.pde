
void setup() {
  size(500, 200);
  textFont(createFont("arial",9));
}
 
void draw(){
  
  int s = second();
  int h = hour();
   
  fill(255);
  rect(0, 0, 800, 400);
   
COLORS( s + 30, s);
COLORS( s,  s - 6);
COLORS( s + 50,  s);
COLORS( s + 94, 33);
COLORS( s,  s + 70);
COLORS( s - 50,  s);
COLORS( s - 94,  33);
COLORS( s - 55,  80);
COLORS( s + 100,  100);
COLORS( s + 100,  100);
COLORS( s - 100,  100);
COLORS( s- 200,  300 + s);
COLORS( s- 300, 200 + s);
COLORS( s - 180, 100 - s);
COLORS( s - 90,  100 + s);

  String t = "COLOR SCHEME FOR SPRING 2013";
  float tw = textWidth(t);
  fill(0);
  text(t, 100, 150);

}
 
 void COLORS(int x, int y){
  noStroke();
  fill  (255, 183, 101); 
 ellipse  (x + 7, y + 10, 7, 7);
  fill  (23, 40, 66);
 ellipse (x + 99, y + 100, 7, 7);
  fill (146, 57, 75);
 ellipse (x + 115, y + 25, 7, 7);
  fill (219, 194, 200);
 ellipse (x + 66, y + 10, 7, 7);
  fill  (184, 42, 79);
 ellipse (x + 40, y + 60, 7, 7);
  fill  (210, 182, 47);
 ellipse (x + 50, y + 190, 7, 7);
  fill (165, 165, 165);
 ellipse (x + 10, y + 40, 7, 7);
   fill (175, 77, 52);
 ellipse (x + 60, y + 80, 7, 7);
    fill (25, 83, 95);
 ellipse (x + 175, y + 60, 7, 7);
     fill (237, 52, 49);
 ellipse (x + 20, y + 150, 7, 7);
 
}
