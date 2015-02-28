
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
frameRate(150);
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
  if(mousePressed){ //clicking resets the statment to true
  inc = 0;
  el = true;

}
if(inc>800){
  inc = 0; //set to a constant for restarting point
}

else{  
  fill(col, opac);
  text("d", 2*xpos, ypos);
  text("a", 3*xpos, ypos);
  text("n", 4*xpos, ypos);
  text("i", 5*xpos, ypos);
  text("e", 6*xpos, ypos);
  text("l", 7*xpos, ypos);}

}


