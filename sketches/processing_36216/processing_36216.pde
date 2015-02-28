
float radius=150;
float centreX=0;
float centreY=0;
float distanceX=0;
float distanceY=0;
float mouse1=mouseX;
float mouse2=mouseY;
float radiusX=0;
float radiusY=0;
int reps = 10; 
int instance = 0; 
float [] ypos = new float[reps]; 
float [] xpos = new float[reps];



void setup() {
  size(700,400);
    for (instance = 0; instance < reps; instance ++) {
    xpos[instance] = mouseX;
    ypos[instance] = mouseY;
  }
}
void draw() {
  background(255);
 for (instance = 0; instance < reps; instance ++) {
  centreX =constrain(centreX,0+radius/2,width-radius/2);
  centreY =constrain(centreY,0+radius/2,height-radius/2);
  ellipse(centreX,centreY,radius,radius);


  mouse1 = mouseX;
  mouse2 = mouseY;
  
  distanceX=((mouse1-width/2)/width*2);
  radiusX=(radius*distanceX)/100;
  centreX =mouse1-(radius/4*radiusX);

  distanceY=((mouse2-height/2)/height*2);
  radiusY=(radius*distanceY)/100;
  centreY =mouse2-(radius/4*radiusY);
 println(distanceY);
 println(radiusY);


}}

void mousePressed() {
  println(centreX);
 
}


