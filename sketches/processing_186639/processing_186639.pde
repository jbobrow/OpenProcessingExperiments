
// **********BRAIN GAME***********
// SAY THE COLOR OF THE WORD IN EACH BOX 
// HAVE FUN :)



float r,b,g,rd;
PFont f;
void setup(){
size (640,580);
frameRate(30);
f = createFont("Arial", 16,true);
}

void draw(){
background(255);
strokeWeight(0.2);
stroke(0);
line(width/3,0,width/3,480);
line(2*width/3,0,2*width/3,480);
line(0,240,width,240);
textFont(f,40);
noStroke();
fill(#000000);
rect(0,480,width,100 );
fill(#ffffff);
text("Say The Color of The Word", 100,530);
if (mouseX < width/3 && mouseY < 240)
{
fill(255,0,0);
rect(0,0,width/3,240);
fill(255,255,0);
text("RED", 50,140);
}

else if (mouseX < width/3 && mouseY > 240){
fill(#0000ff);
rect(0,240,width/3,240 );
fill(#ffffff);
text("BLUE", 50, 340);
}

else if(mouseX<2*width/3 && mouseY< 240){
  fill(255,255,0);
  rect(width/3,0,width/3,240);
  fill(255,0,0);
  text("YELLOW" , 230,140);
}

else if (mouseX<2*width/3 && mouseY > 240){
fill(#87f717);
rect(width/3, 240 ,width/3, 240 );
fill(#7931df);
text("GREEN",230 ,340);
}

else if(mouseX > 2*width/3 && mouseY < 240) {
fill(#000000);
rect(2*width/3,0,2*width/3,240);
fill(#ffffff);
text("BLACK" , 440,140);
}
else if ( mouseX > 2*width/3 && mouseY > 240){
fill(#f87a17);
rect(2*width/3, 240,width/3,240 );
fill(#736f6e);
text("ORANGE", 440,340);
}
}

