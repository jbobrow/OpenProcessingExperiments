
int a= 100;
int b=height/4;
int c=height/8; 
int w=40;
int d = 100; 

void setup () {
  size(500,500);
  noStroke ();
  smooth ();
 
}
 
void draw () {
 
   background(mouseX, mouseY, 70, 130);
   
  // Atomo 
  fill(7,119,234,70);
  stroke(40);
  strokeWeight(2);
  ellipse(mouseX,mouseY, d, d);

 if(mousePressed){
  
  // Atomo pazzo
  fill(7,119,234);
  stroke(40);
  strokeWeight(2);
  ellipse(mouseX,mouseY, d, d);
  
  //elettroni
  fill(238,255,5);
  stroke(40);
  strokeWeight(2);
  ellipse(mouseY-90,mouseX+15,w/5,w/5);
  ellipse(mouseY-40,mouseX+35,w/3 ,w/3);
  ellipse(mouseX+40,mouseX+50,w/2,w/2);
  
  ellipse(height-mouseY,width-mouseX,w/5,w/5);
  ellipse(width-mouseX+50,height-mouseX+5,w/3 ,w/3);
  ellipse(height-mouseY,width-mouseX,w/2,w/2);

  ellipse(width-mouseX-90,height-mouseY+15,w/5,w/5);
  ellipse(width-mouseX-40,height-mouseY+35,w/3 ,w/3);
  ellipse(height-mouseY+40,width-mouseX+50,w/2,w/2);
  
 }else{    
  
   // Atomo pazzo
  fill(7,119,234,70);
  stroke(40);
  strokeWeight(2);
  ellipse(mouseX,mouseY, d, d); 
  
 }

}
