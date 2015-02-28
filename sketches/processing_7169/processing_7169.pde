
/*
 * --=[DISTANCE TEST]=--
 * by Jonsku, December 2009
 * --
 * Space Bar : toggle trail effect
 * 't'       : toggle territory limits display
 * 'a'       : toggle moving particles display
 * 's'       : toggle static particles display
 * 'r'       : toggle 'Go Nuts!' mode (On by default)
 *
 * UP arrow    : increase number of static particles
 * DOWN arrow  : decrease number of static particles
 * RIGHT arrow : increase territory radius
 * LEFT arrow  : decrease territory radius
 * NOTE: Pressing any of the arrow key while 'Go Nuts!' mode is activated will deactivate it.
 *
 * Click anywhere to add a static particle at the position of the mouse pointer
 */

class Thing {
  PVector position;
  int colour;

  public Thing(PVector position, int colour){
    this.position = position;
    this.colour = colour;
  }

  public float dist(){
    return position.dist(new PVector(0,0));
  }
}

class Ant {
  PVector position;
  PVector center;
  float currentDirection = 0;
  float directionChangeProba = 0.7;

  public Ant(PVector position, PVector center){
    this.position = position;
    this.center = center;
  }

  public void update(){
    if(position.dist(center)>territoryRadius){
      currentDirection = atan2(center.y-position.y,center.x-position.x);
    }
    else if(random(1)< directionChangeProba ){
      currentDirection += random(1)<0.5?radians(5):-radians(5);
    }

    position.add(new PVector(cos(currentDirection),sin(currentDirection)));
  }

  public void draw(){
    fill(255);
    noStroke();
    pushMatrix();
    translate(position.x,position.y);
    rotate(currentDirection);
    beginShape(TRIANGLES);
    vertex(-5, -5);
    vertex(8, 0);
    vertex(-5, 5);
    endShape();
    popMatrix();
  }

  public void findNearest(ArrayList things){
    Thing closest = null;
     for(int j=0;j<things.size();j++){
    Thing t = (Thing)things.get(j);
      if(closest == null || (closest.position.dist(position)>t.position.dist(position)))
        closest =  t; 
    }
    if(closest!=null){
      stroke(closest.colour);
      line(closest.position.x,closest.position.y,position.x,position.y);
    }
  }
}


boolean trailOn = true;
boolean showAnts = false;
boolean showTerritory = false;
boolean showThings = false;
boolean goNuts = false;

int bufferSize;
int bufferDuration;

ArrayList things;
ArrayList ants;
float distances;
float territoryRadius = 100;

int thingsCount;
int targetRadius;

//float angle = 1;

void setup(){
  size(600,600);
  
  things = new ArrayList();
  ants = new ArrayList();
  PVector center = new PVector(width/2,height/2);
  for(int i=0;i<500;i++){
    ants.add(new Ant(new PVector(random(0,width),random(0,height)),center));
    
  }
  
  for(int i=0;i<10;i++){
    addThing(new PVector(random(0,width),random(0,height)));
  }
  goNuts = true;
  initNutsMode();
}

void draw(){
 if (keyPressed == true) {
    if(keyCode == DOWN && things.size()>0){
      goNuts = false;
      things.remove(things.size()-1);
    }else if(keyCode == UP){
      goNuts = false;
      addThing(new PVector(random(width/2-territoryRadius/2,width/2+territoryRadius/2),random(height/2-territoryRadius/2,height/2+territoryRadius/2)));
    }else if(keyCode == RIGHT){
      goNuts = false;
      territoryRadius++;
    }else if(keyCode == LEFT){
      goNuts = false;
      territoryRadius--;
    }
  }
  
  if(goNuts){
    if(territoryRadius>targetRadius){
      territoryRadius--;
    }else if(territoryRadius<targetRadius){
     territoryRadius++;
    }else{
       targetRadius = int(width*2*noise(1,frameCount));
    }
    
    if(things.size()>thingsCount){
      things.remove(things.size()-1);
    }else if(things.size()<thingsCount){
     addThing(new PVector(random(width/2-territoryRadius/2,width/2+territoryRadius/2),random(height/2-territoryRadius/2,height/2+territoryRadius/2)));
    }else{
      thingsCount = int(50*noise(10,frameCount));
    }
  }
  
  if(trailOn){
    fill(0,0,0,5);
    rect(0,0,width,height);
  }else{
    background(0);
  }
  
  if(showTerritory){
    pushStyle();
    noFill();
    stroke(200);
    strokeWeight(5);
    ellipse(width/2,height/2,territoryRadius*2,territoryRadius*2);
    popStyle();
  }
  
  
  //scale(angle);
  if(showThings){
   for(int j=0;j<things.size();j++){
      Thing t = (Thing)things.get(j);
      fill(t.colour);
      ellipse(t.position.x,t.position.y,10,10);
    }
  }
  for(int i=0;i<ants.size();i++){
    Ant a = (Ant)ants.get(i);
    a.update();
    if(showAnts)
      a.draw();
    a.findNearest(things);
  }
}

int getClosest(float[] arr, float value){
  if(arr.length<1)
    return -1;
  else if(arr.length==1)
    return 0;

  int start = 0;
  int end = arr.length;
  int middle = floor(end/2);
  //println(middle);
  float closestVal = arr[middle];
  while((end-start)>=3 && arr[middle]!=value){
    println(middle);
    if(arr[middle]>value){
      end = middle;
    }
    else{
      start = middle; 
    }
    middle = start+floor((end-start)/2);
  }
  if(middle<1){
    return middle;
  }
  if(abs(value-arr[middle-1])<abs(value-arr[middle])){
    return middle-1;
  }
  else{
    return middle;
  } 
}

void keyReleased(){
  if(key==' '){
     trailOn = !trailOn;
    }else if(key=='t'){
     showTerritory = !showTerritory;
    }else if(key=='a'){
     showAnts = !showAnts;
    }else if(key == 's'){
      showThings = !showThings;
    }else if(key == 'r'){
      goNuts = !goNuts;
      if(goNuts){
        initNutsMode();
      }
    }
}

void initNutsMode(){
   trailOn = true;
        showTerritory = false;
        showAnts = false;
        showThings = false;
        int thingsCount = int(100*noise(10,frameCount));
        targetRadius = int(width*2*noise(1,frameCount));
}


void mousePressed(){
  addThing(new PVector(mouseX,mouseY));
}

void addThing(PVector pos){
  int col = color(random(1,256),random(1,256),random(1,256));
  Thing newThing = new Thing(pos,col);
  things.add(newThing);
}




