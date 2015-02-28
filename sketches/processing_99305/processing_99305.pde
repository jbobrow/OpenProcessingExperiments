
PImage right;
PImage left;
boolean difference = true;

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
   image(right,600,0);
   ellipse(mouseX,mouseY,50,50); 
   
}
  

   //  void mouseReleased(){
      //ellipse(500,400,50,50);
  // fill(255,0,0);
   

void mousePressed(){
  //if (mouseX < 500 && mouseX < 450 && mouseY > 400 && mouseY < 420){
  if(mousePressed){
    fill(255,0,0); 
    ellipse(200,260,20,50);
    }

    if(mousePressed){
     fill(255,0,0); 
    ellipse(402,10,25,22);
    
    }
    if(mousePressed) {
    fill(255,0,0);
    ellipse(300,125,20,20);
    }
    if(mousePressed){
      ellipse(150,390,20,20);
    }
    
  }


