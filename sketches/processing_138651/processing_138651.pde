
void setup(){
  size(1000, 1000);
}
void draw(){
  background(200, 40, 40);
   if(mousePressed){
   fill(255,255,255);
   stroke(255,255,255);
 }else{fill(0,0,0);
 stroke(0,0,0);}
  quad(mouseX+75,mouseY-75,1000,0,mouseX+75,mouseY+75,1000,1000 );
  
      quad(mouseX-75,mouseY+75,0,1000,mouseX-75,mouseY-75,0,0);
 
  strokeWeight(5);
  if (mousePressed){
    fill(0,0,0);}
    else{
  fill(255,255,255);}
  rect(mouseX-75,mouseY-75,150, 150);
  fill(0,200,40);
  if(mousePressed ){
    fill(0,40,200);

     ellipse(mouseX+50,mouseY+50 ,50,50);
    ellipse(mouseX+50,mouseY-50 ,50,50);
     ellipse(mouseX-50,mouseY+50 ,50,50);
      ellipse(mouseX-50,mouseY-50,50 ,50);
       ellipse(mouseX,mouseY,50,50);
       
       fill(0,200,40);

     ellipse(mouseX+50,mouseY ,50,50);
    ellipse(mouseX,mouseY-50 ,50,50);
     ellipse(mouseX,mouseY+50 ,50,50);
      ellipse(mouseX-50,mouseY,50 ,50);
 
}
else{
      fill(0,40,200);

     ellipse(mouseX+50,mouseY ,50,50);
    ellipse(mouseX,mouseY-50 ,50,50);
     ellipse(mouseX,mouseY+50 ,50,50);
      ellipse(mouseX-50,mouseY,50 ,50);
       ellipse(mouseX,mouseY,50,50);
    fill(0,200,40);

     ellipse(mouseX+50,mouseY+50 ,50,50);
    ellipse(mouseX+50,mouseY-50 ,50,50);
     ellipse(mouseX-50,mouseY+50 ,50,50);
      ellipse(mouseX-50,mouseY-50,50 ,50);
       ellipse(mouseX,mouseY,50,50);  
   }}
