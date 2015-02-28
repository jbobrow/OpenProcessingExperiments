
//manage the code of the wandering paths in a class

Spot [] Spot = new Spot[25];

void setup(){
  size(400,400);  
  background(255);
  for(int i=0;i<Spot.length;i++){
  Spot[i] = new Spot();
  }

}

void draw(){

  for(int i=0;i<Spot.length;i++){

  Spot[i].update();
  Spot[i].display();
  }
}
  
class Spot {
  
  float x1 = random(150,250);
  float y1 = random(150,250);
  
  
  Spot(){
  }
 
void update(){
  x1 = x1 + random(-10,10);
  y1 = y1 + random(-10,10);

}

void display(){
  noStroke();
  fill(100,190,200,40);
  ellipse(x1,y1,10,10);
  fill(120,255,60,40);
  ellipse(400-x1,400-y1,10,10);



}
}





