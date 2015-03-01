
PImage img5, img6;
car carone1;
car carone2;

void setup(){
  img5 = loadImage("halloween2.png");
  img6 = loadImage("halloween3.png");
size(720,500);
carone1 = new car(color(120,30,100),-352,270,1.25,750,730);



}

void draw(){
  smooth();
  background(255);
  carone1.display();
  image(img5, 0, 0);
  carone1.drive();
 
  
  
}

class car {
 color c;
float xpos;
float ypos;
float xspeed;
float xsize;
float ysize;


  car (color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempXsize, float tempYsize){
  c= tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;
  xsize = tempXsize;
  ysize = tempYsize;
}

void display(){
  rectMode(CENTER);
  fill(c);
  rect(xpos,ypos,xsize,ysize);
  }
  void drive(){
    xpos = xpos + xspeed;
    if (xpos > 320) {
      noStroke();
     fill(120,30,100);
     rect(500,500,1000,800);
     image(img6,0,0);
     
}

}
}



