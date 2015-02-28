
// I wanted to use a variety of palettes and trails of shapes.
// I found the colours too dense so added transparency, to give a feeling of space,
//which also gives the illusion of depth. As some thicker strokes were overwhelming,
// I reduced the thickness of those strokes for the repeated circles.

//Define Color Palettes
color[] blues = {#7102FF, #2A05E8, #0722FF, #0459E8, #09A6FF};
color[] reds = {#FF470D, #E8260C, #FF0000, #E80C66, #FF05D2};
color[] yellows = {#FF9C06, #E8A402, #FFCE05, #E8D303, #F7FF01};
color[] greens = {#A2FF07, #41E803, #05FF16, #03E854, #00FFA3};
String[] palette = {"blues", "reds", "yellows", "greens"};

int r;
float counter = 0;
float x;

//Create setup code block
void setup(){
 size(1000, 700);
 //select the background palette randomly - didnt work
 //background((palette[int(random(4))])[int(random(5))]);
 background(blues[int(random(5))]);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 110
 while(counter < 110){
   //Set stroke weight randomly, using variable which can be measured later
   r = int(random(1, 7));
   strokeWeight(r);
   //Set stroke color randomly from yellow palette
   stroke(yellows[int(random(5))]);

   //Set fill color randomly from red palette
   fill(reds[int(random(5))]);
   //set ellipse origin location x to random of screen width
   float x = random(width);
   //set ellipse origin location y to random of screen height    
   float y = random(height);
   //set ellipse height and width randomly
   float d = random(5, 90);
   //draw ellipse 
   ellipse(x, y, d, d);
   // draw next ellipses, moving diagonally, random distance, not too close
   for (int i = 10; i < 65; i+= random(15, 30)) {
      //random red fill and transparency
      fill(reds[int(random(5))], 100);
      // reduce fat strokes
      if(r > 1){
        r-=2;
      }
      strokeWeight(r);
      ellipse(x+i, y+i, d, d);
   }
   // draw squares
   //Set stroke weight randomly
   strokeWeight(int(random(1, 5)));
   //Set stroke color to random green color and no fill
   stroke(greens[int(random(5))]);
   noFill();
   // make rects with random position, limit size to half canvas dimensions
   rect(random(width), random(height), random(width/2), random(height/2));
   //change limiter count randomly between -1 and +3
   counter += random(-1, +3);
 }
}


