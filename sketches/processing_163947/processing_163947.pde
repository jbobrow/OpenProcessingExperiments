
PImage acen, crazy,run; // variable for picture
PFont font;         //variable for font                      
Ring [] rings; //declares array (ring array setup found in book pg 409)
int numRings=200; //this is the limit to how many rings can be created
int currentRing=0;

void setup(){
  size (650,600);
  rings=new Ring[numRings];
    for (int i=0; i<numRings; i++){
        rings[i]=new Ring();
      } 
     //images used 
  acen=loadImage("animecent.jpg");
  crazy=loadImage("reality.png");
 run=loadImage("running.png");
 //setup for the use of text
 font=loadFont("BlackadderITC-Regular-42.vlw");
 textFont(font);
 fill(#EE31F2);
}

// Setup for the ring class 
class Ring{
  float x, y;
  float diameter;
  boolean on = false;
    void start(float xpos, float ypos){
      x=xpos;
      y=ypos;
      on=true;
      diameter=1;
    }
//Setup for the ring expansion    
 void grow() {
    if (on==true){
    diameter += 1;
      if(diameter > 250){
        on =false;
      }
    }
  }
//Setup for how the rings are going to show when they appear  
void display(){
    if(on==true){
      noFill();
      strokeWeight(3);
      stroke(random(255), random(255), random(255), random(255)); //found @ http://processing.org/discourse/beta/num_1193163956.html
      ellipse(x,y, diameter, diameter);
       }  
     }
  }

// 
void draw(){
  image(acen,0,0);            //
  filter(POSTERIZE,11);        // Setup for the back ground image
  filter(BLUR, 1);             // 
  image(crazy, 425,420);
  crazy.filter(INVERT);
//avoiding text
smooth();
textSize(48);
text("We're all mad here~", width-mouseX, height-mouseY); //cause text to avoid the mouse

//running man image that avoids mouse
image(run, width-mouseX, height-mouseY);

//spirals
    smooth();
    float radius=1.0;
      for(int deg=0; deg<360*6; deg+=11){
        float angle=radians(deg);
        float x=135+(cos(angle)*radius);
        float y=195+(sin(angle)*radius);
       
        ellipse(x,y,1,1);
        radius=radius+0.5;
      }
      smooth();
    float radius=1.0;
      for(int deg=0; deg<360*6; deg+=11){
        float angle=radians(deg);
        float x=400+(sin(angle)*radius);
        float y=155+(cos(angle)*radius);
        ellipse(x,y,1,1);
        radius=radius+0.25;
      }

//for loop for the rings
  for (int i=0; i<numRings; i++) {
      rings[i].grow();
      rings[i].display();
  } 

}
//Setup to allow the rings to be created on mouse button clicking
void mouseDragged(){
  rings[currentRing].start(mouseX, mouseY);
  currentRing++;
  if (currentRing>=numRings){
        curentRing=0;
  }
}



