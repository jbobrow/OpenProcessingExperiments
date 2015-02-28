
//---------------------LIBRARIES

//---------------------GLOBAL VARIABLES
int particlesSize = 1000;
int particlesSize2 = 100;
color c = color(3,180,255,200); //initil particles (blue)
color c2 = color(255,150,20,200); // seondary particles (orange)

//---------------------DECLARE OBJECT
ArrayList particles; 

//---------------------SETUP LOOP
void setup(){
size (1000,400);
smooth();
frameRate(30);
background (0);

//-------------------INITIALIZE OBJECT
particles = new ArrayList (); //start with empty list
for (int i = 0; i< particlesSize; i ++) {
  Parti myParti = new Parti(random(0,width),random(0,height),c);
  particles.add(myParti);
  }
}

//---------------------DRAW LOOP
void draw(){
  fill (0,10); // particles fade out
  rect (0,0,width,height);
  for (int i = 0; i < particles.size(); i ++) {
    Parti p = (Parti) particles.get(i);
    p.run();
  }
  if(mousePressed){// add secondary particles
    for (int i = 0; i< particlesSize2; i ++) {
    particles.add(new Parti(random(0,width),random(0,height),c2));
  
  }
}
}

//---------------------ADDITIONAL FUNCTION
void keyPressed(){
  saveFrame();
}

