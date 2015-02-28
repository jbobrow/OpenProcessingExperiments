
class cell{  //we created a new cell class

//lets begin with defining some variables
PVector loc = new PVector();  
PVector velocity = new PVector ();
float diam;
boolean isseed;
float cellred;
float cellgreen;
float cellblue;
float lineColor;


cell(){
loc = new PVector(random(500),random(500)); // location of seed cell is random within the boundary of frame (it could have been random(width) and random(height)
diam = 5 ;   // diameter of the cell
isseed = false ;   //  is the cell is seeded or not, at this time it is not
cellred = 255;
cellgreen = 255;
cellblue = 255;
lineColor = random(150,250);   //in order to define edge color of the cells
}

void display(){   //lets begin forming our cell
stroke (lineColor);


if(isseed == true)    { fill(random(255),0,0);}  // if the cell is seeded, its color varies from dark to bright red
if(isseed == false) {fill(cellred,cellgreen,cellblue);  // if not it is white
}

ellipse(loc.x,loc.y,diam,diam);   // since loc PVec defined randomly, loc x and loc y will be placed randomly
}

void update(){    //in order to continue to the movement
  if(isseed == false){
 velocity = new PVector (random(-10,10),random(-10,10));  //cell will appear anywhere 5 unit far from its last current location   
 loc.add(velocity);
  
}}}  
cell[] mycells = new cell[8000];  // [x]  x number of cells will be in frame
float col1=0;
float col2=0;
float col3=0;
void setup(){
  background(20);
size(500,500);
 for(int i =0; i<mycells.length; i++) {mycells[i] = new cell();{ if(i<15)

 // i= number of seeded cells  so, if i < x  there will be x-1 seeded cells will appear on the screen
 
 mycells[i].isseed = true;   //i times seeds placed randomly is true
 
 }
 }
}


void draw(){
  colorMode(HSB);
  stroke(col1,240,120);
  col1=col1+3;    //color wheel increases 3 each pass
  
  
  

 
  for(int i=0; i<mycells.length; i++)  //

  mycells[i]. update();  // in order to continue to grow

  

for(int i=0; i<mycells.length; i++) {   
    
  if(mycells[i].isseed == false) {
    
    for(int j=0; j<mycells.length; j++) {
        
        if(mycells[j].isseed == true)  {
          
          
            float d;
            d = PVector.dist(mycells[i].loc, mycells [j].loc);
            
              if(d<5) {  mycells[i].isseed = true;  //if(d<x) isseed= true means  if d is less than x, cell stop moving
            
          line(mycells[i].loc.x, mycells[i].loc.y , mycells[j].loc.x, mycells[j].loc.y); // since some cells stop moving because of previous command, this one draw lines between each other
          
      
          

      }}}}}}
      
      

   void mousePressed() { save("tunc simple DLA.png");   background(20);  loop();   //when mouse pressed it saves current image as png with dark background
}
