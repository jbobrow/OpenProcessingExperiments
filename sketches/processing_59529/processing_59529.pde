
PFont numb;
PImage bimg;
PImage anim;
float x;
float y;
float r;
int a;
int b;
int c;


void setup(){
  size(1085,700);
  smooth();
  frameRate(3);
  numb = loadFont("Serif-24.vlw");
  textFont(numb);
  anim = loadImage("beer-0000.png");
  image (anim,500,0);
  fill(255);
  rect(0,0,500,700);
  fill(0);
  textSize(50);
  text("C'MON!",150,290);
  text("HAVE A BEER!",70,390);  
}

void draw(){
  noStroke();
  fill(0);
  rect(1000,0,85,700);
  beerbutton(1010,15); //Beers 1 to 5 on the
  beerbutton(1010,115); //right hand side of
  beerbutton(1010,215); //the screen
  beerbutton(1010,315);
  beerbutton(1010,415);
  refillbutton();
  fill(255); //Number Labels for the beers
  textSize(36);
  text("1",1028,65);
  text("2",1028,165); 
  text("3",1028,265);
  text("4",1028,365);
  text("5",1028,465);
    //INTERACTIVE
    if((mouseX>1010)&&(mouseX<1060)&&(mouseY>15)&&(mouseY<85)){
      back1(); //Beer 1
      anim();
      blur1();
  }
    if((mouseX>1010)&&(mouseX<1060)&&(mouseY>115)&&(mouseY<185)){
      back2(); //Beer 2
      anim();
      blur2();
      blur2();
  }
    if((mouseX>1010)&&(mouseX<1060)&&(mouseY>215)&&(mouseY<285)){
      back3(); //Beer 3
      anim();
      blur3();
      blur3();
      blur3();
  }
    if((mouseX>1010)&&(mouseX<1060)&&(mouseY>315)&&(mouseY<385)){
      back4(); //Beer 4
      anim();
      blur4();
      blur4();
      blur4();
      blur4();
  }
    if((mouseX>1010)&&(mouseX<1060)&&(mouseY>415)&&(mouseY<485)){
      back5(); //Beer 5
      anim();
      blur5();
      blur5();
      blur5();
      blur5();
      blur5();
  }
    if((mouseX>1010)&&(mouseX<1075)&&(mouseY>500)&&(mouseY<685)){
      anim(); //Refill
  }
  fill(0);
  rect(0,0,1000,15); //Border
  rect(0,0,15,700);
  rect(0,685,1000,15);
}

void beerbutton(int x, int y){
  pushMatrix();
  translate(x,y);    //local variables so that i could 
  fill(153,204,204); //position the beers where i wanted
  rect(0,0,50,70);   //in void draw
  rect(50,15,15,8);
  rect(50,50,15,8);
  rect(57,23,8,27);
  fill(204,102,0);
  rect(3,0,44,65);
  fill(255);
  rect(3,0,44,10);
  popMatrix();
}

void refillbutton(){
  fill(255,0,0);
  rect(1010,500,65,185);
  fill(255);
  textSize(30);
  text("R",1034,530);
  text("E",1034,557);
  text("F",1034,585);
  text("I",1036,615);
  text("L",1034,645);
  text("L",1034,675);
}

//SERIES OF BACK IMAGES THAT STAY STATIONARY DURING THE SIMULATION

void back1(){ 
  tint(255,255);
  fill(255);
  rect(0,0,500,700);
  bimg = loadImage("girl1.png");
  image(bimg,0,0);
}

void back2(){
  tint(255,255);
  fill(255);
  rect(0,0,500,700);
  bimg = loadImage("girl2.png");
  image(bimg,0,0);
}

void back3(){
  tint(255,255);
  fill(255);
  rect(0,0,500,700);
  bimg = loadImage("girl3.png");
  image(bimg,0,0);
}

void back4(){
  tint(255,255);
  fill(255);
  rect(0,0,500,700);
  bimg = loadImage("girl4.png");
  image(bimg,0,0);
}

void back5(){
  tint(255,255);
  fill(255);
  rect(0,0,500,700);
  bimg = loadImage("girl5.png");
  image(bimg,0,0);
}

//1ST PERSON BEER DRINKING ANIMATION

void anim(){
  anim = loadImage("beer-00"+a+b+".png");
  image (anim,500,0);
  a++;
  b++;
  if((mouseX>1010)&&(mouseX<1075)&&(mouseY>500)&&(mouseY<685)){
    a = 0; //Refills the beer, brings back to the first frame
    b = 0;
  }
  if(b<9){
    a = 0;
  }
  if(b>8){
    b = 9;
  }
  if(a>7){ //Makes animation stay on the last frame with
    a = 7; //with empty glass, to eliminate the
  }        //"NullPointer Exception" error 
}

//SERIES OF IMAGES THAT CREATE THE DRUNK SIMULATION EFFECT RELATIVE
//TO THE BACK IMAGE, eg. blur1() goes with back1()

void blur1(){
  pushMatrix(); //push and pop put in to make sure the rotating and
  tint(255,128);//shuffling effect is isolated and does not effect
  bimg = loadImage("girl1.png");//the beer buttons which would 
  translate(115,115);//otherwise also rotate
  image(bimg,x,y);
  x = random (-120,-110);
  y = random (-120,-110); 
  popMatrix();
}

void blur2(){
  tint(255,128);
  bimg = loadImage("girl2.png");
  pushMatrix();
  translate(115,115);
  image(bimg,x,y);
  x = random (-120, -110);
  y = random (-120, -110);
  popMatrix();
}

void blur3(){
  tint(255,128);
  bimg = loadImage("girl3.png");
  pushMatrix();
  translate(115,115);
  rotate(radians(r));
  image(bimg,x,y);
  x = random (-122, -108);
  y = random (-122, -108);
  r = random(-1,1); 
  popMatrix();
}

void blur4(){
  tint(255,128);
  bimg = loadImage("girl4.png");
  pushMatrix();
  translate(115,115);
  rotate(radians(r));
  image(bimg,x,y);
  x = random (-122, -108);
  y = random (-122, -108);
  r = random(-3,3); 
  popMatrix();
}

void blur5(){
  tint(255,128);
  bimg = loadImage("girl5.png");
  pushMatrix();
  translate(115,115);
  rotate(radians(r));
  image(bimg,x,y);
  x = random (-124, -106);
  y = random (-124, -106);
  r = random(-4,4); 
  popMatrix();
}


