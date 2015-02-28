
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

PFont font;
String input="";
int Textfarbe=0;

void setup() {
  background(255);
  size(600,400);
  textAlign(CENTER,CENTER);
  font=createFont("Helvetica",60);
  //font=loadFont("Impact-48.vlw"); geht nur wenn man vorher tools--> create font macht
  textFont(font);
}

void draw() {
  fill(255,5);
  rect(0,0,600,400);
  fill(Textfarbe);
  textSize(mouseX+4);
  text(input,width/2,mouseY);
}

void mousePressed() {
  Textfarbe=int(random(250));
}

void keyPressed() {
  /*if(key==BACKSPACE){
      input=input.substring(0,input.length()-1);
    } meine Variante*/
  if (key==BACKSPACE){
    int lastletter= input.length()-1;
    input=input.substring(0,lastletter);
  }
  else if(key != CODED){
    input+=key;
    if(input.length()>=10) {
      input="";
    }
  }
}


