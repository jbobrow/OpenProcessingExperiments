
  int x;
  int y;
  float r=255;
  float g=255;
  float b=255;



void setup(){
  size(500,500);
  background(0,255,0);
  noStroke();
  frameRate(25);
  smooth();
  


}


void mouseDragged(){
  ellipse(mouseX,mouseY,5,5);
  fill(0);
}

void draw (){
  if(mousePressed == true) {
    fill(100,20,255);
  }
  
  else{
    fill(255,252,0);
  }
}
void keyPressed() {
  if (key == 'a')
  ellipseMode(CORNER);
  ellipse(10,25,width/2, height/6);
  ellipse(100,200,width/2, height/6);
  //println(mousePressed);
  }
  
  void mouseReleased(){
    fill(0,g,b);
    rect(x,y,width/3,height);
    //fill(r,0,b);
    //rect(x+(width/3),y,width/3,height);
    fill(r,g,0);
    rect(x+(2*(width/3)),y,width/3,height);    
    
//    r-=0.5;
//    g-=0.5;
//    b-=0.5;
//  
//  if(r<2){
//    r=255;
//  }
//  
//  if(g<2){
//    g=255;
//  }
//  
//  if(b<2){
//    b=255;
//  }
//  
 
 
  
}


