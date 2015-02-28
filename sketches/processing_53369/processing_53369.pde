
// objects
PFont font;

PVector textLoc;



//int x = 10;
 

 
void setup() {
  size(600, 600);
 
  font = loadFont("DINPro-Bold-48.vlw");
 
 
  //textLoc = new PVector(width/2, height/2, 0);
}
 
void draw() {
  background(255);
 

 
   textFont(font, 48);
  textAlign(CENTER, BASELINE);
 fill(0);
 //text("R", 100, height/2);

//S
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("S", x, y);
    }
    
   else{
     fill(0);
      text("S", 100, height/2);
      
   }
  
//R
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("C", x/2, y/2);
    }
    
   else{
     fill(0);
      text("C", 130, height/2);
      
   } 
  
  
  //R
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("R", x*1.25, y*1.25);
    }
    
   else{
     fill(0);
      text("R", 160, height/2);
      
   } 
  
   //A
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("A", x/.5, y/.5);
    }
    
   else{
     fill(0);
      text("A", 190, height/2);
      
   } 
   
   
     //M
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("M", x/.8, y*.5);
    }
    
   else{
     fill(0);
      text("M", 225, height/2);
      
   } 
   
    //B
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("B", x*.6, y/.7);
    }
    
   else{
     fill(0);
      text("B", 260, height/2);
      
   } 
  
  
      //L
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("L", x/.9, y/.3);
    }
    
   else{
     fill(0);
      text("L", 290, height/2);
      
   } 
  
        //E
  
if (mousePressed == true) {
      int x = mouseX;
      int y = mouseY;
      fill(0);
      text("E", x/.3, y/.9);
    }
    
   else{
     fill(0);
      text("E", 320, height/2);
      
   } 
  
}

