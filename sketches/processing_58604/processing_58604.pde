
float ellSize = 10;
float dotX = 200;
float dotY = 2000;



void setup() {
  size(1700,1000);
  frameRate(20);
  smooth();
  noStroke();
  
}
 
void draw() {
  float R = random(180);
  float G = random(180);
  float B = random(180);
  background(R,G,B,10);
 
  dotX = (mouseX-dotX)/7 + dotX;
  dotY = (mouseY-dotY)/7 + dotY;
  ellipse(dotX,dotY,20,20);
  ellipse(dotY,dotX,30,30);
  ellipse(dotY,30,60,60);
  ellipse(30,dotX,30,30);
  ellipse(50,dotY,30,30);
  line(100,dotX,300,dotY);
  
  beginShape();
    vertex(dotY,70);
    vertex(40,dotX);
    vertex(dotY,700);
    vertex(350,dotX);
    vertex(dotY,150);
    endShape();
    
     beginShape();
    vertex(dotY,dotX);
    vertex(400,dotX);
    vertex(dotY,70);
    vertex(35,dotX);
    vertex(dotY,200);
    endShape();
}
    void mouseClicked(){
      ellipse(width/2,height/2,dotX++,dotY++);
    }
  
 // for (int i=0; i < 10; i++){
   // if (dist (x,y) < 25){
    // ellipse (mouseX,mouseY,ellSize++,ellSize++);
    //}
  //}
  // if (dist (x,y) > 25){
   //   ellipse (dot,ellSize++,ellSize++);
   // }
 




