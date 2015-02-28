


int graphWidth=30;
int numConnections = 15;
Node connectedFrom=null;
boolean displayingLengths=false;

ArrayList<Node> nodes;

int aNode=0;
int bNode=5;

void setup() {
  size(1200, 700);
  smooth();
  background(40, 80, 255);
  nodes = new ArrayList<Node>();
  for ( int i=0;i<graphWidth;i++) {
    nodes.add(new Node(i));
  }


  int connectionsMade=0;
  while (connectionsMade<numConnections) {
    for (int i=0;i<nodes.size();i++) {
      for (int j=i;j<nodes.size();j++) {
        if (random(100)<3) {
          nodes.get(i).connectTo(nodes.get(j));
          connectionsMade++;
        }
      }
    }
  }
  
  println(printGraph());
  displayNodes();
  
}

int[][] printGraph() {
  int [][]result = new int [graphWidth][graphWidth];
  println("------------------");
  println(graphWidth);

  for (int r=0;r<graphWidth;r++) {
    
    for(int i=0;i<graphWidth;i++){
      result[i][r]=nodes.get(r).connectedArray(graphWidth)[i];
    }
  }

  return result;
}

void printGraphToWindow() {
  int [][]result = new int [graphWidth][graphWidth];
  println("------------------");
  println(graphWidth);

  for (int r=0;r<graphWidth;r++) {
    println(nodes.get(r).printConnections(graphWidth));

  }


}

void draw() {
  
  
  
  background(40, 80, 255);
   
  displayNodes();
     Dijkstras dykestras = new Dijkstras();
 println(dykestras.dijkstras(printGraph(),aNode,bNode,70));
  updateNodes();
  for (int r=0;r<nodes.size();r++) {

    if (mousePressed && mouseButton == LEFT && dist(pmouseX, pmouseY, nodes.get(r).loc.x, nodes.get(r).loc.y)<35) {
      nodes.get(r).loc=new PVector(mouseX, mouseY);
      break;
    }
    


  }

  connectedFromStuff();
  fill(180);
  text("P to print graph",10,20);
  text("Right click to add connections",10,35);
  text("L to to toggle connection length display",10,50);
  text("D to destroy moused over node's connections",10,65);
  text("A and B to set path start and end points respectivly",10,80);

  
}


void connectedFromStuff() {
  if (connectedFrom !=null) {
    line(mouseX, mouseY, connectedFrom.loc.x, connectedFrom.loc.y);
  }
}


void mouseClicked() {
  if (mouseButton == RIGHT) {
    for (int r=0;r<nodes.size();r++) {

      if ( dist(pmouseX, pmouseY, nodes.get(r).loc.x, nodes.get(r).loc.y)<35) {
        if (connectedFrom ==null) {
          connectedFrom = nodes.get(r);
        }

        else if (connectedFrom!=nodes.get(r)) {
          nodes.get(r).connectTo(connectedFrom);
        }
        break;
      }
    }
  }
  else if (mouseButton == LEFT) {
    connectedFrom=null;
  }
}


void displayNodes() {
  for (int r=0;r<nodes.size();r++) {

    nodes.get(r).drawConnections();
  }
  for (int r=0;r<nodes.size();r++) {

    nodes.get(r).display();
  }
}


void updateNodes() {
  for (int r=0;r<nodes.size();r++) {

    nodes.get(r).update();
  }
}


Node getNodeOfLabel(int test) {
    for (int i=0;i<nodes.size();i++) {
      if (nodes.get(i).label==test) {
        return nodes.get(i);
      }
    }
    return null;
}

