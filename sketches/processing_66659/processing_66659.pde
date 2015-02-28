


void setup(){
  
  size(750,500);
  PImage myImage = loadImage("bob.jpg");
  image(myImage, 0, 0);


}


void draw(){
  
  noFill();
  noStroke();
  rect(450,450,width-50,height-50);
  
}  



 void mouseClicked(){
    

  if(mouseX>=400 && mouseY >= 450){
    
    drawcircle(570,480,269,20);}
   
    
   if(mouseX>=105 && mouseX<=130 && mouseY >= 350 && mouseY<=380){
    drawcircle(117,365,30,30);}
    
    if(mouseX>=480 && mouseX<=530 && mouseY >= 350 && mouseY<=380){
    drawcircle(500,370,30,30);}
    
    if(mouseX>=160 && mouseX<=200 && mouseY >= 130 && mouseY<=160){
    drawcircle(180,150,40,40);}
    
    if(mouseX>=550 && mouseX<=580 && mouseY >= 130 && mouseY<=160){
    drawcircle(560,150,40,40);}
   
//   if(mouseX>=400 && mouseY >= 450){
//    
//    noFill();
//    stroke(255,0,0);
//    strokeWeight(3);
//    ellipse(570,480,269,20);}


    
}
  void drawcircle(int cirx, int ciry,int d1, int d2){
    noFill();
    stroke(255,0,0);
    strokeWeight(3);
    ellipse(cirx,ciry,d1,d2);}


