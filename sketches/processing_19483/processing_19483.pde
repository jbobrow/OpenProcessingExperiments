
PFont font;
float x1=1;
float x;
float angle=0.1;

void setup(){
size(250,250);
smooth();

font = loadFont("JCfg-48.vlw");
textFont(font);
fill(x1+1,30,220,50);
 }

void draw(){
  
noFill(); // shape’s colour
angle = angle + 0.03; // rate of rotation
translate(125, 125); // offset from orig position
rotate(angle-1); // rotate shape at angle value
    //ellipse(100,1,x1,1);
fill(20,40,50,x);
textSize(x1+40);
stroke(1);
 textSize(x1+50);
 fill(20,30,x1,3); ///moving background
text("N6G4N5",x1-20,x1-20);
textSize(x1-100);
text("N6G4N5",x1,x1);
x1+=1.0;
if (x1>250){
  x1=-100;
}
}


  
 void mousePressed()  { //clike to see the code
   smooth();
fill(225);
  text("N6G4N5",x1,50);
textSize(x+1);
//x1+=1;
//if (x1>height){
  x1=-11;
}
//} 

