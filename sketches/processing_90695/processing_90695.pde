
void setup (){
  size (800,800);
  smooth();
  
}
void draw(){
 noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    ellipseMode (CORNER);
    for(int yPos=0;yPos<800;yPos+=50){
      for(int xPos=0; xPos<800; xPos+=50){
        fill(random(0,255),random(0,255),random(0,255));
        ellipse(xPos,yPos,50,50);
      }
    }
     delay(10);
}
