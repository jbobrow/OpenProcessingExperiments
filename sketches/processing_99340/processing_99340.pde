
PImage right;
PImage left;
boolean difference;

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
   //noFill(); 
   //noCursor();  
  }
  
   //  void mouseReleased(){
  //ellipse(500,400,50,50);
  // fill(255,0,0);

void mousePressed(){
  //EX (mouseX < 500 && mouseX < 450 && mouseY > 400 && mouseY < 420){
  //pillow
    if(mousePressed && mouseButton == LEFT){
    if(mouseX >= 160 && mouseX <= 100 && mouseY >= 398 && mouseY <= 200 ){
    difference = true;
  }
  if(difference) {
  ellipse(200,260,20,50);
    fill(255,0,0);
  } 
    
    }
    //bowtie
    if(mousePressed && mouseButton == LEFT){
    if(mouseX > 400 && mouseY < 20 ) { 
      difference = true;
    }
     ellipse(402,10,25,22);
     fill(255,0,0); 
    }
    

    //lamp
    if(mousePressed && mouseButton == LEFT) {
      if(mouseX < 310 && mouseY < 120){ 
      difference = true;
    }
    
    ellipse(300,125,20,20);
        fill(255,0,0);
    }
    //Drawer
    if(mousePressed && mouseButton == LEFT){
      if(mouseX < 150 && mouseY > 200) {
      difference = true;
    
    }  
      ellipse(150,390,20,20);
        fill(255,0,0);
    }

    difference = false;
  
    
  }
