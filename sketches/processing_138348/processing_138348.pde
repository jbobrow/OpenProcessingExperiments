
float x=0;
void setup(){
  size(400,400);
  background(152,245,255);
  smooth();
  fill(255,255,150);
  ellipse(0,0,200,200);
}
void draw(){
  
    //stem
    
  strokeWeight(7);
  stroke(0,201,87);
  line(height/2,x+400,height/2,500);
  //petals
  strokeWeight(1);
  stroke(0);
    fill(221,55,180);
  ellipse(height/2-20,x+400,50,20);
  ellipse(height/2+20, x+400,50,20);
  ellipse(height/2, x+380, 20,40);
  ellipse(height/2, x+420, 20,40);
  //green circle
  fill(0,201,87);
  ellipse(height/2,x+400,15,15);


}
void mousePressed(){
x-=20;
background(152,245,255);
  fill(255,255,150);
  ellipse(0,0,200,200);
}
