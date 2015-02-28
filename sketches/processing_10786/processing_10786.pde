
void setup (){
  size(600,600);   //window 600x600
 background(0);  //black
}

void draw (){
  stroke(255,0,0);
  noFill();
  line (300,0,300,600);  // y
  line (0,300,600,300);  // x
  
  /*          white         */
  if (mouseX<300 && mouseY<300){
    stroke(255,255,255);    
    line(300,300,mouseX,mouseY);
  }
  /*            blue        */
  else 
  {
  stroke(0,0,255);
  line(300,300,mouseX,mouseY);
}
  /*     fuchsia         */
   if (mouseX>300 && mouseY>300){
    stroke(255,0,255);
    line(300,300,mouseX,mouseY);
  }
  /*    olive         */
 if (mouseX<300 && mouseY>300){
   stroke(128,128,0);
    line(300,300,mouseX,mouseY);
 }
}
  void keyPressed(){
    background(0);
  }
  

