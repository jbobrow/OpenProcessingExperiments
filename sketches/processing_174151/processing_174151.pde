
int i=#FAE600;
int I=#C1B200;
import ddf.minim.*;
Minim minim;
AudioPlayer audio1;
AudioPlayer audio2;
AudioPlayer audio3;
AudioPlayer audio4;
AudioPlayer audio5;
AudioPlayer audio6;
AudioPlayer audio7;

void setup () {
  size (600, 600);
  minim = new Minim (this);
  audio1 = minim.loadFile ("audio1.mp3");
  audio2 = minim.loadFile ("audio2.wav");
  audio3 = minim.loadFile ("audio3.wav");
  audio4 = minim.loadFile ("audio4.wav");
  audio5 = minim.loadFile ("audio5.wav");
  audio6 = minim.loadFile ("audio6.wav");
  audio7 = minim.loadFile ("audio7.wav");
  cursor(HAND);  
  background(0);
  //Cuadrado amarillo "I"
fill(i);
rect(150, 90, 95, 95, 20);
fill(0);
textSize(50);
text("I", 190, 155);
//cuadrado azul "P"
fill(#002BFA);
rect(30, 200, 95, 95, 20);
fill(0);
textSize(50);
text("P", 60, 265);
//cuadrado rosa "o"
fill(#FA00D9);
rect(150, 200, 95, 95, 20);
fill(0);
textSize(50);
text("O", 180, 265);
//cuadrado azulito "R"
fill(#00FAE7);
rect(270, 200, 95, 95, 20);
fill(0);
textSize(50);
text("R", 300, 265);
//cuadrado verde "N"
fill(#35FA00);
rect(390, 200, 95, 95, 20);
fill(0);
textSize(50);
text("N", 417, 265);
//cuadrado morado "Y"
fill(#A100E8);
rect(150, 310, 95, 95, 20);
fill(0);
textSize(50);
text("Y", 180, 375);
//cuadrado rosa "O"
fill(#FA00D9);
rect(270, 310, 95, 95, 20);
fill(0);
textSize(50);
text("O",300, 375);
//cuadrado rojo "U"
fill(#FF1F23);
rect(390, 310, 95, 95, 20);
fill(0);
textSize(50);
text("U", 417, 375);
}

void draw (){
}

void keyPressed (){
switch (key) {
  case 'i':
  case 'I':
       fill(I);
       rect(150, 90, 95, 95, 20);
       fill(0);
       textSize(50);
       text("I", 190, 155); 
       audio1.play();  
       break;
  case 'p':
  case 'P':
       fill(#100F5D);
       rect(30, 200, 95, 95, 20);
       fill(0);
       textSize(50);
       text("P", 60, 265);
       audio2.play();
       break;
  case 'o':
  case 'O':
       fill(#5D0F55);
       rect(150, 200, 95, 95, 20);
       fill(0);
       textSize(50);
       text("O", 180, 265);
       fill(#5D0F55);
       rect(270, 310, 95, 95, 20);
       fill(0);
       textSize(50);
       text("O",300, 375);
       audio3.play();
       break;
  case 'r':
  case 'R':
       fill(#16817B);
       rect(270, 200, 95, 95, 20);
       fill(0);
       textSize(50);
       text("R", 300, 265);  
       audio4.play();
       break;
  case 'n':
  case 'N':
       fill(#388928);
       rect(390, 200, 95, 95, 20);
       fill(0);
       textSize(50);
       text("N", 417, 265);
       audio5.play();
       break;
  case 'y':
  case 'Y':
       fill(#57206F);
       rect(150, 310, 95, 95, 20);
       fill(0);
       textSize(50);
       text("Y", 180, 375); 
       audio6.play();
       break;
  case 'u':
  case 'U':
       fill(#6F2020);
       rect(390, 310, 95, 95, 20);
       fill(0);
       textSize(50);
       text("U", 417, 375);  
       audio7.play();
       break;
  default:
       fill(255);
       textSize(20);
       text("Press any other key on your keyboard!", 70, 500);   
}


}
  
         