void keyPressed() {
  if (key=='l' || key == 'L') {
    displayingLengths=!displayingLengths;
  }

  if (key =='p' || key == 'P') {
    printGraphToWindow();
  }

  if (key == 'd' || key == 'D') {
    destroyConnections();
  }

  if (key == 'a' || key == 'A') {
    for (int r=0;r<nodes.size();r++) {
      if (  dist(mouseX, mouseY, nodes.get(r).loc.x, nodes.get(r).loc.y)<35) {
        aNode=nodes.get(r).label;
        break;
      }
    }
  }
  if (key == 'b' || key == 'B') {
    for (int r=0;r<nodes.size();r++) {
      if (  dist(mouseX, mouseY, nodes.get(r).loc.x, nodes.get(r).loc.y)<35) {
        bNode=nodes.get(r).label;
        break;
      }
    }
  }
}


void destroyConnections() {
  for (int r=0;r<nodes.size();r++) {
    if (  dist(mouseX, mouseY, nodes.get(r).loc.x, nodes.get(r).loc.y)<35) {
      nodes.get(r).destroyNodeConnections();
      break;
    }
  }
}



class Node {
  PVector loc;
  int label;

  int lengthDivision = 15;

  ArrayList<Node> connectedNodes;

  Node(int newLabel) {
    connectedNodes = new ArrayList<Node>();
    label = newLabel;


    loc = legal();
  }

  PVector legal() {
    PVector test = new PVector(100, 100);
    while (true) {
      if (nodes.size()==0) {
        return test;
      }
      boolean needMoveX = false;
      boolean needMoveY = false;
      for (int i=0;i<nodes.size();i++) {
        if (nodes.get(i) != this) {

          if (dist(test.x, test.y, nodes.get(i).loc.x, nodes.get(i).loc.y)<90) {
            needMoveY=true;
            needMoveX=true;
          }
        }
      }
      if (!needMoveY && ! needMoveX) {


        return test;
      }
      if (needMoveY) {
        test.y = random(height);
      }

      if (needMoveX) {
        test.x = random(width);
      }
    }
  }

  void update() {
    for (int r=0;r<nodes.size();r++) {
      if (nodes.get(r)!=this) {
        PVector test = new PVector(nodes.get(r).loc.x-loc.x, nodes.get(r).loc.y-loc.y);

        float forceMult = 1/(test.mag()/1000)*20;

        if (test.mag()>120) {
          forceMult=0;
        }

        test.normalize();



        if (forceMult<0) {
          forceMult=0;
        }

        test.x*= -forceMult;
        test.y*= -forceMult;





        test.x /= 100;
        test.y /= 100;
        loc.x+=test.x;
        loc.y+=test.y;

        if (hasNodeIsOfLabel(r)) {
          PVector yeah = new PVector(nodes.get(r).loc.x-loc.x, nodes.get(r).loc.y-loc.y);
          float origLength = yeah.mag();
          yeah.normalize();
          float attractionMult = 2;
          if (origLength>200 ) {
            attractionMult =origLength/2;
            attractionMult =10;
          }

          attractionMult = origLength/20;
          if (dist(loc.x, loc.y, mouseX, mouseY)<35 && mousePressed) {
            attractionMult=0;
          }

          yeah.x*=attractionMult;
          yeah.y*=attractionMult;

          loc.x+=yeah.x;
          loc.y+=yeah.y;
        }
      }
    }

    if (loc.x<50) {
      loc.x=50;
    }
    if (loc.y<50) {
      loc.y=50;
    }

    if (loc.x>width-50) {
      loc.x=width-50;
    }
    if (loc.y>height-50) {
      loc.y=height-50;
    }
  }


  void connectTo(Node toAdd) {
    if (!hasNodeIsOfLabel(toAdd.label)) {
      connectedNodes.add(toAdd);
      toAdd.connectedNodes.add(this);
    }
  }

  String printConnections(int graphWidth) {
    String result = "";
    for (int i=0;i<graphWidth;i++) {
      if (hasNodeIsOfLabel(i) ||( i==label)&&( getConnectedNodeOfLabel(i)!=null)) {
        result+=(int)(new PVector(getConnectedNodeOfLabel(i).loc.x-loc.x, getConnectedNodeOfLabel(i).loc.y-loc.y).mag()/lengthDivision);
      }
      else {
        result +=0;
      }
      result+=" ";
    }
    return result;
  }

