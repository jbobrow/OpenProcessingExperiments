
float inc;
int redv= int(random(255));
int redvInc = 1;

int greenv= int(random(255));
int greenvInc = 1;

int bluev= int(random(255));
int bluevInc = 1;


void setup() {
noStroke();
  size(500,500);

}

 
void draw() {
  
background(0);
  
randomSeed(mouseX);
 

  for(int i=0;i< width/18; i++) {

    for(int j=0;j< height/18; j++) {

      ellipse(i*random(19),j*19,16,16);
  }

  }


fill(redv,greenv,bluev,20);
redv+=redvInc;

if (redv>254 || redv<1){
  redvInc*=-1;
}         
if (greenv>254 || greenv<1){
  greenvInc*=-1;
}
if (bluev>254 || bluev<1){
  bluevInc*=-1;
}
}
                
                
