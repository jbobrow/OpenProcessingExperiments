

float x;
float y;
float targetX;
float targetY;
float easing = .05;
PImage winpage;
PImage losepage; 
int start; 
boolean win = false; 

void setup () 
{

  start = second(); 
  winpage = loadImage ("You-Win.jpg"); 
  losepage = loadImage ("YOU-LOSE.jpg"); 
  size (800,800);
  background (20,20,225);
  noStroke ();
  smooth ();
}

void draw()
{
  
  println (mouseX);
  println (mouseY);
  background (20,20,225);
 targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1){
    x += dx * easing;
                  }
  targetY = mouseY;
  float dy =targetY - y;
  if (abs(dy) > 1){
    y += dy * easing;
}


//block1 
if (x > 375 -15 && x < 550 +15 && y > 400 -15 && y < 630 + 15){  
easing = 0.001;
} 
//block 2 
else if ( x > 194 -15 && x < 294 +15 && y > 388 -15 && y < 488 +15){
  easing = 0.001; 
}
//block3 
else if (x > 278 -15 && x < 528 +15 && y > 211 -15 && y < 311 +15){
  easing = 0.001;
}
//block4
else if (x > 127 -15 && x < 252 +15 && y >527 -15 && y <652 +15){
  easing = 0.001;
}
//block5 
else if (x > 603 -15 && x < 703 +15 && y >358 -15 && y <458){
  easing = 0.001;
}
//block6
else if (x > 600 - 15 && x < 775 +15 && y >500 -15 && y < 730 + 15){
easing = 0.001;
}
//block7
else if (x > 647 -15 && x < 772 +15 && y >135 -15 && y < 310 +15) {
 easing = 0.001;
} 
//block8 
else if (x > 51 -15 && x < 301 +15 && y >694 -15 && y <774 +15){
  easing = 0.001;
}
//block9 
else if (x > 407 -15 && x < 507 +15 && y >678 -15 && y <778 +15){
  easing = 0.001;
}
//block10 
else if (x > 170 -15 && x < 220 +15 && y >65 -15 && y <115 +15){
  easing = 0.001;
} 
//block11 
else if (x > 24 -15 && x < 199 +15 && y >197 -15 && y <337 +15){
  easing = 0.001;
}
//block12 
else if (x > 35 -15 && x < 85 +15 && y >385 -15 && y <585 +15){
  easing = 0.001;
}
//block13 
else if (x > 400 -15 && x < 575 +15 && y >50 -15 && y <170 +15){
  easing = 0.001;
}
//block14 
else if (x > 414 -15 && x < 514 +15 && y >327 -15 && y <387 +15){
  easing = 0.001;
}
//block15 
else if (x > 296 -15 && x < 356 +15 && y >550 -15 && y <650 +15){
  easing = 0.001;
} 
//block16 
else if (x > 616 -15 && x < 736 +15 && y >23 -15 && y <123 +15) {
  easing = 0.001;
}
//block17 
else if (x > 570 -15 && x < 630 +15 && y >229 -15 && y <339 +15){
  easing = 0.001;
}
//block18 
else if (x > 259 -15 && x < 359 +15 && y >24 -15 && y <154 +15){
  easing = 0.001;
}
//block19
else if (x > 57 -15 && x < 157 +15 && y >127 -15 && y <187 +15){
  easing = 0.001;
} 
else {
 easing = .05;
}   


fill (0,255,0);
ellipseMode(CENTER); 
ellipse(x,y,30,30);

noStroke();

//borders
 fill (225, 10,10);
 rectMode(CORNER); 
 rect (0,0,10,800);
 rect (0,0,800,10);
 rect (10,790,800,10);
 rect (790,10,800,800); 
 
 //blocks 
 rectMode(CORNER); 
  rect (375,400,175,230); //block1 
  rect (194,388, 100, 100);//block2 
  rect (278,211, 250,100);//block3 
  rect (127,527,125,125);//block4 
  rect (603,358, 100,100);//block5 
  rect (600,500,175,230); //block6 
  rect (647, 135, 125, 175);//block7 
  rect(51, 694, 250, 80);//block8 
  rect (407, 678, 100,100);//block9 
  rect (170,65,50,50);//block10 
  rect (24,197,175,140);//block11 
  rect (35,385,50,200);//block12 
  rect (400,50,175,120);//block13 
  rect (414, 327,100,60);//block14 
  rect (296,550,60,100);//block15 
  rect (616,23,120,100);//block16 
  rect (570,229,60,100);//block17 
  rect (259,24,100,130);//block18 
  rect (57,127,100,60);//block19 
  fill (0,255,0);
  rect (736,735,50,50);//winblock 
  
int timer = second()-start; 
textSize (35); 
  text(timer,30,30); 
  
  if (timer >= 20){
    image(losepage,0,0); 
   
  }

  //wincondition
if (x > 736 -15 && x < 786 +15 && y >735 -15 && y <785 +15){
  win = true; 
}

if (win == true){
image(winpage,0,0); 
} 
}




