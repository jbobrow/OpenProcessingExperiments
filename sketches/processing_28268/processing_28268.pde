
void setup (){
  size (500,500);
  background (255);
  smooth();
  
}


void draw(){


 float f_eins = 12;
float f_zwei = 12;
int margin = 0;

noStroke();

for (int i = margin; i < height; i += f_zwei){
  if(f_eins > -50){
    for(int j = margin; j < width; j+= f_zwei){
      fill(255-f_eins*30,200);
      rect(j, i, f_eins-1, sin(f_eins)*8);
    }
    f_eins = f_eins - 0.21;
    
  }

}

}
void mousePressed() {
  float f_eins = 12;
float f_zwei = 12;
int margin = 0;
//size(200,200);
noStroke();
randomSeed(0);
  
  if (mouseButton == LEFT) {

for (int i = margin; i < height; i += f_zwei){
  if(f_eins > -50){
    for(int j = margin; j < width+20; j+= f_zwei){
      fill(255-mouseX,0-mouseY,100);
      rect(j, i, sin(f_eins)*20,sin(mouseX)*5);
    }
    f_eins = f_eins - 0.21;

}
}   
}
}




