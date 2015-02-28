
PImage pic;

void setup() {
  size(600, 600);
  pic = loadImage("SelfPic.jpg");
  frameRate(5);

 


}

void draw() {
  image(pic,0,0);
  filter(INVERT);
  
  stroke(0,0,random(255));
  line(50,50,100,50);
    stroke(0,0,random(255));

  line(75,25,75,75);
    stroke(0,0,random(255));

  line(62,37,87,62);
    stroke(0,0,random(255));

  line(62,62,87,37);
  
    stroke(0,0,random(255));

  line(400,50,450,50);
  line(425,25,425,75);
  line(412,37,437,62);
  line(412,62,437,37);
  
    stroke(0,0,random(255));

  line (75,200,125,200);
  line (100,175,100,225);
  line(87.5,187.5,112,212.5);
  line(87.5,212.5,112,187.5);
  
    stroke(0,0,random(255));

  line (450,250,500,250);
  line (475,225,475,275);
  line(462.5,237.5,489,262.5);
  line(462.5,262.5,489,237.5);
  
    stroke(0,0,random(255));

  line(475,150,525,150);
  line(500,125,500,175);
  line(487.5,137.5,512,162.5);
  line(487.5,162.5,512,137.5);
  
  
  stroke(255);
  strokeWeight(5);
  
 
  

}


