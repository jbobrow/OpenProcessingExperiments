
// A Project to make a GAME / SOFTWARE
 
 /* create by : Naghmi Shireen
     Dated: 2nd November, 2010
     */
     
 /* this game works by creating nodes, on every click, once the mouse clickes on initial node,
 the nodes start moving in a random manner. You have to click on every node to make it pop one by one.
 as you suceed on poping each node, the game ends with your score. to restart the game again,
 you have to press any key.*/


boolean mouseisPressed; 
boolean isShapeClosed  = false; //this boolean will be true, once the shape gets close, to make it move random
boolean dontDrawMoreNodes=false; //this will stop making more nodes, once shape is closed, so that on each click poping nodes activity begins
boolean isAllNodesClicked; //this will be true once all nodes are clicked to show score.

int points; //this will store the score,for how much score you got
int counter; //this will store the value of no.of nodes created
int clickedNodes;//this will store the no. of nodes clicked
int timeCount=0; // timer which sets back to zero, once game ends
int prevTime;// to store the time value of previous game, to get it subtracted, when the new game begins



Node nodes; // an object of class Node
Node yourScore; //an object of class Nodes, which will call a methos of subclass Points
GameEnds endGame;// an object of class endGame

float[] Xpos=new float[0]; //an array of zero length to store X-cordinates, everytime mouse clicks
float[] Ypos=new float[0];//an array of zero length to store Y-cordinates, everytime mouse clicks
color[] colour=new color[0]; //an empty array to store the color of each node
float[]xspeed  =  new float[0]; //an empty array to store  x speed of each node
float[]yspeed  =  new float[0];//an empty array to store y value of each node
float radius=5; // radius of nodes


void setup() {
  size(600, 600); //display size set
  frameRate(30); 
  smooth();
  mouseisPressed=false; // initially mouse pressed is set to false

}

void draw() {

  rectMode(LEFT); //sets the rectangle mode to left
  fill(255, 36);
  rect(0, 0, width, height);
  
  //introducing a number of constructors, to give a new value of Xpos, Ypos each time the mouse clicks
  nodes=new Node(Xpos, Ypos,radius, colour, xspeed, yspeed);
  yourScore=new Points(Xpos, Ypos, radius, colour, xspeed,yspeed);
  
 
//  this function will display the nodes statistics of how many nodes created and how many poped
  yourScore.writeScore(points, counter, clickedNodes);


//this part of program will only run, if all nodes are clicked  
  if(isAllNodesClicked) {
    endGame=new GameEnds(points);
    endGame.EndShape(); // will diplay the points attained
  }

}

//whenever the mouse is pressed and the shape is not closed,
//this part of program will keep on running to add one more object to the previous array length
//on every click.

  void mousePressed() {
    mouseisPressed=true; //mousepressed boolean is set to true
    
    if(!dontDrawMoreNodes) { // a condition, in case shape is closed, it will not add more nodes instead will just return
    
      Xpos = append(Xpos, mouseX); // appending Xpos array with one more object of value of mouseX
      Ypos = append(Ypos, mouseY);//appending Ypos arrat with one more object of value if mouseY
      colour=append(colour,color(0)); //appending colour array with one more value of black color
      xspeed = append(xspeed, 0); //adding Xspeed object with 0 value in the previous array
      yspeed = append(yspeed, 0); //adding Yspeed object with 0 value in the previous array
      
   }
    else {
      return; //else the condition is false, and dontDrawMoreNodes becomes true, it will return
    }
  }


class Node {
  Pattern pattern;  // an object of class Pattern is being declared
  PFont noOfNodes; //an object of PFont class is declared
  float[] nodeXPos; //an array to store X values
  float[] nodeYPos; //an array to store Y values of node
  color[] nodeColor; //an array to store color of all nodes
  float[]xSpeed; //an array to store xspeed of all nodes
  float[]ySpeed; //an array to store Yspeed of all nodes
  float nodeRadius;  //radius of node


  Node(float nodeXPPos[], float nodeYPPos[], float nodeRadius, color nodeColor[], float xSpeed[],float ySpeed[]) {
    this.nodeXPos=nodeXPPos;
    this.nodeYPos=nodeYPPos;
    this.nodeRadius=nodeRadius;
    this.nodeColor=nodeColor;
    this.xSpeed=xSpeed;
    this.ySpeed=ySpeed;


    noOfNodes=createFont("arial",30); //to initialize the Pfont class, by creating a font
    pattern=new Pattern(nodeXPos, nodeYPos,nodeRadius+50, nodeRadius+50); //this will initialize the pattern class
    drawNode(); //a method to draw nodes

    if(!isAllNodesClicked) { // if all nodes are not clicked then these set of methods will be called
      checkOverInitialNode(); // to check if the mouse is clicked on initial array then this method will stop making more nodes
      MousePressed(mouseisPressed); //once the shape is close,this method will start poping nodes on each click
      drawEdge(); //this method draws lines between nodes
      moveShape(); //this method make the nodes move
    }
    else {
      return; //if all nodes are clicked, then simply return
    }
  }//end of constructor


