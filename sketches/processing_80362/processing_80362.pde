

int maxSlices = 256; 
Slice[] slice = new Slice[maxSlices];
int n = 16;
float step = 2;
PImage img;      

int leftmargin = 10;
int rightmargin = 20;
String buff = "";
boolean didntTypeYet = true;
float c = 0;
PFont font;

float rPos;
int yx = 19;


void setup() {
  smooth();  
  noTint();
  img = loadImage("choppingstrawberries.jpg"); 
  size(img.width + 1*img.width/2, img.height); 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
  println(width);
  println(height);
}


void draw() {
  fill(0);
  rect(0,0,width,height);

  for (int i = 0; i < n; i++) {
    slice[i].update();
    slice[i].checkMove();
    slice[i].paint();
  }
  
  
  
}

void mousePressed() {
  //save("pic.jpg");
  
  n = int(n*step);
  if(n > maxSlices | n < 4){
    step = 1/step;
    n = int(n*step*step);
  } 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
  
}

void keyPressed(){
  float a1 = random(255);
  float a2 = random(255);
  float a3 = random(255);
  
  if((millis() % 500) < 250){  // Only fill cursor half the time
    noFill();
  }
  else {
    fill(a1,a2,a3);
    stroke(0);
  }

  // Store the cursor rectangle's position
  noStroke();
  noFill();
  rPos = textWidth(buff) + leftmargin;
  rect(rPos, yx, 10, 21);

  // Some instructions at first
  if(didntTypeYet) {
    fill(0);
    //text("Use the keyboard.", 22, 40);
  }


  pushMatrix();
  translate(mouseX,mouseY);
  char k;
  for(int i = 0;i < buff.length(); i++) {
    k = buff.charAt(i);
    translate(-textWidth(k),0);
    scale(1.05);
    text(k,0,0);
  }
  popMatrix();

  
    if(key == BACKSPACE){
      noTint();
  }else{
  tint(a1,a2,a3,random(150,200));
    }
   img = loadImage("cezanne processing copy.jpg"); 
  size(img.width + 2*img.width/3, img.height); 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
  println(width);
  println(height);
  

  k = (char)key;
  switch(k){
  case 8:
    if(buff.length()>0){
      buff = buff.substring(1);
    }
    break;
  case 13:  // Avoid special keys
  case 10:
  case 65535:
  case 127:
  case 27:
    break;
  default:
    if(textWidth(buff+k)+leftmargin < 300){
      didntTypeYet = false;
      buff=k+buff;
    }
    break;
  }

  
}


