
void setup (){
  size (600,600);
  smooth();
  background(0);
}

void draw(){
   background(0);
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
   if((x % 20) == 0){
     line(x,y,x+6,y-6);
   } else {
     line(x,y,x+6,y+6);
     
   stroke(random(255), random(255), random(255));
   strokeWeight(5);
   if (mouseX > 300){
     stroke (random(255), random (0,100), random(255));
     if (mouseY < 300){
   stroke (random(0,100), random(255), random(255));     
   if (mouseX > mouseY){
     stroke (random(255), random (255), random(0,100));
   if(mouseX < 100){
stroke(random(255), random(0,150), random(150,255));

   }
 }
   }
 }
   }
    }
  }
}


