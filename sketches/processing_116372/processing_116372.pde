
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample click;


int[] x={0,50,140,210,280,350,420};
int[] y={0,50,140,210,280,350,420};
int []position = new int [100];
int currentkey;
int lastkey;
PFont font;

void setup(){
  smooth();
  size(500,650);
  minim = new Minim(this);
  click = minim.loadSample("click.wav");
  print(1);
  font = loadFont("FootlightMTLight-48.vlw");
}

void keyPressed(){
  click.trigger();
}
  
void keyReleased() {
lastkey = currentkey;
currentkey = key-48;
}


void draw() {
background(0);
  
position[11] = #000000;
position[12] = #FC052A;
position[13] = #D94234;
position[14] = #E0E344;
position[15] = #FF5E24;
position[16] = #95D624;
position[21] = #039677;
position[22] = #804E51;
position[23] = #696C56;
position[24] = #817A4E;
position[25] = #72BD5E;
position[26] = #4CB64E;
position[31] = #4B55AB;
position[32] = #A42D6B;
position[33] = #924C70;
position[34] = #A55A68;
position[35] = #969C78;
position[36] = #709668;
position[41] = #A3156F;
position[42] = #D00D4D;
position[43] = #BE2C52;
position[44] = #D13A4A;
position[45] = #C27C5A;
position[46] = #925A46;
position[51] = #73286D;
position[52] = #B8174C;
position[53] = #A63551;
position[54] = #B94349;
position[55] = #AA8659;
position[56] = #847F49;
position[61] = #008D48;
position[62] = #864F3F;
position[63] = #746E44;
position[64] = #877C3C;
position[65] = #78BE4C;
position[66] = #52B83C;


for(int i=1;i<7;i++){
  for(int j=1;j<7;j++){
    int colour = getColorIndex(i,j);
    fill(color(colour));
    //fill(255);
    noStroke();
    if (i == 1 && lastkey == j-1) {
    strokeWeight(4);
    stroke(255);
    }
    else if (j == 1 && currentkey == i-1) {
    strokeWeight(4);
    stroke(255);
    }
   if (i-1 == currentkey && j-1 == lastkey) {
    strokeWeight(4);
    stroke(255);
    textFont(font, 32);
    text("#"+hex(colour,6),300,600);
    }
    ellipse(x[i],y[j],60,60);
    if(i==1||j==1){
      if(i==1){
    stringInside(""+(j-1),i,j,60);
    }
    else{
      stringInside(""+(i-1),i,j,60);
    }
    }
  }
}
}



//custom function with return-value
int getColorIndex(int i, int j){
  String c = ""+i;
  String d = ""+j;
  String cd = c+d;
  int p = int(cd);
  int colour = position[p];
  return colour;
}

//void custom funtion
void stringInside (String s,int i,int j,int r){

  float tw = textWidth(s);
  textSize(25);
  if (i==1&&j==1){
  fill(0);
  }else{
  fill(255);
  }
  text(s,x[i]-tw/2,y[j]+7);
}


