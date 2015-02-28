

PImage right;
PImage left;
boolean click;
PVector v1;
PVector v2;
PVector v3;
PVector v4;

//ellipse(500,400,50,50);
// ellipse(402,10,25,22);
void setup(){
  size(1200,530);
  right = loadImage("BartOG.png");
  size(1200,530);
  left = loadImage("BartsRoomm.png");
  v1 = new PVector(200,260);
  v2 = new PVector(402,10);
  v3 = new PVector(300,125);
  v4 = new PVector(150,390);
  }
  
void draw(){
 
   image(left,0,0);
   image(right,480,0);
   //ellipse(mouseX,mouseY,50,50);
   //noFill(); 
   //noCursor();
   if( mousePressed && (mouseButton == LEFT) ) {
       println( "mouseX position: " + mouseX + " and mouseY position: " + mouseY);
    }
   

   if(click == true) {
     if(mousePressed){ 
   ellipse(v1.x, v1.y, 20,50);
     
     }
     if(mousePressed) {
   ellipse(v2.x, v2.y, 25,22);
     }
     if(mousePressed){
   ellipse(v3.x, v3.y, 20,20);
     }
     if(mousePressed){
   ellipse(v4.x, v4.y, 20,20);
     }
   }
}
  

  
  void mousePressed(){
    click = true;
  }
  void keyPressed(){
  click = false;
  }





