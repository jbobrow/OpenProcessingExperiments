

int depth =4;
int leftmargin = 20;
int rightmargin = 40;
String buff = "";
boolean didntTypeYet = true;
int transparancy =176;

void setup()
{
  size(640, 360, P3D);
  textFont(loadFont("Univers45.vlw"), 25);
}

void draw()
{
  background(255);

  if((millis() % 500) < 250){  
    noFill();
  }
  else {
    fill(3,0,0);
    stroke(0);
  }
  float rPos;
 
  rPos = textWidth(buff) + leftmargin;
  rect(rPos+1, 19, 10, 21);


  if(didntTypeYet) {
    fill(0);
   
  }

  fill(0);
  pushMatrix();
  translate(rPos,10+25);
  char k;
  for(int i = 0;i < buff.length(); i++) {
    k = buff.charAt(i);
    translate(-textWidth(k),0);
  rotateY(-((mouseX-(width/2))*radians(90))/(width/2));
  rotateX(((mouseY-(height/2))*radians(90))/(width/2));
    scale(1.1);
    text(k,0,0);
  }
  popMatrix();
}

void keyPressed()
{
  char k;
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
    if(textWidth(buff+k)+leftmargin < width-rightmargin){
      didntTypeYet = false;
      buff=k+buff;
    }
    break;
  }
}


