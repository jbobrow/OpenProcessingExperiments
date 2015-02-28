
//Shape Builder and Animator Example
float nodeRadius = 5.0;
//holds node coordinate values
float[]nodeXPos = new float[0];
float[]nodeYPos = new float[0];

color initialNode = color(0);
boolean isShapeClosed = false;

//dynamics variables (moves shape)
float gravity = .55;
float jitterRange = 15;
float elasticRangeMin = .99;
float elasticRangeMax = .99;
float friction = .85;
float[]jitter = new float[0];
float[]xSpeed = new float[0];
float[]ySpeed = new float[0];
float[]elasticity = new float[0];

void setup(){
  size(400,600);
  
  frameRate(30);
  smooth();
}
void draw(){
  //create simple shape trails
  fill(57,116,4, 36);
  rect(0,0,width, height);
  if(nodeXPos.length>1){
    //draw line between nodes
    drawEdge();
    //check if mouse is over origional node
    checkOverInitialNode();
    //animate shape
    moveShape();
  }
  //draw node
  drawNode();
}

//change node fill color when mouse is over intitial node
void checkOverInitialNode(){
  if(isInitialNode()){
    initialNode = color(255,127,0);
  }
  else{
    initialNode = color(#FFF700);
  }
}
//function to draw lines between nodes
void drawEdge(){
  stroke(#FF7300);
  for(int i=0; i<nodeXPos.length; i++){
    if(i>0){
      line(nodeXPos[i], nodeYPos[i], nodeXPos[i-1], nodeYPos[i-1]);
    }
    //close shape, line between last node and initial node
    if(isShapeClosed && i==nodeXPos.length-1){
      line(nodeXPos[i],nodeYPos[i], nodeXPos[0], nodeYPos[0]);
    }
  }
}
//function to draw nodes
void drawNode(){
  //draw nodes at shape vertices
  noStroke();
  for(int i=0; i<nodeXPos.length; i++){
    //initial node has own color variable
    if(i==0){
      fill(initialNode);
    }
    else{
      fill(#FFF700);
    }
    ellipse(nodeXPos[i], nodeYPos[i], nodeRadius*2, nodeRadius*2);
  }
}
//function returns true/false if mouse is over initial node
boolean isInitialNode(){
  boolean isOnNode = false;
  if(nodeXPos.length>2){
    if(dist(mouseX, mouseY, nodeXPos[0], nodeYPos[0])<nodeRadius){
      isOnNode = true;
    }
  }
  return isOnNode;
}
void mousePressed(){
  if(isShapeClosed){
    //after shape is closed empty arrays
    nodeXPos = subset(nodeXPos, 0,0);
    nodeYPos = subset(nodeYPos, 0,0);
    xSpeed = subset(xSpeed, 0,0);
    ySpeed = subset(ySpeed, 0,0);
    jitter = subset(jitter,0,0);
    elasticity = subset(elasticity,0,0);
    
    //reset variable to false
    isShapeClosed = false;
  }
  if(!isInitialNode()){
    //if not on initial node plot at mouse position
    //increase size of node coordinate arrays.
    nodeXPos = append(nodeXPos, mouseX);
    nodeYPos = append(nodeYPos, mouseY);
    
    //increase size of dynamics arrays
    xSpeed = append(xSpeed, 0);
    jitter = append(jitter, random(-jitterRange, jitterRange));
    elasticity = append(elasticity, random(elasticRangeMin,
            elasticRangeMax));
    ySpeed = append(ySpeed, 0);
  }
  else{
    //set to true to avoid additional nodes in shape
    isShapeClosed = true;
  }
}
//fuction to move shape
void moveShape(){
  //animate after shape is closed
  if(isShapeClosed){
    for(int i=0; i<nodeXPos.length; i++){
      nodeXPos[i]+=xSpeed[i];
      ySpeed[i]+=gravity;
      nodeYPos[i]+=ySpeed[i];
      
      //set display window edge collision
      //right display window edge
      if(nodeXPos[i]>width-nodeRadius){
        nodeXPos[i]= width-nodeRadius;
        xSpeed[i]*=-1;
      }
      //left display window edge
      if(nodeXPos[i]<nodeRadius){
        nodeXPos[i] = nodeRadius;
        xSpeed[i]*=-1;
      }
      //bottom display widnow edge
      if(nodeYPos[i]>height-nodeRadius){
        nodeYPos[i] = height-nodeRadius;
        xSpeed[i]+=jitter[i];
        xSpeed[i]*=friction;
        jitter[i]*=friction;
        ySpeed[i]*=-1;
        ySpeed[i]*=elasticity[i];
      }
    }
  }
}


