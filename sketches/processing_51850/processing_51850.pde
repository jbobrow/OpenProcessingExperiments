
void setup(){
     background(0);
size(600,600);
smooth();
}


void draw(){
   
  for(int x = 0;x < width; x+=10){
   for(int y = 0; y < height; y+=10){
   if(mouseX > x && mouseX < x +65 && mouseY > y && mouseY < y+70){
    fill(random(255),random(255),random(255));
          } else {
         fill(255,.20);
 }
     stroke(255);
     strokeWeight(.5);
 float speedX = abs(mouseX-pmouseX);
 if(x%100 == 0){
 ellipse(x,y,mouseX/3,mouseY/6);
 
  stroke(0);
 quad(x, y, mouseX+13, mouseY/25, mouseX+7, mouseY+18, mouseX*10, mouseY/9);
 
 }
  }
  }
  
  //mouse splatter
   stroke(47,200);
    fill(random(255),random(255),random(255),20);
   float speedX = abs (mouseX -pmouseX);
   for(int i = 0;i < speedX; i++){
     strokeWeight(.5);
     line(mouseX,mouseY^1,i*30,i*30);
     triangle(mouseX, mouseY, i*10, i*15, i*5, i*7);
     ellipse(mouseX,mouseY,i*4,i*5);
   }
   }

 
void mouseReleased(){
     background(76);
   }

