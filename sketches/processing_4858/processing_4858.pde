
PImage perros;
PImage perro_frames[];
PImage forloop;
PFont myfont;
int frame = 0;
int dir = 2;
int px,py;
int x,y;
boolean stopped = false;
int step = -1;
Rectangle r = new Rectangle(0,0,0,0); 
float bscale = 0;
float bsteps = 0;
int lx = 3;
int ly = 80;
String mytext = "";
int i = 0;

void setup(){
  size(260,170);
  myfont = loadFont("monospaced-12.vlw");
  textFont(myfont);
  perros = loadImage("dogs2.png");
  perro_frames = new PImage[12];
  forloop = loadImage("loop2.png");
  int dw = 24;
  int dh = 32;
  for(int i=0; i < perro_frames.length; i++){
    perro_frames[i] = createImage(dw, dh, ARGB);
    int sx = (i%3)*dw;
    int sy = int((i/3))*dh;
    perro_frames[i].copy(perros, sx, sy, dw, dh, 0, 0, dw, dh);
  }
}

void draw(){
  background(255);
  subrayar();
  image(forloop,lx,ly);
  bone();
  animaperrito();
  fill(255);
  stroke(0);
  if((step>1)&&(step<9)){
    hueso(30,20,40,20);
    fill(0,0,128);
    textFont(myfont,12);

    text("i = "+i,30,25);
  }

}

void subrayar(){
  if(!stopped){
    switch(step){
    case 1:
      r = new Rectangle(lx + 30,ly-2,72,20); 
      break;
    case 2:
      r = new Rectangle(lx + 105,ly-2,48,20); 
      break;
    case 3:
      r = new Rectangle(0,0,0,0); 
      break;
    case 4:
      r = new Rectangle(lx + 13,ly + 32,84,20); 
      break;
    case 5:
      r = new Rectangle(0,0,0,0); 
      break;
    case 6:
      r = new Rectangle(lx+154,ly-2,70,20); 
      break;
    case 7:
      r = new Rectangle(0,0,0,0); 
      break;
    case 9:
      r = new Rectangle(0,0,0,0); 
      break;
    }
  }
  rectMode(CORNER);
  fill(221,221,187);
  noStroke();
  rect(r.x,r.y,r.width,r.height); 
}

void bone(){
  if(step%2 == ((step>1)?0:1)){
    bsteps = 0.01;
  }
  else{
    bscale = 0;
    bsteps = 0;
  }

  bscale += bsteps;
  if(bscale > 1) bscale = 1;

  if (bscale > 0){
  int w = int(40*bscale);
  int h = int(20*bscale);
  int bx = x + 10;
  int by = y - int(50*bscale) + 10;
  fill(247,242,227);
  stroke(0);
  ellipse(bx,by+(h),h*.5,h*.5);
  ellipse(bx,by+(h*1.8),h*.3,h*.3);
  hueso(bx,by,w,h);
  fill(0,128,0);
  textFont(myfont,12*bscale);
  textAlign(CENTER);
  text(mytext,bx,by+4);
  }
}

void hueso(int bx,int by,int w, int h){
  rectMode(CENTER);
  rect(bx,by,w,h);
  ellipse(bx-(w*0.5),by-(h*.3),(w*0.5),h);
  ellipse(bx-(w*0.5),by+(h*.3),(w*0.5),h);
  ellipse(bx+(w*0.5),by-(h*.3),(w*0.5),h);
  ellipse(bx+(w*0.5),by+(h*.3),(w*0.5),h);
  noStroke();
  rect(bx,by+1,w*1.2,h-2); 
}

void mousePressed(){
  if ((x == px) && (y == py)){
    bscale = 0;
    step++; 
  }
  if (step == 10){
    step = 0;
    x = 0; 
    y = 0;
    i = 0;
  }
  if (step > 7){
    step = 2;
  }
  if(mytext == "false")
    step = 9;
  println(step);
  switch(step) {
  case 0:
    mytext = "";
    px = lx + 23; 
    py = ly - 20;
    break;   
  case 1:
    mytext = "i = "+i;
    px = lx + 87; 
    py = ly - 20;
    break;
  case 2:
    if (i < 3)
      mytext = "true";
    else
      mytext = "false";
    px = lx + 137; 
    py = ly - 20;
    break;
  case 3:
    mytext = "";
    px = lx + 7; 
    py = ly + 15;
    break;
  case 4:
    mytext = ""+i;
    px = lx + 81; 
    py = ly + 15;
    break;
  case 5:
    mytext = "";
    px = lx + 150; 
    py = ly - 22;
    break;
  case 6:
    mytext = "i="+i+"+1";
    px = lx + 212; 
    py = ly - 22;
    break;
  case 7:
    i++;
    mytext = "";
    px = lx + 94; 
    py = ly - 20;
    break;
  case 9:
    mytext = "";
    px = lx + 5;
    py = ly + 63;
    //i = 0;
  }
}

void animaperrito(){
  if(y < py){
    dir = 2;
    y++;
  }
  else if(y > py){
    dir = 0;
    y--; 
  }

  if(x < px){
    x++;
    dir = 1;
  }
  else if(x > px){
    x--;
    dir = 3;
  }

  if((x == px) && (y == py)){
    stopped = true;
  }
  else
    stopped = false;

  int dogframe;
  if(!stopped){
    frame = (frame+1)%3;
    dogframe = frame+dir*3;
  }
  else{
    dogframe = 7;
  } 
  image(perro_frames[dogframe],x,y);
}

for(int i =0; i < 3; i = i + 1){

  println(i);

}



