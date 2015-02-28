
PImage right;
PImage left;
boolean exit;

 
//ellipse(500,400,50,50);
// ellipse(402,10,25,22);
void setup(){
  size(1200,530);
  right = loadImage("BartOG.png");
  size(1200,530);
  left = loadImage("BartsRoomm.png");
  }
   
void draw(){
  
   image(left,0,0);
   image(right,480,0);
   ellipse(mouseX,mouseY,50,50);
   noFill();
   //noCursor(); 

 }
void mousePressed(){
    if(mousePressed && mouseButton == LEFT){
      if(mouseX >= 160 && mouseX <= 100 && mouseY >= 398 && mouseY <= 200 ) {
        ellipse(200,260,20,50);
        fill(255,0,0);
    }
    //bowtie
    if(mousePressed && mouseButton == LEFT){
      if(mouseX >= 405 && mouseX <= 415 && mouseY >= 14 &&mouseY <= 20 ) {
        ellipse(402,10,25,22); 
        fill(255,0,0);
    } 
    //lamp
    else if(mouseX >= 301 && mouseX <= 311 && mouseY >= 120 && mouseY <= 130) { 
      ellipse(300,125,20,20);   
      fill(255,0,0);
    }
    //Drawer
    else if(mouseX >= 146 && mouseX <= 156 && mouseY >= 380 && mouseY <= 390){ 
      ellipse(150,390,20,20);
      fill(255,0,0);
      }
    }
  }
}
    


