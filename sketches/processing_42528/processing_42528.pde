
PImage acqua;
PImage fuoco;
PImage terra;
PImage aria;

float ac = 100;
float f = 100;
float t = 100;
float ar = 100;

void setup(){
  size(400, 400);
  
  acqua = loadImage("acqua.jpeg");
  fuoco = loadImage("fuoco.jpeg");
  terra = loadImage("terra.jpeg");
  aria = loadImage("aria.jpeg");
}

void draw(){
  
  if(mouseX <= 200 && mouseY <= 200){
    ac = ac + 1;
  }else{
    ac = 100;
  }
  if(mouseX > 200 && mouseY <= 200){
    f = f +1;
  }else{
    f = 100;
  }
   if(mouseX <= 200 && mouseY > 200){
    t = t + 1;
  }else{
    t = 100;
  }
   if(mouseX > 200 && mouseY > 200){
     ar = ar + 1;
  }else{
    ar = 100;
  }
  
  tint(ac);
  image (acqua, 0, 0);
  tint(f);
  image (fuoco, 200, 0);
  tint(t);
  image (terra, 0, 200);
  tint(ar);
  image (aria, 200, 200);
  
}


