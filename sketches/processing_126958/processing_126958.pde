
int y = 150;
int a;
int eSize = 5;
PImage img;
PImage foke;
PImage apple;
PImage supun;
PImage huta;
PImage kaziru;


void setup(){
size(450,450);
background(255);
supun = loadImage("supu-n.png");
foke = loadImage("fo-ke.png");
apple = loadImage("apple.png");
huta = loadImage("huta.png");
kaziru = loadImage("kaziru.png");
a = 160;
}


void draw(){
background(255);
for(int c = 0; c <= height; c +=10){
  for(int x = 0; x <= width; x += 10){
    ellipse(x, c, eSize, eSize);
  }
}


fill(0);
ellipse(225,320,220,110);
fill(255);
ellipse(225,315,200,90);
//image(kaziru,178,160,110,188);

image(supun,35,220,180,190);
image(foke,300,220,180,190);
if(a == 160) {
//  image(apple,150,160,150,190);
  image(apple,150,a,150,190);
} else if(a == 1000){
  image(kaziru,178,160,110,188);
} else if (y >= 130) {
  image(apple,150,a,150,190);
}
image(huta,100,y,260,230);
}



//huta-agaru
void mouseMoved(){
 if(mouseX >= 100 && mouseX <=360 && mouseY >= y && mouseY <= y+230){
  y -= 3;
  if(y < -100){
    y = -100;
  }
 }
}


//huta-sagaru
void mousePressed(){
  if(mouseX >= 100 && mouseX <=360 && mouseY >= y && mouseY <= y+230){
  y += 15;
  if(y > 150){
    y = 150;
    a = 160;
  }
 }
}


//apple-taberu
void mouseClicked(){
  if(mouseX >= 148 && mouseX <= 300 && mouseY >= 200 && mouseY <= 340){
//    tint(255,0);
a = 1000;
  }
}






