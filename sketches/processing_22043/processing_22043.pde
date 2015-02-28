
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;
float xpos= 200;
float ypos= 600;


void setup()
{
  size(600, 600, P2D);
  minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile( "camaron de la isla - como el agua.mp3", 800);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop();                                // set it to loop
  
  println("File Name: " + meta.fileName());
  println("Length (in milliseconds): " + meta.length());
  println("Title: " + meta.title());
  println("Author: " + meta.author());
  
 
  
  
}

void draw()
{
 
   background(000);

//lines2();
lines(); 
ball();
//dance();




  
} 
//Additional visual but need to change "mysound = minim.loadFile" to 800. This is not working on open processing: could be the "800" vs 600x600 sizes???
void lines(){
 pushMatrix(); 
 translate(200, 300); // maybe it wasn't necessary to translate... just doing the rotation and setting the right size.
 
  rotate(.4);
   for(int i = 0; i < mysound.bufferSize() - 1; i++)         
  {
    stroke(5, random(100), 100);
   //line(i, 50 + mysound.left.get(i)*50, i+1, 50 + mysound.left.get(i+1)*50);
    //line(i, 150 + mysound.right.get(i)*50, i+1, 150 + mysound.right.get(i+1)*50);
    line( 50 +mysound.right.get(i)*50, i-350 ,  50 + mysound.right.get(i+1)*50, (i-350)+1);
   line( 100 +mysound.left.get(i)*50,i-400 ,  100 + mysound.left.get(i+1)*50, (i-400)+1);
    line( 150 +mysound.right.get(i)*50,i-450 ,  150 + mysound.right.get(i+1)*50, (i-450)+1);
   line( 200 +mysound.left.get(i)*50,i-450 ,  200 + mysound.left.get(i+1)*50, (i-450)+1);
    line( 250 +mysound.left.get(i)*50,i-450 ,  250 + mysound.left.get(i+1)*50, (i-450)+1);
   line( 300 +mysound.right.get(i)*50,i-400 ,  300 + mysound.right.get(i+1)*50, (i-400)+1);

  
 
  }
  popMatrix();
  
}
/*

void lines2(){
//"yuuuuuuuuuup" to early translation!!! prob not need
 //pushMatrix(); 
 //translate(0, 0); 
 //rotate(.4); 
   for(int i = 0; i < mysound.bufferSize() - 1; i++)         
  {
    stroke(5, random(100), 100);
   //line(i, 50 + mysound.left.get(i)*50, i+1, 50 + mysound.left.get(i+1)*50);
    //line(i, 150 + mysound.right.get(i)*50, i+1, 150 + mysound.right.get(i+1)*50);
    line( 50 +mysound.left.get(i)*50, i ,  50 + mysound.left.get(i+1)*50, (i+1));
   line( 100 +mysound.right.get(i)*50,i ,  100 + mysound.right.get(i+1)*50, (i+1));
      line( 150 +mysound.left.get(i)*50, i , 150 + mysound.left.get(i+1)*50, (i+1));
   line( 200 +mysound.right.get(i)*50,i ,  200 + mysound.right.get(i+1)*50, (i+1));
       line( 250 +mysound.right.get(i)*50, i ,  250 + mysound.right.get(i+1)*50, (i+1));
   line( 300 +mysound.left.get(i)*50,i ,  300 + mysound.left.get(i+1)*50, (i+1));
 
 
  }
  
   // popMatrix();
}
  
*/
  /*void dance() {

  noStroke();
  fill( 45, random(50), 95);
  
 bezier(300, 500,  100, 600,  200, 100,  300 , 300);
  bezier(300, 500,  500, 400,  500, 100,  300, 300);
 
    }
    */
    
 void ball(){
   
   pushMatrix(); 
 translate(220, 250);
    for(int i = 0; i < mysound.bufferSize() - 1; i++) 
{
    rotate(-4);
   
     noStroke();
  fill(  200, random(100), 60);
  ellipse( 50, 100, 20 +mysound.left.get(i)*400, 40 + mysound.right.get(i+1)*400);
    }
    
    
    popMatrix();
  }



  

  
 



void stop()
{

  mysound.close();
 
  minim.stop();
 
  super.stop();
}
  
  
  

