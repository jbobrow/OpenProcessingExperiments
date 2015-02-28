
public class PhysicsWorm extends PApplet{
  private static final long serialVersionUID = 7900142286617591973L;
  
  private HashMap<Object, Boolean> keyboard = new HashMap<Object, Boolean>();
  private short controlMode = MOUSE;
  private static final short KEYBOARD=0, MOUSE=1;
  
  final int BG = 0xFF382111;
  final int snakeColor = 0xFF888888;
  final int obsColor = 0xFF822E04;
  final int pupColor = 0xFF0000FF;
  final int winColor = 0xFF000000;
  PFont font;
  
  
  float direction = 0;
  
  boolean win;
  
  float   segLength = 5f,
      segStretch = .5f,
      segCompress = 1f;
  
  final int maxSegCount = 200;
  int segCount = 10, segGrowth = segCount;
  byte growInt;
  float   xPos[] = new float[maxSegCount],
      yPos[] = new float[maxSegCount],
      heading;
  
  final int obsCount = 800;
  float  obsX[] = new float[obsCount],
      obsY[] = new float[obsCount],
      obsR[] = new float[obsCount],
      obsF[] = new float[obsCount];
  
  final int  pupCount = 10,
        pupBoost = 5;
  float  pupX[] = new float[pupCount],
      pupY[] = new float[pupCount],
      pupSize = 10;
  int    pupT[] = new int[pupCount];
      
  @Override
  public void setup(){
    size(768,512);
    background(BG);
    strokeWeight(3);
    font = createFont("Arial Black", 36, true);
    textFont(font, 36);
    textAlign(CENTER);
    
    colorMode(HSB);
    
    keyboard.put(UP,false);
    keyboard.put(DOWN,false);
    keyboard.put(LEFT,false);
    keyboard.put(RIGHT,false);
    keyboard.put(' ',false);
    
    for(int i = 0; i < segCount; i++){
      xPos[i] = width/2f + segLength*i ;//+ segLength*segCount/TWO_PI*cos(TWO_PI*i/segCount);
      yPos[i] = height/2f ;//+ segLength*segCount/TWO_PI*sin(TWO_PI*i/segCount);;
    }
    for(int i = 0; i < obsCount; i++){
      obsX[i] = random(0,width);
      obsY[i] = random(0,height);
      
      obsR[i] = 20;
      obsF[i] = .5f;
      //if(obsF[i] < .5f) obsF[i]+=.5f;
    }
    for(int i = 0; i < pupCount; i++){
      pupX[i] = random(0,width);
      pupY[i] = random(0,height);
      pupT[i] = (int)random(0,0);
    }
  }
  
  
      

