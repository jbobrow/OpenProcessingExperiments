
//Interactive Snowflake 
void setup() {
  //set window size
  size(800, 500, P2D); // will also work in P3D and OPENGL. Will not work in JAVA2D (default renderer).
  
  //styling
  noStroke();
  smooth();
  
  //start in center
  mouseX = width/2; mouseY = height/2;
  
}
 
//Gradation Background
color color1 = color(221, 215, 222);
color color2 = color(177, 197, 204);
 
//Define Color Palette
color[] snow = {#ffffff, #f3fefa, #f3f7fe, #fef3f7, #fefaf3, #fdfef3, #bdc4c7, #f4fdfa, #f4fefa, #f3fefa, #f3fffb, #f2fffb};
color[] palette = snow;
 
//Draw
void draw() {
  //background
  background(0);
  gradientRect(0, 0, 1280, 720, color1, color2); //background
  //Snowflake
  for (int i = 1; i < width + 50; i+= 15){
    int w = int(random(0, 30));
    float s = random(0.1, 2.5);
    makeSnowflake(mouseX, mouseY, s);}
  //text
  textSize(20);
  fill(255, 255, 255); 
  text("Snow flake | Sujin Lee", 520, 440);
  textSize(15);
  text("20140921", 650, 460);
  //save a TIFF file named "snowflake"/
  save("snowflake.tif");
 
 
   
}
 
//Draw Gradient Background
void gradientRect(int x, int y, int w, int h, color c1, color c2) {
  beginShape();
  fill(c1);
  vertex(x,y);
  vertex(x,y+h);
  fill(c2);
  vertex(x+w,y+h);
  vertex(x+w,y);
  endShape();
}
 
//Make Snowflake Function
void makeSnowflake(int x, int y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  strokeCap(ROUND);
  stroke(palette[int(random(1, 12))]);
  strokeWeight(7);
  for (int i = 0; i < 6  ; i += 1){
      rotate(PI*0.33);
      line(0, 0, 0, 47);
      line(0, 32, -15, 42);
      line(0, 32, 15, 42);
  }
  popMatrix();
} 
  

