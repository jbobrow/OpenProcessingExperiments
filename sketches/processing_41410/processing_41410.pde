
PFont font;
 
void setup (){
  
 size(400,400);
 background(2532,164,80);
 smooth();
 noStroke();
 fill(0);
   
}
 
void draw(){
    font = loadFont("BauerBodoni-Bold-20.vlw");
    textFont(font);

      text ("Maddy", mouseX, mouseY);

}
 
void mousePressed() {
  
 fill(int(random(0, 255)));
}




