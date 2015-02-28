
// TWO SENTENCE ARTISTIC STATEMENT

//Define Color Palette
color[] rainyday = {#31414D, #4A9AD4, #84AECC, #1B374D, #638299};
color[] palette = rainyday;
float counter = 0;

//Create setup code block
void setup(){
 //maximum window size for this assignment
 size(1280, 720);
 //select the first color from the selected palette
 background(palette[0]);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 8000
 while(counter < 8000){
   //Set stroke color to random palette color
   stroke(palette[int(random(1, 5))]);
   //Set stroke weight randomly
   strokeWeight(int(random(1, 10)));
   //Set fill color randomly from palette
   fill(palette[int(random(1, 5))]);
   //set ellipse origin location x to random of screen width
   float x = random(width);
   //set ellipse origin location x to random of screen height    
   float y = random(height);
   //set ellipse height and width randomly
   float d = random(10, 80);
   //draw ellipse 
   ellipse(x, y, d, d);
   //change limiter count randomly between -1 and +2
   counter += random(-1, +2);
 }
}
