
import gameai.utils.*;
import gameai.graph.*;

Graph[] gs = new Graph[4];
PImage[] graphImage = new PImage[4];
int start[] = new int[4];
int end[] = new int[4];
float nodeSize[] = new float[4];
  
int graphNo = 0;
int algorithm;

int overAlgorithm, overOption, overGraph;
int offX = 10, offY = 10;

boolean[] showOption = new boolean[3];
  
GraphNode[] gNodes, rNodes;
GraphEdge[] gEdges, exploredEdges;
// Pathfinder algorithm
IGraphSearch pathFinder;
// Used to indicate the start and end nodes as selected by the user.
GraphNode startNode, endNode;
boolean selectMode = false;

PImage backImage;

long time;

void setup(){
  size(600,440);
  cursor(CROSS);
  smooth();
  ellipseMode(CENTER);
  backImage = loadImage("backimage.jpg");
  overAlgorithm = overOption = overGraph = -1;
  showOption[2] = true;
  /* MAP 0 : Cityscape
   * map created from B&W image. Nodes are only created in 
   * white areas of the image.
   * Edges are created between adjacent nodes including 
   * diagonals and the traverse cost is based on distance
   * between the nodes. 
   */
  graphNo = 0;
  nodeSize[graphNo] = 10.0f;
  graphImage[graphNo] = loadImage("map03.png");
  gs[graphNo] = new Graph();
  makeGraphFromBWimage(gs[graphNo], graphImage[graphNo], null, 20, 20, true);
  gNodes =  gs[graphNo].getNodeArray();
  end[graphNo] = gNodes[(int) random(0, gNodes.length / 4)].id();
  do
   start[graphNo] = gNodes[(int) random((3 * gNodes.length) / 4, gNodes.length/4)].id();
  while (start[graphNo] == end[graphNo]);
  gs[graphNo].compact();
  
  /* MAP 1 : The maze 
   * created in the same way as the first map but has
   * single width passages to make a maze like map.
   */
  graphNo = 1;
  nodeSize[graphNo] = 10.0f;
  graphImage[graphNo] = loadImage("maze2.png");
  gs[graphNo] = new Graph();
  makeGraphFromBWimage(gs[graphNo], graphImage[graphNo], null, 20, 20, false);
  gNodes =  gs[graphNo].getNodeArray();
  end[graphNo] = gNodes[(int) random(0, gNodes.length / 4)].id();
  do
    start[graphNo] = gNodes[(int) random((3 * gNodes.length) / 4, gNodes.length/4)].id();
  while (start[graphNo] == end[graphNo]);
  gs[graphNo].compact();

  /* MAP 2 : Landscape
   * Created form 2 images the first is a grey-scale image 
   * and nodes are created in non-black areas with edges
   * created between adjacent nodes. The cost of traversing 
   * and edge depends on the level of grey-scale under the
   * 'from' node's position.
   * The second image is used as the background image for 
   * the map. The grey-scale image is obviously based on
   * the background image.
   */
  graphNo = 2;
  nodeSize[graphNo] = 10.0f;
  graphImage[graphNo] = loadImage("map1a.png");
  PImage costImg = loadImage("map1b.png");
  gs[graphNo] = new Graph();
  makeGraphFromBWimage(gs[graphNo], graphImage[graphNo], costImg, 20, 20, true);
  gNodes =  gs[graphNo].getNodeArray();
  end[graphNo] = gNodes[(int) random(0, gNodes.length / 4)].id();
  do
    start[graphNo] = gNodes[(int) random((3 * gNodes.length) / 4, gNodes.length/4)].id();
  while (start[graphNo] == end[graphNo]);
  gs[graphNo].compact();

  /* MAP 3 : Middle earth
   * This graph is created from a text file containing
   * descriptions of the node positions and edges/costs.
   * For details of the format used for this text file 
   * see mearth.txt.
   * This map has two one-way routes, for those familiar
   * with the Lord of the Rings these are the Mines of 
   * Moria (east > west) and the Paths of the Dead 
   * (north > south)
   */
  graphNo = 3;
  nodeSize[graphNo] = 12.0f;
  graphImage[graphNo] = loadImage("mearth.jpg");
  gs[graphNo] = new Graph();
  makeGraphFromFile(gs[graphNo], "mearth.txt");
  gNodes =  gs[graphNo].getNodeArray();
  start[graphNo] = 107;
  end[graphNo] = 106;
  gs[graphNo].compact();
  
  // The GUI will need to know initial options selected
  algorithm = 3;
  graphNo = 0;
  
  // Get arrays of both the nodes and edges used by the
  // selected graph.
  gNodes =  gs[graphNo].getNodeArray();
  gEdges = gs[graphNo].getAllEdgeArray();
  // Create a path finder object based on the algorithm
  pathFinder = makePathFinder(gs[graphNo], algorithm);
  usePathFinder(pathFinder);
}

