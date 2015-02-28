
/* Daniela Gill 
Bootcamp 08-18-11
Final - Dynamic Pointillism, Large ellipses
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
  size(650, 440, P3D);
  background(#99CCFF);
  
  //image
  img = loadImage("frame1.png");
   
  // creating the Minim object 
  minim = new Minim(this);                        
  // loading the MP3 // setting a buffersize
  mysound = minim.loadFile("drei-equali.mp3", 512);        
  meta = mysound.getMetaData();
  mysound.loop();            
          
  //so that you see printed the name of the song and singer    
    println("drei-equali.mp3e: " + meta.fileName());
    println("Length (in milliseconds): " + meta.length());
    println("Classic: " + meta.title());
    println("Beethoven: " + meta.author());
    println("mysound.bufferSize");
    }

    void draw() {
 //sound
    int Add = 0;
    
    for(int i = 0; i < mysound.bufferSize() - 1; i++)          
  {
    float left = 0;
    left = mysound.left.get(i);
    left = map(left,-1,1,0,200);
    float right = 0;
    float center = 0;
    right = mysound.right.get(i);
    right = map(right,-20,1,20,200);
    Add++;
     stroke(100, 100, 200, 60);
    right = center+Add;
   
   //elipses 1 
    fill(#9900FF);
    ellipse(left-40,right,100,120);
    
    //elipses 1 
    fill(#9900FF);
    ellipse(left-10,right,100,120);
   
   //elipses 2 
    fill(#9966FF);
    ellipse(left+100,right,120,120);
    
    //elipses 3
    fill(#9999FF);
    ellipse(left+200,right,100,100);
    
    //elipses 4
    fill(#CC99FF);
    ellipse(left+300,right,100,100);
    
    //elipses5 
    fill(#CCCCFF);
    ellipse(left+400,right,100,120);
    
    //elipses6 
    fill(#99CCFF);
    ellipse(left+460,right,100,120);
  }
     
    

stroke(100,mysound.right.get(i)*50,300);  

    image(img,0,0);

    }



