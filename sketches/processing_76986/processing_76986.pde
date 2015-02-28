

//##GroupDynamics.pde
//##Copyright (c) 2012 Gareth Dunstone
//##http://arcc.cc
//##webmaster [at] arcc . cc
//
//##based on code from:
// ConnectedNodes.pde
// Copyright (C) 2011 Fabian "fabiantheblind" Morón Zirfas
// http://www.the-moron.net
// info [at] the - moron . net

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/.

//# any comments with a # before them indicate code by Gareth, else is by Fabian, or has inline reference.

//   _____      _               
//  / ____|    | |              
// | (___   ___| |_ _   _ _ __  
//  \___ \ / _ \ __| | | | '_ \ 
//  ____) |  __/ |_| |_| | |_) |
// |_____/ \___|\__|\__,_| .__/ 
//                       | |    
//                       |_|   
PFont font; //# setting up text for start ui
Timer timer;
Timer timer2;
NodeSystem ns; // the System
boolean pressed = true; //#setting up a global boolean for the mousepressed function
boolean beatFearOn = false;
void setup()
{
  size (480,800);
  background(0,100);
  int num = 4+(height+width)/290; // number of nodes #no longer the number of nodes but a level of node density. Exponential
  // the starting distance for the calculation of the lines
  int distance = 90;
  //#creating stuff
    font = createFont("Arial", 26, true);
    ns = new NodeSystem(distance);
    timer = new Timer(34975); //# creating a timer
    timer2 = new Timer(20000);
   
   smooth(); // make it smooth
    // initalise all the nodes
    // if you put the init into the draw it calcs every loop new nodes
   ns.init(num);

}// end of setup

//  _____                     
// |  __ \                    
// | |  | |_ __ __ ___      __
// | |  | | '__/ _` \ \ /\ / /
// | |__| | | | (_| |\ V  V / 
// |_____/|_|  \__,_| \_/\_/  
//                            
void draw()
{
  // write a rect in the size of the sketch for smooth background clear
  noStroke();
  if (beatFearOn == true)
    {
      fill(0,255);
    }
   
  else
    {
       fill(255,255);
    }
  rect(0,0,width,height);

  ns.run(); // run the node system
    
}

//   _____ _                         
//  / ____| |                        
// | |    | | __ _ ___ ___  ___  ___ 
// | |    | |/ _` / __/ __|/ _ \/ __|
// | |____| | (_| \__ \__ \  __/\__ \
//  \_____|_|\__,_|___/___/\___||___/
//                                  
//|--------------------------------------------------------------------|//
//#Node class
// the node class holds the only the points
// the lines get caculated in the NodeSystem
//#i removed the lines as i only used the number of connections to change size, opacity, and colour.

class Node
{
  PVector pos; // the node position
  PVector vel; // the velocity of the node
  
  float diam; // the diameter
  int cons = 0; // the connection he has
  
  // the constructor
  Node(PVector pos,float diam)
  {
    this.pos = pos;
    this.diam = diam;
    vel = new PVector(random(-1,1),random(-1,1));
  }

// draw the node
  void show()
  { 
    //#changing colour of ellipse based on the diam variable, linked to the number of connections.
    if (beatFearOn==false)
    {
      fill(diam*5, 120, diam*3, 255);
      ellipse(pos.x, pos.y, diam, diam);
    }
    else
    {
      fill(diam*2, 0, diam*5, diam*3);
      ellipse(pos.x, pos.y, diam, diam);
    }
  }
  
  
  // update the postion
    void update() {
    // Motion 101: Locations changes by velocity.
      {pos.add(vel);}
  }
  //#this function has been mostly rewritten to bounce the nodes off the edges in a semi random way,
  //#i thought this was preferable to having them reappear on the other side
  void checkEdges()
  {
    if (pos.x > width) {
      vel.x = random(-1,-2);
    } 
    else if (pos.x < 0) {
      vel.x = random(1,2);
    } // X
    
    if (pos.y > height) {
      vel.y = random(-1,-2);
    } else if (pos.y < 0) {
      vel.y = random(1,2);
    }// Y

  }// end checkEdges
  
