
Gnome coolGnome1;
  PImage img;

void setup(){
  
  img = loadImage("Full-Snapshot.jpg");
  image(img,0, 0,width,height);

  size(800,800);
  smooth();
  float xpos;
  float ypos;

  coolGnome1 = new Gnome(400,500);
  coolGnome1.display();
  
}

void draw(){  
  textAlign(CENTER);
   fill(225);
   textSize(20);
   text("PRESS THE UP", width/2, 275);
   text("DOWN, LEFT, RIGHT", width/2, 295);
   text("TO GIVE YOUR GNOME", width/2, 315);  
   text("A NICE TRIM", width/2, 335);
}

void keyPressed(){
   if (key == CODED) {
    if (keyCode == UP) {

  coolGnome1.display();
  coolGnome1.moustacheOne();
   
 fill(0);
   textSize(40);
   text("SMASHING!", width/2, 650);
   
  }
   if (keyCode == RIGHT) {
     background(100);
  
  coolGnome1.display();
  coolGnome1.moustacheTwo();
   
 fill(0);
   textSize(40);
   text("HANDSOME!", width/2, 650);
 }  
 
  if (keyCode == DOWN) {
     background(100);
  
  coolGnome1.display();
  coolGnome1.moustacheThree();
   
 fill(0);
   textSize(40);
   text("QUITE NICE!", width/2, 650);
 }  
 
   if (keyCode == LEFT) {
     background(100);
  
  coolGnome1.display();
  coolGnome1.moustacheFour();
   
 fill(0);
   textSize(40);
   text("EXQUISITE!", width/2, 650);
 }  
 
 
 
 
}}

   





class Gnome {
float xpos;
float ypos;
  
