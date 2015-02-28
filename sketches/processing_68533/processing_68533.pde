


int sizeX;
int sizeY;



void setup(){
  
  translate (500,350);
  size(1000,700);
  background(188,188,188);
  ellipseMode(CENTER);
  sizeX = 60;
  sizeY = 30;
  
}

void draw(){
 
  if (mousePressed){ 
  fill(0,0,0,5);
  rect(0,0,width,height); 
  Rain();
  Rain35();
  Rain15();
  }
  

  
}



void Rain(){
    smooth();
    noFill();
    stroke(random(255),255,255,random(255));
    strokeWeight(random(8)); 
      pushMatrix();
      rotate(radians(15));
    ellipse(mouseX,mouseY,sizeX,sizeY);
    sizeX+=10;
    sizeY+=5;  
    popMatrix(); 
}

void Rain35(){
  
    smooth();
    noFill();
    stroke(255,255,255,random(255));
    strokeWeight(random(8)); 
    pushMatrix();
      rotate(radians(15));
      ellipse(random(width),random(height),sizeX,sizeY);
      sizeX+=10;
      sizeY+=5; 
   popMatrix(); 
}

void Rain15(){

    smooth();
    noFill();
    stroke(255,255,255,random(255));
    strokeWeight(random(8)); 
    pushMatrix();
      rotate(radians(15));
      ellipse(mouseX,mouseY,sizeX,sizeY);
      sizeX+=10;
      sizeY+=5; 
    popMatrix(); 
}

void mouseReleased(){
   sizeX = 60;
   sizeY = 30;
}

