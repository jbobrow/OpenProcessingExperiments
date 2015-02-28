
//theme - the night sky
/*As the programer stays up late in the night, working away at her canvas so bright
twinkling stars start to line the sky, as the hours fly on by 
 taken to strings like warp speed. */
 
 //mouse input - move mouse over the canvas to see the stars flickering in the night sky
 //visual art with background of night sky included in image

//Globules from the paint can aka color palette for warp-speed lines
color[] palette = {#7C878D, #4D5154, #6A6E70, #E4E9EB, #F2F5F6};
//background image setup
PImage nightsky;

//setup
void setup() {
 size(900, 600);
//background image loading
nightsky = loadImage("IMG_1641.JPG");
   shininess(1.0);
}

 //get out the paint brush
 void draw() {
   image(nightsky, 0, 0, width, height);
//stars (drawn with a tiny x and an ellipse)
   float a = random(8);
   float b = random(0);
   float c = random(6);

while(a < 10){
   stroke(palette[int(random(0, 5))]);
   strokeWeight(int(random(.1, .01)));
   fill(palette[int(random(1, 5))]);
   float x = random(mouseX);  
   float y = random(mouseY);
   float d = random(1, 2);
   line(x, y, width/2 + 64, height/2 - 7 );
   ellipse(x, y, d, d);
   fill(#E6F700);
   textAlign(CENTER);
   smooth();
   textSize(8);
   text("x", x, y);
   a += random(-1, +2);
 }
}



