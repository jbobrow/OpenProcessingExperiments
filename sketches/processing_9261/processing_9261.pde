
/*
Isobel Scanlon 3098536
 
 This work is inspired by rain droplets in a puddle. i wanted the user to interact and 'start' the rain
 falling. 
 
 The starting point for the code was the 'leaves' example from Monica in class. I then expanded on this
 to create the droplets becoming larger, and then in turn have then fade in and out.
 
 I feel I have grasped the ideas behind arrays and conditions, and although this animation is rather basic
 I think the understanding of the principles are there. I am looking forward to stretching my knowledge
 and application to the next assignment. 
 
 Being a first-time processer, I experimented with a lot of ways of doing things. With some hits and many
 misses this is the resulting code. To learn further from this exercise I plan to discuss with Monica 
 ways of building on what I have created.
 */

//i wanted to 'nest' the inner droplet rings within the array
int[] xPos = {
  100,100,100,30,30,30,200,200,200,70,70,70,250,250,250,190,190,190};
int[] yPos = {
  50,50,50,150,150,150,70,70,70,250,250,250,150,150,150,190,190,190};
//this determines the 'rings' size
int[] innerDrops = {
  40,30,20,30,20,10,70,60,50,40,30,20,20,10,5,50,40,30};
boolean[] click = {
  false,false,false,false,false,false,false,false,false,false,false,
  false,false,false,false,false,false,false};
boolean[] clickAgain = {
  false,false,false,false,false,false,false,false,false,false,false,
  false,false,false,false,false,false,false};

//these are duplicates of the original but dont change over time so we can
//reset in keyPressed
int[] xPosOrig = {
  100,100,100,30,30,30,200,200,200,70,70,70,250,250,250,190,190,190};
int[] yPosOrig = {
  50,50,50,150,150,150,70,70,70,250,250,250,150,150,150,190,190,190};
int[] innerDropsOrig = {
  40,30,20,30,20,10,70,60,50,40,30,20,20,10,5,50,40,30};
boolean[] clickOrig = {
  false,false,false,false,false,false,false,false,false,false,false,
  false,false,false,false,false,false,false};
boolean[] clickAgainOrig = {
  false,false,false,false,false,false,false,false,false,false,false,
  false,false,false,false,false,false,false};

void setup(){
  size(300,300);
}

void draw(){
  background(255);
  //first click increases droplet size until they are 150, and upon clicking again start the 'rain' effect
  for (int i=0; i<xPos.length; i++){
    if ((click[i]==true) && (innerDrops[i]<=150)){
      innerDrops[i]++;
    } 
    else if ((clickAgain[i]==true) && (innerDrops[i]>=150)){
      innerDrops[i]=innerDrops[i]*-1;
    }
    //i like the transparent nature of alpha, i feel it fits with my 'water' theme
    fill (0,10,255,70);
    noStroke();
    ellipse(xPos[i],yPos[i],innerDrops[i],innerDrops[i]);
  }
}
//the mousePress restrictions allow me to control what happens when the user clicks on a specific area
void mousePressed(){
  for(int i=0; i<xPos.length; i++){
    if((mouseX>xPos[i]-20) && (mouseX<xPos[i]+20) && (mouseY>yPos[i]-20) && (mouseY<yPos[i]+20)){
      click[i]=true;
    }
  }
  for(int i=0; i<xPos.length; i++){
    if((innerDrops[i]>=150) && (mouseX>xPos[i]-20) && (mouseX<xPos[i]+20) && (mouseY>yPos[i]-20) && (mouseY<yPos[i]+20)){
      clickAgain[i]=true;
    }
  }
}

void keyPressed () {
  //reseting to original values so we can start all over again
  for (int i=0; i<xPos.length; i++) {
    xPos[i] = xPosOrig[i];
    yPos[i] = yPosOrig[i];
    innerDrops[i] = innerDropsOrig[i] ;
    click[i] = clickOrig[i] ;
    clickAgain[i] = clickAgainOrig[i];
  }
}
//enjoy!



