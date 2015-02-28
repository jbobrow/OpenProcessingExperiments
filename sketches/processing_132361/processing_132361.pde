

 
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyecolor;
int headcolor; 
int brow;
int browcolor; 
int eyesize;
int mouth; 
int mouth2;
int innerear1;
int innerear2;
int earcolor;
int nose;
int nosecolor;
int haircolor;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);

}
 
void draw(){
  if (flipFlop == false){
  eyecolor=0;
  headcolor=152;
  brow=50;
  browcolor=214;
  eyesize=0;
  mouth=15;
  innerear1=115;
  innerear2=-115;
  earcolor=116;
  nose=15;
  nosecolor=188;
  mouth2=50;
  haircolor=0;
  }
  if (flipFlop == true){
  eyecolor=255;
  headcolor=42;
  brow=95;
  browcolor=152;
  eyesize=89;
  mouth=100;
  innerear1=50;
  innerear2=50;
  earcolor=20;
  nose=50;
  nosecolor=50;
  mouth2=30;
  haircolor=216;
 
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
 
void makeFace(){
  translate(150,150);
rectMode(CENTER);

//head
fill(165,headcolor,170);
rect(0,0,200,150,40);


//eyes
fill(255,eyecolor,0);
ellipse(-50,0,50,50 );
arc(-50, 0, eyesize, 35, -35, 50);

fill(7,eyecolor,255);
ellipse(50,0,40,40);

fill(255,255,255);
arc(50, 2, 0, 35, -35, 50);
arc(50, 0, 2, 35, -35, 50);
arc(50, 2, 50, 35, 20, 20);
line(35, 0, 65, 0);
line(35, 0, 60, 0);


fill(255,255,255);
ellipse(-50,0,20,20);

fill(255,255,255);
ellipse(50,0,10,10);

//ears
fill(eyecolor,198,158);
rect(115,0,35,35,50);

fill(eyecolor,198,158);
rect(-115,0,35,35,50);

fill(0,0,0);
arc(innerear1, 0, 15, 35, -35, 50);
arc(innerear2, 0, 15, 35, -35, 50);
arc(115, 15, 0, 35, -35, 50);
arc(-115, 15, 0, 35, -35, 50);



//lines
fill(230,121,245);
line(30, 0, 10, 10);
line(-25, 8, 5,10);

//mouth

fill(116,198,158);
triangle(0, 50, -15, 60, mouth, 50); 
fill(116,198,158);
triangle(45,45, -50, mouth2, 50, 50); 

//nose
fill(182,184,nosecolor);
triangle(0, 0, -15, 25, 15, nose);  

//brows
fill(browcolor,0,0);
rect(50, -35, brow, 10);
fill(7,0,browcolor);
rect(-50, -35, brow, 10); 

//hair
fill(0,haircolor,0);
rect(0, -75, 200, 50, 100, 60, 0, 0);
 
}