  int[] connectedArray(int graphWidth) {
    int[] result = new int[graphWidth];
    for (int i=0;i<graphWidth;i++) {
      if (hasNodeIsOfLabel(i) ||( i==label && getConnectedNodeOfLabel(i)!=null)) {
     
        result[i]=(int)(new PVector(getConnectedNodeOfLabel(i).loc.x-loc.x, getConnectedNodeOfLabel(i).loc.y-loc.y).mag()/lengthDivision);
      }
      else {
        result [i]=0;
      }
    }
    result[label]=1;
    return result;
  }


  boolean hasNodeIsOfLabel(int test) {
    for (int i=0;i<connectedNodes.size();i++) {
      if (connectedNodes.get(i).label==test) {
        return true;
      }
    }
    return false;
  }

  Node getConnectedNodeOfLabel(int test) {
    for (int i=0;i<connectedNodes.size();i++) {
      if (connectedNodes.get(i).label==test) {
        return connectedNodes.get(i);
      }
    }
    return null;
  }

  void drawConnections() {
    ellipse(loc.x, loc.y, 15, 15);
    for (int i=0;i<connectedNodes.size();i++) {
      stroke(150);
      strokeWeight(2);
      line(loc.x, loc.y, connectedNodes.get(i).loc.x, connectedNodes.get(i).loc.y);

      if (displayingLengths) {
        PVector test = new PVector(connectedNodes.get(i).loc.x-loc.x, connectedNodes.get(i).loc.y-loc.y);
        strokeWeight(0);
        fill(100, 200, 255);
        ellipse(loc.x+test.x/2, loc.y+test.y/2, 20, 20);
        fill(0);
        text((int)(test.mag()/lengthDivision), loc.x+test.x/2-7, loc.y+test.y/2+5);
        fill(255);
      }
    }
  }

  void destroyNodeConnections() {
    for (int i=0;i<connectedNodes.size();i++) {
      connectedNodes.get(i).connectedNodes.remove(this);
    }
    connectedNodes = new ArrayList();
  }

  void display() {
    strokeWeight(0);
    fill(255);
    ellipse(loc.x, loc.y, 35, 35);
    fill(0);
    text(this.label, loc.x-7, loc.y+5);
    fill(255);
  }
}

import java.util.*;
import java.io.*;
import java.util.Scanner;

class Dijkstras {
    

    
    int[][] loadGraph() {
        Scanner s = new Scanner(System.in);
        int numVertices = s.nextInt();
        int[][] graph = new int[numVertices][numVertices];
        System.out.println("Graph:");
        for (int i=0; i<numVertices; i++) {
            for (int j=0; j<numVertices; j++) {
                graph[i][j]=s.nextInt();
                System.out.print(graph[i][j]+" ");
            }
            System.out.println("");
        }
        return graph;
    }
    
    boolean doesPathExist(int[][] graph, int start, int goal) {
        ArrayList<Integer> openNodes;
        ArrayList<Integer> visitedNodes;
        openNodes = new ArrayList<Integer>();
        visitedNodes = new ArrayList<Integer>();
        
        
        openNodes.addAll(getAllConnections(graph, start));
        visitedNodes.add(start);
        
        
        while (openNodes.size ()>0) {
            
            
            for (int i=0;i<openNodes.size();i++) {
                
                
                if (openNodes.get(i)==goal) {
                    return true;
                }
                
                visitedNodes.add(openNodes.get(i));
                
                
                ArrayList <Integer> nextSteps = getAllConnections(graph, openNodes.get(i));
                openNodes.remove(i);
                
                for (int j=0;j<nextSteps.size();j++) {
                    
                    if (!visitedNodes.contains(nextSteps.get(j))) {
                        openNodes.add(nextSteps.get(j));
                    }
                }
         
            }
        }
        return false;
    }
    
