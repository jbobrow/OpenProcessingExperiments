
//SOMA2607: Week 5 Homework_Collage
//tutorial group: Fri 2-5pm
//z3430312,DongniLi

PImage img1,img2,img3,img4,img5;

boolean click = false;
 
void setup(){
  size(400, 400);

  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
}
 
void draw(){
  loadPixels();
  if (click == true){
    image(img5, 0, 0, 200, 200);
  }else {
     image(img1, 0, 0, 200, 200);
  }

  if (click == true){
    image(img5, 200, 0, 200, 200);
  }else {
    image(img2, 200, 0, 200, 200);
  }
  
    if (click == true){
    image(img5, 0, 200, 200, 200);
  }else {
    image(img3, 0, 200, 200, 200);
  }
  
    if (click == true){
    image(img5, 200, 200, 200, 200);
  }else {
 image(img4, 200, 200, 200, 200);
  }
}


void mousePressed() {
  if(click == true) {
    click = false;
  } else {
    click = true;
  }
}


