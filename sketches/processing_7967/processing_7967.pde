
void setup() {
  size(640, 480);
  smooth();

}

void draw() {
  background(0);
  float x1 = map(mouseX, 0, 640, 150, 142);  
  float y1 = map(mouseX, 0, 640, 290, 300);
  float x12 = map(mouseX, 0, 640, 120, 132);
  float y12 = map(mouseX, 0, 640, 320, 408);
  float x23 = map(mouseX, 0, 640, 156, 218);
  float y23 = map(mouseX, 0, 640, 380, 361);
  float x34 = map(mouseX, 0, 640, 300, 358);
  float y34 = map(mouseX, 0, 640, 395, 360);
  float x45 = map(mouseX, 0, 640, 385, 410);
  float y45 = map(mouseX, 0, 640, 380, 430);
  float x56 = map(mouseX, 0, 640, 475, 503);
  float y56 = map(mouseX, 0, 640, 400, 408);
  float x67 = map(mouseX, 0, 640, 504, 480);
  float y67 = map(mouseX, 0, 640, 335, 350); 
  float x78 = map(mouseX, 0, 640, 485, 514);
  float y78 = map(mouseX, 0, 640, 260, 254);
  float x89 = map(mouseX, 0, 640, 498, 471);
  float y89 = map(mouseX, 0, 640, 230, 222);
  float x910 = map(mouseX, 0, 640, 468, 490);
  float y910 = map(mouseX, 0, 640, 217, 195);
  float x1011 = map(mouseX, 0, 640, 334, 396);
  float y1011 = map(mouseX, 0, 640, 220, 229);
  float x1112 = map(mouseX, 0, 640, 278, 361);
  float y1112 = map(mouseX, 0, 640, 280, 290);
  float x1213 = map(mouseX, 0, 640, 244, 200);
  float y1213 = map(mouseX, 0, 640, 295, 250);

  float x1314 = x1;
  float y1314 = y1;
  float x1415 = map(mouseX, 0, 640, 150, 170);
  float y1415 = map(mouseX, 0, 640, 320, 333);
  float x1516 = map(mouseX, 0, 640, 270, 206);
  float y1516 = map(mouseX, 0, 640, 355, 320);
  float x1617 = map(mouseX, 0, 640, 440, 384);
  float y1617 = map(mouseX, 0, 640, 356, 344);
  float x17 = map(mouseX, 0, 640, x67, 410);
  float y17 = map(mouseX, 0, 640, y67, 324);

  float x181 = x1213;
  float y181 = y1213;
  float x182 = x1516;
  float y182 = y1516;
  float x19 = map(mouseX, 0, 640, x1516, 372);
  float y19 = map(mouseX, 0, 640, y1516, 272);
  float x1920 = map(mouseX, 0, 640, 300, 382);
  float y1920 = map(mouseX, 0, 640, 300, 288);
  float x2021 = map(mouseX, 0, 640, 380, 400);
  float y2021 = map(mouseX, 0, 640, 240, 255);
  float x21 = x89;
  float y21 = y89;

  float o = map(mouseX, 0, 640, 0, 255);
  float o2 = map(mouseX, 0, 640, 255, 0);

  //  int blink = 10; //blinking 
  //  int blinkCount = 0; 
  //  boolean doBlink = false; 
  //  int timer = 0; 
  //  timer += 1;
  //  if(frameCount % blink== 0) { 
  //    doBlink = true; 
  //    blink = int(random(90, 160)); //blinking frequency 
  //  } 
  //  if(timer < 30) {  
  //    doBlink = false; 
  //  }  
  //  if(doBlink == false) {   
  //    //blink length 
  //    if(blinkCount > 20) { 
  //      doBlink = false; 
  //      blinkCount = 0; 
  //    } 
  //    blinkCount++; 
  //  } 


  PImage dw = loadImage("dwight_commercial2.jpg");
  tint(100, o2);
  image (dw, 0, 32, 640, 410);
  noTint();
  PImage jg = loadImage("jungle.jpg");
  tint(150, o); 
  image (jg, 0, -150, 640, 680);
  noTint();


  stroke(255);
  strokeWeight(4);
  line(x1, y1, x12, y12); //1
  line(x12, y12, x23, y23); //2
  line(x23, y23, x34, y34); //3
  line(x34, y34, x45, y45); //4
  line(x45, y45, x56, y56); //5
  line(x56, y56, x67, y67); //6
  line(x67, y67, x78, y78); //7
  line(x78, y78, x89, y89); //8
  line(x89, y89, x910, y910); //9
  line(x910, y910, x1011, y1011); //10
  line(x1011, y1011, x1112, y1112); //11
  line(x1112, y1112, x1213, y1213); //12
  line(x1213, y1213, x1314, y1314); //13  
  line(x1314, y1314, x1415, y1415); //14
  line(x1415, y1415, x1516, y1516); //15
  line(x1516, y1516, x1617, y1617); //16
  line(x1617, y1617, x17, y17); //17

    line(x181, y181, x182, y182); //18
  line(x19, y19, x1920, y1920); //19
  line(x1920, y1920, x2021, y2021); //20
  line(x2021, y2021, x21, y21); //21



    PFont im80 = loadFont("Impact-80.vlw");
  PFont im50 = loadFont("Impact-50.vlw");
  PFont im40 = loadFont("Impact-40.vlw");
  if (mouseX > 620){
    translate(30, 30);

    pushMatrix();
    rotate(radians(-20));
    textFont(im80);
    text("Unleash", -40, 80);
    popMatrix();  

    pushMatrix();
    rotate(radians(5));
    textFont(im50);
    text("the nature", 35, 100);
    popMatrix();

    pushMatrix();
    rotate(radians(15));
    textFont(im40);
    text("within", 70, 120);
    popMatrix();

  }


}



