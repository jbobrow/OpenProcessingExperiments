


ArrayList <Dot> dots;
ArrayList <Dot> clusters;

int numClusters = 5;
int numDots = 100;

void setup(){
  size(800, 600);
  background(0);
  
  dots = new ArrayList<Dot>();
  for(int i = 0; i < numDots; i++){
    PVector loc = new PVector(random(width), random(height));
     dots.add(new Dot(loc) );
  }
  
  clusters = new ArrayList<Dot>();
  for(int i = 0; i < numClusters; i++){
    PVector loc = new PVector(random(width), random(height));
     clusters.add(new Dot(loc) );
  }
  
  frameRate(1);
}

void draw(){
  background(0);
  
    for(int i = 0; i < clusters.size(); i++){
    Dot cluster = clusters.get(i);
    cluster.draw(25);
  }
  
  for(int i = 0; i < dots.size(); i++){
    Dot dot = dots.get(i);
    dot.draw(10);
  }
 
  //caculateDistance
  for(int i = 0; i < dots.size(); i++){
    Dot dot = dots.get(i);
    
    PVector dis = PVector.sub(dot.loc, clusters.get(0).loc);
    float min = dis.mag();
    
    for(int j = 0; j < clusters.size(); j++){
      Dot cluster = clusters.get(j);  
      
      float disX = dot.loc.x - cluster.loc.x;
      float disY = dot.loc.y - cluster.loc.y;
      float distance = sqrt( sq(disX) + sq(disY) );
          
      if(distance <= min){
        dot.setGroup(j);
        dot.setColor(cluster.c);
        min = distance;
      }
      
    }
  }
  
  //centroid
  PVector[] centroid = new PVector[clusters.size()];
  for(int j = 0; j < clusters.size(); j++){
    centroid[j] = new PVector(0, 0, 0);
  }
  int[] numGroup = new int[clusters.size()];
  
  for(int i = 0; i < dots.size(); i++){
    Dot dot = dots.get(i);
    int count = 0;
    
    for(int j = 0; j < clusters.size(); j++){
      if(dot.getGroup() == j){
        centroid[j].add(dot.loc); 
        numGroup[j]++;
      }

    }
    
  }
  println(numGroup);
  for(int j = 0; j < clusters.size(); j++){
    Dot cluster = clusters.get(j);
    
    centroid[j].div(numGroup[j]);
    
    if(cluster.loc != centroid[j]){
      cluster.loc = centroid[j];
    }
  }
 
}



class Dot{
  PVector loc;
  color c;
  int group;
  
  Dot(PVector loc){
    this.loc = loc;
    c = color(random(255), random(255), random(255));
  }
  
  Dot(){
  }


  void update(){
  
  }
  
  void setColor(color c){
    this.c = c; 
  }
  
  void setGroup(int g){
    group = g;
  }
  
  color getColor(){
    return c;
  }
  
  int getGroup(){
    return group;
  }

  void draw(int size){
    
    int circleSize = size;
    pushMatrix();
      translate(loc.x, loc.y);
      fill(c);
      ellipse(0, 0, circleSize, circleSize);
    popMatrix();
  }  
  
}
