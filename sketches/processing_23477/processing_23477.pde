


ArrayList Points = new ArrayList(); // a bucket
float maxdist = 10;//a variable that can be manipulated easily to define the maximum distance each hexagon can be from one another 


void setup(){
  size (600,600);// the size of my sketch window
  background (255);//the colour of my window (white)
  stroke(0,20);//the size of my stroke
  smooth();  //gives a smooth line
  //noFill();

  
}

void draw(){//defines the drawing parameters within my window
}
  void mouseDragged(){//command  
   PVector p = new PVector (mouseX,mouseY);// a new point
  Points.add(p);
  
for (int i=0; i<Points.size()-1; i++){
  PVector p2= (PVector) Points.get(i+1);
 float dist = p.dist(p2);
  float joinchance = dist/maxdist;

  
  if ( joinchance < random(1.0) ) {
  //line (p.x,p.y,p2.x,p2.y);
    fill(random(0,255),random(0,255),random(0,255),100);// a random variable is assigned to the RGB coordinates and transparancy
 hexagon(p.x,p.y,mouseX*.01,mouseY*.01, random(0,2));//denotes the position of the hexagon in relation to the mouse, the speed of the rotation along the x and y axis and the scale 

  

   
  //ellipse(p.x,p.y,dist*2,dist*2);
  
}
}
}


void hexagon(float xpos, float ypos, float anglex, float angley, float scal){//The name of my hexagon and its float parameters
 pushMatrix ();//commands for the x and y axis 
 
 
  translate (xpos, ypos);//creates an action for the floats
  rotate(anglex);//rotation action for the x axis
  rotate(angley);//rotation action for the y axis 
  scale(scal);//scale action
  
  beginShape();//creates the hexagon parameters very important to construct around x+y axis
  vertex(-10,-20);
  vertex(10,-20);
  vertex(20,0);
  vertex(10,20);
  vertex(-10,20);
  vertex(-20,0);
  endShape(CLOSE);
 
 popMatrix();
 
  
}



