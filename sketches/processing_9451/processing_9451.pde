
//Bblue.
PImage Bblue;


//galactic.
PImage galactic; 

//Ggreen.
PImage Ggreen;

//neon.
PImage neon;

//Oorange.
PImage Oorange;

//Ppink.jpg
PImage Ppink;


void setup()
{
    size(640, 480);
    smooth();
    
    colorMode(HSB, 360, 100, 100);
    //
    stroke(255);
//    noLoop();
    
     
    //Bblue.
    Bblue= loadImage ("Bblue.jpg");
    

    //galactic.
    galactic= loadImage ("galactic.jpg");
 
 
    //Ggreen.
    Ggreen= loadImage ("Ggreen.jpg");
     
   

    //neon.
    neon= loadImage ("neon.jpg");

    
    //Oorange.
    Oorange= loadImage ("Oorange.jpg");
    
    
    //Ppink.
    Ppink=loadImage ("Ppink.jpg");
    
}
    
    
    

void draw()
{
  background(0);


 //neon.
 image(neon,190,270);
//  //
//  background(0);
//  float x= random(0,width);
//  float y= random(0,height);
//  image(neon,x,y);

//
   
  

 
 //Oorange.
 image(Oorange,435,245);
 
 
  
 //Bblue.
 image(Bblue,435,-20);
 
 //galactic.
 image(galactic,210,-40);
 

 //Ppink.
 image(Ppink,-10,210);
 
 
 //Ggreen.
 image(Ggreen,-30,-45);
//  //tweak.
//
//      translate(x+ Ggreen.width/2,y+Ggreen.height/2);
//  
//      //change random(0,0)<--to make the angle change.
//      float angle=random(0,0);
//      rotate(radians(angle));
  
     image(Ggreen,-Ggreen.width,-Ggreen.height);
// }

//mousepressed.
   
  float q = random(0, 100);
  if (q < 10) {
    float r= random(0,360);
    tint(r, 60, 100); 
  }

}

