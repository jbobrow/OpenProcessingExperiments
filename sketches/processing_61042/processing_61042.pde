
int posx;
int posy;
int z = 10;

int mouseClicks = 0;
PFont font;

PImage rain;

void setup()

{
  size(750, 350);
  smooth();
  textAlign(CENTER);

  rain = loadImage("rain.jpg");
  image(rain, 0, 0, width, height);

  font = loadFont("DilleniaUPC-48.vlw");
}

void draw()

{
  
  loadPixels();
  color pixel = get(mouseX, mouseY);
  //pixels[i]= pixel;
  noStroke();
  fill(pixel, 120-z);

  posx=pmouseX-(mouseX%z);
  posy=pmouseY-(mouseY%z);
  ellipse(posx, posy, z, z);

  if (mouseClicks == 0) {
    fill(255);
    textFont(font);
    fill(255, 100);
    textSize(30);
    text("Do you", width/2-155, height/2+150);
    textSize(80);
    text("Forget", width/4, height/2);
    text("Remember", width/4*3, height/2);
    z = 10;
  }

  if (mouseClicks == 1) {
    textFont(font);
    fill(255, 100);
    textSize(24);
    text("sitting in the back seat only because it occupies the front", width/5+90, height/2-100);
    textSize(28);
    text("this strange, naive trust for your years", width/5*3, height/2+50);
    z = 15;
  }

  if (mouseClicks == 2) {
    fill(255, 255, 255, 100);
    textSize(29);
    text("passenger's seat implodes, scattering paper brains onto concrete", width/2, height/4*3);
    textSize(37);
    text("rain pouring adamantly down",width/3,height/2-120);
    z = 20;
  }

  if (mouseClicks == 3) {
    fill(255, 255, 255, 100);
    textSize(34);
    text("yet I remain an unbeliever", width/8 + 65, height/2 + 30);
    textSize(28);
    text("someone must have caused this", width/8*5.3, height/9);
    z = 25;
  }
  
  if (mouseClicks == 4) {
    fill(255, 255, 255, 100);
    textSize(30);
    text("rearview mirror amputee", width/3 + 365, height/2 + 150);
    textSize(26);
    text("look back to me before you feel your own pain", width/8*2.3, height/9+60);
    z = 30;
  }
  
  if (mouseClicks == 5) {
    fill(255, 255, 255, 100);
    textSize(39);
    text("whose fault is this", width/9+50, height/2 + 110);
    textSize(46);
    text("rubber burns of flesh and plastic", width/8*5.1, height/9+100);
    z = 35;
  }
  
  if (mouseClicks == 6) {
    fill(255, 255, 255, 100);
    textSize(60);
    text("skin safe", width/9+250, height/2 + 160);
    textSize(72);
    text("eyes burning", width/8*3.1, height/9-10);
    z = 40;
  }
  
  if (mouseClicks == 7) {
    fill(255, 255, 255, 100);
    textSize(50);
    text("wet black invading every sense", width/4+250, height/2 + 60);
    textSize(62);
    text("how distant is that trust", width/3*1.1, height/3-10);
    z = 45;
  }
  
  if (mouseClicks == 8) {
    fill(255, 255, 255, 100);
    textSize(50);
    text("and yet", width/4-100, height/2 + 155);
    textSize(67);
    text("totaled and spinning to a halt", width-100, height/3+10);
    z = 50;
  }
  
  if (mouseClicks == 9) {
    fill(255, 255, 255, 100);
    textSize(70);
    text("dialing blindly for help", width/2+100, height/2 + 125);
    textSize(77);
    text("taking control", width/2+300, height/3-30);
    z = 55;
  }
  
  if (mouseClicks == 10) {
    fill(255, 255, 255, 100);
    textSize(70);
    text("dialing blindly for help", width/2+100, height/2 + 125);
    textSize(77);
    text("taking control", width/2+300, height/3-30);
    z = 60;
  }
  
  if (mouseClicks == 11) {
    fill(255, 255, 255, 100);
    textSize(80);
    text("protective pride", width/2, height/2);
    textSize(97);
    text("blue and red lights fill the void", width/2+200, height/2+60);
    z = 65;
  }
  
  if (mouseClicks == 12) {
    fill(255, 255, 255, 100);
    textSize(100);
    text("these must be growing pains", width/2-300, height/2-80);
    textSize(115);
    text("and I know you remember", width/2-100, height/2+150);
    z = 70;
  }
  
  if (mouseClicks == 13) {
    fill(255, 255, 255, 100);
    textSize(120);
    text("because I'll never forget", width/2-400, height/2-30);
    textSize(145);
    text("so why does it bother me that", width/2+100, height/2+120);
    z = 75;
  }
  
  if (mouseClicks == 14) {
    textAlign(LEFT);
    z = 1;
    background(16);
    fill(255);
    textSize(40);
    text("you ...", width/2-40, height/2); 
  }
  
  if (mouseClicks == 15) {
    z = 1;
    background(16);
    fill(255,30,30);
    textSize(40);
    fill(255);
    text("you ...", width/2-40, height/2); 
    fill(255,30,30);
    text("cared", width/2+40, height/2); 
  }
  
    if (mouseClicks == 16) {
    z = 1;
    background(16);
    fill(255,30,30);
    textSize(40);
    fill(255);
    text("you ...", width/2-40, height/2); 
    fill(255,30,30);
    text("protected", width/2+40, height/2); 
  }
  
  if (mouseClicks == 17) {
    z = 1;
    background(16);
    fill(255,30,30);
    textSize(40);
    fill(255);
    text("you ...", width/2-40, height/2); 
    fill(255,30,30);
    text("loved", width/2+40, height/2); 
  }
  
  if (mouseClicks == 18) {
    z = 1;
    background(16);
  }
}

void mousePressed() {
    mouseClicks ++;
}

