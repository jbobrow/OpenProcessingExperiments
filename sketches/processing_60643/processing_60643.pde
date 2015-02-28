
int grenze = 225;

void setup(){
  smooth();
  size(450,450);
   background(0);
}
 
 
void draw(){
 
 
if(grenze < mouseX && grenze < mouseY){
  
  smooth();
  fill(255,1);
  ellipse(mouseX, mouseY, mouseX, mouseY);

  stroke(255,2,2,1);
  noFill();
  ellipse(mouseX, mouseY, mouseX, mouseY);

  if(mousePressed){
   fill(255,20);
   noStroke();
   ellipse(mouseX, mouseY, mouseX, mouseY);}


}else{
 
   noStroke();
   fill(255,2,2,1);
   ellipse(mouseX+20, mouseY+20, mouseX, mouseY);


   stroke(255,50);
   noFill();
   ellipse(mouseX, mouseY, mouseX, mouseY);

 
 
   if(mousePressed){
     smooth();
   fill(255,20);
   noStroke();
   ellipse(mouseX, mouseY, mouseX, mouseY);



  }

}}

