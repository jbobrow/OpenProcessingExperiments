
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
     noFill();
     noCursor();
      
  }
  
     //  void mouseReleased(){
     //ellipse(500,400,50,50);
    // fill(255,0,0);
  void mousePressed(){
    
    if (mousePressed){  
      //lamp 
      //if (mouseX >=100 && mouseX <= 250) { //&& mouseY >= 200 && mouseY <= 230) {
      ellipse(305,120,40,40);
        fill(255,0,0);    
    }
      //bowtie
      if (mousePressed){
       //if (mouseX >= 10 && mouseY <= 402){// && mouseY >= 10 && mouseY <= 0) { 
      ellipse(402,10,25,22);
       fill(255,0,0); 
     }
      //pillow
  
  if (mousePressed) {
       // if(mouseX >= 60 && mouseX <= 200){// && mouseY >= 110 && mouseY <= 120){
         ellipse(200,250,40,70);
        fill(255,0,0); 
    
  }
      //Drawer
      if (mousePressed){       
       ellipse(155,390,30,30);        
      fill(255,0,0);  
    }      
}


