
// hw 12
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim October 2012  Pittsburgh, PA 15213  All Rights Reserved

/*
credits to supermanoeuvre for .csv importing code {http://supermanoeuvre.com/}
move the mouse around. 
The mouse X co-ordinates control the degrees of rotation of the data.
hold the mouse to return it to its initial state.
data from {http://hubwaydatachallenge.org/}

each ray represents the hubway station ID (going in the x direction).
going down in the y direction is the density of each station.
ellipse size helps visualize this (bigger diameter, more dense).
the rotation element is there for animation and visualization purposes only.
you can see the actual data visualization more clearly if you move the mouse towards the left (to see just one ray, instead of multiple ones in motion).

note: the initial dataset was large (over 22,000 lines)
so i trimmed down the data to around 4,000 lines to make the sketch go smoother.
*/

ArrayList pointList;                   // arraylist to store the points in
float theta, d; 
 
void setup(){
 
  size(840,840);
  background(0);
  smooth();
  noCursor();
  frameRate(100);
 
  pointList = new ArrayList();    // instantiate an ArrayList
  importTextFile();               // call our custom function
  
  theta = TWO_PI/pointList.size();
}
 
void draw(){
  initiate();
  visualize();
  freeze();
  printAngle();
}
  
void importTextFile(){   
  String[] strLines = loadStrings("test2.csv"); // the name and extension of the file to import!
  for(int i = 0; i < strLines.length; ++i){
    String[] arrTokens = split(strLines[i], ',');       // use the split array with character to isolate each component
    float xx = float(arrTokens[0]);                     // cast string value to a float values!
    float yy = float(arrTokens[1]);                     // cast string value to a float values!
    //float zz = float(arrTokens[2]);                     // cast string value to a float values!
    pointList.add( new PVector(xx,yy) );             // add values to a new array slot
  }
}

void initiate(){
  background(255);
}

void visualize(){
  for(int i = 0; i < pointList.size(); ++i){        
    PVector V = (PVector) pointList.get(i);
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    
    // visualize data as a series of ellipses
    stroke(0,14);
    fill(70,14);
    
    d = V.y%height/2;
    
    ellipse(V.x*3.5,V.y*3.5,d,d);
    
    theta += TWO_PI/pointList.size();
    //theta += TWO_PI/57;
    //noLoop();
    if(theta > TWO_PI){
      theta = TWO_PI/mouseX*3.5;
    }
    
    popMatrix();
  }
}

void freeze(){
  if(mousePressed){
    theta = 0;
  }else{
  }
}

void printAngle(){
  fill(0);
  text(degrees(theta)%360, 21,35);
}




