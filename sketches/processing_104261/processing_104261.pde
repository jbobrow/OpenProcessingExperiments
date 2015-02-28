
ArrayList<PVector> history = new ArrayList<PVector>();
float dist = 30;
float x, y, teta;
float r;

void setup(){
  size(500,500);
  background(255);
  stroke(0,50);
  smooth();
  frameRate(100);
  r = 1;
  teta = 0;
}


void draw(){
  x = r*sin(teta);
  y = r*cos(teta);
  teta = random(0, 360);
  r = random(0,500);
  
  PVector d = new PVector(x + width/2,y + height/2, 0);
  history.add(0,d);
  
  for(int i = 0; i < history.size(); i++){
     PVector v = history.get(i);
    
     if(d.dist(v) < dist)
      line(d.x, d.y, v.x, v.y); 
  }
}

void mouseDragged(){
  PVector d = new PVector(mouseX,mouseY, 0);
  history.add(0,d);
  
  for(int i = 0; i < history.size(); i++){
     PVector v = history.get(i);
    
     if(d.dist(v) < random(dist))
      line(d.x, d.y, v.x, v.y); 
  }
  
}


void keyPressed(){
   if( key == ' '){
      background(255);
      history.clear();
   }else if( key == 'p'){
      saveFrame("art.png");
   } 
  
}
