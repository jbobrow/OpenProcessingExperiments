
PImage img; 
int xpos;
int ypos;

int x = 41;
int y = 0;

int currPxl;
int numPxls;
int i;
int rowAdd;
float tempo;

int rectX = 40;
int rectY = 10;

LessSimpleMidiSynth synth;

void setup() {
  
  colorMode(RGB, 127);
  size(440, 400);
  background (0);
  img = loadImage("horizon.jpg");
  
  xpos = (int(random(0, (img.width/2)+40)));
  ypos = (int(random(0, (img.height/2))));
  
  currPxl = 40;
  
  numPxls = (width*height)-height*40;
  
  tempo = 5;
  //tempo = 0.1;
  
  frameRate(tempo);
  
  synth = new LessSimpleMidiSynth();
  
}

void draw() {
  
  if(tempo < 5){
    tempo=tempo + 0.1;
  }
  
  frameRate(tempo);
  
  imageMode(CENTER);  
  image(img, xpos, ypos);
  
  x++;
  if (x > width) {
    x = 41;
    y = y + height/10;
    currPxl = currPxl + width*(height/10) - width + 40;
  }
  if (y >= height) {
    y = 0;
    xpos = (int(random(40, width+40)));
    ypos = (int(random(40, height)));
  }
    fill(0);
    noStroke();
    beginShape();
    vertex(x, y + height/10);
    vertex(40, y + height/10);
    vertex(40, height);
    vertex(width, height);
    vertex(width, y);
    vertex(x, y);
    endShape(CLOSE); 
    
  loadPixels();
  
  pushMatrix();
  fill(pixels[currPxl]);
  rect (0, 0, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width]);
  rect (0, 10, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*2]);
  rect (0, 20, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*3]);
  rect (0, 30, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*4]);
  rect (0, 40, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*5]);
  rect (0, 50, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*6]);
  rect (0, 60, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*7]);
  rect (0, 70, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*8]);
  rect (0, 80, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*9]);
  rect (0, 90, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*10]);
  rect (0, 100, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*11]);
  rect (0, 110, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*12]);
  rect (0, 120, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*13]);
  rect (0, 130, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*14]);
  rect (0, 140, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*15]);
  rect (0, 150, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*16]);
  rect (0, 160, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*17]);
  rect (0, 170, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*18]);
  rect (0, 180, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*19]);
  rect (0, 190, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*20]);
  rect (0, 200, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*21]);
  rect (0, 210, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*22]);
  rect (0, 220, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*23]);
  rect (0, 230, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*24]);
  rect (0, 240, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*25]);
  rect (0, 250, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*26]);
  rect (0, 260, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*27]);
  rect (0, 270, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*28]);
  rect (0, 280, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*29]);
  rect (0, 290, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*30]);
  rect (0, 300, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*31]);
  rect (0, 310, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*32]);
  rect (0, 320, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*33]);
  rect (0, 330, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*34]);
  rect (0, 340, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*35]);
  rect (0, 350, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*36]);
  rect (0, 360, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*37]);
  rect (0, 370, rectX, rectY);
  popMatrix();
    pushMatrix();
  fill(pixels[currPxl+width*38]);
  rect (0, 380, rectX, rectY);
  popMatrix();
  pushMatrix();
  fill(pixels[currPxl+width*39]);
  rect (0, 390, rectX, rectY);
  popMatrix();
    
  
 
   int note0 = round(red(pixels[currPxl]));
   int note1 = round(red(pixels[currPxl+width]));
   int note2 = round(red(pixels[currPxl+width*2]));
   int note3 = round(red(pixels[currPxl+width*3]));
   int note4 = round(red(pixels[currPxl+width*4]));
   int note5 = round(red(pixels[currPxl+width*5]));
   int note6 = round(red(pixels[currPxl+width*6]));
   int note7 = round(red(pixels[currPxl+width*7]));
   int note8 = round(red(pixels[currPxl+width*8]));
   int note9 = round(red(pixels[currPxl+width*9]));
   int note10 = round(red(pixels[currPxl+width*10]));
   int note11 = round(red(pixels[currPxl+width*11]));
   int note12 = round(red(pixels[currPxl+width*12]));
   int note13 = round(red(pixels[currPxl+width*13]));
   int note14 = round(red(pixels[currPxl+width*14]));
   int note15 = round(red(pixels[currPxl+width*15]));
   int note16 = round(red(pixels[currPxl+width*16]));
   int note17 = round(red(pixels[currPxl+width*17]));
   int note18 = round(red(pixels[currPxl+width*18]));
   int note19 = round(red(pixels[currPxl+width*19]));
   int note20 = round(red(pixels[currPxl+width*20]));
   int note21 = round(red(pixels[currPxl+width*21]));
   int note22 = round(red(pixels[currPxl+width*22]));
   int note23 = round(red(pixels[currPxl+width*23]));
   int note24 = round(red(pixels[currPxl+width*24]));
   int note25 = round(red(pixels[currPxl+width*25]));
   int note26 = round(red(pixels[currPxl+width*26]));
   int note27 = round(red(pixels[currPxl+width*27]));
   int note28 = round(red(pixels[currPxl+width*28]));
   int note29 = round(red(pixels[currPxl+width*29]));
   int note30 = round(red(pixels[currPxl+width*30]));
   int note31 = round(red(pixels[currPxl+width*31]));
   int note32 = round(red(pixels[currPxl+width*32]));
   int note33 = round(red(pixels[currPxl+width*33]));
   int note34 = round(red(pixels[currPxl+width*34]));
   int note35 = round(red(pixels[currPxl+width*35]));
   int note36 = round(red(pixels[currPxl+width*36]));
   int note37 = round(red(pixels[currPxl+width*37]));
   int note38 = round(red(pixels[currPxl+width*38]));
   int note39 = round(red(pixels[currPxl+width*39]));
   
   int velocity0 = round(green(pixels[currPxl]));
   int velocity1 = round(green(pixels[currPxl+width]));
   int velocity2 = round(green(pixels[currPxl+width*2]));
   int velocity3 = round(green(pixels[currPxl+width*3]));
   int velocity4 = round(green(pixels[currPxl+width*4]));
   int velocity5 = round(green(pixels[currPxl+width*5]));
   int velocity6 = round(green(pixels[currPxl+width*6]));
   int velocity7 = round(green(pixels[currPxl+width*7]));
   int velocity8 = round(green(pixels[currPxl+width*8]));
   int velocity9 = round(green(pixels[currPxl+width*9]));
   int velocity10 = round(green(pixels[currPxl+width*10]));
   int velocity11 = round(green(pixels[currPxl+width*11]));
   int velocity12 = round(green(pixels[currPxl+width*12]));
   int velocity13 = round(green(pixels[currPxl+width*13]));
   int velocity14 = round(green(pixels[currPxl+width*14]));
   int velocity15 = round(green(pixels[currPxl+width*15]));
   int velocity16 = round(green(pixels[currPxl+width*16]));
   int velocity17 = round(green(pixels[currPxl+width*17]));
   int velocity18 = round(green(pixels[currPxl+width*18]));
   int velocity19 = round(green(pixels[currPxl+width*19]));
   int velocity20 = round(green(pixels[currPxl+width*20]));
   int velocity21 = round(green(pixels[currPxl+width*21]));
   int velocity22 = round(green(pixels[currPxl+width*22]));
   int velocity23 = round(green(pixels[currPxl+width*23]));
   int velocity24 = round(green(pixels[currPxl+width*24]));
   int velocity25 = round(green(pixels[currPxl+width*25]));
   int velocity26 = round(green(pixels[currPxl+width*26]));
   int velocity27 = round(green(pixels[currPxl+width*27]));
   int velocity28 = round(green(pixels[currPxl+width*28]));
   int velocity29 = round(green(pixels[currPxl+width*29]));
   int velocity30 = round(green(pixels[currPxl+width*30]));
   int velocity31 = round(green(pixels[currPxl+width*31]));
   int velocity32 = round(green(pixels[currPxl+width*32]));
   int velocity33 = round(green(pixels[currPxl+width*33]));
   int velocity34 = round(green(pixels[currPxl+width*34]));
   int velocity35 = round(green(pixels[currPxl+width*35]));
   int velocity36 = round(green(pixels[currPxl+width*36]));
   int velocity37 = round(green(pixels[currPxl+width*37]));
   int velocity38 = round(green(pixels[currPxl+width*38]));
   int velocity39 = round(green(pixels[currPxl+width*39]));
   
   float bfloat0 = blue(pixels[currPxl]);
   bfloat0 = map(bfloat0, 0, 100, 10, 100);
   long duration0 = round(bfloat0); 
  float bfloat1 = blue(pixels[currPxl+width]);
   bfloat1 = map(bfloat1, 0, 100, 10, 100);
   long duration1 = round(bfloat1); 
  float bfloat2 = blue(pixels[currPxl+width*2]);
   bfloat2 = map(bfloat2, 0, 100, 10, 100);
   long duration2 = round(bfloat2); 
  float bfloat3 = blue(pixels[currPxl+width*3]);
   bfloat3 = map(bfloat3, 0, 100, 10, 100);
   long duration3 = round(bfloat3);
  float bfloat4 = blue(pixels[currPxl+width*4]);
   bfloat4 = map(bfloat4, 0, 100, 10, 100);
   long duration4 = round(bfloat4);
  float bfloat5 = blue(pixels[currPxl+width*5]);
   bfloat5 = map(bfloat5, 0, 100, 10, 100);
   long duration5 = round(bfloat5);
  float bfloat6 = blue(pixels[currPxl+width*6]);
   bfloat6 = map(bfloat6, 0, 100, 10, 100);
   long duration6 = round(bfloat6);
  float bfloat7 = blue(pixels[currPxl+width*7]);
   bfloat7 = map(bfloat7, 0, 100, 10, 100);
   long duration7 = round(bfloat7);
  float bfloat8 = blue(pixels[currPxl+width*8]);
   bfloat8 = map(bfloat8, 0, 100, 10, 100);
   long duration8 = round(bfloat8);
  float bfloat9 = blue(pixels[currPxl+width*9]);
   bfloat9 = map(bfloat9, 0, 100, 10, 100);
   long duration9 = round(bfloat9);
   float bfloat10 = blue(pixels[currPxl+width*10]);
   bfloat10 = map(bfloat10, 0, 100, 10, 100);
   long duration10 = round(bfloat10); 
  float bfloat11 = blue(pixels[currPxl+width*11]);
   bfloat11 = map(bfloat11, 0, 100, 10, 100);
   long duration11 = round(bfloat11); 
  float bfloat12 = blue(pixels[currPxl+width*12]);
   bfloat12 = map(bfloat12, 0, 100, 10, 100);
   long duration12 = round(bfloat12); 
  float bfloat13 = blue(pixels[currPxl+width*13]);
   bfloat13 = map(bfloat13, 0, 100, 10, 100);
   long duration13 = round(bfloat13);
  float bfloat14 = blue(pixels[currPxl+width*14]);
   bfloat14 = map(bfloat14, 0, 100, 10, 100);
   long duration14 = round(bfloat14);
  float bfloat15 = blue(pixels[currPxl+width*15]);
   bfloat15 = map(bfloat15, 0, 100, 10, 100);
   long duration15 = round(bfloat15);
  float bfloat16 = blue(pixels[currPxl+width*16]);
   bfloat16 = map(bfloat16, 0, 100, 10, 100);
   long duration16 = round(bfloat16);
  float bfloat17 = blue(pixels[currPxl+width*17]);
   bfloat17 = map(bfloat17, 0, 100, 10, 100);
   long duration17 = round(bfloat17);
  float bfloat18 = blue(pixels[currPxl+width*18]);
   bfloat18 = map(bfloat18, 0, 100, 10, 100);
   long duration18 = round(bfloat18);
  float bfloat19 = blue(pixels[currPxl+width*19]);
   bfloat19 = map(bfloat19, 0, 100, 10, 100);
   long duration19 = round(bfloat19);
  float bfloat20 = blue(pixels[currPxl+width*20]);
   bfloat20 = map(bfloat20, 0, 100, 10, 100);
   long duration20 = round(bfloat20); 
   float bfloat21 = blue(pixels[currPxl+width*21]);
   bfloat21 = map(bfloat21, 0, 100, 10, 100);
   long duration21 = round(bfloat21); 
  float bfloat22 = blue(pixels[currPxl+width*22]);
   bfloat22 = map(bfloat22, 0, 100, 10, 100);
   long duration22 = round(bfloat22); 
  float bfloat23 = blue(pixels[currPxl+width*23]);
   bfloat23 = map(bfloat23, 0, 100, 10, 100);
   long duration23 = round(bfloat23); 
  float bfloat24 = blue(pixels[currPxl+width*24]);
   bfloat24 = map(bfloat24, 0, 100, 10, 100);
   long duration24 = round(bfloat24);
  float bfloat25 = blue(pixels[currPxl+width*25]);
   bfloat25 = map(bfloat25, 0, 100, 10, 100);
   long duration25 = round(bfloat25);
  float bfloat26 = blue(pixels[currPxl+width*26]);
   bfloat26 = map(bfloat26, 0, 100, 10, 100);
   long duration26 = round(bfloat26);
  float bfloat27 = blue(pixels[currPxl+width*27]);
   bfloat27 = map(bfloat27, 0, 100, 10, 100);
   long duration27 = round(bfloat27);
  float bfloat28 = blue(pixels[currPxl+width*28]);
   bfloat28 = map(bfloat28, 0, 100, 10, 100);
   long duration28 = round(bfloat28);
  float bfloat29 = blue(pixels[currPxl+width*29]);
   bfloat29 = map(bfloat29, 0, 100, 10, 100);
   long duration29 = round(bfloat29);
  float bfloat30 = blue(pixels[currPxl+width*30]);
   bfloat30 = map(bfloat30, 0, 100, 10, 100);
   long duration30 = round(bfloat30); 
   float bfloat31 = blue(pixels[currPxl+width*31]);
   bfloat31 = map(bfloat31, 0, 100, 10, 100);
   long duration31 = round(bfloat31); 
  float bfloat32 = blue(pixels[currPxl+width*32]);
   bfloat32 = map(bfloat32, 0, 100, 10, 100);
   long duration32 = round(bfloat32); 
  float bfloat33 = blue(pixels[currPxl+width*33]);
   bfloat33 = map(bfloat33, 0, 100, 10, 100);
   long duration33 = round(bfloat33); 
  float bfloat34 = blue(pixels[currPxl+width*34]);
   bfloat34 = map(bfloat34, 0, 100, 10, 100);
   long duration34 = round(bfloat34);
  float bfloat35 = blue(pixels[currPxl+width*35]);
   bfloat35 = map(bfloat35, 0, 100, 10, 100);
   long duration35 = round(bfloat35);
  float bfloat36 = blue(pixels[currPxl+width*36]);
   bfloat36 = map(bfloat36, 0, 100, 10, 100);
   long duration36 = round(bfloat36);
  float bfloat37 = blue(pixels[currPxl+width*37]);
   bfloat37 = map(bfloat37, 0, 100, 10, 100);
   long duration37 = round(bfloat37);
  float bfloat38 = blue(pixels[currPxl+width*38]);
   bfloat38 = map(bfloat38, 0, 100, 10, 100);
   long duration38 = round(bfloat38);
  float bfloat39 = blue(pixels[currPxl+width*39]);
   bfloat39 = map(bfloat39, 0, 100, 10, 100);
   long duration39 = round(bfloat39);  
  
     if (note0 == 0){
     velocity0 = 0;}
     if (note1 == 0){
     velocity1 = 0;}
     if (note2 == 0){
     velocity2 = 0;}
     if (note3 == 0){
     velocity3 = 0;}
     if (note4 == 0){
     velocity4 = 0;}
     if (note5 == 0){
     velocity5 = 0;}
     if (note6 == 0){
     velocity6 = 0;}
     if (note7 == 0){
     velocity7 = 0;}
     if (note8 == 0){
     velocity8 = 0;}
     if (note9 == 0){
     velocity9 = 0;}
     if (note10 == 0){
     velocity10 = 0;}
     if (note11 == 0){
     velocity11 = 0;}
     if (note12 == 0){
     velocity12 = 0;}
     if (note13 == 0){
     velocity13 = 0;}
     if (note14 == 0){
     velocity14 = 0;}
     if (note15 == 0){
     velocity15 = 0;}
     if (note16 == 0){
     velocity16 = 0;}
     if (note17 == 0){
     velocity17 = 0;}
     if (note18 == 0){
     velocity18 = 0;}
     if (note19 == 0){
     velocity19 = 0;}
     if (note20 == 0){
     velocity20 = 0;}
     if (note21 == 0){
     velocity21 = 0;}
     if (note22 == 0){
     velocity22 = 0;}
     if (note23 == 0){
     velocity23 = 0;}
     if (note24 == 0){
     velocity24 = 0;}
     if (note25 == 0){
     velocity25 = 0;}
     if (note26 == 0){
     velocity26 = 0;}
     if (note27 == 0){
     velocity27 = 0;}
     if (note28 == 0){
     velocity28 = 0;}
     if (note29 == 0){
     velocity29 = 0;}
     if (note30 == 0){
     velocity30 = 0;}
     if (note31 == 0){
     velocity31 = 0;}
     if (note32 == 0){
     velocity32 = 0;}
     if (note33 == 0){
     velocity33 = 0;}
     if (note34 == 0){
     velocity34 = 0;}
     if (note35 == 0){
     velocity35 = 0;}
     if (note36 == 0){
     velocity36 = 0;}
     if (note37 == 0){
     velocity37 = 0;}
     if (note38 == 0){
     velocity38 = 0;}
     if (note39 == 0){
     velocity39 = 0;} 
   
  synth.play(note0, velocity0, duration0);
  synth.play(note1, velocity1, duration1);
  synth.play(note2, velocity2, duration2);
  synth.play(note3, velocity3, duration3);
  synth.play(note4, velocity4, duration4);
  synth.play(note5, velocity5, duration5);
  synth.play(note6, velocity6, duration6);
  synth.play(note7, velocity7, duration7);
  synth.play(note8, velocity8, duration8);
  synth.play(note9, velocity9, duration9);
  synth.play(note10, velocity10, duration10);
  synth.play(note11, velocity11, duration11);
  synth.play(note12, velocity12, duration12);
  synth.play(note13, velocity13, duration13);
  synth.play(note14, velocity14, duration14);
  synth.play(note15, velocity15, duration15);
  synth.play(note16, velocity16, duration16);
  synth.play(note17, velocity17, duration17);
  synth.play(note18, velocity18, duration18);
  synth.play(note19, velocity19, duration19);
  synth.play(note20, velocity20, duration20);
  synth.play(note21, velocity21, duration21);
  synth.play(note22, velocity22, duration22);
  synth.play(note23, velocity23, duration23);
  synth.play(note24, velocity24, duration24);
  synth.play(note25, velocity25, duration25);
  synth.play(note26, velocity26, duration26);
  synth.play(note27, velocity27, duration27);
  synth.play(note28, velocity28, duration28);
  synth.play(note29, velocity29, duration29);
  synth.play(note30, velocity30, duration30);
  synth.play(note31, velocity31, duration31);
  synth.play(note32, velocity32, duration32);
  synth.play(note33, velocity33, duration33);
  synth.play(note34, velocity34, duration34);
  synth.play(note35, velocity35, duration35);
  synth.play(note36, velocity36, duration36);
  synth.play(note37, velocity37, duration37);
  synth.play(note38, velocity38, duration38);
  synth.play(note39, velocity39, duration39);
    
    currPxl++;
  if (currPxl >= numPxls){
    currPxl = 40;
  }

 }

