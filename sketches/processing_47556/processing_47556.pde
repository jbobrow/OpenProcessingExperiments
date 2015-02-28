
int data[]= {74, 28, 27, 23, 19, 16, 15};
String states[] ={"FLORIDA", "TEXAS", "COLORADO", "GEORGIA", "NORTH CAROLINA", "ALABAMA", "SOUTH CAROLINA"};
 PImage lightning;
  
void setup(){
  background(255);
  size (800, 450);
  lightning = loadImage("lightning-1.jpg");
  smooth();
 
}
void draw(){
  background(0);
  for(int i = 0; i < data.length; i++){
       float ellSize= map(data[i],10,80,0,50);
       image (lightning, i*100+30,100,ellSize*5, ellSize*5);
         fill(255);
       textSize(15);
       text(data[i],i*100+40,400);
       textSize (10);
       text(states[i],i*97+40,50);
       textSize(20);
       text ("LIGHTNING DEATHS PER STATE 2007", 250,30);
     
  }
}

//Nick I lost my source for this data :( srry