  //##this function was written to bring user interaction with the mouse.
  void checkMouse()
  {
     if (pos.x>mouseX-100 && pos.x<mouseX+100 && pos.y>mouseY-100 && pos.y<mouseY+100) //# if a node happens to occupy a square box around the mouse
     {
       if (beatFearOn==false)
        {
          if (pos.x>mouseX-50) 
            {vel.x = random(3,1);} //# if its in the right hand side give it a random positive velocity along the x axis
          else if (pos.x<mouseX-50)
            {vel.x = random(-3,-1);} //#same for the left hand side only a random negative velocity
        
            //#same for Y axis
         if (pos.y>mouseY-50) 
            {vel.y = random(3,1);}
         else if (pos.y<mouseY-50)
            {vel.y = random(-3,-1);}
        }
      else if(beatFearOn==true)
        {
          if (pos.x>mouseX-30) 
              {vel.x = random(4,1);} //# if its in the right hand side give it a random positive velocity along the x axis
            else if (pos.x<mouseX-30)
              {vel.x = random(-4,-1);} //# same for the left hand side only a random negative velocity
        
              //#same for Y axis
           if (pos.y>mouseY-30) 
              {vel.y = random(4,1);}
           else if (pos.y<mouseY-30)
              {vel.y = random(-4,-1);}
        }       
     } 
  }

}

//|--------------------------------------------------------------------|//


class NodeSystem{
  
  ArrayList <Node> nodes; // a list of nodes
  float distance; // inital distance

  // constructor 
  NodeSystem(float dis){
  this.distance = dis;
  }


  // this initalizes the nodes
  void init(int num){
    
    nodes = new ArrayList();
    
    // loop thru num
    //# changed the way that the  are numbered. and generated
    //# this causes nodes to start their position evenly distributed into a grid.
    //# it also means that a dynamic number of nodes are created based on the size of the sketch making it more scalable.
    for(int i = 0; i < num; i++)
    {
      float y = i*height/num; 
      for(int q = 0; q < num*2; q++)
      {
        float x = q*height/num;
      
        float diam = 0;// with diameter
      
        PVector pos = new PVector(x,y);// position into PVector
        Node n = new Node(pos,diam); 
        nodes.add(n); // add the new node to the list
      }
    }
  
  }
  
  // run the nodesystem
  void run()
  {
    display();
  }

// calculate the connections and draw the lines
void calcConnections(Node n)
  {
  
  int num = 0; // number of connections

  for(int i = 0; i < nodes.size(); i ++)
    {
    
      PVector  v1 = n.pos; // reference position
      PVector  v2 = nodes.get(i).pos; // every other node
      float d =  PVector.dist(v1, v2);// calc the distance
  
      // now if the node already has some connections
      // make the distance he can check higher
      if((d < distance + n.cons* 3) &&(d > 1))
      {
        //# here lies the now dead line code
        //stroke(255,100);
        //line(v1.x , v1.y,v2.x, v2.y); // draw the line
        
        num++; // increment num
      }
    // set the connections of the node to the num
      n.cons = num;
      
      //# this makes the nodes react to having too many connections
      //# by giving them a different random velocity.
      //# this helps dissipate large groups with similar vectors, and keeps them moving organically.
      //# it also means that if the user forces the nodes into large groups they get excited and vibrate themselves apart
      //# now has some a
      if(n.cons>29)
      {
          n.vel.x = random(-2,2);
          n.vel.y = random(-2,2);
          timer2.start();
          if (n.cons>41)
           {
             beatFearOn = true;
             timer.start(); //#if they get too frisky they get feared.
           }
      }
      else if (n.cons>17)
      { 
        if (beatFearOn == true)
        {
          n.vel.x = random(-50,50);
          n.vel.y = random(-50,50);
        } 
       if (timer.isFinished()) //#unfears the nodes so they can chill
       {
         beatFearOn=false;
       }
      }
    }
  }

  // display the nodes and draw the connections
  void display()
  {
    Node n = null;// keep it clear
    for(int i = 0; i < nodes.size(); i++)
      {
      n = nodes.get(i); // call the functions of node
      n.diam = n.cons*4; // set the size
      n.show(); // display
      n.update(); // and update position
      calcConnections(n); //# calculate the connections
      n.checkMouse(); //# take information from mouse location for responses, this needs to be before checkEdges() because otherwise it will take precedence in vector calculation
      n.checkEdges(); //# check the edges so that the nodes dont slip off the edge
      }
   } // end display
}

//|--------------------------------------------------------------------|//
// timer class for unfearing.
// credit goes to Daniel Shiffman
// http://www.learningprocessing.com

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

//  ______                _   _                 
// |  ____|              | | (_)                
// | |__ _   _ _ __   ___| |_ _  ___  _ __  ___ 
// |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
// | |  | |_| | | | | (__| |_| | (_) | | | \__ \
// |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
//

