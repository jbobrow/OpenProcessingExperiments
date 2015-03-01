
float r;
float g;
float b;
float diam;
float randfact;
int counter = 3;

void setup(){
  size(400,400);
  background(255);
  print("press the 1, 2 or 3 key to change the background color");
}

void draw(){
  
  r = random(255);
  g = random(255);
  b = random(255);
  diam = random(50);
  randfact = random(3);
  fill(r,g,b);
  if ( counter % 3 == 0){
    if(randfact == 1)
      ellipse(mouseX,mouseY,diam,diam);
    else if (randfact == 2)
       ellipse(mouseX,mouseY,diam*randfact,diam);
    else
       ellipse(mouseX,mouseY,diam/randfact,diam);
  }
  counter++;
}

void keyPressed(){
  if (key == '1')
    background(0);
  if (key == '2')
    background(255);
  if (key == '3'){
    r = random(255);
    g = random(255);
    b = random(255);
    background(r,g,b);
  }
    
}


