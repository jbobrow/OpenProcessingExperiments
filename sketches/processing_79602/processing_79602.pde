
float x,y;
int a = 360;
int b = 60;
int c = 60;
int d = 10;

void setup(){
  size(700,700);
  background(0,0,0); 
  smooth(); 
  colorMode(HSB,360);
  rectMode(CENTER);
}

void draw()

{if(focused){
    frameRate(d);
    fill(random(360),360,360,40);
    stroke(random(360),360,360,360);
    x = random(150);  
    ellipse(random(width),random(height),x,x);
    y = random(150);
    rect(random(width),random(height),y,y);
    fill(random(360),360,360,90);
    text("RainbowCircle",10,20);
    text("PressKeyboad",608,688);
    
    if(mousePressed){
    d += 10;
    }
  
}else{
    frameRate(1);
    background(0,0,0);
    fill(random(360),360,360,360);
    text("RainbowCircle",10,20);
  
  }
}

void keyPressed(){
  
  d = 10;

  if (key == '1' || key == '1') {
    background(36,b,a);
  }

  if (key == '2' || key == '2') {
    background(72,b,a);
  }

  if (key == '3' || key == '3') {
    background(108,b,a);
  }

  if (key == '4' || key == '4') {
    background(144,b,a);
  }

  if (key == '5' || key == '5') {
    background(180,b,a);
  }

  if (key == '6' || key == '6') {
    background(216,b,a);
  }

  if (key == '7' || key == '7') {
    background(252,b,a);
  }

  if (key == '8' || key == '8') {
    background(288,b,a);
  }

  if (key == '9' || key == '9') {
    background(324,b,a);
  }

  if (key == '0' || key == '0') {
    background(360,b,a);
  }

  if (key == 'q' || key == 'q') {//黒
    background(0,0,0);
  }

  if (key == 'w' || key == 'w') {
    background(15,a,c);
  }

  if (key == 'e' || key == 'e') {
    background(30,a,c);
  }

  if (key == 'r' || key == 'r') {
    background(45,a,c);
  }

  if (key == 't' || key == 't') {
    background(60,a,c);
  }

  if (key == 'y' || key == 'y') {
    background(75,a,c);
  }

  if (key == 'u' || key == 'u') {
    background(90,a,c);
  }

  if (key == 'i' || key == 'i') {
    background(105,a,c);
  }

  if (key == 'o' || key == 'o') {
    background(120,a,c);
  }

  if (key == 'p' || key == 'p') {
    background(135,a,c);
  }

  if (key == 'a' || key == 'a') {
    background(150,a,c);
  }

  if (key == 's' || key == 's') {
    background(165,a,c);
  }

  if (key == 'd' || key == 'd') {
    background(180,a,c);
  }

  if (key == 'f' || key == 'f') {
    background(195,a,c);
  }

  if (key == 'g' || key == 'g') {
    background(210,a,c);
  }

  if (key == 'h' || key == 'h') {
    background(225,a,c);
  }

  if (key == 'j' || key == 'j') {
    background(240,a,c);
  }

  if (key == 'k' || key == 'k') {
    background(255,a,c);
  }

  if (key == 'l' || key == 'l') {
    background(270,a,c);
  }

  if (key == 'z' || key == 'z') {
    background(285,a,c);
  }

  if (key == 'x' || key == 'x') {
    background(300,a,c);
  }

  if (key == 'c' || key == 'c') {
    background(315,a,c);
  }

  if (key == 'v' || key == 'v') {
    background(330,a,c);
  }

  if (key == 'b' || key == 'b') {
    background(345,a,c);
  }

  if (key == 'n' || key == 'n') {
    background(360,a,c);
  }

  if (key == 'm' || key == 'm') {//白
    background(0,0,360);
  }

}
  


