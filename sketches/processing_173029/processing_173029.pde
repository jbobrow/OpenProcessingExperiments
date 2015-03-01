
ArrayList agents;





void setup(){
   size(300,300);
  
  //agents = new ArrayList();
  agents = imageToAgents();
  noStroke();
}

void draw(){
  background(0);
  
  
  for (int i = 0; i < agents.size(); i++){
    
    Agent tempA = (Agent)agents.get(i);
    
    tempA.update();
    tempA.draw();
  }
  
  
}

void mousePressed(){
  Agent ourAgent;
  ourAgent = new Agent(mouseX,mouseY,color(random(255),255,255));
  agents.add(ourAgent); 
}

ArrayList imageToAgents(){
  
 ArrayList pixies = new ArrayList();
 PImage img = loadImage("acorn.png"); 
 
 for  (int ix = 0; ix < img.width; ix++){
   for (int iy = 0; iy <img.height; iy++){
     
     color c = img.pixels[ix + (iy*img.width)];
       Agent ourAgent;
       ourAgent = new Agent(ix,iy,c);
       pixies.add(ourAgent);
     
     
   }//end for iy
 }//end for ix
 
 return pixies; 
}


class Agent{
  
  // class data
  float x, y;
  color c;
  //constructor
  Agent(int _x, int _y, color _c){
    x = _x;
    y = _y;
    c = _c;
  }
  
  //class methods
  void update(){
  x += random(-1,1);
  y += random(-1,1);
}

void draw(){
  fill(c);
  rect(x,y,5,5);
}
  
}//end class


