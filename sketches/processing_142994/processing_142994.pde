
int numagents = 10;
float progress = 0;
int mysize = 50;
int ismoving = 0;
Agent[] agents;

void setup(){
  size(1000,1000);
  noStroke();
  agents = new Agent[numagents];
  int index = 0 ;
  
  for(int i = 0; i < numagents; i++){
   agents[index++] = new Agent(); 
  }
  
}

void draw(){
  background(0);
  for (int i = 0; i < numagents; i++) {
    //agents[i].update();
    agents[i].display();
  }
    
  if(ismoving == 1){
    for (int i = 0; i < numagents; i++) {
    agents[i].theposx = lerp(agents[i].lastposx, agents[i].nextposx, progress);
    agents[i].theposy = lerp(agents[i].lastposy, agents[i].nextposy, progress);
    }
    progress += 0.01; 
  }
  
  if(progress > 1){
   progress = 0; 
   ismoving = 0;
   
   for (int i = 0; i < numagents; i++) {
    agents[i].lastposx =  agents[i].theposx;
    agents[i].lastposy =  agents[i].theposy;
   }
   
  }
   
}

class Agent {
  float theposx;
  float theposy;
  float lastposx;
  float lastposy;
  float nextposx;
  float nextposy;
  
  Agent(){     
  theposx = round(random(width));   
  theposy = round(random(height));   
  lastposx = round(random(width));   
  lastposy = round(random(height));  
  nextposx = round(random(width));   
  nextposy = round(random(height));    
  }
  
  void display(){
    rectMode(CENTER);
    fill(255);
    rect(theposx, theposy, mysize, mysize); 
  }
  
  void findnextpos(){
    nextposx = round(random(width));   
    nextposy = round(random(height));    
  }
  
}

void mousePressed(){
 
  progress = 0;
  
  for (int i = 0; i < numagents; i++) {
    agents[i].lastposx =  agents[i].theposx;
    agents[i].lastposy =  agents[i].theposy;
   }
  
  for (int i = 0; i < numagents; i++) {
    agents[i].findnextpos();  
  }
  
  if(ismoving == 0){
   ismoving = 1; 
 }
}


