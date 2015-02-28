
float gx = 20;
float gy = 50;
float gt = 60;
float wx = 450;
float wy = 640;
float wt = 0;
float wc = 29;
float gc = 102;
float go = -30;
int m = 0;
PFont myFont;

void setup(){
  size(900,500);
  background(255,243,237);
  myFont = loadFont("ArialRoundedMTBold-90.vlw");
}

void draw(){
    if (m < 15 || m == 15){
    //fill(252,96,21); 
    fill(gc,96,21);
    textFont(myFont);
    textSize(gt);
    text("GOT WARM?",gx,gy);
}   
    
    if (m>15 && m<25){
    //fill(239,0,119);
    fill(wc,0,119);
    textSize(wt);
    text("WE DO!!",wx,wy);
    
    }
}

void mousePressed(){
    gx += 6;
    gy += 15;
    gt += 5;
    go += 5;
    gc += 10;
    wx -= 20;
    wy -= 10;
    wt += 10;
    wc += 8;
    m ++;
}

