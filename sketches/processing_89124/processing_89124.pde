
int c = 50;
float d = 50.5;



 String words = "Bouncy ball";

void setup() {
  size(600,600);
  background (200,100,150); 
 textFont(createFont("Helvetica",20));


}
 void draw(){ 
   
  background (100,100,250);
  textSize(12);
  text ("Follow the ball wherever it goes, where it stops nobody knows...", 30,400);
  
  fill(200,250,200);
  stroke(250,240,250);
  ellipse( mouseX,mouseY,c,d);
 
 if (keyPressed) { //if key pressed, everything turns black
  fill(0);
   ellipse(mouseX,mouseY, c,d);
   
 }
 
 else { //if key pressed and  mouse pressed , ball turns black and red
  
   ellipse(mouseX,mouseY,c,d );
 }

  
 
 if (mousePressed) { //if mouse pressed everythign turns red
   
   fill(250,30,30);//the ellipse is filled with white
   ellipse(mouseX,mouseY, 45,45);
 } 
 else {
   ellipse(mouseX,mouseY,100,100);
 }
  }
