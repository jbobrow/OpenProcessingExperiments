
//R.M. Watkins
//Learning Processing
//NMD102 

//Lesson One Project

//Move the mouse to change the color of Zoog's head
//Click the mouse to change the color and size of Zoog's body

    
  void draw() {
   
    
    //Draw a black background
    background(150);
    
    //Set  ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);
    
   
     circles();
     boxes();
    Zoog();



  }
  void mousePressed() {
    Nolan=random(0,255);
    Watkins=random(0,255);
    Body=random(0,150);
    println("R.M.Watkins, NMD 102");
  }
  
  void setup () {
  //Set the size of the window
  size(200,200); }
  
  void Zoog() {
     //Zoog's body
  stroke(0);
  fill(Body);
  rect(mouseX,mouseY,Nolan,Watkins);
  Nolan = 40;
  Watkins = 100;

  //Zoog's head
  stroke(0);
  fill(mouseX,150,mouseY);
  ellipse(mouseX,mouseY-30,60,60);
  
  //Zoog's eyes
  fill(mouseX,50,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  //Zoog's eyebrows
  line(mouseX,mouseY-40,pmouseX-30,pmouseY-50);
  line(mouseX+8,mouseY-50,pmouseX+40,pmouseY-50);
 
  //Zoog's legs
  stroke(0);
  fill(255);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+80);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+80);
  }
  
  void circles(){
        //Circles
    smooth();
  //Purple circle
  fill(155,27,146);
  ellipse(Ford-40,Sienna-40,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-40,Sienna+40,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford,Sienna,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-20,Sienna-20,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-20,Sienna+20,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+20,Sienna-20,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+20,Sienna+20,Elarion,Lance);
  //Purple circle
  fill(155,27,146);
  ellipse(Ford-80,Sienna-80,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-80,Sienna+80,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford+40,Sienna+40,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-60,Sienna-60,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-60,Sienna+60,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+60,Sienna-60,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+60,Sienna+60,Elarion,Lance);
    //Purple circle
  fill(155,27,146);
  ellipse(Ford-40,Sienna-40,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-40,Sienna+40,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford,Sienna,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-20,Sienna-20,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-20,Sienna+20,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+20,Sienna-20,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+20,Sienna+20,Elarion,Lance);
  

  //Random codes for circles
  Elarion = random(-20,20);
  Lance = random(-20,20);
  ellipse(Ford-80,Sienna,Elarion,Lance);
  
  }
  
  void boxes() {
      //Boxes
  
  //Black box
  fill(0);
  rect(Ford-40,Sienna,Kerri,Kerri);
  //White box inside black box
  fill(255);
  rect(Ford-40,Sienna,Dahlia,Dahlia);
   //Grey box inside black box
  fill(125);
  rect(Ford-40,Sienna,Strith,Strith); 
 //Random codes for squares
Kerri= random(-20,20);
Strith=random(-10,10);
Dahlia= random(-5,5);

//All random
Ford=random (0,220);
Sienna=random (0,220);

Kerri=Kerri+0.05;
Dahlia=Dahlia+0.05;
Elarion=Elarion+0.2;
Lance=Lance+0.2;
Strith=Strith+0.1;
  }
  
  //black box width and height
float Kerri;

//white box width and height
float Dahlia;

//circle width
float Elarion;

//circle height
float Lance;

//grey box width and height
float Strith;

//x location
float Ford;

//y location
float Sienna;


float Dome; 

//Zoog's body color
float Body;
//Zoog Body width
float Nolan;

//Zoog Body height
float Watkins;
    

