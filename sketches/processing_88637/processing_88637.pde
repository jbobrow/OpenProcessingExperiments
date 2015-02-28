
ArrayList vertex1 = new ArrayList();
ArrayList vertex2 = new ArrayList();

void setup(){
 size(400, 400); 
 background(255);
}

void draw(){
  background(255, 255, 255, 30);
  fill(150, 0, 150, 100);
  beginShape();
  for(int i = 0; i < vertex1.size(); i++){
    vertex(((Vertex)vertex1.get(i)).x, ((Vertex)vertex1.get(i)).y);
    for(int j = 0; j < vertex2.size(); j++){
     
   line(((Vertex)vertex1.get(i)).x, ((Vertex)vertex1.get(i)).y, ((Vertex)vertex2.get(j)).x, ((Vertex)vertex2.get(j)).y);  
   
    }
  }
  endShape();
  
}

class Vertex {
  int x, y;
  Vertex(int a, int b) {
   x = a;
   y = b;
  }
}

void mousePressed(){
  
  if(mouseButton == LEFT){
    vertex1.add(new Vertex(mouseX, mouseY));
  }
  if(mouseButton == RIGHT){
    vertex2.add(new Vertex(mouseX, mouseY));
  }
  
  println(((Vertex)vertex1.get(vertex1.size()-1)).x + " , " + ((Vertex)vertex1.get(vertex1.size()-1)).y);
  
}


