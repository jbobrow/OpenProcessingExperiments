
ArrayList<vine> grow;
//for the next line, new endpoints
float newX = 0;
float newY = 0;

int num = 60;
int x[] = new int[num];
int y[] = new int[num];

void setup(){ 
  size(400,400);
  background(0);
  smooth();
  ellipseMode(RADIUS);
  //initialize array list
grow = new ArrayList<vine>();

 //add first line
grow.add(new vine(random(width),height));

}

void draw(){
  background(0); 
  
    for(int i = x.length-1; i > 0; i--){
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
 
  x[0] = mouseX; //start position
  y[0] = mouseY; //start position
  
  
  for(int i = 0; i < x.length; i++){
   noStroke();
    fill(255, 0, 0, 100);
    ellipse(x[i], y[i], 15, 15);
  }
  
  //naming and initializing new object
    for(int i = 0; i < grow.size(); i++){
    vine stem = grow.get(i);  
    stem.update();
    }
    
//add new stem each frame, with new end point from previous

grow.add(new vine(newX+random(-5,5),newY+(random(-2))));

//draw...

  for(int i = 1; i < grow.size(); i++){
    strokeWeight(5);
    stroke(255);
    line(grow.get(i).posx,grow.get(i).posy,grow.get(i-1).posx,grow.get(i-1).posy);
}

  //if(stem.finished()){
  //grow.remove(i);

}

//vine class
class vine{
  
 //declare variables
  float posx, posy;
  
  //float life;
//class constructor
vine(float x, float y){
  
  posx = x;
  posy = y;

  newX = posx;
  newY = posy; 
  
  //life = 60;
}
//movement method
void update(){
  //updating new x and y position
  newX = posx;
  newY = posy;  
  
  //life --;
  //to prevent line going off window
if(newY <= 0){
  newY = height;
 
} 
if(newX <= 0){
  newY = height;
  newX = random(width);
}
if(newX >= width){
  newY = height;
  newX = random(width);
}
} 
//void display(){
 
 //boolean finished(){
 //if(life<=0){
  //return true;
 //}else{
  //return false;
 } 






