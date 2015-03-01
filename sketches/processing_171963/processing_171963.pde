
// // // *** Sketch by Zoe Kendall // // //

// // // *** Emergent Digital Practices, 2014-2015 // // //

Particle particle;
Particle particle2;
Particle particle3;
color color1;
color color2;


PImage logo;

void setup(){
  noCursor();
  frameRate(30);
  size(600,360);
  smooth(8); //super anti-aliasing!

logo = loadImage("edplogo.png");

   particle = new Particle(width*0.27, height*0.47, color1, color2); //the (run) width and (rise) height of the entire system and color
   
  background(0);
}

void draw(){
 
  fill(0,80); //slightly transparent so that it gives the particle system a slightly blurred motion
  noStroke();
  rect(0,0,width,height); //this keeps it from layering on top of itself but it slightly transparent so that it gives the particle system a slightly blurred motion
  
 
  particle.display(); //display the Particle Class!
  
  image(logo,width/2+300,height/2-600, 960, 540);//the edp logo
  
}

//////The Main Class //////////
class Particle {
  ///the array
 Parvect[] partsys;
 ///Listing all the variables
 float distBase; //distribution base - how connected the particles are; reducing the variable will reduce the connectivity
 float webVar; //more or less webby (keep between .7 and 1.1)
 float lineMax; //line thickness
 float run; // width - determined in setup
 float rise; // height - - determined in setup
 
 PVector temp1; //temporary equations that allow for generation while it runs through the code
 PVector temp2; // ^
 

 float tempDist; //temporary equations that allow for generation while it runs through the code
 float strokeVar;
 float varColor;
 color color1; //determined in void display()
 color color2; //determined in void display()
 color colorStroke;

 //determined below to keep it all constrained in an even manner
 float minX;
 float minY;
 float maxX;
 float maxY;

  ////Saying what is going to be going on in the Particle class - i.e. the constructors
  Particle(float run, float rise, color color1, color color2){
   
   run=run;
  rise=rise; 
 color1=color1;
color2=color2;

distBase=(run + rise); //connectivity & base of distribution = run and rise, changing these values will change the connections
webVar = 0.08; //distribution of webbing...adding more makes it webby and slow, less makes it more sparse
lineMax = 60; //how thick the lines are

//this keeps it constrained
minX = (width-run)*0.5;
minY = (height-rise)*0.5;
maxX = (width+run)*0.5;
maxY = (height+rise)*0.5;

partsys= new Parvect [350]; // 350 particles array for pvector

for(int i = 0; i < partsys.length; i++){
 partsys[i] = new Parvect(run,rise); //making the arrrrraaaayyyy! index of [0] = run; [1] = rise
} 
  }
  
  void display(){
       
    strokeWeight(1); //the weight of the stroke
    smooth(8); //8x anti aliasing 
    
 color1 = color(random(240,255), random(80,100), 0);
 color2 = color(random(60,80),20,random(200,225));
  
  
    for(int i = 0; i < partsys.length; i++){
      partsys[i].update(); //updating from ParVect
    }
    ///NESTED LOOP! For temporary equations before running through the code and then putting the PVector business in there
    for (int i = 0; i<partsys.length; i++){
      for (int j = 0; j<partsys.length; j++){
        temp1 = partsys[i].getPosition();
        temp2 = partsys[j].getPosition();
        tempDist = PVector.dist(temp1, temp2); //measuring the distance between these two variables here
        
        if (tempDist < distBase*webVar*1.2){ //connection and webbiness
         varColor = map(temp1.x, minX, maxX, 0., 1.); //mapping it between 0 - 1 = this is the variable for how the color is mapped across the particle system
          strokeVar = map(tempDist, 300, distBase*webVar, 300, lineMax); //determines the thickness of the lines - with bigger values in the map, it makes the map less crowded
          //lerpColor(c1, c2, amt)
          colorStroke = lerpColor(color1, color2, varColor); //lerpColor!!! Creates a color shift: (color1, color2, and the shift amount between)
          //stroke (red var, green var, blue var, alpha)
          stroke(red(colorStroke), green(colorStroke), blue(colorStroke), strokeVar); //this is an easier way to store the color values from the lerpColor so that it doesnt slow down the computer
          line(temp1.x+10, temp1.y+10, temp2.x+7, temp2.y+7); //THE ACTUAL LINE!!!! YAY!!! This comes from the PVector stuff below and the "temp" allows it to run through and return to here! - The math in there creates an uneven double vision effect
       
        }
      }
    }
  }  
  
}


////Bring on the PVector class! /////
class Parvect {
  PVector position; //PVector for where it moves
  PVector velocity; //PVector for how it moves
  float run; //width
  float rise; //height
  float minX; //min width size
  float minY; //min height size
  float maxX; //max width size
  float maxY; //max height size
  float maxVel; //speed of velocity
  float rad; //distribution of webbiness and how it connected
  float radBase; //width + height
  float radFac; //how closely it will remain connected
  
  Parvect(float run, float rise){
    this.run = run;
    this.rise=rise;
    maxVel = .90; //for velocity to use in PVector (the higher it is, the faster it goes) -- Can be .90 or 1.0(slightly faster)
    radFac = 0.5; //how close it all stays connected to each other! -- keep at .5 or else there are straglers and DISSENSION!
    radBase = (run + rise); //like dist base - level of connectivity and how it is connected
    rad = radBase*radFac; //the distribution of webbiness x connectivity - this equations makes it go outward in an even way
    
    //this keeps it constrained and evenly distributed
minX = (width-run)*0.5; 
minY = (height-rise)*0.5;
maxX = (width+run)*0.5;
maxY = (height+rise)*0.5;

/////POSITION VECTOR - how it expands and contracts/////
position = new PVector(random(minX,maxX), random(minY,maxY)); //PVector(x,y) -- generative vector based on X and Y values
if(dist(position.x, position.y, width/2, height/2) > rad) { //float distance calculated between the two points of the vector
  //if the distance between the two ^ points, it normalizes to make the position as 1 (that is why it bounces back)
  position.normalize();
  position.mult(rad); //multiplying the Position Vector by rad which means it expands evenly
}
/////VELOCITY VECTOR - speed of movement /////
velocity = new PVector (random(-maxVel, maxVel), random(-maxVel, maxVel)); //this keeps all the movement equal but still going outward
  }
  
  ////UPDATE FUNCTION - for how to treat the position and velocity when it hits the edge - for bounce back//// 
  void update(){
    if (dist(position.x, position.y, width*.5, height*.5) > rad) { //if it gets to half of height and half of width, bounce it back
     velocity.mult(-1); //multiplies the velocity by -1 which BOUNCES IT BACK!
    }
   position.add(velocity); //addition of velocity to position - without this, nothing moves
  }
  //returns the position of the vectors to the displays above!
  PVector getPosition(){
    return position;
  }
}


