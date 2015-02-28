
PFont font;
int ypos;
int xpos;
float opac; //any number with a decimal place rather than a whole number
int inc;
color col;
boolean el;

void setup(){
col = color(190,265,200);
font = loadFont("MSReferenceSansSerif-40.vlw");
size(1200,100);
smooth();
textSize(60);
ypos = 70;
frameRate(300);
el = false; //can only either be true or false. the frame rate is equal to 120 and the y position is 70.  text sixe is 60 with a smooth effect for clarity.
}

void draw(){
  background (255);
  if(el == true){ //== means a comparison rather than defining a value
  col = color(int(random(255)),int(random(255)),int(random(255)));  
  el = false;
  }
  inc ++; //adds one increment each time
  xpos = inc/12;
  opac = mouseY*2.5;
  if(mousePressed){
  inc = 0;
  el = true;
}
if(inc>7200){
  inc = -3600; //set to a constant
  stroke(255); //stroke colour is white for font
  fill(col, opac);
  
}
else{
  fill(127,127,127);
  noStroke();
  
} 
fill(col, opac);
text("3pete interaction rules", 2*xpos, ypos); //this will move the line along until inc reaches 1000.  The x position is being multiplied by 2 from the increment

}

