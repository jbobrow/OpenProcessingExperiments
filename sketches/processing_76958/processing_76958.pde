
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76812*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//additional sources: http://processing.org/reference/mouseClicked_.html, http://processing.org/reference/stroke_.html, http://www.youtube.com/watch?v=3R43S8iTkBk
PFont font;
int myY, myX;
float opacity;
int num;
color col;
boolean boo;

void setup(){
col = color(0,0,200);
font = loadFont ("birch.vlw");
size(1000,100);
smooth();
textSize(48);
myY=70;
frameRate(120);
boo = false;

  
  
}

void draw(){
background(255);
if(boo == true){
 col = color(int(random(255)), int(random(255)),int(random(255)));
 boo = false;
}
num++;
myX=num/12;
opacity=mouseY*2.5;
if(mousePressed){
  num=0;
boo = true;
} 

if(num>1000){
//  fill(col, 80);
    num = 1000;
  stroke(0, opacity);
  line(90, myY+20, 600+myX*3, myY+20); 
  fill(col, opacity);
  ellipse(myX*10, myY-10,25,25);

}
else{
  fill(127,80);
  ellipse(mouseX, mouseY, 25, 25);
}

fill(col, opacity);
text("F", 1*myX, myY);
text("U", 2*myX, myY);
text("C", 3*myX, myY);
text("K", 4*myX, myY);
text(" ", 5*myX, myY);
text("Y", 6*myX, myY);
text("E", 7*myX, myY);
text("A", 8*myX, myY);
text("H", 9*myX, myY);
strokeWeight(5);
line(90, myY+20, 400+myX*3, myY+20); 

println(num);
}


