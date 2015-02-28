
/* Daniela Gill 
Bootcamp 08-18-11
Final - Dynamic Pointillism, Squares
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
  background(#FF9900);
  
 //image
  img = loadImage("frame3.png");
  
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
//      fill(100,70,300);
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
     stroke(10, 10, 200, 20);
    right = right+Add; 
 
fill(#FF9900);
    rect(right-100,left,10,10);
    
fill(#FF99FF);
    rect(right-200,left,10,10);
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
     stroke(10, 10, 200, 20);
    right = right+Add;
 
fill(#66FFCC);
    rect(right-100,left,10,10);
    
fill(#FFFF66);
    rect(right-200,left,10,10);
  }
     
stroke(10,mysound.left.get(i)*50,300);

image(img,0,0);


    }



