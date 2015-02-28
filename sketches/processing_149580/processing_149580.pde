
int x=300;
int y=130;
int a=50;

void setup() {
 size(480,350); 
}

void draw(){
  background(loadImage("colors.JPG"));
  noStroke();

  if (keyPressed && (key==CODED)){
 if (keyCode==LEFT){
   x--;
 } else if (keyCode==RIGHT){
 x++; 
 }
 
 if (keyCode==UP){
   y--;
 } else if (keyCode==DOWN){
 y++;
 }
 
 if (y>130){a=(385-y);
 } else { 
   a=255;
 }
 }
 if (keyPressed){
   if(key=='0'){
   x=300;
   y=130;
    }
 }

colorMode(HSB, 360, 100,100);
fill(x, 80, (y-30),a);
ellipse(x, y, 150, 150);
}




