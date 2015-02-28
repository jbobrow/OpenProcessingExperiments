


int forme;
int maVariable;

void setup ()

{

  maVariable = 10;
  background (random (150), random (1), random (255), 0);
  size (1100, 1100);
 forme = 1;
}
void draw () {
  
   
if (forme == 1) {
ellipse (mouseX, mouseY, maVariable, maVariable);
}
if (forme == 2) {
rect (mouseX, mouseY, maVariable, maVariable);
}



  frameRate(50);
  maVariable = maVariable +1;


  fill(random (255), random(255), random(255), 0);

  if(mousePressed == true) {
    maVariable = maVariable -2;
    noCursor();
  // background (random (200), random (179), random (64), 0); 
   fill(random (150), random (201), random (65), random (2)); 
    ellipse(mouseX, mouseY, random(255), random (255));


if(forme == 1) {
forme =2;
} else {
forme =1;
}

    
  }
}

void action() {



  if (mouseX + mouseY > 0);
}

                
