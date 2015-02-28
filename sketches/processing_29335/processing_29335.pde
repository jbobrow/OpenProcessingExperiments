
PFont font;
float T = 10;
String myKey="";

float n = 0;

void setup() {
  size(500, 500, P3D);
  font = loadFont("ArialMT-48.vlw");
  background(0);
}

void draw() { 
  background(0,10);  
  translate(height/2, width/2 );
  n++;

 
  drawLetters(256,PI/8,n);
  drawLetters(128,PI/8,n/1.5);
  drawLetters(64,PI/8,n/3);
  drawLetters(32,PI/8,n/4.5);
}

void keyPressed()
{

  print(key);
  
  if (key == BACKSPACE)
   { 
     myKey ="";
     n=0;
   }

  
  myKey += Character.toString(key);
}

void drawLetters(int count,float rotation, float y){

  for(int i = 0 ; i < count ; i++) {

    fill(255-y, mouseY/2, mouseX/2, 50);
    rotate(rotation);
    pushMatrix();
    text(myKey, 0, y);
    scale(-1,1);
    text(myKey, 0, y);
    popMatrix();
    textFont(font, (y-255)/5);

     }
}
void mouseClicked(){
  myKey="";
  n = 0;


}