void usePathFinder(IGraphSearch pf){
  time = System.nanoTime();
  pf.search(start[graphNo], end[graphNo], true);
  time = System.nanoTime() - time;
  rNodes = pf.getRoute();
  exploredEdges = pf.getExaminedEdges();
}

IGraphSearch makePathFinder(Graph graph, int pathFinder){
  IGraphSearch pf = null;
  float f = (graphNo == 2) ? 2.0f : 1.0f;
  switch(pathFinder){
  case 0:
    pf = new GraphSearch_DFS(gs[graphNo]);
    break;
  case 1:
    pf = new GraphSearch_BFS(gs[graphNo]);
    break;
  case 2:
    pf = new GraphSearch_Dijkstra(gs[graphNo]);
    break;
  case 3:
    pf = new GraphSearch_Astar(gs[graphNo], new AshCrowFlight(f));
    break;
  case 4:
    pf = new GraphSearch_Astar(gs[graphNo], new AshManhattan(f));
    break;
  }
  return pf;
}

void mousePressed(){
  // Only consider a mouse press if over the map
  if(mouseX < offX + 400 && mouseY < offY + 400 && mouseX > offX && mouseY > offY){
    startNode = gs[graphNo].getNodeAt(mouseX - offX, mouseY - offY, 0, 16.0f);
    if(startNode != null)
     selectMode = true;
  }
}

void mouseDragged(){
  if(selectMode)
    endNode = gs[graphNo].getNodeAt(mouseX - offX, mouseY - offY, 0, 16.0f);
}

void mouseReleased(){
  if(selectMode && endNode!= null && startNode != null && startNode != endNode){
     start[graphNo] = startNode.id();
     end[graphNo] = endNode.id();
     usePathFinder(pathFinder);
  }
  selectMode = false;
  startNode = endNode = null;
}

void mouseMoved(){
  overAlgorithm = overOption = overGraph = -1;
  if(selectMode == false && mouseX > 430 && mouseX < 560){
    if(mouseY >= 24 && mouseY < 124)
      overAlgorithm = (mouseY - 26) / 20;
    if(mouseY >= 154 && mouseY < 214)
      overOption = (mouseY - 154) / 20;
    if(mouseY >= 318 && mouseY < 398)
      overGraph = (mouseY - 318) / 20;
  }
}

void mouseClicked(){
  if(overAlgorithm >= 0){
     algorithm = overAlgorithm;
     pathFinder = makePathFinder(gs[graphNo], algorithm);
     usePathFinder(pathFinder);
  } 
  if(overGraph >= 0){
     graphNo = overGraph;
     pathFinder = makePathFinder(gs[graphNo], algorithm);
     gNodes = gs[graphNo].getNodeArray();
     gEdges = gs[graphNo].getAllEdgeArray();
     usePathFinder(pathFinder);
  }
  if(overOption >= 0){
    showOption[overOption] = !showOption[overOption];
  }
}

void draw(){
  background(backImage);
  pushMatrix();
  translate(offX, offY);
  if(graphImage[graphNo] != null)
    image(graphImage[graphNo],0,0);

  if(showOption[1]){
    if(graphNo == 3)
      drawEdges(gEdges, color(192,192,192, 128), 1.0f, true);
    else
      drawEdges(gEdges, color(240,192,240, 160), 1.0f, false);
  } 

  if(showOption[2])
      drawEdges(exploredEdges, color(0,0,255), 1.8f, false);

  if(showOption[0] || graphNo == 3)
   drawNodes();

  drawRoute(rNodes, color(200,0,0), 5.0f);

  if(selectMode){
    stroke(0);
    strokeWeight(1.5f);
    if(endNode != null)
      line(startNode.xf(), startNode.yf(), endNode.xf(), endNode.yf());
    else
      line(startNode.xf(), startNode.yf(),mouseX - offX, mouseY - offY);
  }
  popMatrix();
  // Display search analysis data
  text("" + exploredEdges.length , 433, 260);
  text("" + (time * 0.000001f), 449, 280);

  fill(255,255,0,64);
  stroke(255,255,0);
  strokeWeight(1.5);
  // Display option selectors
  if(overAlgorithm >= 0)
    rect(430, 24 + overAlgorithm * 20, 160, 20);
  if(overOption >= 0)
    rect(430, 154 + overOption * 20, 160, 20);
  if(overGraph >= 0)
    rect(430, 318 + overGraph * 20, 160, 20);
  
  // Display option ticks (green boxes)
  noStroke();
  fill(0,160,0);
  rect(433, 29 + algorithm * 20, 10, 10);
  rect(433, 323 + graphNo * 20, 10, 10);
  for(int i = 0; i < showOption.length; i++)
    if(showOption[i]) 
      rect(433, 159 + i * 20, 10, 10);
}

