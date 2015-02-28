
ArrayList racers;

void setup(){
  
  racers = new ArrayList();
  
  for(int i = 0; i < 1024; i++){
   
   racers.add(new racer()); 
    
  }

  size(900,450);
  //background(250);
  background(0);
  //frameRate(10);

}


void draw(){

  loadPixels();
  
  if(mousePressed || mouseDragged) { stroke(0); fill(0); rect(mouseX-25, mouseY-25, 50, 50); }
   
  for(int i = 0; i < racers.size(); i++){
   
    racer thisRacer = (racer) racers.get(i);
    thisRacer.tick();
    
    // find out if the racer needs to change direction
    color colorAtRacerPos = pixels[(thisRacer.posY * 900) + thisRacer.posX];

    if(red(colorAtRacerPos)!= 0 || green(colorAtRacerPos)!= 0 || blue(colorAtRacerPos)!= 0)
    {
      thisRacer.direction = int(random(8));
    } 
    else 
    {
      stroke((thisRacer.clrR), (thisRacer.clrG), (thisRacer.clrB) );
      point(thisRacer.posX, thisRacer.posY);
    } 
        
  }
   
}

class racer {
  
 int posX;
 int posY;
 int direction;
 float clrR, clrG, clrB;

 racer(){
  
  posX = 450;
  posY = 225;
  clrR = random(0.0, 33.0);
  clrG = random(0.0, 66.0);
  clrB = random(128.0, 255.0);
  direction = int(random(8));
   
 } 
 
 void tick(){
  
  if(direction == 0) { posX--; }
  else if(direction == 1) { posX++; }
  else if(direction == 2) { posY--; }
  else if(direction == 3) { posY++; }
  
  else if(direction == 4) { posX++; posY++; }
  else if(direction == 5) { posY--; posX++; }
  else if(direction == 6) { posY++; posX--; }
  else if(direction == 7) { posY--; posX--; }
  
  if(posX < 0){posX = 899;}
  if(posY < 0){posY = 449;}
  if(posX >= 900) { posX = 0; }
  if(posY >= 450) { posY = 0; }
  
 } 
  
}
                                                                                                                                
