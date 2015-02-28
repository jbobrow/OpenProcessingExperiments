
class cell{

PVector loc = new PVector();
PVector velocity = new PVector ();
float diam;
boolean isseed;
float cellred;
float cellgreen;
float cellblue;
float lineWeight;


cell(){
loc = new PVector(random(500),random(500));
diam = 5 ;
isseed = false ;
cellred = 255;
cellgreen = 255;
cellblue = 255;
lineWeight = 0.1;
}

void display(){
  
noStroke();

if(isseed == true)    { fill(random(255),0,0);}
if(isseed == false) {fill(cellred,cellgreen,cellblue);
}

ellipse(loc.x,loc.y,diam,diam);
}
void update(){
  if(isseed == false){
 velocity = new PVector (random(-10,10),random(-10,10));
 loc.add(velocity);
  
}}}  


cell[] mycells = new cell[4000];

void setup(){
size(500,500);
 for(int i =0; i<mycells.length; i++) {mycells[i] = new cell();
{ if(i<20)
 mycells[i].isseed = true;
 frameRate(200);
}
} 
}


void draw(){
  background(255);
  for(int i=0; i<mycells.length; i++)
  {mycells[i]. display();
  mycells[i]. update();

  }

for(int i=0; i<mycells.length; i++) {   
    
  if(mycells[i].isseed == false) {
    
    for(int j=0; j<mycells.length; j++) {
        
        if(mycells[j].isseed == true)  {
          
            float d;
            d = PVector.dist(mycells[i].loc, mycells [j].loc);
            
              if(d<5) {  mycells[i].isseed = true; }}}}}}
