
//Y.Okamoto 20140212
//impact on the others


//Define Color Palette
color[] mcz = {#FF6A92, #CA6AFF, #6AFF86, #FFFF6A, #FF716A, #FFFFFF};
color[] palette = mcz;
float counter = 0;


//Create setup code block
void setup(){
 //maximum window size for this assignment
 size(1280, 720);
 //select the first color from the selected palette
 background(#000000);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 8000
 while(counter <300 ){
   //Set stroke color to random palette color
   stroke(palette[int(random(0, 6))]);
   //Set stroke weight randomly
   strokeWeight(int(random(1, 2)));
   //Set fill color randomly from palette
   fill(palette[int(random(0, 6))]);
   //set ellipse origin location x to random of screen width
   float x = random(width);
   //set ellipse origin location x to random of screen height    
   float y = random(height);
   //set ellipse height and width randomly
   float d = random(0, 10);
   
   //draw ellipse 

   //line(x, y, d, d);


noFill();
bezier(x, y, d, 5, 80, 75, 10, 75);
ellipse(x, y, d, d);


   //change limiter count randomly between -1 and +2
   counter += random(-1, +2);
 }
}
