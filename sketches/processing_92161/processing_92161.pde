
PImage bg;

int a; 
//color b,c;
//boolean useFirst = true;

void setup() 

{

  size(600,600);

  frameRate(45);

  bg = loadImage("galaxy.jpg");
  background(bg);
  //resetColors();
}

//void resetColors(){
  //b= color(20,255,255);
  //c= color(random(220,250), random(20,50), random (220,250));
//}
  
  
void draw (){
   image(bg,0,0);
   tint (0,0);

  line (0,600,mouseX,mouseY);
  line (600,0, mouseX, mouseY);
  line (0,0, mouseX,mouseY);
  line (600,600, mouseX,mouseY);
  line (0,300, mouseX,mouseY);
  line (300,0, mouseX,mouseY);
  line (600,300, mouseX,mouseY);
  line (300,600, mouseX,mouseY);
}
void keyPressed() {
 if (key == 'z' || key == 'Z') {
   noLoop();  
 }
 if(key=='a'||key=='A'){
      stroke (255,228,194,60);
  }
 if(key=='s'||key=='S'){
      stroke (165,189,209,60);
  }
  if(key=='d'||key=='D'){
      stroke (126,139,183,60);
  }
  if(key=='f'||key=='F'){
      stroke (191,236,241,60);
  }
  if(key=='g'||key=='G'){
      stroke (117,138,121,60);
  }
  if(key=='h'||key=='H'){
      stroke (129,130,125,60);
  }
  if(key=='j'||key=='J'){
      stroke (62,82,93,60);
  }
  if(key=='k'||key=='K'){
      stroke (197,173,199,60);
  }
  if(key=='l'||key=='L'){
      stroke (81,150,181,60);
  }
  if(key=='x'||key=='X'){
      stroke (0,0,0,60);
  }
 
  if(key=='c'||key=='C'){
      stroke (255,255,255,60);
  }
 
}

void keyReleased() {
  if (key == 'z' || key == 'Z') {
loop();  
  }
}


void mouseClicked() {
  //fill(0);
  bg = loadImage("galaxy.jpg");
  background(bg); 
}




