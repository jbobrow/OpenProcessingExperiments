
//varriables
char skyState = 'n';

//Fonts and Images
PImage sunglasses;
PImage logo;
PImage moustache;
PImage shoe;
PImage flowers;
PImage scarf;
PFont heiti;

void setup() {
  //Load images
  sunglasses = loadImage("sunglasses.png");
  size(sunglasses.height,sunglasses.width);
  logo = loadImage("logo.png");
  size(logo.height,logo.width);
  moustache = loadImage("moustache.png");
  size(moustache.height,moustache.width);
  shoe = loadImage("shoe.png");
  size(shoe.width,shoe.height);
  flowers = loadImage("flowers.png");
  size(flowers.height,flowers.width);
  scarf = loadImage("scarf.png");
  size(scarf.width,scarf.height);
  
  //Load Fonts
  heiti = loadFont("AdobeHeitiStd-Regular-48.vlw");
  
  size(700,500);
  smooth();
  int centreX=250;
  int centreY=250;
}

void draw() {
  int centreX=250;
  int centreY=250;
  
  //Change Background/Sky
  if (skyState == 'n') {
    background(16,22,52); //night
    noStroke();
    fill(255); //white moon
    ellipse(centreX-180, centreY-180, 100, 100);  //draw moon
    //concrete
    fill(150); //grey concrete
    rect(0,480,500,20);
  }else{
    background(126,277,255);  //day
    stroke(255,205,3);
    fill(246,255,3); //yellow sun
    ellipse(centreX-180, centreY-180, 100, 100);     //draw sun
    //rays
    ellipse(5,45,5,5);
    ellipse(18,50,5,5);
    
    ellipse(15,75,5,5);
    ellipse(2,80,5,5);
    
    ellipse(5,108,5,5);
    ellipse(20,100,5,5);
    
    ellipse(25,130,5,5);
    ellipse(35,120,5,5);
    
    ellipse(30,30,5,5);
    ellipse(20,20,5,5);
    
    ellipse(60,15,5,5);
    ellipse(58,5,5,5);
      
    ellipse(90,18,5,5);
    ellipse(96,6,5,5);
      
    ellipse(112,34,5,5);
    ellipse(125,20,5,5);
      
    ellipse(125,55,5,5);
    ellipse(140,45,5,5);
      
    //concrete
     fill(150); //grey concrete
     noStroke();
     rect(0,480,500,20);
  }
  
 drawSideBar();
 drawClaws();
 drawHands();
 drawEars();
 drawFeet();
 drawShoes();
 drawHeadAndBody();
 drawEyes();
 drawEyelashes();
 drawGiantEye();
 drawTail();
 drawHat();
 drawGlasses();
 drawKeys();
 drawMoustache();
 drawFlowers();
 drawWinter();
}

void keyPressed() {
if(key=='n' || key=='d') {
skyState=key;
}
}
  
 
// --------------- Side bar ------------------
void drawSideBar() {
  int centreX=250;
  int centreY=250;
  println("drawSideBar has been drawn");
  noStroke();
  fill(240);
  rect(centreX+250,0,400,500);
  image(logo,centreX+260,centreY-220);
}


// --------------- Keys ------------------
void drawKeys() {
  int centreX=250;
  int centreY=250;
  println("drawKeys has been drawn");
  textFont(heiti);
  textSize(16);
  fill(0);
  text("Push the keyboard keys", centreX+260, centreY-110);
  text("to dress up Violet:", centreX+260, centreY-90);
  //backgrounds
  text("Pick Background -", centreX+260, centreY-45);
  text("d = daytime", centreX+260, centreY-25);
  text("n = nightime", centreX+260, centreY-5);
  
  //clothes
  text("Pick Clothes -", centreX+260, centreY+30);
  text("h = hat", centreX+260, centreY+50);
  text("g = glasses", centreX+260, centreY+68);
  text("m = moustache", centreX+260, centreY+85);
  text("s = sneakers", centreX+260, centreY+103);
  text("f = flowers", centreX+260, centreY+123);
  text("w = winter scarf", centreX+260, centreY+143);
}
  
