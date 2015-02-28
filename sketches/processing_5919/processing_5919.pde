
boolean click=false;
float startX;
float startY;
float damping=0.1;

void setup(){
  size(900,300);
  background(0);
  noStroke();
  smooth();
}

void draw(){
  if(mousePressed){
    if(!click){
      click=true;
      startX=mouseX;
      startY=mouseY;
    }
    else{
      float posX=(mouseX-startX)*damping+startX;
      float posY=(mouseY-startY)*damping+startY;
      ellipseMode(CENTER);
      //    ellipse(posX,posY,(mouseX-startX),(mouseY-startY));
      //    ellipse(posX,posY,20,20);
      stroke(255);
      strokeWeight(2);
      line(posX-5,posY+5,posX+5,posY-5);
      startX=posX;
      startY=posY;
    }
  }  

}
void mouseReleased(){
  click=false;
}

void keyPressed(){
 if(key=='-'){
 damping+=0.01;
 }else if(key=='+'&&damping>0){
   
   damping-=0.01;
 }
}


