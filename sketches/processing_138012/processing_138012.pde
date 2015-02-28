
//One day while struggling to come up with a theme for this project, I decided to go to youtube to listen to some music.
//I listend to some music from a band I liked back in high school called Yellowcard and eventually stumbled upon an 8-bit version of one of their songs.
//I knew I wanted to use the song in my project and decided to try to build an 80s video game loading screen
//Press b to hear the 8-bit song.


float[] x = new float[100];
float[] y = new float[100];
float[] speedz = new float[100];


//import ddf.minim.*;
//Minim minim;
//AudioSample ocean;

PImage img;
PImage img2;




float angle=0.0;
float angle2=0.0;
float angleDirection=1;
float angleDirection2=1;
float speed=0.010;





void setup(){
  //background(0);
  size(800,600);
 
  //minim= new Minim(this);
  //ocean=minim.loadSample("yellow.WAV");
  
  
 int i = 0;
  while(i < 100) {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    speedz[i] = random(1, 5);
    i = i + 1;
  }
  
   img=loadImage("Galaga2.png");
   img2=loadImage("attack.png");
  
  
  
   
  
  
}





void draw(){
 background(0);
 smooth();
   
   
   int i = 0;
  while(i < 100) {
    stroke(255);
    point(x[i], y[i]);
  
    x[i] = x[i] - speedz[i];
    if(x[i] < 0) {
      x[i] = width;
    }
    i = i + 1;
  }
 
 
 
 boolean runonce = true;
  if (runonce) {
  //font=loadFont("8BITWONDERNominal-48.vlw");
  
  
    
  image(img,mouseX,mouseY,100,100);
  image(img2,150,250);
  
  runonce = false;
   
}
 
 


   


 
 
 
 
 
  pushMatrix();
  translate(400,155);
  rotate(angle);
  strokeWeight(2);
  stroke(255,251,0);
  noFill();
  //fill(255,251,0);
  rect(-110,-30,220,60);
  angle=angle+speed;

  popMatrix();
  

  translate(400,155);
  rotate(angle2);
  strokeWeight(2); 
  stroke(255,251,0);
  noFill();
  //fill(255,251,0);
  rect(-110,-30,220,60);  
  angle2=angle2-speed;
  
  



  }
  
  
  void keyPressed(){
    //if ( key== 'b') ocean.trigger();
    if (key== 'b') println("sample triggered");
    if(key=='s')saveFrame("screenshot.png");
  }