// --------------- Drawing Claws ------------------
void drawClaws() {
  int centreX=250;
  int centreY=250;
  println("drawClaws has been drawn");
  stroke(0,0,0);
  smooth();
  fill(255, 0, 183);
  ellipse(centreX-138, centreY+92, centreX-240, centreY-245);
  ellipse(centreX-140, centreY+100, centreX-240, centreY-245);
  ellipse(centreX-138, centreY+108, centreX-240, centreY-245);

  ellipse(centreX+138, centreY+92, centreX-240, centreY-245);
  ellipse(centreX+140, centreY+100, centreX-240, centreY-245);
  ellipse(centreX+138, centreY+108, centreX-240, centreY-245);

  ellipse(centreX-126, centreY+222, centreX-240, centreY-245);
  ellipse(centreX-126, centreY+228, centreX-240, centreY-245);

  ellipse(centreX+126, centreY+222, centreX-240, centreY-245);
  ellipse(centreX+126, centreY+228, centreX-240, centreY-245);
}


// --------------- Draw Hands ------------------
void drawHands() {
  int centreX=250;
  int centreY=250;
  println("drawHands has been drawn");
  fill(99, 18, 180);
  for (int i=centreX-115; i<centreX*2; i+=centreX-20){
    ellipse(i, centreX+100, centreX-200, centreY-225);
  }
}

// --------------- Draw Ears ------------------
void drawEars() {
  int centreX=250;
  int centreY=250;
  println("drawEars has been drawn");
  // ears
  fill(99, 18, 180);
  triangle(centreX-235, centreY-35, centreX-180, centreY-77, centreX-180, centreY-25);
  triangle(centreX+235, centreY-35, centreX+180, centreY-75, centreX+70, centreY-25);
}

  
// --------------- Draw head and body ------------------
void drawHeadAndBody() {
  int centreX=250;
  int centreY=250;
  println("drawHeadAndBody has been drawn");
  // head and body
  fill(99, 18, 180);
  ellipse(centreX, centreY+100, centreX-50, centreY);
  ellipse(centreX, centreY-50, centreX+125, centreY-50);
}


// --------------- Draw feet ------------------
void drawFeet() {
  int centreX=250;
  int centreY=250;
  println("drawFeet has been drawn");
  //feet
  fill(99, 18, 180);
  for (int e=centreX-75; e<centreX+150; e+=centreX-100){
    ellipse(e, centreX+225, 100, 25);
  }
}


// --------------- Draw eyes ------------------
void drawEyes() {
  int centreX=250;
  int centreY=250;
  println("drawEyes has been drawn");
  //eyes
  fill(255, 255, 255);
  ellipse(centreX-173, centreY-125, centreX-200, centreY-200);
  ellipse(centreX-125, centreY-150, centreX-200, centreY-200);
  ellipse(centreX-77, centreY-167, centreX-200, centreY-200);
  ellipse(centreX-25, centreY-175, centreX-200, centreY-200);
  ellipse(centreX+25, centreY-175, centreX-200, centreY-200);
  ellipse(centreX+75, centreY-167, centreX-200, centreY-200);
  ellipse(centreX+125, centreY-151, centreX-200, centreY-200);
  ellipse(centreX+170, centreY-125, centreX-200, centreY-200);

//eyeBall(BLACK)
  fill(0, 0, 0);
  ellipse(centreX-169, centreY-115, centreX-225, centreY-225);
  ellipse(centreX-120, centreY-139, centreX-225, centreY-225);
  ellipse(centreX-73, centreY-155, centreX-225, centreY-225);
  ellipse(centreX-22, centreY-163, centreX-225, centreY-225);
  ellipse(centreX+25, centreY-162, centreX-225, centreY-225);
  ellipse(centreX+70, centreY-156, centreX-225, centreY-225);
  ellipse(centreX+120, centreY-140, centreX-225, centreY-225);
  ellipse(centreX+165, centreY-113, centreX-225, centreY-225);
}


// --------------- Draw eyelashes ------------------
void drawEyelashes() {
  int centreX=250;
  int centreY=250;
  println("drawEyelashes has been drawn");
  //eyeLashes(FACING_LEFT)
  noFill();
  arc(centreX-198, centreY-150, centreX-210, 40, PI/2, PI);
  arc(centreX-192, centreY-160, centreX-210, 40, PI/2, PI);

  arc(centreX-150, centreY-175, centreX-210, 40, PI/2, PI);
  arc(centreX-143, centreY-185, centreX-210, 40, PI/2, PI);

  arc(centreX-100, centreY-200, centreX-210, 40, PI/2, PI);
  arc(centreX-90, centreY-210, centreX-210, 40, PI/2, PI);

  arc(centreX-44, centreY-210, centreX-210, 40, PI/2, PI);
  arc(centreX-30, centreY-220, centreX-210, 40, PI/2, PI);
  
  //eyeLashes(FACING_RIGHT)
   noFill();
  arc(centreX+23, centreY-220, centreX-210, centreY-210, 0, PI/2);
  arc(centreX+39, centreY-215, centreX-210, centreY-210, 0, PI/2);

  arc(centreX+77, centreY-212, centreX-210, centreY-210, 0, PI/2);
  arc(centreX+90, centreY-208, centreX-210, centreY-210, 0, PI/2);

  arc(centreX+129, centreY-197, centreX-210, centreY-210, 0, PI/2);
  arc(centreX+140, centreY-192, centreX-210, centreY-210, 0, PI/2);

  arc(centreX+180, centreY-169, centreX-210, centreY-210, 0, PI/2);
  arc(centreX+190, centreY-160, centreX-210, centreY-210, 0, PI/2);
}


