

ArrayList points = new ArrayList();

//Point p = new Point(100,100);

void setup(){
  
  size(800,600);
  smooth();

  background(255);
  //stroke(random(255),random(255),random(255));
}




void draw(){

  fill(0, 128);
  rect(-1,-1,width+1, height+1);

  for(int i = 0; i<points.size(); i++){
    
    Point p = (Point) points.get(i);
    p.display();
    p.update();
    
  }
}

void mousePressed(){
  for(int i = 0; i<100; i++){
  points.add(new Point(mouseX+random(-10,10),mouseY+random(-10,10)));
  }
  
}

void keyPressed(){

  background(0);
  for(int i = points.size()-1;i>=0; i--){
 
  
    Point p = (Point) points.get(i);
    //p.xv=0;
    //p.yv=0;
    points.remove(i);
  } 
  
 // saveFrame("gravity####.png");
}




