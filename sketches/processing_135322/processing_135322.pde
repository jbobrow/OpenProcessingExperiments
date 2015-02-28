
 
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyecolor = 255;
float eyesize = 50;
float eyesize2 = 40;
float mouthsize = 15;
float mouthsize2 = 50;
float mouthcolor = 255;
float brow = 50;
float hair = -75;
float eye = -50;
float head = 150;
float nosecolor = 185;
float earcolor = 198;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);

}
 
void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
  eyecolor = random(20,255);
  eyesize = random(25,100); 
  eyesize2 = random(60,100);
  mouthsize = random(20,50);
  mouthsize = random(30,60);
  mouthcolor = random(60,255);
  brow = random(10,50);
  hair = random(-75,-60);
  eye = random(-55,-45);
  head = random(150,160);
  nosecolor = random(50,255);
  earcolor = random(5,250);
  
 keyPrompt = ("");
} 
  
 void makeFace(){
  translate(150,150);
rectMode(CENTER); 

  //head
fill(165,166,170);
rect(0,0,200,head,40);


//eyes
fill(255,eyecolor,0);
ellipse(-50,0,eyesize,50);
arc(-50, 0, 50, 35, -35, 50);

fill(7,0,255);
ellipse(50,0,eyesize2,40);

fill(255,255,255);
arc(50, 2, 0, 35, -35, 50);
arc(50, 0, 2, 35, -35, 50);
arc(50, 2, 50, 35, 20, 20);
line(35, 0, 65, 0);
line(35, 0, 60, 0);


fill(255,255,255);
ellipse(eye,0,20,20);

fill(255,255,255);
ellipse(50,0,10,10);

//ears
fill(116,earcolor,158);
rect(115,0,35,35,50);
rect(-115,0,35,35,50);

fill(0,0,0);
arc(115, 0, 15, 35, -35, 50);
arc(-115, 0, 15, 35, -35, 50);
arc(115, 15, 0, 35, -35, 50);
arc(-115, 15, 0, 35, -35, 50);



//lines
fill(230,121,245);
line(30, 0, 10, 10);
line(-25, 8, 5,10);

//mouth

fill(116,mouthcolor,158);
triangle(0, 50, -15, 60, mouthsize, 50); 

triangle(45,45, -50, 50, mouthsize, 50); 

//nose
fill(182,nosecolor,188);
triangle(0, 0, -15, 25, 15, 15);  

//brows
fill(255,0,0);
rect(50, -35, brow, 10);
fill(7,0,255);
rect(-50, -35, brow, 10); 

//hair
fill(0,0,0);
rect(0, hair, 200, 50, 100, 60, 0, 0);
 
 }


