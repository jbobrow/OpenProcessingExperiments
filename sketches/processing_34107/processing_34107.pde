
/*
 * Mountaintop Party 
 * (c) Andy Wallace
 * 2010
 *
 * Bike and Person images from Clker.com. These images are public domain.
 *
 * Press left or right arrow to control the people manually
 * Press space to return it to automatic control
 */

//weights
Weight[] people=new Weight[0];  //holds all of the people
Weight[] weights=new Weight[0];  //holds all other weights
Weight[] falling=new Weight[0];  //holds all objects that have fallen off the board
Weight[] newWeights=new Weight[0];  //holds the new objects falling from the top of the screen

//world info
int startWaitTime=200;  //time to wait before things start falling
int startTimer=0;  //timer before things start falling

float fallSpeed=5;  //rate at which falling objects move

float center;  //the x  value of the fulcrum
float yShift;  //the y value of the fulcrum
float boxX, boxWidth, boxHeight;  //x value and width, hieght of the box

float rot=0;  //how tiled the board is
float maxRot=60;  //how far the board can rotate in either direction

//images
PImage person;
PImage statue;
PImage bike;
PImage plant;

//title
PFont titleFont;  //font that the title will appear in
int letterCount=0;  //keeps track of which letter we're on when writing the title
String[] titleLetters= {
  "M","O","U","N","T","A","I","N","T","O","P"," ","P","A","R","T","Y"
};

//player control
boolean playerControl=false;
boolean leftDown=false;
boolean rightDown=false;
int idleTimer=0;  //amount of time of not being used before player control is turned off
int idleMax=500;

void setup() {
  smooth();
  size(800,700);
  center=width/2;
  yShift=450;

  boxX=-center*0.8;
  boxWidth=width*0.8;
  boxHeight=200;

  //images
  person= loadImage("person.png");
  statue= loadImage("statueOutline.png");
  bike= loadImage("bike.png");
  plant= loadImage("plant.png");
  titleFont = loadFont("TrebuchetMS-48.vlw");  //make sure this is on whatever computer is being used

  //add people
  people=(Weight[])append(people, new Weight(-boxWidth*2/3,-50,50,"person"));  //big guy
  people[people.length-1].walk=6;
  people=(Weight[])append(people, new Weight( (boxWidth*2/3)*0.47619,-35,35,"person"));  //mid guy
  people[people.length-1].walk=8;
  people=(Weight[])append(people, new Weight(boxWidth*2/3,-25,25,"person"));  //lil guy
  people[people.length-1].walk=12;

  //throw in a table
  weights=(Weight[])append(newWeights, new Weight(0,-25,50,"table"));
  weights[weights.length-1].inside=true;  //make sure it's inside

    //add letters. Uses titleLetters[]
  float letterSize=40;
  for(int i=0;i<titleLetters.length;i++) {
    weights=(Weight[])append(weights, new Weight(-boxWidth/2+letterSize*i,-boxHeight-letterSize/2,letterSize,"letter"));
  }
}

