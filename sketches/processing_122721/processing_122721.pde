
int x, y;   
int r, g, b;
  
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);
 
r=0;
g=0;
b=0;
 
}
  
void draw() {
  //ellipse(mouseX, mouseY, 10, 10);
}
 
void mouseDragged(){
  fill(r, g, b);
  ellipse(mouseX, mouseY, 20, 20);   
}
 
void keyPressed(){
 switch(key){
   case 'd':  //d=Delite
  background(255);

      break;
  case '1':  //1=red1
   r=195;
   g=17;
   b=17;
      break;
  case '2':  //2=red2
   r=88;
   g=0;
   b=0;
      break;
  case '3':  //3=red3
   r=52;
   g=0;
   b=0;
      break;
  case '4':  //4=black
   r=0;
   g=0;
   b=0;

      break;
  case '0':  //0=kesigomu
   r=255;
   g=255;
   b=255;
}
}