// --------------- Draw Giant Eye ------------------
void drawGiantEye() {
  int centreX=250;
  int centreY=250;
  println("drawGiantEye has been drawn");  //This is the 'RESPONSE' for the function
  //giantEye
  fill(100,229,100);
  ellipse(centreX, centreY-50, centreX, centreY-100);
  fill(255, 255, 255);
  ellipse(centreX, centreY-50, centreX-100, centreY-100);

  //giantEyeBall
  fill(0, 0, 0);
  ellipse(centreX, centreY-13, centreX-175, centreY-175);
}


// --------------- Draw Tail ------------------
void drawTail() {
  int centreX=250;
  int centreY=250;
  println("drawTail has been drawn");
  //tail
  triangle(centreX+215, centreX+4, centreY+225, centreY+65, centreX+170, centreY+30);
  noFill();
  bezier(centreX+200, centreY+50, centreX+100, centreY+100, centreX+180, centreY+200, centreX+91, centreY+150);
}


// --------------- Draw Hat ------------------
void drawHat() {
  int centreX=250;
  int centreY=250;
  println("drawHat has been drawn");
  if(keyPressed) {
    if (key == 'h' || key =='H') {  //if 'h' or 'H' gets pressed Hat is drawn
      fill(255,5,214);
      triangle(centreX-30, centreY-150, centreX, centreY-230, centreX+30, centreY-150);
      fill(250,255,5);
      ellipse(centreX, centreY-230, 30, 30);
      //little Dots
      //Dark Blue
        fill(5,40,255); 
        ellipse(centreX-5, centreY-190, 10, 10);
        ellipse(centreX, centreY-165, 10, 10);
        ellipse(centreX+15, centreY-160, 10, 10);
        
        //Bright Green
        fill(171,250,98);
        ellipse(centreX+7, centreY-180, 10, 10);
        ellipse(centreX-15, centreY-160, 10, 10);
      }
  } 
}


// --------------- Draw Glasses ------------------
void drawGlasses() {
  int centreX=250;
  int centreY=250;
  println("drawGlasses has been drawn");
  if(keyPressed) {
    if (key == 'g' || key =='G') {   //if 'g' or 'G' is pressed glasses are drawn
    fill(0);
    image(sunglasses,centreX-140,centreY-135);
       
      }
  } 
}


// --------------- Draw Moustache ------------------
void drawMoustache() {
  int centreX=250;
  int centreY=250;
  println("drawMoustache has been drawn");
  if(keyPressed) {
    if (key == 'm' || key =='M') {   //if 'm' or 'M' is pressed mousetache is drawn
    fill(0);
    image(moustache,centreX-70,centreY+30);
      }
  } 
}


// --------------- Draw Moustache ------------------
void drawShoes() {
  int centreX=250;
  int centreY=250;
  println("drawShoes has been drawn");
  if(keyPressed) {
    if (key == 's' || key =='S') {   //if 's' or 'S' is pressed mousetache is drawn
    fill(0);
    image(shoe,centreX-150,centreY+150);
      }
  } 
}


// --------------- Draw Flowers ------------------
void drawFlowers() {
  int centreX=250;
  int centreY=250;
  println("drawFlowers has been drawn");
  if(keyPressed) {
    if (key == 'f' || key =='F') {   //if 'f' or 'F' is pressed mousetache is drawn
    fill(0);
    image(flowers,centreX-190,centreY-70);
      }
  } 
}


// --------------- Draw Scarf ------------------
void drawWinter() {
  int centreX=250;
  int centreY=250;
  println("drawWinter has been drawn");
  if(keyPressed) {
    if (key == 'w' || key =='W') {   //if 'f' or 'F' is pressed mousetache is drawn
    fill(0);
    image(scarf,centreX-142,centreY+27);
      }
  } 
}



