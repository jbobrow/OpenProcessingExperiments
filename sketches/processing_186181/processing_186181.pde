
void setup(){
  size(500,500);
  stroke (255,240,245);
  
}
void draw(){
background(134,183,255);
//line
stroke(255,240,245);
line(height/2,0, width/2,height);
line(0,height/2,width,height/2);

//if the mouse is on the  top right side of screen
if (mouseY< height/2){
if (mouseX> width/2){
fill(255,255,255);
rect(250,0,250,250);
fill(253,253,203);
ellipse(380,125,200,200);
fill(0,0,0);
ellipse(320,100,20,20);
ellipse(420,100,20,20);
fill(255,154,154);
arc(375, 125, 150,150, 0, PI);

}
}
//if the mouse is on the top left side of screen
if (mouseY< height/2){
  if (mouseX< width/2){
fill(253,253,203);
rect(0,0,250,250);
fill(134,183,255);
textSize(50);
text("Hello",125,125);
}
}

//if the mouse is on the bottom right side of screen
if (mouseY>height/2){
  if (mouseX> width/2){
fill(253,253,203);
rect(250,250,250,250);
fill(134,183,255);
textSize(50);
text("Bye",260,380);
}
}

//if the mouse is on the bottom left side of screen
if (mouseY> height/2){
if (mouseX< width/2){
fill(255,255,255);
rect(0,250,250,250);
fill(253,253,203);
ellipse(125,380,200,200);
fill(0,0,0);
ellipse(70,350,20,20);
ellipse(170,350,20,20);
fill(255,154,154);
rect(50,400,150,20);
}
}
}

