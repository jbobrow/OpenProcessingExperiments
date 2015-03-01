
object [] array = new object [1];

void setup(){
  size(800,800);
  background(255);
  smooth();
 for (int i = 0; i < array.length; i++){
  array[i] = new object();
  } 
}

void draw(){
  for (int i = 0; i < array.length; i++){
  array[i].update();
  }
}


class object{
 float bodySize = 40;
 float xPos1=width/2;
 float yPos1=height/2;

  void update(){
  fill(233, 224 , 71);
  strokeWeight(5);
  ellipse(250, 250, 50 ,50);
  fill(0);
  ellipse(245, 245 , 2, 10);
  fill(0);
  ellipse(255, 245 , 2, 10);
  fill (255);
  line(240, 260, 260, 260);
 
 
    
  }
  
  
  
  
}


