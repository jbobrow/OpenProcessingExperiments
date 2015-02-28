
PFont f;
float textH=600;
float textW=5;

void setup() {
size(200,600);
background(255,20,147);
smooth();
f= loadFont("keyfont1.vlw");
textFont(f,30);
text("press return",10,20);
}

void keyPressed() {
  textFont(f,30);
  textH -= 20;
  text("again"
  
  ,textW,textH);
 if (textH<=0){
  textH=600; 
  textW=textW+20;
 }
}
//}

void draw(){
//background(255,20,147);
  
}

