
//String[] page = loadStrings("http://dewey.computing.dundee.ac.uk/cmartin/random");


String[] page;

void setup(){
  size(200,200);
  // page = loadStrings("http://dewey.computing.dundee.ac.uk/cmartin/random");
  smooth();
  background(50);
  
  frameRate(1);
  
  
}

void draw(){
  background(50);
  page = loadStrings("http://dewey.computing.dundee.ac.uk/cmartin/random");
  //println(page[0]);
  
  Float f = new Float(page[0]);
  
  ellipse(width/2,height/2,f,f);
  
}