  //a method to draw nodes  
  void drawNode() {
    noStroke();
    for (int i=0; i<nodeXPos.length; i++) {
      fill(nodeColor[i]);
      ellipse(nodeXPos[i], nodeYPos[i], nodeRadius*5, nodeRadius*5);
    }
    pattern.drawRec();
  }
  
// an example of over loading, i have over loaded a method with one argument  
    void drawNode(int nodeRadius) {
    noStroke();
    for (int i=0; i<nodeXPos.length; i++) {
      fill(nodeColor[i], 80);
      ellipse(nodeXPos[i], nodeYPos[i], nodeRadius, nodeRadius);
    }
  }


  //  function returns true/false if mouse is over initial node
  boolean isInitialNode() {
    boolean isOnNode  =  false;
    if (nodeXPos.length>2) {
      if  (dist(mouseX, mouseY, nodeXPos[0], nodeYPos[0]) < nodeRadius*5) {
        isOnNode  =  true;
      }
    }
    return isOnNode;
  }



  //  change node fill color when mouse is over initial node
  void checkOverInitialNode() {

    if(!isShapeClosed) { //if shape is not closed
      if  (nodeXPos.length>1) { // and the nodes are more than one
        if  (isInitialNode()) { //and mouse is on initial node
          nodeColor[0]  =  color(255, 127, 0); //then change the color of the node to orange
        }
        else {
          nodeColor[0]  =  color(0); //else just let it remain black
        }
      }
    }
  }



  //function to draw lines between nodes
  void drawEdge() {
    if  (nodeXPos.length>1) {
      stroke(100, 50, 20);
      for (int i=0; i<nodeXPos.length; i++) {
        if (i>0) {
          line(nodeXPos[i], nodeYPos[i], nodeXPos[i-1], nodeYPos[i-1]);
        }
        // if shape is closed, line between last node and initial node
        if  (isShapeClosed  &&  i  ==  nodeXPos.length-1) {
          line(nodeXPos[i], nodeYPos[i], nodeXPos[0], nodeYPos[0]);
        }
      }
    }
  }




  //a method to 
  void MousePressed(boolean mouseIsPressed) {
    if(mouseIsPressed) { //if mouse is pressed
      if(isShapeClosed) { // and shape is closed as well
        if(clickedNodes<counter) { //if the no of nodes created are greater than no of nodes clicked then go ahead

          for ( int i=0;i<nodeXPos.length; i++) {
            //if the mouse is onto a  node who is not already clicked, then go ahead
            if(dist(mouseX, mouseY,nodeXPos[i],nodeYPos[i])< nodeRadius*5 && nodeColor[i]!=color(255,0,0)) {
              //change the colour if the node clicked to red
              nodeColor[i]=color(255,0,0);
              drawNode(100);
              if(i<nodeXPos.length-1) { // and for uptil the last cycle
                clickedNodes+=1; //increase the value of nodes clicked by 1
                points=points+10; //increase the points gained by 10
              }// end of if
            }//end of if
          }//end of for
        }//end of if
        else { //if the number of nodes clicked and no of nodes created are egual then make AllNodesCclicked to true
          isAllNodesClicked=true;
        }//end of else
      }//end of if

      if(!isInitialNode() && !dontDrawMoreNodes && !isShapeClosed) {
        counter=counter+1; //increase the count of adding nodes by one more
      }
      else {
        //  set to true to avoid additional nodes on shape
        isShapeClosed  =  true;
        dontDrawMoreNodes=true;
      }

      mouseisPressed=false;// mousepressed is set back to false, so that next time it only runs when mouse is pressed again
    }//end of if
  }//end of method



//an abstract method in the parent class, which will be detailed out in sub class
  void writeScore(int pts, int noOfNodes, int noOfclickedNodes) {
  }


// a method to move the whole shape
  void moveShape() {
    if (!isAllNodesClicked) { // this shape will keep on moving till all the nodes are not clicked
      if  (nodeXPos.length>1) {
        //animate after shape is closed
        if (isShapeClosed) {
          for (int i=0; i<xSpeed.length; i++) { 
            nodeXPos[i]+=xSpeed[i]; //adding xspeed to xpos
            nodeYPos[i]+=ySpeed[i]; //adding yspeed to ypos
            ySpeed[i]+=0.1; 
            xSpeed[i]+=0.01;


            // set display window edge collision
            // right display window edge
            if  (nodeXPos[i]>width-(nodeRadius+30)) {
              nodeXPos[i]  =  width-(nodeRadius+30);
              xSpeed[i]*=-1;
            }
            // left display window edge
            if (nodeXPos[i]<nodeRadius+30) {
              nodeXPos[i]  =  nodeRadius+30;
              xSpeed[i]*=-1;
            }

            //  bottom display window edge
            if  (nodeYPos[i]>height-(nodeRadius+30) ) {
              nodeYPos[i]  =  height-(nodeRadius+30);
              ySpeed[i]*=-1;
            }
            if  (nodeYPos[i]<nodeRadius+30 ) {
              nodeYPos[i]  =  nodeRadius+30;
              ySpeed[i]*=-1;
            }
          }
        }
      }
    }
  }
}

