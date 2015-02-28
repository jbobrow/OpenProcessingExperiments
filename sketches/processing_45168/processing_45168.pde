
/*
Hackpact Arte Generativo 2011
Dia 6

Martin Zumaya Hernandez
*/


Nodes[] nodes;
int n = 3; //number of groups of nodes
float dt = 0.1;

void setup(){
 size(600,600);
 background(30);
 smooth();
 colorMode(HSB);
 
 nodes = new Nodes[n]; 
 
 for( int i = 0; i < n; i++){
   nodes[i] = new Nodes();
   nodes[i].start();
   }
 }


void draw(){
  
  fill(30,20);
  rect(0,0,width,height);  
  
  for( int i = 0; i < n; i ++){
  nodes[i].bounds();
  nodes[i].draws();
  nodes[i].mmove(dt);
  }
  
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  #### imagen.png");
  }
}


