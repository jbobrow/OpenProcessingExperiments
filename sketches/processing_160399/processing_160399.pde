
//I made Snowflake Background. If you edit code, you can use it as wallpaper also. I will add animation fuction, dropping snowflake from the bottom in the future.
void setup() {
  size(800, 500, P2D); // will also work in P3D and OPENGL. Will not work in JAVA2D (default renderer).
  noStroke();
}

//Gradation Background
color color1 = color(221, 215, 222);
color color2 = color(177, 197, 204);

//Define Color Palette
color[] snow = {#ffffff, #f8f9f9, #f7faf9, #f6fbf9, #f6fcfa, #f5fcfa, #f5fdfa, #f4fdfa, #f4fefa, #f3fefa, #f3fffb, #f2fffb};
color[] palette = snow;

//Draw 
void draw() {
  //background
  background(0);
  gradientRect(0, 0, 900, 900, color1, color2); //background
  //Snowflake
  randomSeed(0);
  for (int i = 1; i < width + 50; i+= 15){
    int w = int(random(0, 800));
    float s = random(0.1, 1.2);
    makeSnowflake(i, w, s);}
  //text
  textSize(20);
  fill(255, 255, 255); 
  text("Snowflake | Sujin Lee", 520, 440);
  textSize(15);
  text("20140914", 650, 460);
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
  
 
 
 




