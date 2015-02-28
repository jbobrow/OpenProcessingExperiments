
float banana = 0;
int hue4 = 23;
int hue3 = 29;
int hue2 = 44;
int hue1 = 62;

void setup(){
  colorMode(HSB, 360, 100, 100);
  size(600,600);
  background(0);
}

void draw(){
  banana += 1;
  rotate(banana);
   if (hue1 == 360){
     hue1 = 0;}
     if (hue2 == 360){
     hue2 = 0;}
     if (hue3 == 360){
     hue3 = 0;}
     if (hue4 == 360){
     hue4 = 0;}
  fill(hue1,51,99);
  rect(30,20,55,55);
  fill(hue2,96,99);
  rect(150,150,80,80);
  fill(hue3,96,99);
  rect(300,300,100,100);
  fill(hue4,96,99);
  rect(450,450,130,130);
  hue1 +=1;
  hue2 +=1;
  hue3 +=1;
  hue4 +=1;
}


