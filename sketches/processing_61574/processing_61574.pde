
PVector location;
PVector velocity;
float rot = 0;
float tripMouseMove  = 10;

void setup(){
  size(500,500);
  background(255);
  frameRate(40);
  location = new PVector(random(-50,550),random(-50,550)); // startin position
  velocity = new PVector (10,2.5); // speed of triangle in x & y direction
  
}


void draw(){
  //background(255);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);//adds in fading trail when BKg in setup
  smooth();
  
   
  location.add(velocity); //causes triangle to move - adds current speed to the location
   
  if ((location.x > width+50) || (location.x < -50)){
    
     velocity.x = velocity.x *-1;
     location.x = random(500);
  }
  
 if ((location.y > width+50) || (location.y < -50)){
    
     velocity.y = velocity.y *-1;
     location.y = random(500);
     
  }
 tri();
  
  if (tripMouseMove == 10){
   
  tri();
   pushMatrix();
  translate(location.x,location.y);
  rotate(rot);
  translate(-location.x,-location.y);
tri();
popMatrix();
  

 
  } 
  
  
  
}


// co-ordinates of triangle
float triXa = 25;
float triYa = 0;
float triXb = 0;
float triYb = 50;
float triXc = 50;
float triYc = 50;


void tri(){ // initial triangle
  
  fill(0);
    

    
     triangle(triXa+location.x,triYa+location.y, triXb+location.x,triYb+location.y, triXc+location.x,triYc+location.y);
  
  
}

void mouseMoved(){
  
  
  velocity.x = location.x - ((mouseX-location.x)/50.0); // intersing if turned on!!!
  location.x = location.x - ((mouseX-location.x)/50.0);
  velocity.y = location.x - ((mouseX-location.x)/50.0);
  location.y = location.y + ((mouseY-location.y)/50.0);
  
  
  
  
  
  
  
  
  
}

