
import java.util.*;
import controlP5.*;
//PImage bg;
ControlP5 cp5;
DropdownList d1, d2;
int cnt = 0;
int node1x, node1y; //Position of Node 1
int node2x, node2y; //Position of Node 2
int node3x, node3y; //Position of Node 3
int nodeSize = 20; //Diameter of Nodes
color node1color, node2color, node3color; //Colors of nodes
color currentColor;
color node1highlight, node2highlight, node3highlight; //Highlight colors of node (on mouseover)
boolean node1over = false; //Is mouse over node or not?
boolean node2over = false;
boolean node3over = false;
boolean mousePress = false;
int mouse1x, mouse2x, mouse1y, mouse2y; //Placeholder variables for beginning/end positions of mouse
int ddlx, ddly;

void setup(){
  //bg = loadImage("g.jpg");
  size(750,400); //Size of canvas
  node1color = color(0,0,255); //Beginning colors of node 1, 2, and 3
  node2color = color(0,255,0);
  node3color = color(255,0,0);
  node1x = 75; //Coordinates of the individual nodes
  node1y = 100;
  node2x = 675;
  node2y = 100;
  node3x = 375;
  node3y = 300;
  ellipseMode(CENTER);
  
  //Place centered dropdown list
  cp5 = new ControlP5(this);
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d").setPosition(325, 150); 
  customize(d1); 
  
}
void draw(){
  
  background(255);
  update(mouseX,mouseY);
  
  if (node1over){
    fill(node1highlight);
  }else{
    fill(node1color);
    stroke(node1color);
  }
  ellipse(node1x,node1y,nodeSize,nodeSize);
  if (node2over){
    fill(node2highlight);
  }else{
    fill(node2color);
  }
  stroke(node2color);
  ellipse(node2x,node2y,nodeSize,nodeSize);
  if (node3over){
    fill(node3highlight);
  }else{
    fill(node3color);
  }
  stroke(node3color);
  ellipse(node3x,node3y,nodeSize,nodeSize);
}


//Function written to continuously update the overNode booleans
void update(int x, int y){
  if ( overNode1(node1x, node1y, nodeSize)){
    node1over = true;
    node2over = false;
    node3over = false;
  }else if ( overNode2(node2x, node2y, nodeSize)){
    node1over = false;
    node2over = true;
    node3over = false;
  }else if ( overNode3(node3x, node3y, nodeSize)){
    node1over = node2over = false;
    node3over = true;
  }else{
    node1over = node2over = node3over = false;
  }
}



//Changes color variables when mouse is pressed
void mousePressed(){
  if(node1over){
    node1color = color(0);
    node2color = color(0,255,0);
    node3color = color(255,0,0);
    /**
    // create a DropdownList
    cp5 = new ControlP5(this);
    d1 = cp5.addDropdownList("myList-d1").setPosition(mouseX, mouseY); 
    customize(d1); // customize the list
    **/
  }
  if(node2over){
    node1color = color(0,0,255);
    node2color = color(0);
    node3color = color(255,0,0);
    /**
    cp5 = new ControlP5(this);
    // create a DropdownList
    d1 = cp5.addDropdownList("myList-d1").setPosition(mouseX, mouseY); 
    customize(d1); 
    **/
    }
  if(node3over){
    node1color = color(0,0,255);
    node2color = color(0,255,0);
    node3color = color(0);
    /**
    cp5 = new ControlP5(this);
    // create a DropdownList
    d1 = cp5.addDropdownList("myList-d1").setPosition(mouseX, mouseY);       
    customize(d1);
    **/
    }
    /**Update variables for detecting where mouse is released (for hiding individual dropdown menus)
  ddlx = mouseX;
  ddly = mouseY;
  **/
  
  
  mousePress = true;
  
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("Options");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  //We can add as many options to the dropdown list as necessary, depending on how many analyses of data we have
  ddl.addItem("AVG TIME: 1->2",1);
  ddl.addItem("AVG TIME: 1->3",2);
  ddl.addItem("AVG TIME: 2->1",3);
  ddl.addItem("AVG TIME: 2->3",4);
  ddl.addItem("AVG TIME: 3->1",5);
  ddl.addItem("AVG TIME: 3->2",6);
  ddl.addItem("TOTAL TRAFFIC: 1->2",7);
  ddl.addItem("TOTAL TRAFFIC: 1->3",8);
  ddl.addItem("TOTAL TRAFFIC: 2->1",9);
  ddl.addItem("TOTAL TRAFFIC: 2->3",10);
  ddl.addItem("TOTAL TRAFFIC: 3->1",11);
  ddl.addItem("TOTAL TRAFFIC: 3->2",12);
  ddl.addItem("TOTAL TRAFFIC: 1->1",13);
  ddl.addItem("TOTAL TRAFFIC: 2->2",14);
  ddl.addItem("TOTAL TRAFFIC: 3->3",15);
  ddl.addItem("AVG WAIT: NODE 1",16);
  ddl.addItem("AVG WAIT: NODE 2",17);
  ddl.addItem("AVG WAIT: NODE 3",18);
  
  
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}


    

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.
  // These controlEvents triggered will be what allows us to display data or visualizations from pre-loaded tables
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

//Sets final coordinates for arrows upon release of mouse
void mouseReleased(){
  if(!node1over){ //Resets colors of nodes when mouse is released
    node1color = color(0,0,255);
    node2color = color(0,255,0);
    node3color = color(255,0,0);
  }else if(!node2over){
    node1color = color(0,0,255);
    node2color = color(0,255,0);
    node3color = color(255,0,0);
  }else if(!node3over){
    node1color = color(0,0,255);
    node2color = color(0,255,0);
    node3color = color(255,0,0);
  }else{
    node1color = color(0,0,255);
    node2color = color(0,255,0);
    node3color = color(255,0,0);
  }
  //Update variables tracking where mouse was last clicked
  if(mousePress){
  int mouse2x = mouseX;
  int mouse2y = mouseY;
  }
  mousePress = false;
  /**code for hiding dropdown lists if not selected
  if(mouseX > ddlx+50){
    cp5.hide();
  }else if(mouseY > ddly+10){
    cp5.hide();
  }else if(mouseX < ddlx){
    cp5.hide();
  }else if(mouseY < ddly-5){
    cp5.hide();
  }
  **/
}
//Boolean values declared with true/false returns if mouse is over/not over the node
boolean overNode1(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}
boolean overNode2(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}
boolean overNode3(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}




