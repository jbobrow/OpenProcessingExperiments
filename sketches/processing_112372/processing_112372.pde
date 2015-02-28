
void setup(){
  size(400,400);
  background(255);
  println();

}
void draw(){
  
  noStroke();
  background(255);
  fill(255,0,0);
  
  ellipse(200,mouseX,50,50);
  ellipse(mouseX,200,50,50);
  fill(156,25,45);
  rect(mouseX,mouseX+5,50,50);
  rect(mouseX+50,mouseX-20,20,20);
  fill(260,10,80);
  ellipse(100,mouseX+10,70,70);
  ellipse(mouseX-50,mouseX,15,15);
  ellipse(50,50,mouseX-10,mouseX+15);
  mouseX=mouseX+1;
  if (mouseX>width+20){
    mouseX=-20;
  }else{
    mouseX=mouseX+1;
  }
}
   

  
  


