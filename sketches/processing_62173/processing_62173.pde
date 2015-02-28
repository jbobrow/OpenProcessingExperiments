
import ddf.minim.*;

Minim minim;
AudioInput in;

//decalare variables
PImage b;
float grow = 0;
float boxco = 255;
float linecoB = 0;
float linecoW = 255;
int concentration = 600;


void setup(){
  size(800, 800, P3D);
    minim = new Minim(this);
  //used to bring mic input into sketch
  in = minim.getLineIn(Minim.STEREO, 1000);
  
  //Image - I can't figure out why the whole thing freezes when I actually load the image 
    //b = loadImage("flylo.png");
  //noLoop();

}


  void draw(){
    
   

 //if statement for color alterations  
  if (keyPressed == false) {    
    background(100);
    //fill(230, 4);
    //rect(0, 0, width, height);
    // += original+ declared number each time
  
  
   //Image
   //b.resize(0,20);
   //image(b, 0, 0);
   
    grow +=.08;
 
 //didn't use this, but maybe it will come in handy
 // ellipse(width/2, height/2, abs(in.left.get(1)*1000),abs(in.left.get(1)*1000));
 
 //For Waveform
    //adapted from John Park's MicIn Sketch
   stroke(255); 
    for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, (height/2)-5 + in.left.get(i)*50, i+1, (width/2)-5 + in.left.get(i+1)*50);
    line(i, (height/2)+5 + in.left.get(i)*50, i+1, (width/2)+5 + in.left.get(i+1)*50);
  }
   
  
  
   noStroke(); 
    //translate should be at top of draw sequence - also used to move things around
    translate(width/2, height/2);
    
    //x and y give 3d roatation
    {
      rotateX(radians(grow*5));
    //rotateY(radians(grow*5));
    
    //push and pop matrix are start and end for editing single items in for statement
    
    for(int i = 0; i<200; i++){
      pushMatrix(); 
        //draws lines penetrating spehere
        rotate(radians(30*i));    
        fill(linecoB);
        rect(0,0, (abs(in.left.get(1)*1000)+100), 2);
        //draws rotating boxes
        fill(#8EA59D);
        translate(width/5, height/5);
        box(30); 
      popMatrix();}
      }
      
          {
      //rotateX(radians(grow*5));
    rotateY(radians(grow*5));
    
    //push and pop matrix are start and end for editing single items in for statement
    for(int i = 0; i<200; i++){
      pushMatrix(); 
        rotate(radians(30*i));    
        fill(linecoB);
        rect(0,0, (abs(in.left.get(1)*1000)+100), 2);
        fill(#B1C2AF);
        translate(width/5, height/5);
        box(30); 
      popMatrix();}
      }
  
 rotateX(radians(grow*5));
    rotateY(radians(grow*5));
 
  for(int i = 0; i<200; i++){
      
        rotate(radians(30*i));    
        fill(linecoB);
        rect(0,0, (abs(in.left.get(1)*100)+100), 2);
      }
 
 { 
 //Sphere code
  fill(255);
  //color options through lighting
  //ambientLight(random(0, 100), random(0, 100), random(0, 100));
  //directionalLight(random(0, 100), random(0, 100), random(0, 100), -1, -1, -1);
  ambientLight(71, 24, 31);
  sphere(abs(in.left.get(1)*200)+30);

 //orbit_spheres - adapted from http://www.openprocessing.org/sketch/59268 - Toni Hulzer, changed the whole sketch, just taught me how to use color on spheres
 color c = color(0,0,0);
  // orbit1 - local variable
  float ax=80;
  float ay=60;
            
  // orbit2 - local variable
  float bx=-80;
  float by=-80;
  float bz=100;

 //orbit3 - local variable
  float cx=10;
  float cy=10;
  float cz=50;  
  
  
  translate(ax,ay);
    fill(c);
    sphere(12);
  translate(bx,by,bz);
    fill(c);
    sphere(6); 
  translate(cx,cy,cz);
    fill(c);
    sphere(8);
}
 } 
   
 //for second color scheme  
//ON KEYPRESS   
    else {      
    background(200);
    //fill(230, 4);
    //rect(0, 0, width, height);
    // += original+ declared number each time
 
  
   //Image
   //b.resize(0,20);
   //image(b, 0, 0);
   
    grow +=.08;
 
 // ellipse(width/2, height/2, abs(in.left.get(1)*1000),abs(in.left.get(1)*1000));
 
 //For Waveform

   stroke(255); 
    for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, (height/2)-5 + in.left.get(i)*50, i+1, (width/2)-5 + in.left.get(i+1)*50);
    line(i, (height/2)+5 + in.left.get(i)*50, i+1, (width/2)+5 + in.left.get(i+1)*50);
  }
   
  
  
   noStroke(); 
    //translate should be at top of draw sequence
    translate(width/2, height/2);
    
    //x and y give 3d roatation
    {
      rotateX(radians(grow*-5));
    //rotateY(radians(grow*5));
    
    //push and pop matrix are start and end for editing single items in for statement
    for(int i = 0; i<200; i++){
      pushMatrix(); 
        rotate(radians(30*i));    
        fill(linecoW);
        rect(0,0, (abs(in.left.get(1)*1000)+100), 2);
        fill(#8EA59D);
        translate(width/5, height/5);
        box(30); 
      popMatrix();}
      }
      
      
          {
      //rotateX(radians(grow*5));
    rotateY(radians(grow*-5));
    
    //push and pop matrix are start and end for editing single items in for statement
    for(int i = 0; i<200; i++){
      pushMatrix(); 
        rotate(radians(30*i));    
        fill(linecoW);
        rect(0,0, (abs(in.left.get(1)*1000)+100), 2);
        fill(#B1C2AF);
        translate(width/5, height/5);
        box(30); 
      popMatrix();}
      }
  
 rotateX(radians(grow*-5));
    rotateY(radians(grow*-5));
 
  for(int i = 0; i<200; i++){
      
        rotate(radians(30*i));    
        fill(linecoW);
        rect(0,0, (abs(in.left.get(1)*100)+100), 2);
      }
 
 { 
 //sphere_Main
  fill(255);
  //color options through lighting
  //ambientLight(random(0, 100), random(0, 100), random(0, 100));
  //directionalLight(random(0, 100), random(0, 100), random(0, 100), -1, -1, -1);
  ambientLight(71, 24, 31);
  sphere(abs(in.left.get(1)*200)+30);

 //orbit_spheres - adapted from http://www.openprocessing.org/sketch/59268
 color c = color(0,0,0);
  // orbit1
  float ax=80;
  float ay=60;
            
  // orbit2
  float bx=-80;
  float by=-80;
  float bz=100;

 //orbit3
  float cx=10;
  float cy=10;
  float cz=50;  
  
  
  translate(ax,ay);
    fill(c);
    sphere(12);
  translate(bx,by,bz);
    fill(c);
    sphere(6); 
  translate(cx,cy,cz);
    fill(c);
    sphere(8);
}
      
  } }
  
  void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}


  

