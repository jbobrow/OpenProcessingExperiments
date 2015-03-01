
import javax.swing.*;
Graph g;
boolean mouseDrag = false;

//Setup method that creates a background, size, and initial state of the graph.
void setup() {
  background(255, 255, 255);
  size(1000, 800);
  g = new Graph();
  g.drawGraph();
}

//Calls IO methods implicitly
void draw() {
}

//If the mouse is pressed, this method is called
void mousePressed() {
  Node cur = g.getOverlap(); //Get the thing the mouse is on top of
  if (cur != null) { //if there is something
    cur.setSelected(); //Select the node
    cur.drawNode(); //Make it a pretty color
  } else {
    g.addNode(); //A blank node is added.
  }
}

//If the mouse is dragged, this method is called
void mouseDragged() {
  Node cur = g.getOverlap();
  mouseDrag = true; //Set boolean for mouseReleased method
}

//When the mouse is released, this method is called
void mouseReleased() {
  Node cur = g.getOverlap(); //Gets what the mouse is over
  //If the mouse is on top of something that isn't the connected node, the mouse was being dragged, and there is something selected
  if (cur != null && cur != g.getSelected() && mouseDrag && g.getSelected() != null) { 
    String strWeight = JOptionPane.showInputDialog("What is the weight of the new Edge?"); //Prompt user for desired weight
    if (strWeight != null) { //As long as the string input is valid
      int weight = Integer.parseInt(strWeight); //Get the int version
      System.out.println("EDGE ADDED OF WEIGHT: " + weight);
      Edge add = new Edge(g.getSelected(), cur, weight); //Create a new edge between the selected node and 
      g.getSelected().edges.add(add); //Add new edge
      g.addEdge(add); //Adds the edge to the graph
      g.update(); //Update the graph
      g.drawGraph(); //Draw the graph
    }
  }
  g.deselectAll(); //Deselect any selected values
  mouseDrag = false; //Mouse is no longer being dragged
}


