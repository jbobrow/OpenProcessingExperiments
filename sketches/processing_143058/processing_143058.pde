
int     numagents = 50;
float   progress = 0;
float   myspeed = 0.01;
int     mysize = 50;
boolean ismovingxyz = false;
Agent[] agents;

void setup(){
  size(1200,1200, P3D);
  noStroke();
  agents = new Agent[numagents];
  for(int i = 0; i < numagents; i++){
   agents[i] = new Agent(); 
  }  
}

void draw(){
  background(0);
  lights();
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  for (int i = 0; i < numagents; i++) {
    //agents[i].update();
    agents[i].display();
  }
    
  if (ismovingxyz) {
    for (int i = 0; i < numagents; i++) {
      agents[i].theposx = lerp(agents[i].lastposx, agents[i].nextposx, progress);
      agents[i].theposy = lerp(agents[i].lastposy, agents[i].nextposy, progress);
      agents[i].theposz = lerp(agents[i].lastposz, agents[i].nextposz, progress);
    }
    progress += myspeed; 
  }
  
  if (progress > 1){
    progress = 0; 
    ismovingxyz = false;   
    for (int i = 0; i < numagents; i++) {
      agents[i].lastposx =  agents[i].theposx;
      agents[i].lastposy =  agents[i].theposy;
      agents[i].lastposz =  agents[i].theposz;
    }   
  }   
}

class Agent {
  float theposx;
  float theposy;
  float theposz;
  float lastposx;
  float lastposy;
  float lastposz;
  float nextposx;
  float nextposy;
  float nextposz;
  
  Agent() {     
    theposx = round(random(width));   
    theposy = round(random(height)); 
    theposz = round(random(-500, 500));  
    lastposx = round(random(width));   
    lastposy = round(random(height));  
    lastposz = round(random(-500, 500));  
    nextposx = round(random(width));   
    nextposy = round(random(height));   
    nextposz = round(random(-500, 500));   
  }
  
  void display(){
    /* rectMode(CENTER); */
    /* fill(255); */
    pushMatrix();
    translate(theposx,theposy,theposz);
    box(mysize); 
    popMatrix();
  }
  
  void findnextpos(){
    nextposx = round(random(width));   
    nextposy = round(random(height)); 
    nextposz = round(random(-500,500));   
  }  
}

void mousePressed(){
  progress = 0;  
  for (int i = 0; i < numagents; i++) {
    agents[i].lastposx =  agents[i].theposx;
    agents[i].lastposy =  agents[i].theposy;
    agents[i].lastposz =  agents[i].theposz;
   }
  
  for (int i = 0; i < numagents; i++) {
    agents[i].findnextpos();  
  }
  
  if (ismovingxyz == false){
    ismovingxyz = true; 
  }
}


