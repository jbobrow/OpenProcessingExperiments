
int colorDir;
int myColor;

void setup(){
  size(600,800);
  smooth();
  background(210,10,19);
  
}

void draw(){
  fill(80,120,130);
  ellipse(90,90,90,120);
  fill(50,40,10);
  ellipse(200,400,180,180);
  if(mouseY<400){
    fill(20,90,80);
    rect(width/2,height/2, 20,20);
  } else {
    if (mouseY > 400){
      fill(255);
      rect(width/2,height/2, 20,20);
    }
 line (myColor,100,myColor,height/2);
   myColor++;
  }
  

  
  
  noFill();
  
  rect(mouseX-20, mouseY-20, random(10, 150), random(10, 150));
  
}

void mouseReleased(){
  ellipse(pmouseX, pmouseY, myColor, myColor);
  
      background(random(255), random(255), random(255));
  

}
