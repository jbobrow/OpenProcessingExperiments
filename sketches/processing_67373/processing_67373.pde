
//---------------------LIBRARIES

//---------------------GLOBAL VARIABLES
int particlesSize = 180;
color c = color(250,80,40,200); //initil particles (red)


//---------------------DECLARE OBJECT
ArrayList particles; 

//---------------------SETUP LOOP
void setup(){
size (1100,400);
smooth();
frameRate(60);
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
  fill (0,50); // particles fade out
  rect (0,0,width,height);
  for (int i = 0; i < particles.size(); i ++) {
    Parti p = (Parti) particles.get(i);
    p.run();
  }

}

//---------------------ADDITIONAL FUNCTION
void keyPressed(){
  saveFrame();
}