    boolean isComplete(int[][] graph, int width) {
        for (int i=0; i<width;i++) {
            for (int j=i;j<width;j++) {
                if (!doesPathExist(graph, i, j)) {
                    return false;
                }
            }
        }
        return true;
    }
    
    boolean dijkstras(int[][] graph, int first, int goal, int nodeVisitsAllowed) {
        if (!doesPathExist(graph, first, goal)) {
            return false;
        }
        
        int[] pathLengths = new int[graph[0].length];
        for(int i=0;i<pathLengths.length;i++){
            pathLengths[i]=999999999;
        }
        
        int[] prevArray = new int[graph[0].length];
        prevArray[first]=-1;
        
        ArrayList<Integer> openNodes = new ArrayList<Integer>();
        ArrayList<Integer> visitedNodes = new ArrayList<Integer>();
        openNodes.add(first);
        visitedNodes.add(first);
        pathLengths[first]=0;
        
        while (true){
            ArrayList <Integer> oldOpenNodes = new ArrayList<Integer>();
            for(int z=0;z<openNodes.size();z++){
                oldOpenNodes.add(openNodes.get(z));
            }    
            for(int i=0;i<openNodes.size();i++){
                ArrayList theseConnections = getAllConnections(graph,openNodes.get(i));
 
                
                
                
                for(int j=0;j<theseConnections.size();j++){
                    if(pathLengths[(Integer)openNodes.get(i)]+graph[(Integer)theseConnections.get(j)][(Integer)openNodes.get(i)]<pathLengths[(Integer)theseConnections.get(j)]){
                        pathLengths[(Integer)theseConnections.get(j)]=pathLengths[(int)openNodes.get(i)]+graph[(Integer)theseConnections.get(j)][(Integer)openNodes.get(i)];
                        prevArray[(Integer)theseConnections.get(j)]=(Integer)openNodes.get(i);
                        openNodes.addAll(theseConnections);
                    }
                }
                
                
            }
            
            for(int z=0;z<oldOpenNodes.size();z++){
                openNodes.remove(oldOpenNodes.get(z));
            } 
            
            
            if( openNodes.contains((Integer)goal)){
                prevArray[first]=-1;
                
                drawPathFromPrevArray(prevArray, goal);
                
                
                
                return true;
            }
            if(openNodes.size()==0 ){
                
                return false;
            }
        }
        
        
        
        //return false;
    }
    
    boolean AStar (int[][] graph, int first, int goal, int nodeVisitsAllowed) {
        
        if (!doesPathExist(graph, first, goal)) {
            return false;
        }
        
        int[] distGuesses = new int[nodes.size()];
        for(int i=0;i<nodes.size();i++){
            distGuesses[i]=(int)dist(getNodeOfLabel(first).loc.x,getNodeOfLabel(first).loc.y,nodes.get(i).loc.x,nodes.get(i).loc.y);
                                                                    
        }
        
        int[] pathLengths = new int[graph[0].length];
        for(int i=0;i<pathLengths.length;i++){
            pathLengths[i]=999999999;
        }
        
        int[] prevArray = new int[graph[0].length];
        prevArray[first]=-1;
        
        ArrayList<Integer> openNodes = new ArrayList<Integer>();
        ArrayList<Integer> visitedNodes = new ArrayList<Integer>();
        openNodes.add(first);
        visitedNodes.add(first);
        pathLengths[first]=0;
        
        
        
        
        while (true){
            ArrayList <Integer> oldOpenNodes = new ArrayList<Integer>();
  
            for(int i=0;i<openNodes.size();i++){
                ArrayList theseConnections = getAllConnections(graph,openNodes.get(i));
               
                
                
                
                for(int j=0;j<theseConnections.size();j++){
                    if(pathLengths[(Integer)openNodes.get(i)]+graph[(Integer)theseConnections.get(j)][(Integer)openNodes.get(i)]<pathLengths[(Integer)theseConnections.get(j)]){
                        pathLengths[(Integer)theseConnections.get(j)]=pathLengths[(int)openNodes.get(i)]+graph[(Integer)theseConnections.get(j)][(Integer)openNodes.get(i)];
                        prevArray[(Integer)theseConnections.get(j)]=(Integer)openNodes.get(i);
                        openNodes.addAll(theseConnections);
                        oldOpenNodes.add(openNodes.get(i));
                    }
                }
                
                
            }
            
            for(int z=0;z<oldOpenNodes.size();z++){
                openNodes.remove(oldOpenNodes.get(z));
            } 
            
            
            if( openNodes.contains((Integer)goal)){
                prevArray[first]=-1;
                //printPathFromPrevArray(prevArray,goal);
                drawPathFromPrevArray(prevArray, goal);
                
                
                
                return true;
            }
            if(openNodes.size()==0 ){
                
                return false;
            }
        }
        
        
        //return false;
    }
    
