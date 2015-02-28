
int A = 62;
int x = 250;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,500,500);
  
//create 4 ellipse + mouse position change them colors   
  fill(mouseX, height-mouseX,mouseY,50);
  ellipse(0,0,700,700);
  fill(mouseY, mouseX,height-mouseY,50);
  ellipse(500,0,700,700);
  fill(mouseX, height-mouseY,height-mouseY,50);
  ellipse(0,500,700,700);
  fill(width-mouseY,mouseX,mouseY,50);
  ellipse(500,500,700,700);
  
//center ellipse +mpuse pos change color of it
  fill(mouseX, mouseY, width-mouseX);
  ellipse(width/2, height/2, 62, 62);
  
//mouse cursor, change dimension   
  stroke(250, 0, 250);
  noFill();
  ellipse(mouseX, mouseY, 20, 20);
  ellipse(mouseX, mouseY, mouseX/4, mouseY/4);
  ellipse(mouseX, mouseY, mouseY/4, mouseX/4);

//mouse on center of the screen create a circle that grow in dimension  
  if(dist(mouseX,mouseY, x, x) <=70) {
    noStroke();
    fill(0);
    ellipse(x, x, A,A);
    A +=1;
    if(A >=150) {
      A = 150;
    }
//mouse press for restart the grown circle in the center    
  if(mousePressed) {
    A = 10;}
  
  }
}


