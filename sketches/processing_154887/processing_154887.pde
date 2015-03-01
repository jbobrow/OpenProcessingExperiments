
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/60661*@* */

/*----------------------------------
 Spring / Nodes by Generative Gestaltug
 
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
 
 -----------------------------------*/

import generativedesign.*;

// an array for the nodes
Node[] nodes;
// an array for the springs
Spring[] springs;
String [] names;
int [] [] viewPerPhoto;

// dragged node
Node selectedNode = null;
PFont font;
boolean drawInfo = false;

void setup() {
  size(800, 800);
  smooth();

  font = createFont ("Arial", 14);
  textFont (font);
  textAlign (CENTER, CENTER);

  loadJson();
  initNodesAndSprings();
}


void draw() {

  background(#57385c);

  moveNodes(); 
  interactWithNodes();
  drawNotes ();
  if (drawInfo) drawInformations();
}

void drawInformations ()
{
  noStroke();
  int index = 1;
  for (int i = 0; i < names.length; i++)
  {
    fill (#57385c, 180);
    rect (nodes [index].x-textWidth (names [i]) /2-10, nodes [index].y - 8, textWidth (names [i])+20, 20);

    fill (255);
    text (names [i], nodes [index].x, nodes [index].y);

    index += 1 + viewPerPhoto [i].length;
  }
}

void moveNodes ()
{
  // let all nodes repel each other
  for (int i = 0; i < nodes.length; i++) 
  {
    nodes[i].attract(nodes);
  } 
  // apply spring forces
  for (int i = 0; i < springs.length; i++) 
  {
    springs[i].update();
  } 

  int index = 1;
  int count = 0;
  // apply velocity vector and update position
  for (int i = 0; i < nodes.length; i++) 
  {
    if (frameCount > 200)
    {
      if ( i != index) nodes[i].update();
      else 
      {
        index +=  1 + viewPerPhoto [count].length;
        count++;
      }
    }
    else nodes[i].update();
  }
}


void interactWithNodes ()
{
  if (selectedNode != null) 
  {
    selectedNode.x = mouseX;
    selectedNode.y = mouseY;
    frameCount = 0;
  }
}

void drawNotes ()
{
  stroke(#ffedbc);
  strokeWeight(2);

  // draw connections
  for (int i = 0; i < springs.length; i++) 
  {
    strokeWeight (map (float (springs [i].id), 1, 3, 2, 0.25));
    line(springs[i].fromNode.x, springs[i].fromNode.y, springs[i].toNode.x, springs[i].toNode.y);
  }

  // draw nodes
  strokeWeight (3);
  for (int i = 0; i < nodes.length; i++) 
  {

    color c = color (#ffedbc);
    if ( nodes[i].getID().equals ("1")) c = #A75265;
    else if ( nodes[i].getID().equals ("2")) c = color (254, 190, 126);
    else if ( nodes[i].getID().equals ("3")) c = color (120);

    stroke(#ffedbc);
    fill(c);
    ellipse(nodes[i].x, nodes[i].y, nodes[i].getDiameter(), nodes[i].getDiameter());
  }
}