    boolean getShortestPath(int[][] graph, int start, int goal, int nodeVisitsAllowed) {
        int numNodeVisits=0;
        
        if (!doesPathExist(graph, start, goal)) {
            return false;
        }
        int[][]waterTimes = new int[graph[0].length][graph[0].length];
        
        int waterIsRising=0;
        
        if (start>goal) {
            int temp = goal;
            goal = start;
            start=temp;
        }
        if (start == goal) {
            return true;
        }
        
        if (start < 0 || goal < 0 || start>graph[0].length || goal>graph[0].length) {
            System.out.println("HA");
            return false;
        }
        
        
        ArrayList<Integer> openNodes;
        ArrayList<Integer> visitedNodes;
        openNodes = new ArrayList<Integer>();
        visitedNodes = new ArrayList<Integer>();
        
        int[] prevArray = new int[graph[0].length];
        prevArray[start]=-1;
        for (int i=0;i<prevArray.length;i++) {
            prevArray[i]=-5;
        }

        //-1 means it is root node
        
     
        openNodes.add(start);
        int fathomsOnFathomsOnFathomsINCOMPRIHENSIBLEDEPTH=0;
        for (int x=0;x<graph[0].length;x++) {
            for (int y=0;y<graph[0].length;y++) {
                fathomsOnFathomsOnFathomsINCOMPRIHENSIBLEDEPTH+=graph[x][y];
            }
        }
        
        
        
        while (openNodes.size ()>0) {
            println("here" + " " + openNodes);
            for (int i=0;i<openNodes.size();i++) {
                
                
                if (openNodes.get(i)==goal && numNodeVisits<=nodeVisitsAllowed) {
                    prevArray[start]=-1;
             
                    drawPathFromPrevArray(prevArray, goal);
                    
                    
                    
                    return true;
                }
                else if (numNodeVisits>=nodeVisitsAllowed) {
                    fill(0);
                    for (int r=0;r<openNodes.size();r++) {
                        ellipse(getNodeOfLabel(openNodes.get(r)).loc.x, getNodeOfLabel(openNodes.get(r)).loc.y, 20, 20);
                    }
                    return false;
                }
                
                visitedNodes.add(openNodes.get(i));
                
                
                ArrayList <Integer> nextSteps = getAllConnections(graph, (int)openNodes.get(i));
                ArrayList <Integer> oldOpenNodes = new ArrayList<Integer>();
                oldOpenNodes.addAll(openNodes);
                
                for (int j=0;j<nextSteps.size();j++) {
                    
                    if (!visitedNodes.contains(nextSteps.get(j))) {

                        if (openNodes.get(i)!=nextSteps.get(j) ) {
                            if (graph[nextSteps.get(j)][openNodes.get(i)]+waterTimes[nextSteps.get(j)][openNodes.get(i)]<=waterIsRising) {
                                System.out.println("OES");
                                
                                openNodes.add(nextSteps.get(j));
                                numNodeVisits++;
                                visitedNodes.add(nextSteps.get(j));
                                prevArray[nextSteps.get(j)]=openNodes.get(i);
                                waterTimes[(int)nextSteps.get(j)][(int)openNodes.get(i)]=waterIsRising;
                                waterTimes[(int)openNodes.get(i)][(int)nextSteps.get(j)]=waterIsRising;
                                
                                waterIsRising=0;
                               
                            }
                        }
                    }
                    boolean saved = false;
                    for (int r=0;r<nextSteps.size();r++) {
                        if (!(openNodes.contains(nextSteps.get(r)) && visitedNodes.contains(nextSteps.get(r)))) {
                            saved = true;
                        }
                    }
                    if (!saved) {
                        if (i<openNodes.size()) {
                        }
                        else {
                            openNodes.remove(openNodes.size()-1);
                        }
                    }
                }
                openNodes.remove(oldOpenNodes);
                waterIsRising++;
            }
        }
        return false;
    }
    
