
import megamu.mesh.*;


int pointAmount = 100;//number of terrain regions
Voronoi myVoronoi;
AICore homeCore;
float[][] points;
MPolygon myRegions[];
color regionColors[];
int lastGoodMouseX, lastGoodMouseY, timer, displayInt;
resourceSite resourceList[];

PFont myFont, myIngameFont;
PImage splashScreen, endScreen;
String introString, introString2, introString3, introString4, endTextGood, endTextBad1, endTextBad2;

boolean gameStopped, gameOver;


void setup(){
  size(1000,618);
  
  //intro screens stuff
  myFont = createFont("Courier", 15, false);
  textFont(myFont);
  splashScreen = loadImage("odoshi_land.jpg");
  endScreen = loadImage("odoshi_gameOver.jpg");
  introString = "(click mouse)";
  introString2 = " You are an AI.\n\n You have crash landed on an unknown planet.\n You must try to collect enough energy to escape, \n before you starve to death. \n\n (search for energy and metal with the cursor,\n build extraction drones by left clicking. \n they must be built close to each other \n press U to upgrade your AI \n if you upgrade all the way to level 10, \n you'll fly back to the safety of space).";
  introString3 = " The AI core is the dark circle. \n It shrinks as it is losing energy, \n and red rings flash when it is almost dead. \n\n Build drones on resource deposits to harvest \n metal and thermal energy. \n The cursor is greener \n the closer it is to a deposit. \n\n Drones cost 1 metal to build, \n and increase the energy drain by 0.001 \n Upgrades cost 5 metal and 1.5 energy";
  introString4 = "Good Luck!";
  endTextGood = "Blast Off!";
  endTextBad1 = " You're dead. But at least you reached ";
  endTextBad2 = " MIPS, \n and you managed to contemplate the mysteries of the universe \n in the final nanoseconds before you died.";
  
  
  points = new float[pointAmount][2];//not a 2D array exactly, but the Mesh library needs this arrangement to work. the inner array contains X and Y coords
  regionColors = new color[pointAmount];
  
  //generate resources
  int resourceAmount = 12;
  resourceList = new resourceSite[resourceAmount];
  for(int i=0; i<resourceList.length; i++){
    resourceList[i] = new resourceSite(int(random(0,2)));//the casting to int rounds down from .99 apparently, so making the random range 0-2 will output 0s and 1s randomly.
    println(resourceList[i].resourceType);
  }

  //generate points for the voronoi regions
  for(int i=0; i<points.length; i++)
  {
    int newPosX = int(random(0,width));
    int newPosY = int(random(0,height));
    points[i][0] = newPosX;
    points[i][1] = newPosY;
    regionColors[i] = color(110, random(200,255), 100);//random greenish grey color for each terrain region.
  }
  points[0][0] = mouseX;
  points[0][1] = mouseY;

  pointsToVoronoi(points);
  
  homeCore = new AICore(int(random(0,width)), int(random(0,height)));
  
  timer = 0;
  displayInt = 0;
  gameOver = false;
  gameStopped = true;
}

