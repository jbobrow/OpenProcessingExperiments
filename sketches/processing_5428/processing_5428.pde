
float vx,vy,x,y;
void setup(){
  size(800,600);
  background(4);
  
}
void draw(){
  //background(122,100,200,20);
  vx = (mouseX - x)/60;
  vy =(mouseY - y)/60;
  x = x + vx;
  y = y + vy;
  smooth();
  fill(13,20,46,10);
  strokeWeight(1);
  stroke(52,456,359,478);
  fill(x%205,50+40,y%200,vy+20);
  triangle(x%200,y*5,mouseX/1,mouseY/2,108,180);
  line(x*8,y*3,mouseX/2,mouseY);
  line(x*8,y*3,mouseX,mouseY/2);
  
  
}
void keyPressed (){
 save(random(500)+"jpg");
} 