  Gnome(float xpos_, float ypos_){
    xpos = xpos_;
    ypos = ypos_; 
  }

void display() {
  image(img,0, 0,width,height);
  smooth();
fill(0);
ellipse(xpos,ypos+400,800,800);

fill(231,203,166);
ellipse(xpos,ypos,400,450);

//eyposes
stroke(0);
strokeWeight(2);


fill(225);
ellipse(xpos-75,ypos,100,100);

noStroke();
fill(57,206,255);

ellipse(xpos-75,ypos,40,40);

fill(0);
ellipse(xpos-75,ypos,20,20);
 
 //other eypose
stroke(0);
strokeWeight(2);

fill(225);
ellipse(xpos+75,ypos,100,100);

noStroke();
fill(57,206,255);
ellipse(xpos+75,ypos,40,40);

fill(0);
ellipse(xpos+75,ypos,20,20);

rectMode(CENTER);
fill(231,203,166);
rect(xpos,ypos-80,300,130);

//hat
fill(205,21,21);
triangle(xpos, ypos-430, xpos-200, ypos-100, xpos+200, ypos-100);

//eyposebrows
fill(225);
rectMode(CENTER);
rect(xpos-75,ypos-25,120,20);

ellipse(xpos-35,ypos-35,40,30);
ellipse(xpos-75,ypos-35,40,30);
ellipse(xpos-115,ypos-35,40,30);

rect(xpos+75,ypos-25,120,20);

ellipse(xpos+35,ypos-35,40,30);
ellipse(xpos+75,ypos-35,40,30);
ellipse(xpos+115,ypos-35,40,30);

//nose
  fill(207,153,126);
triangle(xpos, ypos-10, xpos-30, ypos+70, xpos+30, ypos+70);

  }

void moustacheOne(){

//beard
  fill(225);
  noStroke();
  ellipse(xpos,ypos+300,400,500);  

//beard lines  
  stroke(0);
  fill(160);
  strokeWeight(2);
  line(xpos-100, ypos+260, xpos-100, ypos+300);
  line(xpos, ypos+260, xpos, ypos+300);
  line(xpos+100, ypos+260, xpos+100, ypos+300);

//nose 
  noStroke();
  fill(207,153,126);
  triangle(xpos, ypos-10, xpos-30, ypos+70, xpos+30, ypos+70);
 }  
 
void moustacheTwo(){
   fill(225);
   noStroke();  
  
  //right side
    ellipse(xpos+30, ypos+90,90,60);
    ellipse(xpos+50, ypos+130,90,60);
    ellipse(xpos+70, ypos+170,90,60);
    ellipse(xpos+90, ypos+210,90,60);

    ellipse(xpos+50, ypos+100,90,60);
    ellipse(xpos+70, ypos+140,90,60);
    ellipse(xpos+90, ypos+180,90,60);
    ellipse(xpos+110, ypos+220,90,60);

    ellipse(xpos+70, ypos+110,90,60);
    ellipse(xpos+90, ypos+150,90,60);
    ellipse(xpos+110, ypos+190,90,60);
    ellipse(xpos+130, ypos+230,90,60);

  //left side
    ellipse(xpos-30, ypos+90,90,60);
    ellipse(xpos-50, ypos+130,90,60);
    ellipse(xpos-70, ypos+170,90,60);
    ellipse(xpos-90, ypos+210,90,60);

    ellipse(xpos-50, ypos+100,90,60);
    ellipse(xpos-70, ypos+140,90,60);
    ellipse(xpos-90, ypos+180,90,60);
    ellipse(xpos-110, ypos+220,90,60);

    ellipse(xpos-70, ypos+110,90,60);
    ellipse(xpos-90, ypos+150,90,60);
    ellipse(xpos-110, ypos+190,90,60);
    ellipse(xpos-130, ypos+230,90,60);
    
    ellipse(xpos-170, ypos+190,90,60);
    ellipse(xpos+170, ypos+190,90,60);

   //nose 
  fill(207,153,126);
  triangle(xpos, ypos-10, xpos-30, ypos+70, xpos+30, ypos+70);
}  

void moustacheThree(){
    fill(225);
   noStroke();  
   
  ellipse(xpos,ypos+100,150,90);
    
    ellipse(xpos+30, ypos+90,100,50);
    ellipse(xpos+50, ypos+110,100,50);
    ellipse(xpos+70, ypos+130,100,50);
    ellipse(xpos+110, ypos+150,100,50);
    ellipse(xpos+130, ypos+145,100,50);
    ellipse(xpos+170, ypos+120,60,50);
    ellipse(xpos+190, ypos+100,30,30);

    ellipse(xpos-30, ypos+90,100,50);
    ellipse(xpos-50, ypos+110,100,50);
    ellipse(xpos-70, ypos+130,100,50);
    ellipse(xpos-110, ypos+150,100,50);
    ellipse(xpos-130, ypos+145,100,50);
    ellipse(xpos-170, ypos+120,60,50);
    ellipse(xpos-190, ypos+100,30,30);

  ellipse(xpos-30,ypos+140,40,40);
  ellipse(xpos-30,ypos+170,40,40);
  ellipse(xpos-30,ypos+200,40,40);
  ellipse(xpos-30,ypos+230,40,40);
 
  ellipse(xpos,ypos+140,40,40);
  ellipse(xpos,ypos+170,40,40);
  ellipse(xpos,ypos+200,40,40);
  ellipse(xpos,ypos+230,40,40);
  ellipse(xpos,ypos+260,40,40);
  
  ellipse(xpos+30,ypos+140,40,40);
  ellipse(xpos+30,ypos+170,40,40);
  ellipse(xpos+30,ypos+200,40,40);
  ellipse(xpos+30,ypos+230,40,40);

   //nose 
  fill(207,153,126);
  triangle(xpos, ypos-10, xpos-30, ypos+70, xpos+30, ypos+70);
}
    
void moustacheFour(){
  
 fill(225);
noStroke();  
  rectMode(CENTER);
  rect(xpos,ypos+120,200,140);
  ellipse(xpos,ypos+200,200,300);
  
  ellipse(xpos+110,ypos+70,50,50);
  ellipse(xpos+150,ypos+70,50,50);
  ellipse(xpos+170,ypos+70,50,50);
  ellipse(xpos+200,ypos+70,30,30);
  
  ellipse(xpos-110,ypos+70,50,50);
  ellipse(xpos-150,ypos+70,50,50);
  ellipse(xpos-170,ypos+70,50,50);
  ellipse(xpos-200,ypos+70,30,30);
  
  ellipse(xpos+110,ypos+100,70,70);
  ellipse(xpos+140,ypos+130,50,50);
  ellipse(xpos+170,ypos+160,50,50);
  ellipse(xpos+195,ypos+170,50,50);
  ellipse(xpos+220,ypos+175,50,50);
  ellipse(xpos+250,ypos+170,30,30);
  
  ellipse(xpos+110,ypos+170,90,90);
  ellipse(xpos+150,ypos+200,70,70);
  ellipse(xpos+180,ypos+230,70,70);
  ellipse(xpos+205,ypos+240,70,70);
  ellipse(xpos+230,ypos+245,70,70);
  ellipse(xpos+260,ypos+240,50,50);
  ellipse(xpos+290,ypos+235,30,30);
  
  ellipse(xpos-110,ypos+100,70,70);
  ellipse(xpos-140,ypos+130,50,50);
  ellipse(xpos-170,ypos+160,50,50);
  ellipse(xpos-195,ypos+170,50,50);
  ellipse(xpos-220,ypos+175,50,50);
  ellipse(xpos-250,ypos+170,30,30);
  
  ellipse(xpos-110,ypos+170,90,90);
  ellipse(xpos-150,ypos+200,70,70);
  ellipse(xpos-180,ypos+230,70,70);
  ellipse(xpos-205,ypos+240,70,70);
  ellipse(xpos-230,ypos+245,70,70);
  ellipse(xpos-260,ypos+240,50,50);
  ellipse(xpos-290,ypos+235,30,30);

  
   //nose 
  fill(207,153,126);
  triangle(xpos, ypos-10, xpos-30, ypos+70, xpos+30, ypos+70);
}

}


