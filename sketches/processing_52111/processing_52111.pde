


void setup(){

size(500, 500);
smooth();
background(255);
noStroke();

}

void draw(){
  
  float x = width*.25;
int y = height/2;
int w = 100;
int h = 100;
int radius = 50;

rectMode(CENTER);  
      rect(x,y,w,h);
  
  if ((mouseX > x) && (mouseX < x+w) &&
    (mouseY > y) && (mouseY < y+h)) {
    fill(0, 0, 255);
    }
    else {
      fill(255, 0, 0);
    }


  
    

 
//fill(255, 0, 0);
//rectMode(CENTER);
//rect(width*.25, height/2, 100, 100);


ellipseMode(RADIUS);
ellipse(width*.75, height/2, 50, 50);

float d = dist(mouseX, mouseY, width*.75, height/2);
if (d < radius) {

  if (mousePressed == true){
    fill(0, 255, 0);
  }
    else{
      fill(255, 0, 0);
    }
    
    
    
  
}
  
  


}


