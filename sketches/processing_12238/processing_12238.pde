
void setup(){
  size(500,400);
  background(0,0,0) ;
  smooth();
}
void draw(){
  fill(mouseX/2, 3, mouseY);
  //stroke(0);

  rect(0,150,40,150);
  rect(40,200,30,100);
  rect(70,50,30,250);
  rect(100,100,40,200);
  rect(140,125,80,175);
  fill(0,255,0);
  rect(0,300,500,200);
 
 
//stroke(0);
     if(mousePressed) {
    fill(random(0,255),random(0,255),random(0,255)) ;
    rect(random(0,500),random(0,500),5,5);
    rect(random(0,500),random(0,500),5,5);
     }
  rect(mouseX,mouseY,2,2);
   saveFrame();
  }

