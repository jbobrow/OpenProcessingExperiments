
float gravity = .1;
Triangular[] triangles = new Triangular[1];

void setup(){
  size(300,300);
  smooth();

triangles[0] = new Triangular(30,30,60,20,80,50);
}

void draw(){
 background(255); 
 
 //even
 for (int i = 0; i<triangles.length; i++){
   triangles[i].moveUpDown();
  // triangles[i].moveLeftRight();
  // triangles[i].gravity();
   triangles[i].display();
   i++;

  print('x');
   println(mouseX) ;
   
   print('y');
   println(mouseY);
 } 
 
 //odd
 for (int i = 1; i<triangles.length; i++){
 //  triangles[i].moveUpDown();
   triangles[i].moveLeftRight();
  // triangles[i].gravity();
   triangles[i].display();
   i++;

 
 } 
 
}

void mousePressed(){
 Triangular tri = new Triangular(mouseX,mouseY,mouseX+30, mouseY-10, mouseX+50, mouseY+20);
 triangles = (Triangular[]) append(triangles,tri);
 Triangular tri2 = new Triangular(mouseX,mouseY,mouseX+30, mouseY-10, mouseX+50, mouseY+20);
 triangles = (Triangular[]) append(triangles,tri2);
}

