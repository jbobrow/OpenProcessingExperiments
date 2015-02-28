
//**Coding by Alexandra Schaefer & Hideaki Matsui**// 
//**Edited by Cecilia Chen, YSDN 2012**//
//**Interactivity 1 Project 2d**// 

PImage echo;
 
void setup(){
size (500, 500);
smooth();
echo= createImage(width, height, RGB);
imageMode(CENTER);
}
 
void draw() {
  //if this si first frame dont display image
  if (frameCount <= 200){
    // do nothing
  } else {
      //else display image but scale it
      pushMatrix();
      scale(1.05);
      image(echo, width/2, height/2);
      popMatrix();
  }
  // draw any animation we want
  fill(random(300), random(255), 20);
  ellipse(mouseX, mouseY, 20, 20);
  fill(random(245),random(17),17);
triangle(mouseX,mouseY,20,100,100,200);
fill(150,34,17,167);
triangle(mouseX,mouseY,600,300,300,200);
fill(220,158,17,143);
triangle(mouseX,mouseY,600,400,300,200);
fill(245,76,17,175);
triangle(mouseX,mouseY,600,500,300,200);
fill(218,100,17,167);
triangle(mouseX,mouseY,600,600,300,200);
fill(30,43,17,167);
triangle(mouseX,mouseY,600,700,300,200);
 


 
  //copy all pixels into echo
  echo= get();
}

void mouseDragged(){ 
  fill(111,10,83);
triangle(mouseX,mouseY,60,210,100,400);

  fill(111,194,196,50);
triangle(mouseX,mouseY,600,200,300,200);
 fill(245,12,17,167);
triangle(mouseX,mouseY,500,100,300,200);
fill(60,112,17,100);
triangle(mouseX,mouseY,400,100,300,200);
fill(50,158,157,18);
triangle(mouseX,mouseY,300,100,300,200);

 
} 


