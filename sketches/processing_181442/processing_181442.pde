
int count = 0;
color c1 = #FFFFFF;
color c2 = #FFE9C4;
color c3 = #D4FBFF;
float X, Y, pX, pY, r, x, i;
boolean rectOver;

void setup()
{
  size(1000, 800);
  background(0,0,0);
  
   for(i=0; i<150; i++){
    r = random(3, 5);
    x = random(1, 4);

    if (x <= 2) {
      fill(c1);
    } else if (x <= 3) {
      fill(c2);
    } else {
      fill(c3);
    }
    ellipse(random(0,1000), random(0,800), r, r);
    } 
  
}

void draw() {
  fill(color(c1));
  
  if(keyPressed == true) {
    fill(color(204));
    count = 0;
  }
  
  r = random(3, 5);
  x = random(1, 4);

  if (x <= 2) {
    fill(c1);
  } else if (x <= 3) {
    fill(c2);
  } else {
    fill(c3);
  }
  
  if(mousePressed == true){    
    if(count < 1){
       count++;
    }
    else{
       stroke(255, 80);
       strokeWeight(2);
       line(pX, pY, X, Y); 
    }
    mousePressed = false;
  }
  
}

void mousePressed() {  
  float r = random(3, 5);
  float x = random(1, 4);

  pX = pmouseX;
  pY = pmouseY;

  if (x <= 2) {
    fill(c1);
  } else if (x <= 3) {
    fill(c2);
  } else {
    fill(c3);
  }
  
  ellipse(mouseX, mouseY, r, r);
 
}

void mouseReleased(){
  X = mouseX;
  Y = mouseY;
}

