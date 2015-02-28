
//import processing.opengl.*; //uncomment offline
import peasy.*;

String[] file;
ArrayList<PVector> vertexes = new ArrayList();
ArrayList<Integer> faces = new ArrayList();

PeasyCam cam;

void setup() {
  size(500,500,P3D);
  //size(500,500,OPENGL); //uncomment offline
  file = loadStrings("suzanne.obj"); //load 'er up!
  
  for(int i=0; i < file.length; i++) {
    char theChar = file[i].charAt(0);
    if(theChar == '#') {
      continue; //it's a comment!
    }
    
    if(theChar == 'v') { //vertex
      String vertexList = file[i].substring(2,file[i].length()); //get the list
      String[] vertexArray = split(vertexList,' '); //split the list
      PVector v = new PVector(
        float(vertexArray[0]), //make a vector
        float(vertexArray[1]),
        float(vertexArray[2])
      );
      vertexes.add(v); //and add it!
    } else if(theChar == 'f') {
      String faceList = file[i].substring(2,file[i].length());
      String[] faceArray = split(faceList,' ');
      faces.add(int(faceArray[0]));
      faces.add(int(faceArray[1]));
      faces.add(int(faceArray[2]));
    }
  }
  
  stroke(0);
  
  cam = new PeasyCam(this,300);
  perspective(PI/3,(float)width/height,0.01,500);
  
  println(faces.size() + " faces, " + vertexes.size() + " corners.");
}

void draw() {
  background(255);
  scale(10);
  lights();
  
  noStroke();
  fill(250);
  beginShape(TRIANGLES);
  for(int i=0; i < faces.size(); i++) {
    PVector p = getVertex(i);
    vertex(p.x,p.y,p.z);
  }
  endShape();
  
  println("frame rate: " + frameRate);
}

PVector getVertex(int i) {
  return vertexes.get(((int) faces.get(i))-1);
}

