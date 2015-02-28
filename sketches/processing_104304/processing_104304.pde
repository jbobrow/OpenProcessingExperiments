


Maxim maxi;
AudioPlayer[] players = new AudioPlayer[3];
boolean buttonOn;
int elements = 20;
int nodes =3;
int tempo = 60; //0~255
node nodesToPlay1;
node nodesToPlay2;
node nodesToPlay3; //voice
int startTime;
boolean locked = false;

class node {
  int xpos, ypos;
  boolean activated = false;
  int size = 20;
  int playDelay = 0;
  
  node(int x, int y){
      xpos = x;
      ypos = y;
  }
  
  boolean isActive(){
    return activated;
  }
  
  void updatePos(int x, int y){
      xpos = x;
      ypos = y;
  }
  
  void setActive(boolean s){
    activated = s;
  } 
  
  void setDelay(int s){
    playDelay = (int) map(s, 0, dist(0,0,width/2,height/2), 0, 60/5);
    //println("The play delay is " + playDelay);
  }
  
  int getDelay(){
    return playDelay;
  }
  
  //box estimation
  boolean isHover(){
    if (mouseX >= (xpos - size) && mouseX <= (xpos + size) &&
        mouseY >= (ypos - size) && mouseY <= (ypos + size))
      return true;
    else
      return false;
  }
  
  int getX(){
    return xpos;
  }
  
  int getY(){
    return ypos;
  }
}

void setup() {
  
  size(1024, 768); //landscape mode'
  maxi = new Maxim(this); 
  
  players[0]=maxi.loadFile("syn5.wav");
  players[1]=maxi.loadFile("guitar2.wav");
  players[2]=maxi.loadFile("lo_tom.mp3"); 
  
  for (int i=0; i<nodes; i++)
  {
     players[i].setLooping(true);
  }
  
  //frameRate(20); //for performance adjustment
  
  noStroke();
  rectMode(CENTER);
  background(0);
  buttonOn = false;
  colorMode(HSB);
  
  nodesToPlay0 = new node(width/2-20, height/2-20);
  nodesToPlay1 = new node(width/2+20, height/2-20);
  nodesToPlay2 = new node(width/2, height/2+20);

}

void draw() {
  int fillcolor = 180;
  int dimming = frameCount%255;

    background(0);
    //draw the tempo guide
    //TODO: smooth animation
    for (int i = tempo/3 ; i > 0;i--) {
      fillcolor = map(i, 0 , tempo, 130, 180);
      fill(fillcolor, 255 , dimming);
      ellipse(width/2, height/2, width/tempo*i*3, height/tempo*i*3);
    }
    
   //draw dots (nodes)
   if(!locked){
     fill(0, 0, 255);
     ellipse(nodesToPlay0.getX(), nodesToPlay0.getY(), 20, 20);
     fill(0, 170, 230);
     ellipse(nodesToPlay1.getX(), nodesToPlay1.getY(), 20, 20);
     fill(190, 0, 100); 
     ellipse(nodesToPlay2.getX(), nodesToPlay2.getY(), 20, 20);
   }
   
   playTogether();
}

void playTogether()
{
    if (buttonOn){//play if there is nodes added
    if (second() == startTime + nodesToPlay0.getDelay()){
         players[0].play();
    }
    if (second() == startTime + nodesToPlay1.getDelay()){
         players[1].play();
    }
    if (second() == startTime + nodesToPlay2.getDelay()){
         players[2].play();
    }
  }
  else //stop or pause
  {
    for (int j=0; j<3; j++)
    {
     players[j].stop();
    }
  }
}

void mousePressed(){

  if (dist(mouseX, mouseY, width/2, height/2) <= 20)
  { 
    buttonOn= !buttonOn;
    startTime = second();
  }
  
  if (nodesToPlay0.isHover() || nodesToPlay1.isHover() || nodesToPlay2.isHover()){
    locked = true;
    fill (255, 255, 255);
  }
}

void mouseDragged(){
  if (locked){
    if (nodesToPlay0.isHover()){
      nodesToPlay0.setDelay( dist(nodesToPlay0.getX(), nodesToPlay0.getY(), width/2, height/2));
      nodesToPlay0.updatePos(mouseX, mouseY);
    }
    else if (nodesToPlay1.isHover()){
      nodesToPlay1.setDelay( dist(nodesToPlay1.getX(), nodesToPlay1.getY(), width/2, height/2));
      nodesToPlay1.updatePos(mouseX, mouseY);
    }
    else if (nodesToPlay2.isHover()){
      nodesToPlay2.setDelay( dist(nodesToPlay2.getX(), nodesToPlay2.getY(), width/2, height/2));
      nodesToPlay2.updatePos(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  locked = false;
}



