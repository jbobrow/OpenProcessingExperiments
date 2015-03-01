
//Define Color Palette
color[] fantasy = {#000000, #12FF03, #0DA003, #075D01, #33F000 };
color[] palette = fantasy;
float counter = 0;

//Import 'Minin' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample Sound;
//Load audio file from HDD

//Create setup code block
void setup(){
 //maximum window size for this assignment
 size(1000, 500);
 
  minim = new Minim(this);
  Sound = minim.loadSample("Twilight.mp3");

 //select the first color from the selected palette
 background(palette[0]);
}

//Create the draw code block
void draw(){
 //Setup while loop counting up to 100
 while(counter < 100){
   //Set stroke color to random palette color
   stroke(palette[int(random(1, 4))]);
   //Set stroke weight randomly
   strokeWeight(int(random(1, 5)));
   //Set fill color randomly from palette
   fill(palette[int(random(1, 3))]);
   fill(palette[int(random(1, 2))]);
   //set line origin location x to random of screen width
   float x = random(width);
   //set line origin location x to random of screen height    
   float y = random(height);
   //set line height and width randomly
   float d = random(1, 4);
   //draw line 
   line(x, y, d, d);
   //change limiter count randomly between -1 and +2
   counter += random(-1, +2);
 }
  //set line origin location x to random of screen width
   float x = random(width);
   //set line origin location x to random of screen height    
   float y = random(height);
   //set line height and width randomly
   float d = random(5, 20);
   //draw line 
   line(x, y, d, d);
   //change limiter count randomly between -1 and +2
   counter += random(-1, +1);
}
//create a key trigger
void keyPressed() {
  if ( key == 'b' ) Sound.trigger();
   save("Fantasy.png");
    
}

