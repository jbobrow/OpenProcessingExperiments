
/* @pjs font="Fruktur-Regular.otf"; */
 
int x = 0;
int x1 = 0;
int x2 = 0;
int x3 = 0;
int x4 = 0;
PFont myFont;
PImage myImage;
 
void setup() {
   
  size(900,700);
   
  myFont = createFont ("Fruktur-Regular.otf", 60);
  textFont (myFont);
  textAlign(CENTER, CENTER);
   
  myImage=loadImage("mattkim.JPG");
   
}
 
void draw() {
   
  background(100);
  image(myImage, 0, 0, width, height);
  
  
   fill(255); 
  text("we cut the legs off of our pants ", x4, 40) ;
  text ("threw our shoes into the ocean", x4, 80) ;
  fill (#F299C2) ;
  text("sit back and wave through the daylight", x4,130); 
  fill(#F5A716);
  text("slip and slide on subway grates", x4, 175);
  text("these shoes are poor mans ice skates", x4, 215);
  fill(#1B9BE0);
  text("fall through like change in the daylight",x4,265);
  fill(#4DC966);
  text("i miss yellow lines in my roads some color on monochrome", x4,315);
  fill(255);
  text("maybe i’ll paint them in myself", x4, 365);
  fill(#F299C2);
  text("these sidewalks liquid then stone",x4,415);
  text("building walls and an old pay phone",x4,465);
  fill(#F5A716);
  text("it rings like all through the daylight",x4,515);
  fill(#1B9BE0);
  text("and in the daylight we can hitchhike to maine",x4,565);
  text("I hope that someday i’ll see without these frames",x4,615);
  fill(#4DC966);
  text("and in the daylight i don’t pick up my phone",x4,645);
  text("cause in the daylight anywhere feels like home", x4, 690);
  x4++;
  if (x4 > width){
    x4 = width-875 ;
  }
noStroke();
fill(#F299C2);
ellipse(5,x1,10,10);
 
ellipse(200,x3, 20, 20);
 
 
ellipse(250, x2, 10, 10);
ellipse(275, x1, 15, 15);
 
ellipse(415, x3, 15, 15);
ellipse(450, x1, 10, 10);
 
 
ellipse (530, x3, 20, 20);
 
ellipse(600, x1, 10, 10);
 
ellipse(650, x2, 20, 20);
ellipse(670, x3, 10, 10);
 
ellipse(700, x2, 20, 20);
 
noStroke();
fill(#F5A716);
 
ellipse(100, x2, 10, 10);
ellipse(570, x1, 15, 15);
ellipse(370, x1, 20, 20);
 
 
noStroke();
fill(#1B9BE0);
ellipse(415, x3, 15, 15);
ellipse(620, x3, 13, 13);
ellipse(480, x3, 20, 20);
ellipse(150, x3, 20, 20);
 
 
noStroke();
fill(#4DC966);
ellipse(200,x3, 20, 20);
ellipse(500, x2, 13, 13);
ellipse(50,x2,13,13);
ellipse(690, x1, 13, 13);
x1++;
if (x1> height){
  x1=0;
}
x2= x+1+1;
if (x2>height){
  x2=0;
}
x3 = x3+1+1+1;
if (x3>height){
  x3=0;
}
}



