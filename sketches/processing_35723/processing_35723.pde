
// makes an Eye class. And initiates three variables.

class Eye{
  float x; // x height
  float y; // y height
  float w; // width
  
  Eye(){ // function that actually creates the new eye.
    x=0;
    y=0;
    w=0;
  }
  
  void display(){ // function that displays the eye.
    strokeWeight(0);
    fill (250,250,250);
    ellipse(x,y,w,100); // white of the eye
    stroke( 125,200,250);
    fill (125,200,250);
    strokeWeight(10);
    stroke(0);
    ellipse(x,y+5,w*.8,80); // iris
    strokeWeight(0);
    fill(0,30);
    arc(x,y+5,w*.8,80,PI,2*PI); // iris shading
    fill(0,30);
    arc(x,y+5,w*.8,80,PI-.3,2*PI+.3);
    fill(0,30);
    arc(x,y+5,w*.8,80,PI+.3,2*PI-.3);
    fill(0);
    ellipse(x,y+5,w*.5,50); // pupil
  }
}


float[] limitDistance(){ // limits how far the face can move away
                         //from the center
  float[] coordinates = new float[2];
  float x=mouseX-width/2;   // creates a right triangle between
  float y=mouseY-height/2;  // the mouse coordinates and the center
  float h = sqrt(pow(x,2)+pow(y,2)); //pythagoran theorem
  if (faceRadius/4<=h){ //puts eyes on the outside limit from the center
    coordinates[0]=(faceRadius/(4*h))*x + height/2;
    coordinates[1]=(faceRadius/(4*h))*y+ width/2;
  }
  else{ // unless the mouse is within that boundary
    coordinates[0]=mouseX;
    coordinates[1]=mouseY;
  }
  return coordinates; // returns an array [x,y]
}

float squashCenter(){        //squashes the mouth relative to its x distance
  float x = mouseX-width/2;  //from the center, regardless of side of the face
  x=abs(2*x/faceRadius);
  if(x>.5){ // limits the squash to 50%
    x=.5;
  }
  return x;
  
}

float leftFromCenter(){     //same function as before, but only deforms
  float x = mouseX-width/2; //on the left.
  x=1.5*x/faceRadius;
  if(x<-.4){
    x=-.4;
  }
  if (x>0){
    x=0;
  }
  return x;
}
float rightFromCenter(){    //same function as before, but only deforms
  float x = mouseX-width/2; //on the right.
  x=2*x/faceRadius;
  if(x>.4){
    x=.4;
  }
  if (x<0){
    x=0;
  }
  return x;
}

//if mouse is clicked, planB will change from true to false and vice versa
void mousePressed() {
  planB= !planB;
}

// sets up the canvas
void setup(){ 
  smooth();
  size(500,500);
}

// initiating global variables
float faceRadius; 
PFont myFont;
Boolean planB=false;


//DRWAWIN'
void draw(){
  noCursor(); 
  background(80,20,20); // sets background color
  faceRadius=(width*.4); // sets the radius of the face.
  
  // makes teh face circle
  stroke(0);
  fill(255,50,200);
  ellipse(width/2, height/2, faceRadius*2, faceRadius*2);
  
  // silly little for loop that makes a series of concentric circles
  // as a highlight
  for (int i=3; i<1000; i += i+=.1){
    strokeWeight(.01);
    fill(255,50);
    ellipse (width/2+80-faceRadius/(2*i), height/(20*i)+130+faceRadius/(2*i),faceRadius*3/i,faceRadius*3/i);
  }
  
  // makes a left eye.
  Eye eye1 = new Eye();
  eye1.x=limitDistance()[0]-faceRadius/2;
  eye1.y=limitDistance()[1];
  eye1.w=100+80*leftFromCenter();
  eye1.display();
  
  // makes a right eye.
  Eye eye2 = new Eye();
  eye2.x=limitDistance()[0]+faceRadius/2;
  eye2.y=limitDistance()[1];
  eye2.w=100-80*rightFromCenter();
  eye2.display();
  
  // makes highlights.
  fill(255,200);
  strokeWeight(0.001);
  ellipse(.90*limitDistance()[0]+faceRadius/2+30,limitDistance()[1]-20,20,20);
  ellipse(.90*limitDistance()[0]-faceRadius/2+30,limitDistance()[1]-20,20,20);
  
  // makes the mouth
  strokeWeight(5);
  stroke(255,0,100);
  fill (200,0,50);
  if(planB==false){  // if planB is false, face is happy.
    arc(limitDistance()[0],limitDistance()[1]+60,100-30*squashCenter(),100,0,PI);
  }
  else{ // else, face is sad.
    arc(limitDistance()[0],limitDistance()[1]+80,100-30*squashCenter(),100,PI,2*PI);
  }
  
  // makes a sperm
  noStroke();
  fill(200);
  int x =250;
  int y =460;
  ellipse(x,y,10,15);
  beginShape(); // full tail of sperm
  vertex( x + 3, y + 2);
  bezierVertex( x - 6, y + 8, x + 6, y + 8, x - 3, y + 2);
  bezierVertex( x - 2, y + 8, x - 2, y + 10, random(x-6,x+6) , y + 40);
  bezierVertex( x + 2, y + 10, x + 2, y + 8, x + 3, y + 2);
 endShape();
 if(planB==true){
   myFont = createFont("Impact", 130);
   textFont(myFont);
   textAlign(CENTER);
   fill(255,0,0,200);
   text("PLAN B", width/2, height/2+55);
 }
}