void drawNodes(){
  pushStyle();
  noStroke();
  fill(255,0,255,72);
  for(GraphNode node : gNodes)
    ellipse(node.xf(), node.yf(), nodeSize[graphNo], nodeSize[graphNo]);
  popStyle();
}

void drawEdges(GraphEdge[] edges, int lineCol, float sWeight, boolean arrow){
  if(edges != null){
    pushStyle();
    noFill();
    stroke(lineCol);
    strokeWeight(sWeight);
    for(GraphEdge ge : edges){
      if(arrow)
        drawArrow(ge.from(), ge.to(), nodeSize[graphNo] / 2.0f, 6);
      else {
        line(ge.from().xf(), ge.from().yf(), ge.to().xf(), ge.to().yf()); 
      }
    }
    popStyle();
  }
}

void drawRoute(GraphNode[] r, int lineCol, float sWeight){
  if(r.length >= 2){
    pushStyle();
    stroke(lineCol);
    strokeWeight(sWeight);
    noFill();
    for(int i = 1; i < r.length; i++)
      line(r[i-1].xf(), r[i-1].yf(), r[i].xf(), r[i].yf());
    // Route start node
    strokeWeight(2.0f);
    stroke(0,0,160);
    fill(0,0,255);
    ellipse(r[0].xf(), r[0].yf(), nodeSize[graphNo], nodeSize[graphNo]);
    // Route end node
    stroke(160,0,0);
    fill(255,0,0);
    ellipse(r[r.length-1].xf(), r[r.length-1].yf(), nodeSize[graphNo], nodeSize[graphNo]); 
    popStyle();
  } 
}

 /**
  * Create a tiled graph from an image.
  * This method will accept 1 or 2 images to create a tiled graph (a 2D rectangualr
  * arrangements of nodes.
  * 
 */
void makeGraphFromBWimage(Graph g, PImage backImg, PImage costImg, int tilesX, int tilesY, boolean allowDiagonals){
  int dx = backImg.width / tilesX;
  int dy = backImg.height / tilesY;
  int sx = dx / 2, sy = dy / 2;
  // use deltaX to avoid horizontal wrap around edges
  int deltaX = tilesX + 1; // must be > tilesX

  float hCost = dx, vCost = dy, dCost = sqrt(dx*dx + dy*dy);
  float cost = 0;
  int px, py, nodeID, col;
  GraphNode aNode;

  py = sy;
  for(int y = 0; y < tilesY ; y++){
    nodeID = deltaX * y + deltaX;
    px = sx;
    for(int x = 0; x < tilesX; x++){
      // Calculate the cost
      if(costImg == null){
        col = backImg.get(px, py) & 0xFF;
        cost = 1;
      }
      else {
        col = costImg.get(px, py) & 0xFF;
        cost = 1.0f + (256.0f - col)/ 16.0f; 
      }
      // If col is not black then create the node and edges
      if(col != 0){
        aNode = new GraphNode(nodeID, px, py);
        g.addNode(aNode);
        if(x > 0){
          g.addEdge(nodeID, nodeID - 1, hCost * cost);
          if(allowDiagonals){
            g.addEdge(nodeID, nodeID - deltaX - 1, dCost * cost);
            g.addEdge(nodeID, nodeID + deltaX - 1, dCost * cost);
          }
        }
        if(x < tilesX -1){
          g.addEdge(nodeID, nodeID + 1, hCost * cost);
          if(allowDiagonals){
            g.addEdge(nodeID, nodeID - deltaX + 1, dCost * cost);
            g.addEdge(nodeID, nodeID + deltaX + 1, dCost * cost);
          }
        }
        if(y > 0)
          g.addEdge(nodeID, nodeID - deltaX, vCost * cost);
          if(y < tilesY - 1)
            g.addEdge(nodeID, nodeID + deltaX, vCost * cost);
      }
      px += dx;
      nodeID++;
    }
    py += dy;
  }
}

