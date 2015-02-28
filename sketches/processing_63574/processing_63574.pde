
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);

void keyPressed(){
  sc.playNote(key - 40, 100, 0.5);
  
  ellipseX = random(600);
  ellipseY = random(600);
  
  
}

float ellipseX;
float ellipseY;
int fillColor = 0;


void setup(){
  size(600,600);
  background(0);
  smooth();
  colorMode(HSB, 360, 100 ,100, 100);
} 


void draw() {
  
  if(key == 'a'){
    fill(5,92,35);}  
  if(key == 'b'){
    fill(5,86,46);}
  if(key == 'c'){
    fill(5,88,57);}  
  if(key == 'd'){
    fill(5,85,64);}
  if(key == 'e'){
    fill(5,76,68);}
  if(key == 'f'){
    fill(5,83,79);}
  if(key == 'g'){
    fill(5,76,80);}
  if(key == 'h'){
    fill(5,70,82);}
  if(key == 'i'){
    fill(5,68,88);}
  if(key == 'j'){
    fill(5,61,94);}
  if(key == 'k'){
    fill(5,52,99);}
  if(key == 'l'){
    fill(5,39,98);}
  if(key == 'm'){
    fill(34,99,72);}
  if(key == 'n'){
    fill(34,93,80);} 
  if(key == 'o'){
    fill(34,86,85);}  
  if(key == 'p'){
    fill(34,79,91);}
  if(key == 'q'){
    fill(34,67,97);} 
  if(key == 'r'){
    fill(34,51,99);}
  if(key == 's'){
    fill(43,84,97);} 
  if(key == 't'){
    fill(43,76,99);} 
  if(key == 'u'){
    fill(43,54,98);}
  if(key == 'v'){
    fill(54,90,98);}
  if(key == 'w'){
    fill(54,62,99);}
  if(key == 'x'){
    fill(54,40,99);}
  if(key == 'y'){
    fill(58,26,95);}  
  if(key == 'z'){
    fill(74,25,99);}  
  if(key == '1'){
    fill(338,89,53);}  
  if(key == '2'){
    fill(338,81,60);}  
  if(key == '3'){
    fill(338,87,66);}  
  if(key == '4'){
    fill(338,75,75);}  
  if(key == '5'){
    fill(338,67,77);}  
  if(key == '6'){
    fill(338,58,82);}  
  if(key == '7'){
    fill(338,54,85);}  
  if(key == '8'){
    fill(338,47,92);}  
  if(key == '9'){
    fill(338,43,96);}  
  if(key == '0'){
    fill(348,17,99);}  
  if(key == '-'){
    fill(95,64,99);}  
  if(key == ','){
    fill(95,45,99);}  
  if(key == '.'){
    fill(95,22,95);}
 
 
ellipse(ellipseX, ellipseY, 70,70);

}

