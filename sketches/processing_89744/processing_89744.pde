
PImage [] myImageArray= new PImage [2]; //remember computers count from 0 not 1, doh!
int shrodingersCat;
float x=350;
float y=275;
int counter;

void setup() {
  size(800, 600);
  noStroke();
  counter=0;
  
  myImageArray[0]=loadImage ("nyan.png");
  myImageArray[1]= loadImage ("nyanDead_1.png");
  noLoop();
}
  
void draw() {
  //noCursor();
  //starfield background
  background(2,30,59);
  //twinkling starry background
  //starfield();
  hyperCube();
  shrodingersCat();  
  
  /*  
 //mouse function to either open Shrodinger's box 
  if (mousePressed == false) {
    fill (2,30,59);
  } else {
    noFill();
  }
    cubeDoor();   
      //randomize choice of dead or alive nyan cat
  */ 
} 

void mousePressed()
{
  //mouse function to either open Shrodinger's box 
  if (mousePressed == false) {
    fill (2,30,59);
  } else {
    noFill();
  }
    cubeDoor();
 redraw();
}

void mouseReleased()
{
 cubeDoor(); 
}
void shrodingersCat()
{
  
 if (mousePressed == true) {
    image (myImageArray[(int)random(2)], 300, 200);
    image (myImageArray[(int)random(2)], 300, 200); 
  }   
}
void cubeDoor()
{
  rect (201,176,399,274);
}
void nyanDead()
{
          
//Dead Nyan Cat
  
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(x+20,y+55,20,7); //tail
       
//feet
    ellipse(x+30,y+75,10,15); //foot1
    ellipse(x+39,y+75,10,15); //foot2
    ellipse(x+60,y+75,10,15); //foot3
    ellipse(x+69,y+75,10,15); //foot4
  
//body  
  fill(254,203,150);
    rect(x+25,y+25, 60, 50, 7); //poptart crust
noStroke();
fill (255,153,255);
    rect(x+30,y+30, 50, 40, 7); //poptart frosting
      
//Sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(x+40,y+35,3.5,3.5);
    ellipse(x+50,y+52,3.5,3.5);
    ellipse(x+35,y+60,3.5,3.5);
    ellipse(x+55,y+35,3.5,3.5);
    ellipse(x+70,y+40,3.5,3.5);
   /* optional twinkling sprinkles
    ellipse(x+40,y+40,random(2,5), random(2,5));
    ellipse(x+50,y+50,random(2,5), random(2,5));
    ellipse(x+35,y+60,random(2,5), random(2,5));
    ellipse(x+55,y+35,random(2,5), random(2,5));
    ellipse(x+70,y+40,random(2,5), random(2,5));*/
//bite
fill (2,30,59);
    ellipse (x+35,y+33,25,25); //bite1
    ellipse (x+55,y+30,20,20); //bite2
    ellipse (x+45,y+38,25,25); //bite3
    ellipse (x+45,y+30,15,15); //bite4  
     
//cathead//
   
//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (x+58,y+55,x+63,y+40,x+71,y+50); //earl
    triangle (x+75,y+55,x+86,y+40,x+91,y+55); //earr
     
//head
stroke(0,0,0);
strokeWeight(2); 
fill (150,150,150);
    ellipse (x+75,y+63,40,30);
   
//catnose
noStroke();
fill (255,153,255);
    triangle(x+73,y+64,x+78,y+70,x+83,y+64);
  
//eyes
stroke(0,0,0);
line (x+67,y+57, x+70,y+60); //left eye
line (x+70,y+57, x+67,y+60);
line (x+83,y+57, x+86,y+60); //right eye
line (x+86,y+57, x+83,y+60);

/*strokeWeight(2);
fill(0,0,0);
    ellipse(x+70,y+59,5,5);
    ellipse(x+85,y+59,5,5);
*/    

       
 //smile
 strokeWeight(2);
 fill(0,0,0);
    arc(x+75,y+72,5,5, 0, PI);   
  /*
  //eyeshine
 noStroke();
 fill(248,248,255);
    ellipse(x+69,y+58,3,3);
    ellipse(x+84,y+58,3,3);
    */
}

void hyperCube()
{
  pushMatrix();
  strokeWeight(2.5);
  stroke (0,191,255);
  //rectangle
  line (200,175,600,175);
  line (200,175,200,450);
  line (200,450,600,450);
  line (600,175,600,450);
  //perspective lines
  line(275,125,525,125);
  line (525,125,600,175);
  line (200,175,275,125);
  popMatrix();
}
void nyan()
{
          
//Nyan Cat
  
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(x+20,y+55,20,7); //tail
       
//feet
    ellipse(x+30,y+75,10,15); //foot1
    ellipse(x+39,y+75,10,15); //foot2
    ellipse(x+60,y+75,10,15); //foot3
    ellipse(x+69,y+75,10,15); //foot4
  
//body  
  fill(254,203,150);
    rect(x+25,y+25, 60, 50, 7); //poptart crust
noStroke();
fill (255,153,255);
    rect(x+30,y+30, 50, 40, 7); //poptart frosting
      
//Sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(x+40,y+40,3.5,3.5);
    ellipse(x+50,y+50,3.5,3.5);
    ellipse(x+35,y+60,3.5,3.5);
    ellipse(x+55,y+35,3.5,3.5);
    ellipse(x+70,y+40,3.5,3.5);
   /* optional twinkling sprinkles
    ellipse(x+40,y+40,random(2,5), random(2,5));
    ellipse(x+50,y+50,random(2,5), random(2,5));
    ellipse(x+35,y+60,random(2,5), random(2,5));
    ellipse(x+55,y+35,random(2,5), random(2,5));
    ellipse(x+70,y+40,random(2,5), random(2,5));*/
    
     
//cathead//
   
//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (x+58,y+55,x+63,y+40,x+71,y+50); //earl
    triangle (x+75,y+55,x+86,y+40,x+91,y+55); //earr
     
//head
stroke(0,0,0);
strokeWeight(2); 
fill (150,150,150);
    ellipse (x+75,y+63,40,30);
   
//catnose
noStroke();
fill (255,153,255);
    triangle(x+73,y+64,x+78,y+70,x+83,y+64);
  
//eyes
stroke(0,0,0);
strokeWeight(2);
 fill(0,0,0);
    ellipse(x+70,y+59,5,5);
    ellipse(x+85,y+59,5,5);
       
 //smile
 strokeWeight(2);
 fill(0,0,0);
    arc(x+75,y+72,5,5, 0, PI);   
 //eyeshine
 noStroke();
 fill(248,248,255);
    ellipse(x+69,y+58,3,3);
    ellipse(x+84,y+58,3,3);
}

void starfield()
{

pushMatrix();
  translate (150,200);
  frameRate(1);
  fill(255);
    ellipse(30,30,random(0,3),random(0,3));
    ellipse(350,150,random(0,3),random(0,3));
    ellipse(300,300,random(2,5), random(2,5));
    ellipse(100,100,random(2,5),random(2,5));
    ellipse(150,200,random(0,3),random(0,3));
    ellipse(400,40,random(0,3),random(0,3));
    ellipse(330,320,random(0,3),random(0,3));
    ellipse(405,35,random(1,4),random(1,4));
    ellipse(500,270,random(0,3),random(0,3));
    ellipse(610,250,random(0,3),random(0,3));
    ellipse(45,270,random(3,6),random(3,6));
  frameRate(30);
popMatrix();
  
}

