
/* Daniela Gill 
Bootcamp 08-18-11
Final - Dynamic Pointillism, Ellipses + Squares
Concept: Pointillism interpreted through different types of music. 
*/

//image
PImage img;

//audio
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;


int i,j; 

void setup() {
  size(760, 200, P3D);
  background(255);
  
 //image
  img = loadImage("frame4.png");
  
//  smooth();
   
  // creating the Minim object 
  minim = new Minim(this);                        
  // loading the MP3 // setting a buffersize
  mysound = minim.loadFile("traffic.mp3", 512);        
  meta = mysound.getMetaData();
  mysound.loop();            
          
  //so that you see printed the name of the song and singer    
    println("traffic..mp3e: " + meta.fileName());
    println("Length (in milliseconds): " + meta.length());
    println("Remix: " + meta.title());
    println("shutups: " + meta.author());
    println("mysound.bufferSize");
    }

    void draw() {
    stroke(0);
      
    //sound
    int Add = 0;
    
  
 for(int i = 0; i < mysound.bufferSize() - 1; i++)         
  {
 
    float left = 0;
    left = mysound.left.get(i);
    left = map(left,-1,1,0,200);
    float right = 0;
    right = mysound.right.get(i);
    right = map(right,-1,1,20,200);
    Add++;
     stroke(10, 10, 255, 20);
    right = right+Add; 
 
fill(#CCCCFF);
    ellipse(right-100,left,10,10);
    
fill(#FF99CC);
    ellipse(right-200,left,10,10);
  }
     
stroke(10,mysound.left.get(i)*50,300);


//sound 3
for(int i = 0; i < mysound.bufferSize() - 1; i++)          
  {
 
    float left = 0;
    left = mysound.left.get(i);
    left = map(left,-1,1,0,200);
    float right = 0;
    right = mysound.right.get(i);
    right = map(right,-1,1,0,200);
    Add++;
     stroke(10, 10, 255, 20);
    right = right+Add;
 
fill(#FFFFCC);
    rect(right-100,left,10,10);
    
fill(#CCFFCC);
    rect(right-200,left,10,10);
  }
     
stroke(10,mysound.left.get(i)*50,300);

image(img,0,0);


    }



