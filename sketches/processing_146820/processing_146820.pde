
float tamano;
float colorin;
float colorin2;
float colorin3;

void setup(){
  size(300,200);
  background(0);
  noStroke();
  
  tamano = 0;
  colorin = 0;
  colorin2 = 0;
  colorin3 = 0;
}

void draw(){
  tamano = mouseX / 4;
 // if(mouseY < height / 2){
  //fill(0,30);
 // rect(0,0,width,height);
 // } else { 
 //  fill(255,30);
 // rect(0,0,width,height);
 // }
  if(1 == 1){
    colorin = 255;
    colorin2 = random(255);
    colorin3 = random(255);
  }
 fill(colorin,colorin2,colorin3);
 ellipse(random(300),random(200),tamano,tamano);
 fill(colorin,colorin2,colorin3);
 ellipse(random(300),random(200),tamano,tamano);  
  
};
