
PImage car;
PImage backimg;
PImage backimg2;
 
float posY = 250;
float posX = 20;
  
void setup(){
  size(600, 400);
 car = loadImage("car.png");
 backimg = loadImage("adv1.jpg");

}
  
void draw(){
  background(250,250,100,10);
  background(backimg);
  
//--------------------------------------------------


 // background(#D299D6,255);
  //-------------------------------------backgroundcircle
 /* noStroke();
 fill(#DCACE0);
  ellipse(125,125,100,100);
  
  noStroke();
 fill(#DCACE0);
  ellipse(45,45,60,60); 
  
  noStroke();
 fill(#DCACE0);
  ellipse(255,255,150,150);
  */
  
 //-------------------------------------backgroundRings
   for (int a = 300; a > 0; a = a - 9)
  {
    stroke (#08115A,100);
    strokeWeight(random(2));
    noFill();
    ellipse (580, 155, a, a);
  }
  
     for (int a = 240; a > 0; a = a - 9)
  {
    stroke (#08115A,100);
    strokeWeight(random(2));
    noFill();
    ellipse (500, 305, a, a);
  }
  
     for (int a = 120; a > 0; a = a - 9)
  {
    stroke (#08115A,100);
    strokeWeight(random(2));
    noFill();
    ellipse (420, 105, a, a);
  }
 
 
   for (int a = 60; a > 0; a = a - 9)
  {
    stroke (#6928B4,100);
    strokeWeight(random(2));
    noFill();
    ellipse (235, 35, a, a);
  }
  
 for (int a = 190; a > 0; a = a - 9)
  {
    stroke (#016571,100);
    strokeWeight(random(2));
    noFill();
    ellipse (235, 255, a, a);
  }
  
 for (int a = 110; a > 0; a = a - 9)
  {
    stroke (#3162C1,190);
    strokeWeight(random(2));
    noFill();
    ellipse (205, 105, a, a);
  }
  
  for (int a = 190; a > 0; a = a - 9)
  {
    stroke (#6928B4,190);
    strokeWeight(random(2));
    noFill();
    ellipse (9, 195, a, a);
  }
  
    for (int a = 190; a > 0; a = a - 9)
  {
    stroke (#1058E3,100);
    strokeWeight(random(2));
    noFill();
    ellipse (145, 45, a, a);
  }
  //-------------------------------------mouse 
 /* translate(mouseX,mouseY);
 
 // size(250,250);
  for (int i = 1; i < 5; i++) {
  //float r = random(-150, 150);
  float pointillize = map(9, 0, 40, 2, 10);
  int x = int(random(25));
  int y = int(random(190));
  //color pix = get(x, y);
  strokeWeight(random(40));
  stroke(0);
  fill((random(210)+20),(random(10)+10),99);
  ellipse(x, y, pointillize, pointillize);

}
*/


 
//-------------------------------------------Restrictions for movable image
  if (posY < 100) {
    posY = height-20;
  }
   
    if (posX < 0) {
    posX = 0;
  }
   
      if (posX > 160) {
    posX = 160;
  }
   
  image(car,posX,posY);
}
  
//------------------------------------Keys for movement
  void keyPressed(){
  
if(keyCode==UP ){
posX += 6;
}
if(keyCode==DOWN){
posX -= 6;
}
if(keyCode==LEFT){
posX -= 6;
}
if(keyCode==RIGHT){
posX += 6;
}
  }
  
  
void mousePressed(){
    save("_car.png");
  
}