void makeGraphFromFile(Graph g, String fname){
  String lines[];
  lines = loadStrings(fname);
  int mode = 0;
  int count = 0;
  while(count < lines.length){
    lines[count].trim();
    if(!lines[count].startsWith("#") && lines[count].length() > 1){
      switch(mode){
      case 0:
        if(lines[count].equalsIgnoreCase("<nodes>"))
          mode = 1;
        else if(lines[count].equalsIgnoreCase("<edges>"))
          mode = 2;
      break;
      case 1:
        if(lines[count].equalsIgnoreCase("</nodes>"))
          mode = 0;
        else 
          makeNode(lines[count], g);
      break;
      case 2:
        if(lines[count].equalsIgnoreCase("</edges>"))
          mode = 0;
        else
          makeEdge(lines[count], g);
       break;
      } // end switch
    } // end if
   count++;
  } // end while
}

void makeNode(String s, Graph g){
  int nodeID;
  float x,y, z = 0;
  String part[] = split(s, " ");
  if(part.length >= 3){
    nodeID = Integer.parseInt(part[0]);
    x = Float.parseFloat(part[1]);
    y = Float.parseFloat(part[2]);
    if(part.length >=4)
      z = Float.parseFloat(part[3]);
    g.addNode(new GraphNode(nodeID, x, y, z));
  }
}

 /**
  * Creates an edge(s) between 2 nodes.
  * 
  * Each line of the configuration file has either 3 or 4 entries, the
  * first 2 are the node id numbers, for the from and to nodes. If 
  * either node does not exist then the edge will not be created.
  * 
  * The third value is the cost from-to nodes and the fourth the cost 
  * to-from node (i.e. the return cost). So it is possible to create a 
  * bidirectional route between the nodes with different costs.
  * 
  * Note if a fourth value is not provided then it will not create the
  * edge for the return route.
  * 
  * In both cases if the cost is =0 then the cost is calculated as the
  * euclidean distance (shortest) between the nodes. If the cost <0 
  * then that edge will not be created.
  *  
  * @param s a line from the configuration file.
  * @param g the graph to add the edge.
  */
void makeEdge(String s, Graph g){
  int fromID, toID;
  float costOut = 0, costBack = 0;
  String part[] = split(s, " ");
  if(part.length >= 3){
    fromID = Integer.parseInt(part[0]);
    toID = Integer.parseInt(part[1]);
    try{
      costOut = Float.parseFloat(part[2]);
    }
    catch(Exception excp){
      costOut = -1;
    }
    try{
      costBack = Float.parseFloat(part[3]);
    }
    catch(Exception excp){
      costBack = -1;
    }
    if(costOut >= 0)
      g.addEdge(fromID, toID, costOut);
    if(costBack >= 0)
      g.addEdge(toID, fromID, costBack);  
  }
}

void drawArrow(GraphNode fromNode, GraphNode toNode, float nodeRad, float arrowSize){
  float fx, fy, tx, ty;
  float ax, ay, sx, sy, ex, ey;
  float awidthx, awidthy;

  fx = fromNode.xf();
  fy = fromNode.yf();
  tx = toNode.xf();
  ty = toNode.yf();

  float deltaX = tx - fx;
  float deltaY = (ty - fy);
  float d = sqrt(deltaX * deltaX + deltaY * deltaY);

  sx = fx + (nodeRad * deltaX / d);
  sy = fy + (nodeRad * deltaY / d);
  ex = tx - (nodeRad * deltaX / d);
  ey = ty - (nodeRad * deltaY / d);
  ax = tx - (nodeRad + arrowSize) * deltaX / d;
  ay = ty - (nodeRad + arrowSize) * deltaY / d;

  awidthx = - (ey - ay);
  awidthy = ex - ax;

  noFill();
  strokeWeight(4.0f);
  stroke(160, 128);
  line(sx,sy,ax,ay);

  noStroke();
  fill(48, 128);
  beginShape(TRIANGLES);
  vertex(ex, ey);
  vertex(ax - awidthx, ay - awidthy);
  vertex(ax + awidthx, ay + awidthy);
  endShape();
 }



