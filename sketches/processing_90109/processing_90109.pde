
//Danielle Gorodenzik  
//Feb 19, 2013
//Divide Screen
 
void setup(){
  size(800, 800);
  background(255);
}
 
 
 //top left
void draw(){
  
if((mouseX>0)&&(mouseX<400))
  if((mouseY>0)&&(mouseY<400)){
   fill(255,0,0);
   noStroke();
  rect(0,0,800,800);
 }

//top right
if((mouseX>400)&&(mouseX<800))
  if((mouseY>0)&&(mouseY<400)){
    fill(255,14,252);
    noStroke();
    rect(100,100,600,600);
  }


//bottom left 
  if((mouseX>0)&&(mouseX<400))
  if((mouseY>400)&&(mouseY<800)){
  fill(0,255,39);
  noStroke();
 rect (300, 300,200,200);}
 
 
 
//bottom right
  if((mouseX>400)&&(mouseX<800))
  if((mouseY>400)&&(mouseY<800)){
 fill(20,163,255);
 noStroke();
 rect (200, 200,400,400);}


}
