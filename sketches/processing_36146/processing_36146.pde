
ivoid setup(){
  size(500,500);
  smooth();
  strokeWeight(5);
  stroke(0,45);
  background(0);
}
void draw(){
 
   fill(255);
  ellipse(pmouseX,250,70,mouseY);
  fill(85,7,4,200);
  ellipse(pmouseX,250,20,mouseY);
  fill(0);
ellipse(pmouseX,250,5,mouseY);

fill(255);
  ellipse(pmouseX,50,70,mouseY);
  fill(33,0,130,200);
  ellipse(pmouseX,50,20,mouseY);
  fill(0);
ellipse(pmouseX,50,5,mouseY);

fill(255);
  ellipse(pmouseX,450,70,mouseY);
  fill(30,130,0,200);
  ellipse(pmouseX,450,20,mouseY);
  fill(0);
ellipse(pmouseX,450,5,mouseY);


}
                