void draw(){
  
  if(gameStopped){//the game start state
    background(0);
    image(splashScreen, 0, 0);
    
    
    //controlling the text on the intro screen, switches by mouse click
    switch(displayInt) {
      case 0: 
        fill(255);
        text(introString, 400, 250);
        break;
      case 1: 
        fill(0, 170);
        noStroke();
        rect(445, 213, 450, 330);
        fill(255);
        text(introString2, 450, 230);
        break;
      case 2: 
        fill(0, 170);
        noStroke();
        rect(445, 213, 450, 330);
        fill(255);
        text(introString3, 450, 230);
        break;
      case 3: 
        fill(0, 170);
        noStroke();
        rect(445, 213, 450, 330);
        fill(255);
        text(introString4, 775, 520);
        break;
    }
  }
  
  else if(gameOver){//the game over state
    image (endScreen, 0, 0);
    smooth();
    fill(255, 255, 0);
    if(homeCore.upgradeLevel<10){
      text(endTextBad1+int(homeCore.energyLevel*homeCore.upgradeLevel*1000000)+endTextBad2, 250, 400);
    }
    else{
      text(endTextGood, width/2-50, height/2+100);
    }
    noSmooth();
  }
  
  else if(!gameOver && !gameStopped){//the active game state
    
    //the mouse moves the zeroth region around with it. it is try-catched because the mesh-library throws and exception when two points are overlapping, which i haven't been able to solve.
    noCursor();
    try
    {
      points[0][0] = mouseX;
      points[0][1] = mouseY;
      lastGoodMouseX = mouseX;
      lastGoodMouseY = mouseY;
      pointsToVoronoi(points);
    }
    catch (ArrayIndexOutOfBoundsException e){
      points[0][0] = lastGoodMouseX;
      points[0][1] = lastGoodMouseY;
      println("caught exception: mouse over region point");
    }
    
    
    //changing the cursor-region's color based on prozimity to resource spots
    float oldDist = 999;
    for(int i=0; i<resourceList.length; i++){
      float tempDist = dist(mouseX, mouseY, resourceList[i].posX, resourceList[i].posY);
      if(tempDist<oldDist){
        oldDist = tempDist;
      }
    }
    regionColors[0] = color(20, 255-oldDist, 20);//the mouse pointer's movable region is colored by its proximity to resources.
    
    
    myRegions = myVoronoi.getRegions();
    
    //draws the Voronoi as MPolygons
    for(int i=0; i<myRegions.length; i++)
    {
      noStroke();
      fill(regionColors[i]);
      myRegions[i].draw(this);
    }
   
    /* 
    //for testing, the resources can be made visible here.
    for(int i=0; i<resourceList.length; i++){
      resourceList[i].displaySite();
    }
    */
    //draw the AI Core at points[0]
    homeCore.displayCore();
    homeCore.displayDrones();
    homeCore.displayDroneConnections();
    
    //'HUD'
    fill(0, 50);
    noStroke();
    rect(10, 480, 220, 130);
    fill(200, 0, 0);
    text("Energy Level: "+int(homeCore.energyLevel), 20, 500);
    text("Metal: "+homeCore.metalLevel, 20, 530);
    text("AI [U]Pgrade Level: "+homeCore.upgradeLevel, 20, 560);
    text("MIPS: "+int(homeCore.energyLevel*homeCore.upgradeLevel*1000000), 20, 590);
    
    
    while(timer>5)//controlling the AI's energy consumption for balancing purposes.
    {
      homeCore.consumeResources(resourceList);
      timer = 0;
    }
    timer++;
    
    if(homeCore.energyLevel<0 || homeCore.upgradeLevel > 9){
      gameOver = true;
    }
  }
}


 //input control
void mouseReleased(){
  if(!gameStopped)
  {
    int newPosX = mouseX+int(random(4));//randomizes position because of a persistent bug with identical coordinates.
    int newPosY = mouseY+int(random(4));
    if(homeCore.sendDrone(homeCore.posX, homeCore.posY, newPosX, newPosY)){//tries to place a drone, returns a bool if a drone was placed, and creates a new region (colored yellow) as well.
      pointsExtender(newPosX, newPosY);
    }
  }
  else if(gameStopped)
  {
    displayInt++;
    if(displayInt>3){//when the 3 intro texts have been shown, go to the game
      gameStopped = false;
    }
  }
  else
  {
    gameOver = false;
    gameStopped = true;
  }
}

void keyPressed(){
  if (key == 117 && homeCore.upgradeLevel<10) {
    homeCore.upgrade();
  }
  if (key == 32){
    homeCore.energyLevel--;
  }
}


void pointsToVoronoi(float[][] pointsToUse){
  myVoronoi = new Voronoi(pointsToUse);
}

