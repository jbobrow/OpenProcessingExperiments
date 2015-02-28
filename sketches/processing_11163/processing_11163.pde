
Circle[] circles; //element 1 process 5 homework.
int NUM_CIRCLES=60;
int maxradius=20;
int minradius=20;

void setup(){
  size(400,400);
  background(255);
  smooth();
  circles=new Circle[NUM_CIRCLES];
  for(int i=0;i<NUM_CIRCLES;i++){
   circles[i]=new Circle(random(width),random(height),random(minradius, maxradius)); 
  }
 // circle=new Circle(width/2,height/2,20);
}
void update(){
  for(int i=0;i<NUM_CIRCLES;i++){
  circles[i].update();
}
}
void draw(){
  update();
  //background(255);
  for(int i=0;i<NUM_CIRCLES;i++){
    Circle c1=circles[i];
  for(int j=i+1;j<NUM_CIRCLES;j++){
    circles[i].draw();
    Circle c2=circles[j];
    if(c1.touching(c2)){
      //float g=map(c1.distance(c2),0,2*maxradius,0,255);
      colorMode(RGB);
      color gray= color(240,240,240,100);
      stroke(gray);
      //stroke(220);
      //stroke(g);
      strokeWeight(.5);
      line(c1.x,c1.y,c2.x,c2.y);
}}}}

