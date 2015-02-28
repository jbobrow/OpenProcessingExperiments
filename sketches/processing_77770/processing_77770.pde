
float LTbar1;
float STbar1;
float LTbar2;
float STbar2;
float LTbar3;
float STbar3;
float LTbar4;
float STbar4;
float LTbar5;
float STbar5;

PFont font;

void setup() {
  size(520, 380);
  smooth();
}
 
 
 
void draw() {
      background(255, 255, 255);
      
  
  fill(#000000);
  text("Graph displaying connection between age and long-term memory", 40, 20);
  text("Aged 18-21", 210, 70);
  text("Aged 22-30", 210, 140);
  text("Aged 60-70", 210, 210);
  text("Aged 71-79", 210, 280);
  text("Aged 80-90", 210, 340);
  text("Key:", 350, 80);
  text("Long-term memory", 375, 100);
  text("Short-term memory", 375, 130);
  font = loadFont("Arial.vlw");
  textFont(font);
  fill(255,0,0);
  rect(350, 90, 18, 15);
  fill(0,255,0);
  rect(350,116,20,15);
  
  
  
  
  //this is the bar for the long-term memory of 18-21 year olds
  fill(255,0,0);
  rect(40, 50, LTbar1, 12);
  noStroke();
  LTbar1+=.40;
  if ( LTbar1 > 147) {
    LTbar1=147;
  }
  
  //this is the bar for the short-term memory of 18-21 year olds
    fill(0,255,0);
  rect(40, 65, STbar1, 12);
  noStroke();
  STbar1+=.32;
  if ( STbar1 > 120) {
    STbar1=120;
  }
  
  //this is the bar for the long-term memory of 22-30 year olds
  fill(255,0,0);
  noStroke();
  rect(40, 120, LTbar2, 12);
  LTbar2+=.32;
  if (LTbar2>120) {
    LTbar2=120;
  }
  
  //this is the bar for the short-term memory of 22-30 year olds
  fill(0,255,0);
  rect(40, 135, STbar2, 12);
  noStroke();
  STbar2+=.27;
  if ( STbar2 > 100) {
    STbar2=100;
  }
  
  //this is the bar for the long-term memory of 60-70 year olds
  fill(255,0,0);
  noStroke();
  rect(40, 190, LTbar3, 12);
  LTbar3+=.32;
  if (LTbar3>120) {
    LTbar3=120;
  }
  
  //this is the bar for the short-term memory of 60-70 year olds
  fill(0,255,0);
  rect(40, 205, STbar3, 12);
  noStroke();
  STbar3+=.10;
  if ( STbar3 > 103) {
    STbar3=103;
  }
  
  //this is the bar for the long-term memory of 71-79 year olds
  fill(255,0,0);
  noStroke();
  rect(40, 260, LTbar4, 12);
  LTbar4+=.40;
  if (LTbar4>155) {
    LTbar4=155;
  }
  
  //this is the bar for the short-term memory of 71-79 year olds
  fill(0,255,0);
  rect(40, 275, STbar3, 12);
  noStroke();
  STbar3+=.10;
  if ( STbar3 > 102) {
    STbar3=102;
  }
   
  //this is the bar for the long-term memory of 80-90 year olds
  fill(255,0,0);
  rect(40, 320, LTbar5, 12);
  LTbar5+=.25;
  if (LTbar5>87) {
    LTbar5=87;
  }
  
  //this is the bar for the short-term memory of 80-90 year olds
  fill(0,255,0);
  rect(40, 335, STbar3, 12);
  noStroke();
  STbar3+=.15;
  if ( STbar3 > 97) {
    STbar3=97;
  }
}


