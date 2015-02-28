
// This sketch uses  tints of the three primary colors 
// to dynamically draw random lines, with random colours 
// within one hue, with random level of transparency also.
// On mouse's click, the sketch is redrawn and a new pattern is shown.
// The final result, kinda remind me of the crystals from 
// superman's solitude's fortress. =)


// colours patterns
color[] blues = {#518BD1, #6338E8, #8AE8E1, #1ADEC3, #835ADE};
color[] reds = {#DE624E, #D65322, #E7E8E1, #E83316, #DE2753};
color[] yellows = {#FFFA9F, #D6C52D, #FF8E0F, #ABE821, #DE9927};
color[][] colours = {blues, reds, yellows};

// picking random color pattern. Within draw() this will be used
color[] currentColours = colours[int(random(3))];
float counter = 0;

void setup() {
  size(800, 600);
  background(currentColours[int(random(0,5))]);
  noLoop();
}

void draw() {    
  
  // loop
   while(counter < 1000){
      fill(currentColours[int(random(0,5))]);
      stroke(currentColours[int(random(0,5))], random(20,100));
      strokeWeight(int(random(21)));
      //noStroke();
      line(int(random(-width/2, width*1.2)), int(random(-height/2, height*1.2)), 
               int(random(-width/2, width*1.2)), int(random(-height/2, height*1.2)));
      
      counter += random(-1, +2);
   } 
  fill(#2C2C2C);
  noStroke();
  rect(-1, -1, width+2, 40);
  rect(-1, height-19, width+2, 20);
  fill(#B9B9B9);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("click to change the pattern", 400, 20);  
}

void mousePressed()
{
  currentColours = colours[int(random(3))];
  counter = 0;
  redraw();
}


