
PImage yummy_image; // this is the variable for the cake image
float counting=1;

void setup(){
  size(700,700);
  yummy_image=loadImage("download.jpg");
}

void draw(){
  counting++;
  image(yummy_image,100,100);
  if(counting==100){
    text("GERBILS!",100,100);
  } else {
    text("NO GERBILS!",100,200);
  }
  
  for(int i=0;i<=200;i+=10){
    rect(i,i,100,100);
  }
  
}


