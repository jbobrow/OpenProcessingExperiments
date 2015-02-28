
void setup(){
  //setup main parameters
  int width = 800;
  int height = 600;
  size(width,height);
  background(30,144,255);
  smooth();
  stroke(0,0);
}

//z is a counter for the droplets
float z = 0;

void draw(){
  //setup stroke and random values
  stroke(0,0);
  float cr = random(0,20);
  float dr = random(0,100);
  fill(30,144,255,07);
  //this creates a fade of blue
rect(0,0,width,height);
  float r = random(0,25);
  //here we create lily pads at a slower, randomized interval
  if(r < 3 && r > 2){
    fill(173,255,47,random(150,255));
    ellipse(random(0,width),random(0,height),20+cr,20+cr);
  }
  //mousepressing starts a stream of ripples, z being the number of ripples made
  if(mousePressed){
    z = 5+ random(0,6);
  }
  //this generates the ripples according to z
  if(z > 0 && r < 7 && r > 2 ){
    fill(0,0,0,0);
    stroke(1,191-(random(0,100)),255,random(100,255));
    strokeWeight(random(2,5));
    ellipse(mouseX,mouseY,20+dr,20+dr);
    z--;
  }

  
}
