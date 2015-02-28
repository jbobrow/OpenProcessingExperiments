
/////////////////////
//Geodrawing BASIC////
/////////by JustasM///
//////////////////////

int NUM_POINTS = 4;
ArrayList pa;


void setup(){
  size(900, 900);
  background(255);
  smooth();
  
  pa = new ArrayList();
  
  for(int i = 0; i < NUM_POINTS; i++){
    pa.add(new Point(new PVector(random(0, width), random(0, height)), new PVector(random(-2,2), random(-2,2))));
  }
  
}

void draw(){
  //fill(255);
  //rect(0, 0, width, height);
  
  
  for(int i = 0; i < pa.size(); i++){
    Point p = (Point) pa.get(i);
    
    for(int j = 0; j < pa.size(); j++){
      if(i != j){
        Point p2 = (Point) pa.get(j);
        stroke(0);
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y);
      }
    }
    
    p.run();
  }
}

void reset(){
  setup();
}

void mouseClicked(){
  setup();
}

void keyPressed(){
  if(key == 'x'){
    saveFrame("drawing-####.jpg");
  }
}