    boolean intArrayListContains(ArrayList list, int test) {
        for (int i=0;i<list.size();i++) {
            int num = (int)(Integer)list.get(i);
            if (test == num) {
                return true;
            }
        }
        return false;
    }
    
    void printPathFromPrevArray(int[] pathArray, int pathEnd) {
        int current = pathEnd;
        System.out.println(pathArray.toString());
        System.out.println("pathEnd  " + pathEnd );
        ArrayList<Integer> finalPath = new ArrayList<Integer>();
        for (int i=0;i<pathArray.length;i++) {

        }
        while (true) {
            
            finalPath.add(current);
            if (pathArray[current]==-1 ) {
                break;
            }
            else {
                current = pathArray[current];
            }
        }
        System.out.println("\n Final path: "+finalPath.toString());
    }
    
    void drawPathFromPrevArray(int[] pathArray, int pathEnd) {
        int current = pathEnd;
        System.out.println(pathArray.toString());
        System.out.println("pathEnd  " + pathEnd );
        ArrayList<Integer> finalPath = new ArrayList<Integer>();
        for (int i=0;i<pathArray.length;i++) {
            System.out.print(pathArray[i] + "  --  ");
        }
        while (true) {
            
            finalPath.add(current);
            if (pathArray[current]==-1 ) {
                break;
            }
            else {
                current = pathArray[current];
            }
        }
        for (int i = 0 ;i<finalPath.size()-1;i++) {
            stroke(0);
            strokeWeight(5);
            line(getNodeOfLabel((int)finalPath.get(i)).loc.x, getNodeOfLabel((int)finalPath.get(i)).loc.y, getNodeOfLabel((int)finalPath.get(i+1)).loc.x, getNodeOfLabel((int)finalPath.get(i+1)).loc.y);
        }
    }
    
    ArrayList<Integer> arrayPathFromPrevArray(int[] pathArray, int pathEnd) {
        int current = pathEnd;
       
        System.out.println(pathArray.toString());
        System.out.println("pathEnd  " + pathEnd );
        ArrayList<Integer> finalPath = new ArrayList<Integer>();

        while (true) {
            
            finalPath.add(current);
            if (pathArray[current]==-1 ) {
                break;
            }
            else {
                current = pathArray[current];
            }
        }
        return finalPath;
       
    }
    
    
    
    boolean isConnected(int [][]graph, int node1, int node2) {
        if (node1 != node2 && graph[node1][node2]!=0) {
            return true;
        }
        return false;
    }
    
    ArrayList getAllConnections(int[][]graph, int nodeFrom) {
        ArrayList<Integer> result = new ArrayList<Integer>();
        for (int i=0;i<graph[0].length;i++) {
            if (isConnected(graph, nodeFrom, i)) {
                result.add(i);
            }
        }
        return result;
    }
}



