
/*
Daniel Davis, 2010, nzarchitecture.com

Draws a directed graph and dynamically relaxes the graph. 
Nodes in the graph can also be dragged around.

*/

HashMap graph;
PFont fontA;

int stageSize = 900;  //size of the stage
int boxHeight = 10;    //height of box in pixels
int border = 5;        //border around box in pixels
float speed = 5;       //speed to move nodes together, 1 = slow, 100 = fast.
float bubble = 140;    //distance nodes will try to stay apart
float curveSize = 80; //size of the curve coming out of node, 0 = no curve.

color backgroundColor = color(227, 224, 213);
color lineColor = color(83, 100, 105);
color boxColor = color(185, 200, 201);
color hoverColor = color(214, 186, 204);
color textColor = color(83, 100, 105);


String fileName = "graph.txt"; //name of file with connection data, expecting it in this format:
//a, b, b, b
//a, b, b, b
//a
//where each row represents one node in the graph
//a is the name of the node
//b is the name of the nodes that are outputs for the node
//there can be any number of outputs as long as they are seperated by commas.
//if there are no b's, then the node only has inputs
//inputs do not need to be stated, they are implied from the outputs.


void setup() 
{
  size(stageSize, stageSize);
  background(backgroundColor);
  
  char[] letters = new char[]{'a'};
  fontA = createFont("Helvetica", 16, true, letters);

  //create blank graph
  graph = new HashMap();
  String[] lines = loadStrings(fileName);
  
  //add the nodes into the graph
  for(int i =0; i <lines.length; i++)
  {
    String[] pieces = split(lines[i], ',');
    
    float startX = random(width);
    float startY = random(height);
    String name = trim(pieces[0]);
    
    graph.put(name, new node(startX, startY, name));
  }
  
  //add the connections
  for(int i =0; i <lines.length; i++)
  {
    String[] pieces = split(lines[i], ',');
    
    String name = trim(pieces[0]);
    for(int j=1; j<pieces.length; j++)
    {
      String output = trim(pieces[j]);
      
      if(output != "" && output != null) 
      {
        if(graph.containsKey(name) && graph.containsKey(output))
        {
          ((node)graph.get(name)).addOutput(output);
          ((node)graph.get(output)).addInput(name);
        } else {
          println("Output/name does not match");
        }
      }
    }
  }
  
  
  
  
}

void draw() 
{
  background(backgroundColor);
  
  Iterator i = graph.entrySet().iterator();  // Get an iterator

  while (i.hasNext()) {
    Map.Entry me = (Map.Entry)i.next();
    ((node)me.getValue()).update();
    ((node)me.getValue()).draw();
  }
}


void mousePressed() 
{
  Iterator i = graph.entrySet().iterator();

  boolean found = false;
  while (i.hasNext() && !found) {
    Map.Entry me = (Map.Entry)i.next();
    found = ((node)me.getValue()).pressed(); 
  }
}

void mouseReleased() 
{
  Iterator i = graph.entrySet().iterator();

  while (i.hasNext()) {
    Map.Entry me = (Map.Entry)i.next();
    ((node)me.getValue()).released(); 
  }
}

