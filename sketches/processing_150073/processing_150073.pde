
// DEFINIZIONE DELLA CLASSE

class Bot 
{
  PVector pos;
  PVector vel = new PVector();
  int r, g, b;
  color c;
  int size;
  int targetID = 0;
boolean isAlive = true;


  Bot (PVector startPos) {
    pos = startPos;
    
  }



  void update() {
  targetID = 0;
    if(isAlive){
    
    
    pos.add(vel);
    color nc = color(r,g,b);
    c = nc;
    
    //breaks
    if((vel.x)>1){vel.x = 1;}
    if((vel.y)>1){vel.y = 1;}
    if((vel.x)<-1){vel.x = -1;}
    if((vel.y)<-1){vel.y = -1;}
    
    
    //bounds
    if(pos.x < size){vel.x = .1;}
    if(pos.x > 500-size){vel.x = -.1;}
    if(pos.y < size){vel.y = .1;}
    if(pos.y > 500-size){vel.y = -.1;}
    }
  }
  
  void display() {
  fill(c); 
  ellipse(pos.x,pos.y,size,size);
  }
}

// USO DELLA CLASSE





Bot[] bots = new Bot[300];


void setup() {
  int height = 500;
  int width = 500;
  int n;
  size (height,width);
  //noStroke();
  
  //Bot setup in array bots
  for (int i=0; i<bots.length; i++) {
    float x = random(width);
    float y = random(height);
    bots[i] = new Bot( new PVector(x,y) );
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
   
    color c = color(r,g,240);
    bots[i].c = c;
    
    bots[i].r = r;
    bots[i].g = g;
    bots[i].b = 240;
    
    bots[i].size = 3;
    
    bots[i].targetID = 0;
    
  }
}

void draw() {
  background(0);
  
  
  for(int i = 0;i<bots.length;i++){
          if(bots[i].isAlive){
          bots[i].update();
          
          if (bots[i].r >= bots[i].b){
              
              
              float newDist = 100000.0;
              float oldDist = 1000.0;
              //bots[i].targetID = 0;
              
              for (int j=0; j<bots.length; j++) {  
                    if(bots[j].isAlive == true){
                    newDist = dist(bots[i].pos.x,bots[i].pos.y,bots[j].pos.x,bots[j].pos.y);
                    }else{
                    newDist = 1000000;
                    }
                    if ((newDist<oldDist)&&(i!=j)){
                        bots[i].targetID = j;
                        oldDist = newDist;
                        
                    }
              }
              
              
              n = bots[i].targetID;
              
              //seeking
              if (bots[i].pos.x > bots[n].pos.x){bots[i].vel.x = bots[i].vel.x-.05;}
              if (bots[i].pos.x < bots[n].pos.x){bots[i].vel.x =  bots[i].vel.x+.05;}
              if (bots[i].pos.y > bots[n].pos.y){bots[i].vel.y = bots[i].vel.y-.05;}
              if (bots[i].pos.y < bots[n].pos.y){bots[i].vel.y = bots[i].vel.y+ .05;}
              stroke(150);
              line(bots[i].pos.x,bots[i].pos.y,bots[n].pos.x,bots[n].pos.y);
              noStroke();
              
              if(bots[i].size>=bots[n].size){
              if((oldDist<=(5))&&(bots[n].isAlive)){
              bots[n].isAlive = false;
              fill(0);
              ellipse(bots[n].pos.x,bots[n].pos.x,bots[n].size,bots[n].size);
              bots[i].size=bots[i].size+.5;
              }
             }
              
                 
          } else{
          int xR = random(2);
    int yR = random(2);
    bots[i].vel.x = bots[i].vel.x + (bots[i].r/1000)*(xR - 1);
    bots[i].vel.y = bots[i].vel.y + (bots[i].r/1000)*(yR - 1);
     
    
            } 
          
          bots[i].display();
      }
   }
}




