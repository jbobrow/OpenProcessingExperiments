
PFont coffee;
String sleep = "2 4 5";
 
void setup(){
  size(250,250);

  coffee = createFont("GillSans-Italic",60);
}
 
 
void draw(){
  background(random(100));
  stroke(250,90);
  fill (7,6,14);
  textFont(coffee,60);
    text(sleep,random(width),random(height));
  }