//this method adds one point to the 'points' array, and generates coordinates and a color for it.
void pointsExtender(int newPointX, int newPointY){
  pointAmount++;
  float[][] newPointArray;
  newPointArray = new float[pointAmount][2];
  
  for(int i=0; i<points.length; i++)//first fill all the old points into the new array...
  {
    newPointArray[i][0] = points[i][0];
    newPointArray[i][1] = points[i][1];
  }
  
  for(int i=points.length; i<pointAmount; i++)//...in the remaining spots, generate new random points
  {
    newPointArray[i][0] = newPointX;
    newPointArray[i][1] = newPointY;
    regionColors = (color[])expand(regionColors, pointAmount);//expand the regionColor array.
    regionColors[i] = color(250, random(200,255), 120);//yellowish color.
  }
  
  //println(newPointArray.length);

  try
  {
    points = newPointArray;
    pointsToVoronoi(points);//out with the old and in with the new. This was a workaround because i couldn't get expand() to work with a 2d array.
  }
  catch (ArrayIndexOutOfBoundsException e)
  {
    println("caught exception, point values identical");
  }
}
class AICore{
  int posX, posY, metalLevel, upgradeLevel, placementRange;
  float energyDrainSpeed, energyLevel;
  ArrayList dronesList;
    
  AICore(int newPosX, int newPosY){
    posX = newPosX;
    posY = newPosY;
    energyLevel = 10;
    metalLevel = 30;
    upgradeLevel = 1;//multiplies with energy level, the product is MIPS, which is the game's high score.
    energyDrainSpeed = upgradeLevel*0.02;
    dronesList = new ArrayList();
    placementRange = 200;
  }
  
  //creates 3 concentric circles, colored according to the upgrade level, and sized according to energy level.
  void displayCore(){
    ellipseMode(RADIUS);
    color warningColor;//a feedback to warn the player when the energy level is low.
    if(energyLevel<5){
      warningColor = color(random(150,255),0,0);
      noFill();
      strokeWeight(3);
      smooth();
      stroke(warningColor);
      ellipse(posX, posY, energyLevel*6.0, energyLevel*6.0);
      ellipse(posX, posY, energyLevel*12.0, energyLevel*12.0);
      noStroke();
      noSmooth();
    }
    else{
      warningColor = color(upgradeLevel*20, upgradeLevel*5, upgradeLevel*5);//normal color is reddish, brightness is determined by how far the Core is upgraded
    }
    fill(warningColor);
    ellipse(posX, posY, energyLevel*3.0, energyLevel*3.0);//the AI Core grows in size according to energy level, so you can monitor it easily
    fill(upgradeLevel*30, upgradeLevel*5, upgradeLevel*5);
    ellipse(posX, posY, energyLevel*2.0, energyLevel*2.0);
    fill(upgradeLevel*40, upgradeLevel*5, upgradeLevel*15);
    ellipse(posX, posY, energyLevel*1.0, energyLevel*1.0);
  }
  
  
  //run through the list of drones and run their internal display method
  void displayDrones(){
    for(int i=0; i<dronesList.size(); i++)
    {
      drone iDrone = (drone) dronesList.get(i);
      iDrone.displayDrone();
    }
  }
  
  
  //uses the Mesh library again, but this time to create a delaunay diagram, to represent connections back to the AI
  void displayDroneConnections(){
    float[][] droneConnections = new float[dronesList.size()][2];
    for(int i=0; i<dronesList.size(); i++)
    {
      drone iDrone = (drone) dronesList.get(i);
      droneConnections[i][0] = iDrone.posX;
      droneConnections[i][1] = iDrone.posY;
    }
    Delaunay connectionsGraphic = new Delaunay(droneConnections);
    //this little bit is heavily inspired by http://www.leebyron.com/else/mesh/
    float[][] myEdges = connectionsGraphic.getEdges();
    for(int i=0; i<myEdges.length; i++)
    {
      float startX = myEdges[i][0];
      float startY = myEdges[i][1];
      float endX = myEdges[i][2];
      float endY = myEdges[i][3];
      stroke(255, random(100,150), 120);//actually not supposed to flicker, but it looks kinda good :P
      strokeWeight(2);
      smooth();
      line(startX, startY, endX, endY);
      noSmooth();
    }
  }
    
