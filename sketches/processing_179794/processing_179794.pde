
//Import Library ControlP5
import controlP5.*;

// define slider atributes
ControlP5 cp5;
int sliderValue = 50;
int sliderTicks1 = 50;
int sliderTicks2 = 30;
Slider abc;

// defining variables
int startStop = 0;
int CircleSize = 5;
int ColourChange = 1;

//define JPEG
public void exportJPEG(){
  startStop = 4;
  saveFrame("filename#####.jpg");
}


//number of cells
Cell[] myCells = new Cell[2500]; 
void setup() { 
 // size of canvas
  size(500, 500, P2D); 
 
  //background
  background(255); 
 
  // put in sliders and button and attatch to function
  cp5 = new ControlP5(this);
  
   cp5.addButton("exportJPEG")
  .setSize(100,20)
  .setPosition(10, 10);

   cp5.addSlider("CircleSize")
  .setSize(100,20)
  .setPosition(10,50)
  .setRange(5,50);
  
  
    cp5.addSlider("ColourChange")
  .setSize(100,20)
  .setPosition(10,100)
  .setRange(1,255);
  
    
  for (int i = 0; i < myCells.length; i ++) { 
    myCells[i] = new Cell(); 
  } 
 
} 
  
  
 // mouse click on canvas would freeze or unfreeze  
void mouseClicked(){
  
  switch (startStop){
    case 0:
      noLoop();
      startStop = 1;
      break; 
      
    case 1:
      loop();
      startStop = 0;
      break;
      
    case 2:
      loop();
      startStop = 0; 
      break;
      
    case 3:
      noLoop();
      startStop = 1;
      break;
      
    case 4:
      startStop = 0;
      break; 
  }
}



//create loop
void draw() { 
    
    
  for (int i=0; i< myCells.length; i++) { 
    myCells[i].update(); 
  } 
// defining coordinate values for origin in centre
  myCells[0].location.x = 250; 
  myCells[0].location.y = 250; 
  myCells[0].isseed = true; 

  //setting the location of the origin to the centre of the page 
    for (int i=0; i< myCells.length; i++) { 
    if (myCells[i].isseed == false) { 
      for (int j=0; j< myCells.length; j++) { 
        if (myCells[j].isseed) { 
          float d; 
          d = PVector.dist(myCells[i].location, myCells[j].location); 
          if (d<=8) { 
            myCells[i].isseed = true; 
            strokeWeight(0.5); 
            //variable colour change conroled by slider defining outter circle colour change     
            fill(ColourChange, 255-ColourChange, 0);
            ellipse(myCells[i].location.x, myCells[i].location.y, CircleSize, CircleSize);
            // white inner circle
            fill(255);
           //circle diameter half the outter circle 
            ellipse(myCells[i].location.x, myCells[i].location.y, CircleSize/2, CircleSize/2); 
                  
        } 
        } 
      } 
    } 
  } 
 // save PDF after completting   
    endRecord();  // saves the file
} 



//this is the cell classe. We defnie it in two parts. First we delare its variables: 
class Cell{ 

  PVector location = new PVector(); 
  PVector velocity = new PVector(); 
  float dia; 
  boolean isseed; 
  float cellred, cellgreen, cellblue; 
  float lineweight; 
//then we construct it - using a 'constructor  

  Cell(){ 
    location = new PVector(random(500),random(500)); 
    //defines the new location by a vector with a random x and a random y 
    dia = 2; 
    isseed = false; 
    cellred = 0; 
    cellgreen = 0; 
    cellblue = 0; 
    lineweight = 0.1; 
  } 
 
  void display(){ 
    stroke(lineweight); 
    if(isseed == true){ 
      fill(0,213,255); 
      stroke(0,213,255); 
    } 

    if(isseed == false){ 
    fill(cellred,cellgreen,cellblue); 
    } 
    ellipse(location.x,location.y,dia,dia); 
  } 

  void update(){ 
    if(isseed == false){ 
      velocity = new PVector(random(-1, 1),random(-1, 1)); 
      location.add(velocity); 
    } 
  } 
} 


  


  


    



