
float radius;
float angle = 0;
float period;
float velocity;

void setup(){
  size(500,500); //motoSmart(480,320)
  frameRate(100); //probobaly works better smaller online. 
//period = pow(radius, 1.5); //a^3/2 == b^3/2 (keplers 3rd: P^2 ==> a^3) //expansion with other sketches
  background(0); //To stop that horrible grey colour but keep the transparent overlays.
}

void draw(){
  //          Slow Fade/Trails
  fill(0,0,0,mouseY-20);         //Transparent Fill
  rect(0,0,width,height);        //Rect covers screen
  
  translate(width/2,height/2);   //set origin to centre
  ellipseMode(CENTER);           //sort out alignment, instead of weird leftness thingy
  
  radius = mouseX;               //radius of orbits
  velocity = .05;                //angular velocity
  
  float x = radius * cos(angle); //find x (cos)
  float y = radius * sin(angle); //find y (sin)
  
  fill(255);  
  noStroke(); 
  ellipse(0,y,20,20);            //Vertical ball
  ellipse(x,0,20,20);            //Horizontal ball
  fill(random(30,255),random(30,255),random(30,255));    //fill of the orbiting ball
  if (mousePressed == true) ellipse(x,y,15,15);          //actual orbit
  
  
  angle += velocity;
      
}


