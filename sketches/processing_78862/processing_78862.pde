
PImage kittens;
PImage Kitten;


void setup(){
  size(1280,800);
  smooth();
  kittens = loadImage("kittens.jpg");
  Kitten = loadImage("Kitten.png");
}

void draw(){
  background(kittens);
  for(int i = 0; i < 1280; i+=30){
    for(int j = 0; j < 1280; j+=30){
        rect(i,j,12,12);
      }
     if(mouseX > 0 && mouseX < 135){
       fill(255,0,0);
       //red
     }
     if(mouseX > 135 && mouseX < 270){
       fill(255,153,0);
       //orange
     }
     if(mouseX > 270 && mouseX < 405){
       fill(255,243,0);
       //yellow
     }
     if(mouseX > 405 && mouseX < 540){
       fill(28,255,0);
       //green
     }
     if(mouseX > 540 && mouseX < 675){
       fill(0,255,253);
       //cyan
     }
     if(mouseX > 675 && mouseX < 810){
       fill(0,36,255);
       //blue
     }
     if(mouseX > 810 && mouseX < 945){
       fill(109,0,255);
       //purple
     }
     if(mouseX > 945 && mouseX < 1080){
       fill(242,0,255);
       //pink
     }
       if(mouseY > 0 && mouseY < 100){
       fill(255,0,0);
       //red
     }
     if(mouseY > 100 && mouseY < 200){
       fill(255,153,0);
       //orange
     }
     if(mouseY > 200 && mouseY < 300){
       fill(255,243,0);
       //yellow
     }
     if(mouseY > 300 && mouseY < 400){
       fill(28,255,0);
       //green
     }
     if(mouseX > 400 && mouseX < 500){
       fill(0,255,253);
       //cyan
     }
     if(mouseY > 500 && mouseY < 600){
       fill(0,36,255);
       //blue
     }
     if(mouseY > 600 && mouseY < 700){
       fill(109,0,255);
       //purple
     }
     if(mouseY > 700 && mouseY < 800){
       fill(242,0,255);
       //pink
     }
      image(Kitten,mouseX,mouseY); 
} 
}