void draw() {
  background(#CAFAF9);

  //adjust rotation according to each weight on the board
  //this has to be done first so that the sliding objects will behave correctly
  for(int i=0; i<weights.length; i++) {
    weights[i].AdjustRotation();
  }
  for(int i=0; i<people.length; i++) {
    people[i].AdjustRotation();
  }

  //draw everything centerred around 0,0 then translate/rotate it into place
  pushMatrix();
  translate(center,yShift);
  //draw the background -  D0 this before rotation
  DrawBackground();

  rotate(radians(rot));

  DrawBox();  //the box that hold everything happening

  //deal with all other weights
  for (int i=0;i<weights.length;i++) {
    weights[i].Update();
  }
  //deal with the people
  for (int i=0;i<people.length;i++) {
    people[i].Update();
  }

  //make the new weights fall
  UpdateNewWeights();

  popMatrix();

  //now that we're outside of the matrix, draw the falling objects
  UpdateFalling();

  //make the people run around and try to compensate for the weights
  MovePeople();

  //if enough time has passed, start trying to spawn new weights
  if (++startTimer>startWaitTime)
    NewWeights();

  //if the player has gone for too long without touching the controls, turn player control off
  if (++idleTimer==idleMax)
    playerControl=false;
}

//may or may not create new weights depending on teir probability
void NewWeights() {
  if (random(100)>99)
    SpawnWeight("rock");
  if (random(2000)>1999) {
    SpawnWeight("personTop");
  }
  if (random(1000)>999) {
    SpawnWeight("statue");
  }
  if (random(500)>499) {
    SpawnWeight("bike");
  }
  if (random(2000)>1999) {
    SpawnWeight("table");
  }
}

//draws the background
void DrawBackground() {
  //main mountain
  fill(150);
  beginShape();
  vertex(-100,250);
  vertex(0,0);
  vertex(100,250); 
  endShape();
  //snow cap
  fill(255);
  beginShape();
  vertex(-50,125);
  vertex(0,0);
  vertex(50,125);
  vertex(30,180);
  vertex(5,135);
  vertex(-40,190);
  endShape(CLOSE);
}

//creates new weights with random attributes
void SpawnWeight(String type) {
  if (type=="rock") {
    newWeights=(Weight[])append(newWeights, new Weight(
    random(-boxWidth/2,boxWidth/2),  //x
    -500,  //y
    random(25,60),   //size
    "rock"));  //type
  }
  else if (type=="personTop") {
    newWeights=(Weight[])append(newWeights, new Weight(
    random(-boxWidth/2,boxWidth/2),  //x
    -500,  //y
    random(30,40),   //size
    "personTop"));  //type
  }
  else if (type=="statue") {
    newWeights=(Weight[])append(newWeights, new Weight(
    random(-boxWidth/2,boxWidth/2),  //x
    -500,  //y
    random(60,100),   //size
    "statue"));  //type
  }
  else if (type=="bike") {
    newWeights=(Weight[])append(newWeights, new Weight(
    random(-boxWidth/2,boxWidth/2),  //x
    -500,  //y
    random(50,90),   //size
    "bike"));  //type
  }
  else if (type=="table") {
    newWeights=(Weight[])append(newWeights, new Weight(
    random(-boxWidth/2,boxWidth/2),  //x
    -500,  //y
    random(25,75),   //size
    "table"));  //type
  }
}

void UpdateNewWeights() {
  for(int i=0;i<newWeights.length; i++) {
    newWeights[i].y+=fallSpeed;

    //has it reached the board?
    float topMidY=boxHeight*sin(radians(rot-90));
    float topMidX=boxHeight*cos(radians(rot-90));
    if (newWeights[i].y+newWeights[i].h/2>topMidY+(newWeights[i].x-topMidX)*sin(radians(rot))) {
      //set the y value to line up with theboard
      newWeights[i].y=-boxHeight-newWeights[i].h/2;
      //set the x value to be where it hit the board
      newWeights[i].x-=topMidX;

      //add the object to weights
      if (newWeights[i].type!="personTop")
        weights=(Weight[])append(weights,newWeights[i]);
      else
        people=(Weight[])append(people,newWeights[i]);
      //remove it from newWeights
      newWeights=(Weight[])RemoveOne(newWeights,i);
    }
    else {
      //draw the object if it wasn't removed from the newWeights array
      pushMatrix();
      rotate(radians(-rot));
      newWeights[i].Draw();
      popMatrix();
    }
  }
}

//moves falling objects and draws them
void UpdateFalling() {
  for (int i=0; i<falling.length; i++) {
    falling[i].y+=fallSpeed;  //increase the y value
    falling[i].Draw();        //draw the object

    //is it off screen?
    if (falling[i].y>height+200)
      falling=(Weight[])RemoveOne(falling,i);
  }
}

//moves all of the people in an attempt to balance the board
void MovePeople() {
  float mod = map(abs(rot),-maxRot,maxRot,0,1);   //at what percent of their speed should the people move?
  //If the player is not controlling, move the people automatically
  if (!playerControl) {
    for (int i=0;i<people.length;i++) {
      if (rot+2*people[i].RelativeWeight()<0)    //if they could just stay where they are and it would even out in 2 frames, don't move them
        people[i].x+=people[i].walk*mod; 
      else if (rot+2*people[i].RelativeWeight()>0)
        people[i].x-=people[i].walk*mod;
    }
  }
  else {
    //let the player move the people
    for (int i=0;i<people.length;i++){
      if (leftDown)  //move left
        people[i].x-=people[i].walk*mod;
      if (rightDown)  //move left
        people[i].x+=people[i].walk*mod;
    }
  }
}

//draws the box the game is played in/on
void DrawBox() {
  rectMode(CORNER);
  fill(230);
  rect(boxX,-boxHeight,boxWidth,boxHeight);
}

//takes an array of Weights and removes the weight at value k
//why can't Processing include this as a standard array function?
Weight[] RemoveOne(Weight ar[], int k) {
  Weight[] left=new Weight[ar.length];   //arrays to hold left and right sides of the arry
  Weight[] right=new Weight[ar.length]; 

  left=(Weight[])subset(ar,0,k);  //everything to the left of k
  right=(Weight[])subset(ar,k+1);  //everyhitng to the right of k
  return((Weight[])concat(left,right));
}

//check if a key is down. If left or right was pressed, adjust leftDown or rightDown and give the player control
//if space is down, give control back over to the game
void keyPressed() {
  if (keyCode==37) {  //left
    leftDown=true;
    playerControl=true;
    idleTimer=0;
  }
  if (keyCode==39) {  //right
    rightDown=true;
    playerControl=true;
    idleTimer=0;
  }
  if (keyCode==32)  //space
    playerControl=false;
}

//check when a key is released if we need to update leftDown or rightDown
void keyReleased() {
  if (keyCode==37)  //left
    leftDown=false;
  if (keyCode==39)  //right
    rightDown=false;
}

//WEIGHT CLASS
//every object in the game that can tilt the room is a Weight.
class Weight {
  float x,y;  //x and y locations
  float w,h;  //width and height
  float weight;  //how heavy the object is
  float slide;  //speed at which the object will slide
  float walk;  //speed at which the object walks. Not all objects will use this
  String type;  //name of the type the object belongs to
  boolean inside;  //determines if the object is inside the box or not.
  String info;  //extra info about the object. Currently only used for letter

  //constructor
  Weight(float newX, float newY, float newSize, String newT) {
    //define the values
    x=newX;
    y=newY;
    type=newT;
    inside=false;  //assume the object is outside
    if (type=="person") {
      walk=random(6,12);  //gives the person a walk value bewteen 6 and 12
      inside=true;
      weight=0.02*newSize;
      slide=0;  //The people inside the box should not slide at all.
      w=newSize*1.2;
      h=newSize*2;
    }
    else if (type=="personTop") {
      walk=random(6,12);  //gives the person a walk value bewteen 6 and 12
      inside=false;
      weight=0.02*newSize;
      slide=0.1*newSize;
      w=newSize*1.2;
      h=newSize*2;
    }
    else if (type=="bike") {
      weight=0.005*newSize;  //light object
      slide=500/newSize;  //slides quickly. Bigger bikes will slide more slowly
      w=newSize*1.6;
      h=newSize;
    }
    else if (type=="statue") {
      weight=0.015*newSize;  //make it heavy
      slide=100/newSize;  //make it slide slowly. Also, heavier objects will slide more slowly
      w=newSize*0.9;
      h=newSize*2;  //should be tall
    }
    else if (type=="rock") {    //This is the standard objects. Most of the other levels use "rock" at size 50 as their starting point
      weight=0.01*newSize;
      slide=0.1*newSize;
      w=newSize*1.3;
      h=newSize;
    }
    else if (type=="table") {
      weight=0.017*newSize;
      slide=0.01*newSize;  //table should slide slowly
      w=newSize*2;
      h=newSize;
    }
    //PLANT DOES NOT WORK YET. MAYBE IT NEVER WILL
    else if (type=="plant") {    //plant will grow and become more heavy over time
      weight=0.01*newSize;  //start it light
      slide=0.03*newSize;  //make it slide slowly
      w=newSize;
      h=newSize;
    }
    else if (type=="letter") {
      weight=0;  //letters have no wait
      slide=1;   //havng no wait, they can have constant slide 
      w=newSize;
      h=newSize*1.2;
      info=titleLetters[letterCount++];
    }
  }

  void AdjustRotation() {
    //adjust the board roattion if the board isn't already too far in one direction
    if ( (RelativeWeight()>0 && rot<maxRot) || (RelativeWeight()<0 && rot>-maxRot) )
      rot+=RelativeWeight();
  }

  //update should be called each frame and handles everything that needs to be done or checked on the object
  void Update() {
    //slide the object
    x+=slide*map(rot,-maxRot,maxRot,-1.5,1.5);  //the larger the rotation, the faster the object should move

    //if the object is inside, stop it if it hit the wall
    InsideCheck();

    //if it's on top, check if it has gone off the edge
    OffEdgeCheck();

    //draw the object
    Draw();
  }

  //check if an object inside the box has hit the wall
  void InsideCheck() {
    if (inside) {
      //is the object too far left
      while (x-w/2<boxX)
        x++;
      //is it too far right?
      while (x+w/2>boxX+boxWidth)
        x--;
    }
  }

  //check if an object on top has fallen off the edge and deal with it if it has
  void OffEdgeCheck() {
    //if it's on the top, check if it's fallen off the edge
    if (x<boxX-w/2 || x>boxX+boxWidth+w/2) {
      //add it to the falling array
      falling=(Weight[])append(falling, this);

      //reset the x and y values to be where it is on screen without the translation
      //first, get the fulcrum of the top
      float topMidX=center+boxHeight*cos(radians(rot-90));
      float topMidY=yShift+boxHeight*sin(radians(rot-90));

      //now reset the x and y according to that
      if (x>boxX+boxWidth+w/2) {  //which side of the box is the weight on?
        x=topMidX+(boxWidth/2+w/2)*cos(radians(rot));
        y=topMidY+(boxWidth/2+w/2)*sin(radians(rot));
      }
      else {
        x=topMidX+(-boxWidth/2-w/2)*cos(radians(rot));
        y=topMidY+(-boxWidth/2-w/2)*sin(radians(rot));
      }

      //remove it from the weights array
      if (type!="personTop") {  //as long as it's not a person, remove it from the weights array
        for (int i=0; i<weights.length; i++) {
          //go through the array and figure out which one fell off
          if (weights[i]==this) {
            //now remove it
            weights=RemoveOne(weights,i);
          }
        }
      }
      else {    //and if it is a person, remove it from the people array
        for (int i=0; i<people.length; i++) {
          //go through the array and figure out which one fell off
          if (people[i]==this) {
            //now remove it
            people=RemoveOne(people,i);
          }
        }
      }
    }
  }

  //RelativeWeight returns the value of the objects weight adjusted depending on how far it is from the fulcrum
  float RelativeWeight() {
    float distance=map(x,-width/2,width/2,-1.5,1.5);  //maps the distance to a range between 0 and 1.5
    return(weight*distance);
  }

  //Draw draws the object on the screen
  void Draw() {
    if (type=="person" || type=="personTop") {
      //scale the image size for the person png
      pushMatrix();
      scale(h/person.height);
      image(person,(x-w/2)*(person.height/h),(y-h/2)*(person.height/h));
      popMatrix();
    }
    else if(type=="statue") {
      pushMatrix();
      scale(h/statue.height);
      image(statue,(x-w/2)*(statue.height/h),(y-h/2)*(statue.height/h));
      popMatrix();
    }
    else if(type=="bike") {
      pushMatrix();
      scale(h/bike.height);
      image(bike,(x-w/2)*(bike.height/h),(y-h/2)*(bike.height/h));
      popMatrix();
    }
    else if (type=="rock") {
      stroke(0);
      //draw handle
      noFill();
      rectMode(CORNER);
      rect(x-w/8,y-h/2-h/8,w/4,h/8);
      //draw bulk of the shape
      fill(100);
      beginShape();
      vertex(x-w/2,y+h/2);
      vertex(x-w/4,y-h/2);
      vertex(x+w/4,y-h/2);
      vertex(x+w/2,y+h/2);
      endShape(CLOSE);
    }
    else if (type=="table") {
      stroke(0);
      strokeWeight(4);
      line(x-w/2,y-h/2,x+w/2,y-h/2);  //top
      line(x-w/2+(w/9),y-h/2,x-w/2+(w/9),y+h/2);  //left leg
      line(x+w/2-(w/9),y-h/2,x+w/2-(w/9),y+h/2);  //rightleg
      strokeWeight(1);  //reset it for eveyrbody else
    }
    else if (type=="letter") {
      rectMode(CENTER);    //this affects Font.
      textFont(titleFont);
      fill(0);
      text(info,x+w/2,y+h/2,80,80);
    }
    /*    IT WOULD BE LOVELY IF THIS WORKED BUT IT DOESN'T
     else if (type=="plant") {
     //draw the plant
     pushMatrix();
     scale(weight);  //plant image should get larger as weight increases
     image(plant,(x-w*.7)/weight, (y-h*(weight*2)/weight) );
     popMatrix();
     //draw the pot
     fill(#AA6A35);  //brown
     beginShape();
     vertex(x-w/2,y-h/2);
     vertex(x+w/2,y-h/2);
     vertex(x+w/3,y+h/2);
     vertex(x-w/3,y+h/2);
     endShape(CLOSE);
     }
     */
  }
}



