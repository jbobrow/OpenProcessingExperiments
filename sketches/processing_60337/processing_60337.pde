
/**
 * Mouse Functions. 
 * 
 * Click on the box and drag it across the screen. 
 */

/*
 |This project renders data on the same plane as the background images
 |It is the current working version of my code for the final. 
 |My devlopment version is using a diffrent datasetand is currently not functional.
 |I have a plan and will commence execution tomorrow.
 |Plan for the rest of the week: 
 |Test the following components: 
 |Data parser : Q'S to resolve : Can I call an arrays peices outside of that array?
 |Datarange forloop : Q'S to resolve : Is a foor loop the right structure?
 |Control method for Datarange forloop : 2 buttons for going back, forwards in time and 2 buttons for controlling the range of data viewable.
 |- langT 
 |
*/


PImage SFmap;

//relVariables
int  mcY, dY, dYs, cY, cYi, cYs;
int  mcX, dX, dXs, cX, cXi, cXs;

//timeControls
//int counter1, counter2;


//mapVisVariables
int fC;

void setup(){
  size(800,800);
  smooth();
  
  SFmap = loadImage("txu-pclmaps-topo-us-san_francisco-1947-a 5MB.jpg");
  
  //relVariables
  cY = height/2;
  cX = width/2;
  
  //timeControls
  //counter1 = 0;
  //counter2 = 0;
    
  //mapVisVariables
  fC = 0;
}

/////////////////////////////////
void draw(){
  background(255);
  //Static things
  
  
  
  relMovement();
  //things to render
  
  
  //Data on moving coordinates
  cleanUp();
  relIndicators();
   // add the elments ( see example 1 for the parameters )
  
}
/////////////////////////////////
//Controls
void mousePressed(){
  mcY = mouseY+ cY; // sets anchor location to before dragging
  mcX = mouseX+ cX; // sets anchor location to before dragging
}
void mouseDragged(){
  dY = mouseY;
  dYs = mcY-dY;
  
  dX = mouseX;
  dXs = mcX-dX;
}


void relMovement(){  
  cY += dYs-(cY);//for normal movement
  cYi = -cY;// for inverted movement
  
  cX += dXs-(cX);//for inverted movement
  cXi = -cX;// for normal movement
  
  cYs = -cY;//for zoom tracking
  cXs = -cX;//for zoom tracking
  
  
}

void relIndicators(){
  fill(255,255,255);
  rect(cX+width/2,cY+height/2,10,10);
  fill(255,255,0);
  rect(cXi+width/2,cYi+height/2,10,10);
  //The numbers
  println("Anchor        "+mcY +" "+ mcX); //where the mouse butten was first clicked
  println("Current point"+ dY +" "+ dX); //Where the mouse button was dragged to
  println("Diffrence"+ dYs +" "+ dXs);  //How much is being added to OR subtracted from rectangle 
  println("last value    "+ cY +" "+ cX); // This value is used to store the position of the thing being moved
  println("last value    "+ cYi +" "+ cXi);
  
}


  
void cleanUp(){
  pushMatrix();
  //zState();
  int imgW;
  imgW = SFmap.width/2;
  int imgH;
  imgH = SFmap.height/2;
  translate(cXs,cYs);
  image(SFmap, -imgW , -imgH);
  mapVis();
  //scale(S);
  //println(S +" "+ zS);
  //put images here.
  popMatrix();
}

//////////////// Entering problematic code ///////////////
/*

void dataProcessing(){
  taxiData();
  map(pieces[1],1,12:59,0,1000); // Don't know if the map function supports this but it's worth a shot.
  map(,37.558422 ,37.826 ,0,width); //
  map(sGPS_LA,-122.378 ,-122.507382,0,width); //
  ellipse()
}

void timeControl(){
  counter1 //LEFT -= 1 and RIGHT += 1. The counter variable is P which stands for position. 
  counter2 //UP += 1 and DOWN -= 1. The counter variable is R which stands for range.
  // P is a point on a line from 0 to width fro m point P a number R is added all data that falls between the two numbers is rendered
  // width is the maximum value of the array position for a time variable this is acheved by finding a set of variables 
  for(int [] = [5]; P < [5] < P+R; ; i++){
    ellipse(pieces[3],pieces[3],5,5)
    line(pieces[3],pieces[3],pieces[2],pieces[2]);
  }
}


//This is the counter 
void keyPressed (){
  if ( key == LEFT){
    counter1 -= 1;
  }
  if ( key == RIGHT){
    counter1 += 1;
  }
  if ( key == UP){
    counter2 += 1;
  }
  if ( key == DOWN){
    counter2 -= 1;
  }
}

*/
/////////////// Entering problem free code ////////////////


void mapVis(){
  String[] data = loadStrings("time-x-y-4state.tsv"); //My data causes an
  for(int i=0; i < data.length; i++){ 
    String[] pieces = split(data[i],TAB); // to parse a tab you need to put"TAB"
    //if(i%5 == 0){} //every 5t11h thing do this
    float time = parseFloat(pieces[0]);
    
    float dx = parseFloat(pieces[1]);

    float dy = parseFloat(pieces[2]);
    
    float state = parseFloat(pieces[3]);
    
    if(state == 0){
    fC = 0;
    }
    if(state == 1){ 
    fC = 100;
    }
    if(state == 2){
    fC = 150;
    }
    if(state == 3){
    fC = 225;
    }
  fill(fC,0,0);
  ellipse(dx,dy,3,3);
  }
} 




