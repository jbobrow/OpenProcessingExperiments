
Car[] Cars = new Car[100];
int count;
int rim;
PImage img;
void setup() {
  img = loadImage("TrafficCity.jpg");
  for(int i = 0; i < Cars.length; i++) {
  Cars[i] = new Car();
  }
  count = 0;
  size(800,600);
  smooth();
  rim = 0;
}



void draw() {
  image(img, 0, 0);
 
  count++;
  
  if (count<=200) {
  if(rim == 0){

      for(int i = 0; i < 1; i++){
    Cars[i].x -= 103* i;
  }
  rim++;
  }
  if(rim >= 1){
  for(int i = 0; i < 1; i++){
    Cars[i].move(6);
    Cars[i].display();
  }    
  }
 
    
    
  }
 
  if (count>=200 && count<=600) {
  if(rim == 1){

      for(int i = 1; i < 5; i++){
        Cars[i].x -= 103* i;
      }
  rim++;
  }
  if(rim >= 2){
  for(int i = 1; i < 5; i++){
    Cars[i].move(3.5);
    Cars[i].display();
  }    
  }
  }
 if (count>=400 && count<=1650) {
  if(rim == 2){

      for(int i = 5; i < 17; i++){
        Cars[i].x -= 103* i;
      }
  rim++;
  }
  if(rim >= 3){
  for(int i = 5; i < 17; i++){
    Cars[i].move(2);
    Cars[i].display();
      
  }
    
    
  }

  }
  if(count >= 1650){
    for(int i=0; i < Cars.length; i++) {  
      Cars[i].x = 0;
    }
    count = 0;
    rim = 0;
  }
}




class Car {

float x;
float y;
float speed;
float r;
float c;

Car() {
    x=25; //starting x position of cars
    y=500; //starting y position of cars
    speed = random(6,12); 
  }
  
  
  // Display the Cars
  void display() {
    fill(c);
    
//    for (int i = 2; i < x; i++ ) {
      
  

  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER); 

  // Draw Car's Body
  stroke(0);
  fill(c);
  rect(x,y,100,20);
  rect(x,y-15,40,10);
  
  /* Draw extra circles
  stroke(0);
  fill(255);
  ellipse(x,y-25,40,40); */

  // Draw Car's Wheels
  fill(0); 
  ellipse(x-25,y+10,25,25); 
  ellipse(x+25,y+10,25,25);

  // Draw Car's lines
  stroke(0);
  line(x-20,y-20,x-35,y-10);
  line(x+20,y-20,x+35,y-10);
//}
  }
  void move(float acc) {
  x += acc;
}
}
  
  
  