class Points extends Node {
  float xPositions[], yPositions[];
  float rad;
  color[] colr;
  float[] speedX;
  float[] speedY;



  Points(float xPositions[], float yPositions[],float rad, color colr[], float[] speedX, float[] speedY) {
    super(xPositions, yPositions, rad, colr, speedX, speedY);
  }

// a method to write all the score statistics
  void writeScore(int pointsGained,int nodesCreated, int nodesClicked) {
    text("score :" + pointsGained, 50,50);
    text("Nodes Created: "+nodesCreated, 50, 30);
    text("Nodes Clicked: "+nodesClicked, 50, 70);
    println("i gain points: " + pointsGained);
  }
}


//this class will only be called once the game ends
class GameEnds {
  int score;
  int finalTime=millis()/1000;


  GameEnds(int score) {
    this.score=score;
  }


  void EndShape() {

    if (timeCount==0) { // the timecount will only run when 
      timeCount=finalTime - prevTime;
    }

    textAlign(CENTER);

    text(" CONGRATULATIONS", width/2,height/2-100);
    
    text(" YOUR TOTAL SCORE :"  + score + " in TOTAL TIME: "+ timeCount + " SECONDS", width/2, height/2-70);
    
    text( " PRESS SPACE BAR TO RESTART THE GAME", width/2, height/2-40);

    textAlign(LEFT);

    if (keyPressed) {
      //setting all the arrays back to zero's
        Xpos  =  subset(Xpos, 0, 0);
        Ypos  =  subset(Ypos, 0, 0);
        colour= subset(colour,0,0);
        xspeed  =  subset(xspeed, 0, 0);
        yspeed  =  subset(yspeed, 0, 0);
        
     //setting all values back to false and zero's
        mouseisPressed=false;
        isAllNodesClicked=false;
        isShapeClosed  = false;
        dontDrawMoreNodes=false;
        prevTime= prevTime + timeCount;
        timeCount=0;
        points=0;
        counter=0;
        clickedNodes=0;
    }
  }
}



//a class which will create a pattern on each node
class Pattern{
  float xpos[], ypos[], w, h;

  float curvy=0;
  float endcurve=0;
  float cir;

  Pattern(float xpos[], float ypos[], float w,float h) {

    this.xpos=xpos;
    this.ypos=ypos;
    this.w=w;
    this.h=h;
  }

  void drawRec() {
    rectMode(CENTER);
    noFill();
    strokeWeight(3);
    for(int i=0; i<xpos.length ; i++) {
      rect(xpos[i], ypos[i], w, h);
      stroke(255-curvy,100,150+curvy,150-curvy);
      //these four methods will draw bezier curves on each four side of a rectangle
      curvey0(xpos[i]-w/2,ypos[i]-h/2,xpos[i]+w/2,ypos[i]-h/2);
      curvey1(xpos[i]+w/2,ypos[i]-h/2,xpos[i]+w/2,ypos[i]+h/2);
      curvey3(xpos[i]-w/2,ypos[i]+h/2,xpos[i]-w/2,ypos[i]-h/2);
      curvey2(xpos[i]+w/2,ypos[i]+h/2,xpos[i]-w/2,ypos[i]+h/2);
    }
  }

  void curvey0(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2-curvy-endcurve,verY2+curvy+endcurve,verX2-endcurve-curvy,verY2+curvy+endcurve);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  }

  void curvey1(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2-curvy-endcurve,verY2-curvy-endcurve,verX2-curvy-endcurve,verY2-endcurve-curvy);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  } 


  void curvey2(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2+curvy+endcurve,verY2-curvy-endcurve,verX2+endcurve+curvy,verY2-curvy-endcurve);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  } 

  void curvey3(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2+curvy+endcurve,verY2+curvy+endcurve,verX2+curvy+endcurve,verY2+endcurve+curvy);
    endShape();
    if(curvy<100) {

      curvy+=1;
      endcurve+=1;
    }
    else {
      for(int i =0 ; i<xpos.length; i++) {

        ellipse(xpos[i],ypos[i],cir,cir);
        if (cir<(3*w/2)) {
          cir+=10;
        }
      }
    }
  }
}