  @Override
  public void draw(){
    switch(controlMode){
    case KEYBOARD:
      if((keyboard.get(DOWN)^keyboard.get(UP))||(keyboard.get(LEFT)^keyboard.get(RIGHT)))
          direction = atan2((keyboard.get(DOWN)?1:0)-(keyboard.get(UP)?1:0),
                (keyboard.get(RIGHT)?1:0)-(keyboard.get(LEFT)?1:0));
      break;
    case MOUSE:
    default:
       direction = atan2(mouseY-yPos[0], mouseX-xPos[0]);
      
      break;
    }
    xPos[0] += cos(direction);
    yPos[0] += sin(direction);
    
    xPos[0] = min(max(xPos[0],0),width);
    yPos[0] = min(max(yPos[0],0),height);
    
    
    //*/
    
    for(int i = 0; i < segCount; i++){
      
      for(int j = 0; j < obsCount; j++){//obstacle-snake collision
        
        float overlap =  (segLength+obsR[j])/2 - dist(xPos[i],yPos[i],obsX[j],obsY[j]);
        
        if(overlap > 0){
          
          heading = atan2(yPos[i]-obsY[j], xPos[i]-obsX[j]);
          obsX[j]-= obsF[j]*overlap*cos(heading);
          obsY[j]-= obsF[j]*overlap*sin(heading);
          
          overlap = dist(xPos[i],yPos[i],obsX[j],obsY[j]) - ((segLength+obsR[j])/2);
          xPos[i] = obsX[j] + (segLength+obsR[j])/2*cos(heading);
          yPos[i] = obsY[j] + (segLength+obsR[j])/2*sin(heading);
        }
      }
      
      for(int j = segCount-1; j >= 0; j--)//snake-snake collison
        if(i!=j && i+1!=j && i-1!=j && dist(xPos[i], yPos[i], xPos[j], yPos[j])  < 4/3*segLength ){
          heading = atan2(yPos[j]-yPos[i], xPos[j]-xPos[i]);
          xPos[i] = (xPos[j]-segLength*cos(heading) + segCompress*xPos[i])/(segCompress + 1);
          yPos[i] = (yPos[j]-segLength*sin(heading) + segCompress*yPos[i])/(segCompress + 1);
        }
      
      if(i >=1){//linkage
        heading = atan2(yPos[i-1]-yPos[i], xPos[i-1]-xPos[i]);
        xPos[i] = (xPos[i-1] - segLength*cos(heading) + segStretch * xPos[i])/(segStretch + 1);
        yPos[i] = (yPos[i-1] - segLength*sin(heading) + segStretch * yPos[i])/(segStretch + 1);
      }
      
      for(int j = 0; j < pupCount; j++)//powerup collection
        if(dist(xPos[i], yPos[i], pupX[j], pupY[j])  < (pupSize+segLength)/2){
          pupX[j] = random(0, width);
          pupY[j] = random(0, height);
          segGrowth += pupBoost;
          
        }
    }
    
    for(int i = 0; i < obsCount; i++){//obstacle-obstacle collision
        
        obsX[0] = min(max(obsX[0],0),width);
        obsY[0] = min(max(obsY[0],0),height);
    
      float overlap;
      for(int j = 0; j < obsCount; j++){
        overlap = (obsR[i]+obsR[j])/2 - dist(obsX[i], obsY[i], obsX[j], obsY[j]);
        
        if(overlap > 0){
          heading = atan2(obsY[i]-obsY[j], obsX[i]-obsX[j]);
          obsX[j]-= overlap*obsF[j]*cos(heading);
          obsY[j]-= overlap*obsF[j]*sin(heading);
          obsX[i]+= overlap*obsF[i]*cos(heading);
          obsY[i]+= overlap*obsF[i]*sin(heading);
        }
      }
    }
    
    if (segGrowth > maxSegCount) win = true;
    
    if(segGrowth > segCount && growInt-- == 0 && !win) {
      growInt = 4;
      xPos[segCount] = xPos[segCount-1];
      yPos[segCount] = yPos[segCount-1];
      segCount++;
    }
    
    
    background(BG);

    noStroke(); //obstacle display
    fill(obsColor);
    for(int i = 0; i < obsCount; i++)  
      ellipse(obsX[i],obsY[i],obsR[i]+segLength,obsR[i]+segLength);
    
    fill(pupColor); //powerup display
    for(int i = 0; i < pupCount; i++)
      ellipse(pupX[i],pupY[i],pupSize,pupSize);
    
    stroke(snakeColor); //snake display
    for(int i = 1; i < segCount; i++)
      line((float)xPos[i-1], (float)yPos[i-1], (float)xPos[i], (float)yPos[i]);
    
    if(win){
      fill(winColor);
      text("You Win", width/2, height/2);
    }
    
  }
  
  
  public void keyPressed(){
    if(key == CODED /*|| keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT*/){
      keyboard.put(keyCode, true);
  //    if(keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
        controlMode = KEYBOARD;
    }else
      keyboard.put(key, true);
  }
  
  public void keyReleased(){
    if(key == CONTROL || keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
      keyboard.put(keyCode, false);
    else
      keyboard.put(key, false);
  }
  
  public void mousePressed(){
    controlMode = MOUSE;    
  }

}

