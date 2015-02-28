
/* *******************************
Import Libraries
******************************* */
import processing.opengl.*;


/* *******************************
Configuration Variables
******************************* */
int screenwidth = 600;
int screenheight = 400;
int counter;

int minRings = 5;  // Cannot Be Zero;
int numberOfContainers = 1;
int numberOfStartingNodes = 0;

int withinRange = 30;  // Distance required to be connected
int brushRange = 10;   // Range for Random placement of node on left mouse click

NodeContainers[] nodeGrouping;


void setup() {
  background(#000000);
  size ( 600, 400 );
  counter = 1;

  // Create a list of Groups
  nodeGrouping = new NodeContainers[numberOfContainers];
  for(int d = 0; d < numberOfContainers; d++) {	  
    nodeGrouping[d] = new NodeContainers( screenwidth,screenheight, d + numberOfStartingNodes);
  }
  
  println("Press the Left Mouse button to Start Drawing");

}

void draw () {
  counter++;

  /* Sketch Canvas Setup */
  smooth();
  fill(#000000);  //Set Fill Color to Default White
  strokeWeight(0);
  background(#000000); // Redraw background to cover previous drawing

  /* Draw the Grid Background */
  int posx, posy;
  posx = screenwidth/2;
  posy = screenheight/2;
  stroke( 220, 220, 220);

  //Draw All the Node Containers
  for(int i = 0; i < nodeGrouping.length; i++) {
    nodeGrouping[i].drawNodeConnections();
  }


}


/* User Input Functions */
void mousePressed()
{
  if (mousePressed && (mouseButton == LEFT)) {
    for(int i = 0; i < nodeGrouping.length; i++) {
      nodeGrouping[i].addNodeBrush();
    }
  } else if (mousePressed && (mouseButton == RIGHT)) {    
    for(int i = 0; i < nodeGrouping.length; i++) {
      //nodeGrouping[i].addNode();
    }    
  } else {     
     setup();      
  }  
  
}

void keyPressed() {

}



/********************************
Creates Containers of Nodes.
********************************/
class NodeContainers {
  // Parameters  
  float x, y;
  int numberOfNodes;
  Node[] grouping;
  
  // Constructor
  NodeContainers( float xrange, float yrange, int numNodes ) {    
    x = xrange;
    y = yrange;
    numberOfNodes = numNodes;
    
    grouping = new Node[numNodes];
    for(int d = 0; d < numberOfNodes; d++) {
      // Load Container with Node
      grouping[d] = new Node( random(0,xrange),random(0,yrange));
    }     
  }

  // Deletes a Node at any element in the Node Container  
  void deleteNode(int index) {
    // just delete the last element if the index points at the last element
    if(index + 1 == grouping.length) {
      grouping = (Node[]) shorten(grouping);
    //otherwise shift all element over one, starting after deleted element poistion, and also delete last element   
    } else {
      for( int i = index; i < grouping.length - 1; i++ ) {
        grouping[i] = grouping[i+1];  
      }
      grouping = (Node[]) shorten(grouping);
    }
  }

  void addNodeBrush() {
    numberOfNodes++;
    grouping = (Node[]) append(grouping, new Node(random( mouseX-brushRange , mouseX+brushRange ) ,random( mouseY-brushRange, mouseY+brushRange ) ) );  
  }   
  
  
  // Draw Lines Between Nodes in Group
  void drawNodeConnections() {
    float[] xvalues = new float[grouping.length];
    float[] yvalues = new float[grouping.length];  
  
    /* Loop Through List of Nodes */
    for(int d = 0; d < grouping.length; d++) {  
      xvalues[d] = grouping[d].x;
      yvalues[d] = grouping[d].y;    
    }
  
    //Call all the Draw Functions
    if ( xvalues.length > 0 ) { 
      connectNodesInRange(xvalues, yvalues, withinRange);
      for(int a=0; a < grouping.length; a++) {
        grouping[a].displayPulse(grouping[a].connected / 4, 2.0, -.5, #ccddee);   // Adjust this for the ways it Pulses
      }
			     
    }
        
  } 
  
  void connectNodesInRange(float[] xpoint, float[] ypoint, float range) {  
    noFill();
    // copy sourcepoints, the x, y values  
    float[] xoldlist = xpoint;
    float[] yoldlist = ypoint;  
    int orignalLength = xpoint.length;

    // create starting point, its currently set to first element in array  
    stroke( 255, 255, 255, 150);
    strokeWeight(.4);

    int connected[] = new int[xpoint.length];
    //println(connected.length);

    //drawlines to those within range
    for(int a = 0; a < xoldlist.length; a++) {
      for(int z = a + 1; z < xoldlist.length ; z++) {
        if( dist(xoldlist[a], yoldlist[a], xoldlist[z], yoldlist[z]) < range ) {
          connected[a]++;
          connected[z]++;
          line(xoldlist[a] + ( ( (counter + a) % 3 ) /2  ) , yoldlist[a] + (  ( (counter + a) % 3 ) / 2 ), xoldlist[z], yoldlist[z]);        
        }
      }
    }

    // transfer connected information to node;
    for(int a = 0; a < grouping.length; a++) {
      grouping[a].connected = connected[a];			
    }
		
     
  }  
  
}






/********************************
Creates the Nodes themselves.
********************************/
class Node {
  // Parameters 
  float x, y;
  int rings;          // Counter for number of rings to display for pulsating effect
  int connected = 0;
  boolean increment = true;
 
  // Constructor
  Node(float xposition, float yposition  ) {   
    x = xposition;
    y = yposition;   
  }
   
  void displayPulse(int maxRings, float strokeweight, float strokeweightincrease, int thecolor) {     
    stroke(thecolor);       
    float spacing = rings; // The more rings, the larger the spacing between them
  
    concentricEllispe( x, y, rings, spacing, strokeweight, strokeweightincrease, 130 );  
   
    // Pulsating effect logic
    if ( rings <= 0 ) {
     increment = true;
    }    
    if ( rings >= maxRings ) {
     increment = false;
    }        
    // Increase Node's Ring Count
    if (increment == true) {
       rings++;     
    } else {
       rings--; 
    }   
 } 
 
 void displayCenter(float sw, int[] thecolor) {
  strokeWeight(sw);
  stroke(thecolor[0], thecolor[1], thecolor[2] );
  point(x,y);    
 }
  
}





/********************************
Functions Outside The Classes
********************************/
// Function - Removes an array element
float[] arrayRemovePos( int nearestIndex, float[] theArray) {
   float[] shortenArray = new float[theArray.length];
   arraycopy(theArray, shortenArray);  
   
   //delete the last element when removing the last element
   if(nearestIndex + 1 == theArray.length) {
      shortenArray = shorten(theArray);    
   //otherwise copy and delete last element   
   } else {
      for( int i = nearestIndex; i < theArray.length - 1; i++ ) {
        shortenArray[i] = theArray[i+1];         
      }
      shortenArray = shorten(shortenArray);
   }    
   return shortenArray;
}


/********************************
Creates elliptical Grid
********************************/
void ellipticalGrid( int posx, int posy, int scrWidth, int scrHeight, int interval, int strokeW ) {  
  strokeWeight(strokeW);
  fill( 0,0,0);
  noFill();
  
  float rings = round( sqrt(sq(scrWidth) + sq(scrHeight))/interval );  // Calculate the number of Rings needed to Fill the Screen
  ellipse( posx, posy, rings*interval, rings*interval);            

    for (int d = 0; d <= rings; d += 1 ) {     
      noFill(); 
      ellipse( posx, posy, d*interval, d*interval);            
    }    
}


/********************************
Creates Concentric Cirlces
int posx - X coordinate starting position
int poxy - Y coordinate starting position
int rings  - Number of drawn ellispes
int interval - Spacing between ellispes
int interval - Grid spacing
********************************/
void concentricEllispe( float posx, float posy, int rings, float spacing, float strokeW, float strokeWIncrease, int transparency  ) {        
    fill(100,100,100,transparency);    
    strokeWeight(0);
    
    ellipse( posx, posy, rings*spacing, rings*spacing); 

    
    for (int d = 0; d <= rings; d += 1 ) {     
      noFill();
      if( strokeW + strokeWIncrease <= .1 ) {
        strokeW = .1;
      } else {
        strokeW = strokeW + strokeWIncrease;
      }      
      strokeWeight(strokeW);
            
      ellipse( posx, posy, d*spacing, d*spacing);            
    }   
}

/********************************
Create Cartesian Grid
int posx - X coordinate of grid starting position
int poxy - Y coordinate of grid starting position
int gridxwidth  - Horizontal width of grid from starting position
int gridyheight - Vertical height of grid from starting position
int interval - Grid spacing
********************************/
void cartesianGrid ( int posx, int posy, int gridxwidth, int gridyheight, int interval, int strokeW  ) {
  strokeWeight(strokeW); 
  
  
  //Vertical Grid Lines
  for ( int d = 0; d <= gridxwidth/interval; d += 1 ) {
    line( (d * interval) + posx, posy, (d * interval) + posx, gridyheight + posy);
  }
  
  //Horizontal Grid Lines
  for ( int d = 0; d <= gridyheight/interval; d += 1 ) {
    line( posx, (d * interval) + posy, gridxwidth + posx, (d * interval) + posy );
  }  
}




