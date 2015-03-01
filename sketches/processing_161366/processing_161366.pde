
// Rapunzel and Flint mesmerized by the lantern displays 
// in one of the most memorable scene 
// from the animated Disney movie Tangled.
// The idea is to recreate a snapshot 
// of when Rapunzel reaches out to give 
// a descending lantern near the boat 
// a lift to rise again as Flint watches on.

//Glabal variables
color sky = #815A7E;
color water = #987996;
color skin = #FAF9CF;

//Color palettes
//Small lanterns
color [] paletteLanternSmall = 
{
  #FFF76D, #E8CF63, #FFCF69, #E8A75E, #FF9A67
};  
//Medium lanterns
color [] paletteLanternMedium = 
{
  #FFED63, #E8BE5A, #FFAE60, #E87755, #FF7382
};
//Large lanterns
color [] paletteLanternLarge = {
  #FFF835, #E8CF5A, #FFBC32, #E88A2B, #FF7A44
};
//Main lantern
color [] paletteLanternMain = {
  #FFD946, #E8B440, #FFB953, #E88B40, #FF7E46
};
//Waves
color [] paletteWaves = {
  #FF8CDA, #DE80E8, #D999FF, #A580E8, #968CFF
};


//Variable - Small Lanterns
float x = 0;
float y = 0;
float d = 0;
float e = 0;
//Variable - Medium Lanterns
float a = 0;
float b = 0;
float f = 0;
float g = 0;
//Variable - Large Lanterns
float h = 0;
float i = 0;
float j = 0;
float k = 0;
//Variable - Main Lantern
float m = 0;
//Variable - Waves
float n = 0;
float p = 0;
float q = 0;
float s = 0;
//Variable counters
float counter1 = 0; //Small lanterns
float counter2 = 0; //Medium lanterns
float counter3 = 0; //Large lanterns
float counter4 = 0; //Waves

//setup()
void setup() {
  //size and background color
  size(1200, 600);
  background(sky);
  smooth();
}

//draw()
void draw() {

  //Waves
  while (counter4 < 300) { 
    float r4 = random(0, 5);
    fill(paletteWaves[int(r4)]);
    noStroke();
    n = random(width);
    p = random(500, 600);
    float q = random(50, 100);
    float s = random(2, 4);
    rect(n, p, q, s);
    counter4++;
  }

  //Far away lanterns
  while (counter1 < 250) { 
    float r1 = random(0, 5);
    fill(paletteLanternSmall[int(r1)]);
    noStroke();
    x = random(width);
    y = random(0, 400);
    float d = random(10, 15);
    float e = random(15, 20);
    rect(x, y, d, e, 10);
    counter1++;
  }


  //Closer lanterns
  while (counter2 < 30) {
    float r2 = random (0, 5);
    fill(paletteLanternMedium[int(r2)]);
    noStroke();
    a = random(width); 
    b = random(0, 425);
    float f = random(20, 30);
    float g = random(30, 45);
    rect(a, b, f, g, 15);
    counter2++;
  }

  //Closest lanterns
  while (counter3 < 15) {
    float r3 = random (0, 5);
    fill(paletteLanternLarge[int(r3)]);
    noStroke();
    h = random(width); 
    i = random(0, 450);
    float j = random(35, 50);
    float k = random(50, 65);
    rect(h, i, j, k, 20);
    counter3++;
  }

  //Flint
  noStroke();
  //Body
  fill(#1625B9);
  ellipse(250, 435, 85, 100);
  //Hair
  fill(#814D19);
  noStroke();
  ellipse(250, 375, 50, 50);
  //Head
  fill(skin);
  noStroke();
  ellipse(255, 380, 40, 40);

  //Rapunzel
  //Hair Back
  fill(#FBFF39);
  noStroke();
  ellipse(515, 425, 75, 50);  
  //Legs
  fill(#F253BB);
  ellipse(445, 455, 55, 75);

  //Boat
  fill(#5D3722);
  stroke(#3E200F);
  strokeWeight(2);
  quad(100, 450, 600, 445, 550, 525, 150, 550);

  //Rapunzel
  noStroke();  
  //Body
  fill(#F253BB);
  ellipse(500, 435, 75, 55);
  //Arm
  stroke(#F253BB);
  strokeWeight(15);
  line(535, 450, 585, 485);
  stroke(skin);
  point(585, 485);
  //Hair Front
  fill(#FBFF39);
  noStroke();
  ellipse(550, 435, 50, 50);  
  //Head
  fill(skin);
  noStroke();
  ellipse(553, 440, 40, 40);

  //Main Lantern
  float m = random(1, 5); //Random number between address 1 and 5.
  noStroke();
  fill(paletteLanternMain[int(m)]);
  rect(600, 400, 85, 110, 35);
}

