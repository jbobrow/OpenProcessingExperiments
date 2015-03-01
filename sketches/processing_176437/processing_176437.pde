
//Import 'Minim' library files
import ddf.minim.*;

//Sketch's Global Variables
  
  //Audio
  
  // Each of these audio files are individual sounds 
  //Except for symphony which is a combination of each sound 
  //To create a natural soundscape.
  
Minim minim;
AudioPlayer introduction;
AudioSample dove;
AudioSample Canary;
AudioSample brook;
AudioSample Cardinal;
AudioSample Cicada;
AudioSample Geese;
AudioSample Whipperwhill;
AudioSample Crickets;
AudioSample forest;
AudioSample frogs;
AudioSample symphony;


  //PImage files
  
  // I used letters instead of file names to help with ease in my coding
  // Also my file names are all numbered instead of actual names
  // please see comment for that section
  
PImage bg;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage i;
PImage j;
PImage k;


  //Clock
  
  // The clock will be able to read the users computer's
  // current time (seconds, minutes and hours)
  
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;


//Setup Block

  //Arguments creating the Sketch size 
  //and background loading Image which was
  //created in GIMP
  
void setup() {
  size (1280, 720);
    bg = loadImage("SKY.JPG");
  background(bg);
  
    //Clock Setup
    
    // Creating the positioning of the clock
    // The length of the clock hands as well as the diameter of the clock 
 
  int radius = min(width, height) / 6;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 8;
  cy = height / 6;
  
    //Audio Setup
    
    // Creating the information for loading Audio files from the Data folder
    //When called in the Draw Block
  
  minim = new Minim(this);
  
    introduction = minim.loadFile("introduction.mp3");
    dove = minim.loadSample("dove.mp3");
    Canary = minim.loadSample("Canary.mp3");
    brook = minim.loadSample("brook.mp3");
    Cardinal = minim.loadSample("Cardinal.mp3");
    forest = minim.loadSample("forest.mp3");
    Cicada = minim.loadSample("Cicada.mp3");
    frogs = minim.loadSample("frogs.mp3");
    Whipperwhill = minim.loadSample("Whipperwhill.mp3");
    Crickets= minim.loadSample("Crickets.mp3");
    Geese= minim.loadSample("Geese.mp3");
    symphony= minim.loadSample("symphony.mp3");
    
    introduction.play();
}

//Draw Block

void draw(){
  
  bg = loadImage("SKY.JPG");
    background(bg);
  
   
  //Image keys
  
    // If statements are used for loading images
    // keypressed or keyreleaseed is not used as to allow image to stay indefinitely
    // on the screen until another key is used.
    //Numbers are used as file name to make it easier to exchange photos in data file
    //with out having to change information in processing code should I desire to use a different 
    //image in the programing sketch. Also each file number is associated with the key to be used.
    //except for "a" which loads all image files
    // All images were taken by me.
    
 
      

  if(key=='1'){
    a = loadImage("1.JPG");
    image(a,375,500);
    }
    
  if(key=='2'){
    b = loadImage("2.jpg");
    image(b,375,20);
    }
     
  if(key=='3'){
    c = loadImage("3.JPG");
    image(c,550,260);
     }
     
  if(key=='4'){
    d = loadImage("4.JPG");
    image(d,650,30);
     }
     
  if(key=='5'){
    e = loadImage("5.JPG");
    image(e,960,20);
    }
     
  if(key=='6'){
    f = loadImage("6.JPG");
    image(f,1075,460);
     }
     
   if(key=='7'){
    g = loadImage("7.JPG");
    image(g,700,500);
      }
  
  if(key=='8'){
    k = loadImage("8.JPG");
    image(k,935,250);
      }
      
  if(key=='9'){
    i = loadImage("9.jpg");
    image(i,10,480);
     }
  
  if(key=='0'){
    j = loadImage("0.JPG");
    image(j,275,200);
      }
      
   if(key=='a' || key=='A'){
     a = loadImage("1.JPG");
      image(a,410,500);
     b = loadImage("2.jpg");
      image(b,375,20);
     c = loadImage("3.JPG");
      image(c,550,260);
     d = loadImage("4.JPG");
      image(d,650,30);
     e = loadImage("5.JPG");
      image(e,960,20);
     f = loadImage("6.JPG");
      image(f,1075,460);
     g = loadImage("7.JPG");
      image(g,685,500);
     i = loadImage("9.jpg");
      image(i,40,480);
     j = loadImage("0.JPG");
      image(j,280,200);
     k = loadImage("8.JPG");
      image(k,935,250);
        }
    if (key==DELETE || key==RETURN) {
      bg = loadImage("SKY.JPG");
      }
      
  // Draw the clock
  
   // Drawing the ellipse for the clock
  
  noFill();
  stroke(#000003);
  strokeWeight(4);
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  
  stroke(#F6FF03);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  stroke(#FFFFFF);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute/second ticks with in the ellipse
  
  stroke(#FFFFFF);
  strokeWeight(4);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();

}

  //Audio key trigger
  
    //KeyRleased used so that sound does not become irritating if the buttons sticks
    //Each audio file key number lines up with an image file.
    //I choose only one stop all key so that as each key is triggered
    //the user can create their own soundscape if they desire.
    //Audio files are from my own collection either recorded by me
    //downloaded from soundbible.com a free sound source

 
void keyReleased() {
  
  if (key =='0') brook.trigger();
  
  if (key =='1') Crickets.trigger();
  
  if (key =='2') dove.trigger();
  
  if (key =='3') Geese.trigger();
  
  if (key =='4') forest.trigger();
  
  if (key =='5') Cicada.trigger();
  
  if (key =='6') Canary.trigger();
  
  if (key =='7') frogs.trigger();
  
  if (key =='8') Cardinal.trigger();
  
  if (key =='9') Whipperwhill.trigger();
  
  if (key == 'a' || key=='A') symphony.trigger();
  
    }
    
void keyPressed(){
  if (key=='*'|| key=='a'|| key=='A')  brook.stop();
  if (key=='*'|| key=='a'|| key=='A')  Crickets.stop();
  if (key=='*'|| key=='a'|| key=='A')  dove.stop(); 
  if (key=='*'|| key=='a'|| key=='A')  Geese.stop();
  if (key=='*'|| key=='a'|| key=='A')  forest.stop(); 
  if (key=='*'|| key=='a'|| key=='A')  Cicada.stop();
  if (key=='*'|| key=='a'|| key=='A')  Canary.stop(); 
  if (key=='*'|| key=='a'|| key=='A')  frogs.stop();
  if (key=='*'|| key=='a'|| key=='A')  Cardinal.stop(); 
  if (key=='*'|| key=='a'|| key=='A')  Whipperwhill.stop();
  if (key=='*')  symphony.stop();
  }