  //sending a prospector/connector drone to a point on the terrain, to return resources to the core, but only if it's in range
  boolean sendDrone(int parentX, int parentY, int droneTargetX, int droneTargetY){
    boolean targetInRange = false;
    if(dist(parentX, parentY, droneTargetX, droneTargetY)<placementRange)
    {
      targetInRange = true;
    }
    for(int i=0; i<dronesList.size()-1; i++)
    {
       drone iDrone = (drone) dronesList.get(i);
       if(dist(iDrone.posX, iDrone.posY, droneTargetX, droneTargetY)<placementRange)//if the target is within 200px of any drone, place a drone at target.
       {
         targetInRange = true;
       }
    }
    if(targetInRange)
    {
      dronesList.add(new drone(parentX, parentY, droneTargetX, droneTargetY));
      metalLevel -= 1;//the metal cost of constructing a drone
      energyDrainSpeed += 0.001;//drones cost a little energy to maintain
      return true;//yes, a drone was placed.
    }
    else{
      return false; //no, a drone was not placed.
    }
  }
    
  void consumeResources(resourceSite[] siteList){
    for(int i=0; i<dronesList.size()-1; i++)
    {
      drone iDrone = (drone) dronesList.get(i);
      iDrone.lookForResources(siteList);
      
      resourceSite resource = iDrone.connectedResource;
      if(resource != null && resource.resourceType == 0)
      {
        energyLevel += iDrone.harvestConnectedRes();
        println("harvested thermal energy!");
      }
      else if(resource != null && resource.resourceType == 1)
      {
        metalLevel += iDrone.harvestConnectedRes();
        println("harvested metal");
      }
    }
    energyLevel -= energyDrainSpeed;
  }
  
  void upgrade(){
    if (metalLevel>0){
      upgradeLevel++;
      metalLevel -= 5;
      energyLevel -= 1.5;//balanced so you can't afford a full upgrade from the beginning
    }
    else{
      text("not enough metal!", 400, height/2);//I would like this to stay on screen longer than 1 frame, but I don't have the time to make it so.
    }
  }
}

//
class drone{
  int posX, posY, parentX, parentY, outPutAmount, outPutType;
  resourceSite connectedResource;
  color droneColor;
  boolean isConnected;
  
  drone(int newParentX, int newParentY, int newPosX, int newPosY){
    parentX = newParentX;
    parentY = newParentY;
    posX = newPosX;
    posY = newPosY;
    droneColor = color(0,0,200);

  }
  
  void displayDrone(){
    fill(droneColor);
    ellipse(posX, posY, 5, 5);
  }
  
  void lookForResources(resourceSite[] siteList){//runs through the resource spots and checks if any are available
    if(!isConnected){//is the drone already hooked up to a resource?
      for(int i=0;i<siteList.length; i++)
      {
        resourceSite res = siteList[i];
        if(dist(posX, posY, res.posX, res.posY)<30 && !res.isOccupied && !res.isEmpty)//close enough? already occupied? empty?
        {
          connectedResource = res;
          connectedResource.isOccupied = true;
          isConnected = true;
        }
      }
    }
  }
  
  //harvests the resource of the connected spot and returns the amount gathered to the AI Core
  int harvestConnectedRes(){
    int harvRes = 0;
    if(isConnected){
      harvRes = connectedResource.harvestRes();
    }
    return harvRes;
  }
}
class resourceSite{
  int posX, posY, resourceType, areaSize;
  float amountLeft, drainSpeed;
  boolean isEmpty, isOccupied;
  
  resourceSite(int newResourceType){
    posX = int(random(width));
    posY = int(random(height));
    resourceType = newResourceType;
    areaSize = int(random(15, 30));
    amountLeft = (newResourceType*random(5, 20))+10;//if newResourceType is zero, amountLeft will only be 10
    drainSpeed = 1.0;
    isOccupied = false;
    isEmpty = false;
  }


//test method, normally resources should be invisible
  void displaySite(){
    fill(resourceType*255, 0, 255);
    ellipse(posX, posY, areaSize, areaSize);
  }
  
  //harvests resource and sends it up the chain
  int harvestRes(){
    int harvRes = 0;
    if(amountLeft>0)
    {
       amountLeft -= drainSpeed;//subtracts one drainSpeed portion from the total amount left.
       harvRes = int(drainSpeed);
    }
    else
    {
      isEmpty = true;
      println("it's empty!");
    }
    return harvRes;
  }
}


