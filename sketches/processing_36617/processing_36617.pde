
Face[] faces= new Face[500]; 

void setup(){
  size(600, 600); 
  background(0); 
  smooth(); 
  for (int i=0; i< faces.length; i++){
    faces[i]= new Face(30, random(30, 570), random(30, 570), color(random(255), random(255), random(255))); 
  }
}

void draw(){
  background(0); 
  for (int i=0; i< faces.length; i++){
    faces[i].display(); 
    faces[i].jiggle(); 
  }
}



