
class cell {

  float xloc;
  float yloc;
  float diam;
  float cellred, cellgreen, cellblue,cellalpha;
  float lineweight;
  boolean isseed;
 
  cell(){
   xloc=random(0,500);
    yloc=random(0,500);
    diam=random(30);
    isseed = false;
    cellred=random(200);
    cellgreen=random(200);
    cellblue=random(200);
    cellalpha=random(50,255);
    lineweight=2;
  }
 void display(){
   strokeWeight (random(lineweight));
   stroke(random(255));
   fill(cellred,cellgreen, cellblue,cellalpha);
   ellipse(xloc,yloc,diam,diam); 
 }
void update(){
xloc=xloc+random(-7,7);
yloc=yloc+random(-7,7);
}} 
 
cell[]  mycells = new cell[1000]; 
void setup(){ 

size (500,500);
for (int i=0; i<mycells.length; i++){
mycells[i] = new cell();  } //search about "new" command

}
 
 void draw(){
   background(255);
for (int i=0; i<mycells.length; i++){   
     
   mycells[i].display();    
   mycells[i].update();
   frameRate(15);
 }
 }
