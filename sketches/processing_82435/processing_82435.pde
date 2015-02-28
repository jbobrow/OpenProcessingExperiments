
// Midterm project 
// By Zach Ruddell
// Basic Idea - Its a maze you have to solve with your cursor! 
//CLICK TO Begin!
//Notes: This should be better! I would like to include more things, I just ran out time. Sorry! 


PImage myImg;
PImage myImgtwo;
int kurtz = 0;
int speed = 25;

void setup(){
size(690,500);
myImg = loadImage("start.jpg");
myImgtwo = loadImage("End.jpg");

}
void draw(){
  strokeWeight(8);
  smooth();
  stroke(0);
  
  
 
   textSize(50);
   for(int X=0; X < 1000; X++){
  text("CLICK TO SOLVE IT",100,X*50);
  // Its not much! but it is a for loop!!!
  // I got the idea from something we did in class. 
   
}


  if(mousePressed && mouseX > 0 && mouseX < 700 && mouseY > 0 && mouseY < 700){
   image(myImg,0,0); }
   //Start button
   //I think I used some notes from class to help me with this part but it was pretty much trial and error. 
    if(mousePressed && mouseX > 0 && mouseX < 700 && mouseY > 0 && mouseY < 700){
   image(myImgtwo,600,460); }
   //End button
    
  //Maze Begins!
  line(15,35,15,450);
  line(15,450,630,450);
  line(60,35,675,35);
  line(675,35,675,450);
  line(15,160,110,160);
  line(110,160,110,115);
  line(65,120,65,75);
  line(65,75,205,75);
  line(155,75,155,245);
  line(105,245,155,245);
  line(65,200,110,200);
  line(65,200,65,285);
  line(65,285,345,285);
  line(345,285,345,200);
  line(155,160,300,160);
  line(300,160,300,245);
  line(300,245,205,245);
  line(205,200,205,370);
  line(205,200,250,200);
  line(15,325,110,325);
  line(110,325,110,370);
  line(65,370,65,410);
  line(65,410,390,410);
  line(390,160,390,410);  
  line(155,325,155,410);
  line(205,370,345,370);
  line(345,370,345,410);
  line(250,325,390,325);
  line(390,160,345,160);
  line(345,160,345,120);
  line(345,120,200,120);
  line(250,120,250,75);
  line(250,75,300,75);
  line(345,75,390,75);
  line(390,75,390,120);
  line(390,120,440,120);
  line(440,35,440,160);
  line(535,35,535,120);
  line(535,120,580,120);
  line(390,200,535,200);
  line(535,200,535,290);
  line(535,245,440,245);
  line(440,245,440,285);
  line(485,75,485,200);
  line(485,160,625,160);
  line(625,75,625,200);
  line(625,75,580,75);
  line(625,200,675,200);
  line(435,325,580,325);
  line(485,325,485,285);
  line(580,200,580,370);
  line(580,370,440,370);
  line(440,370,440,450);
  line(485,410,625,410);
  line(625,410,625,245);
  line(625,370,675,370);
  //Maze End. 
  //Based on design at http://www.jimloy.com/puzz/maze0.gif
  
  ellipse(350,250,900,900);
  fill(50,pmouseX,mouseY,50);
  line(mouseX,mouseY,pmouseX,pmouseY);
  //Background and pointer. Figured out from notes in class!
  
  //Flying cubes, borrowed from my HW3 which was based on stuff from the book and modified to work/create new patterns
 kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  rect(1,kurtz,32,32);
  //1
  
   kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(33,kurtz,32,32);
  //2

kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(65,kurtz,32,32);
  //3
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(97,kurtz,32,32);
  //4
  
kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(129,kurtz,32,32);
  //5
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(161,kurtz,32,32);
  //6
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(193,kurtz,32,32);
  //7
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(225,kurtz,32,32);
  //8
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(257,kurtz,32,32);
  //9
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  rect(289,kurtz,32,32);
  //10
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(321,kurtz,32,32);
  //11
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(353,kurtz,32,32);
  //12
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(385,kurtz,32,32);
  //13
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(417,kurtz,32,32);
  //14
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(449,kurtz,32,32);
  //15
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(481,kurtz,32,32);
  //16
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  rect(513,kurtz,32,32);
  //17
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(545,kurtz,32,32);
  //18
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
 
  rect(577,kurtz,32,32);
  //19
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  rect(609,kurtz,32,32);
  //20
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(641,kurtz,32,32);
  //21
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);

  rect(673,kurtz,32,32);
  //22
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(705,kurtz,32,32);
  //23
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(737,kurtz,32,32);
  //24
  
  kurtz = kurtz + speed;
  if ((kurtz > width) || (kurtz <0)) {
    speed = speed * -1;
  }
  if ((kurtz > height) || (kurtz<0));
  
  stroke(0);
  
  rect(769,kurtz,32,32);
  //25
  //END OF CUBES!
}
  
 



