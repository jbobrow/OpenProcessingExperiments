
void setup (){
  size (800, 800);
 // frameRate(75);
  smooth();
  noFill();
}

void draw (){
  background (mouseX-300,mouseY-300,+190);
    
  
  for (int i = 0; i<width; i = i+10){
  for (int r = 0; r<height; r = r+5){
    stroke (0);
   fill (mouseX-150,mouseY-150,-100);
   rect (i, r, 200, 2);
    }
  }
  
  

for(int i = 0; i < 50; i+=5 ){
if (mouseX > width/10 && mouseY > height/10){

  fill (random(200), random(200), random(200), random(200));
   ellipse (mouseX-170, mouseY-170, i*5, i*5); 
  }

}  

 
for(int i = 0; i < 50; i+=5 ){
if (mouseX > width/10 && mouseY > height/10){

  fill (random(200), random(200), random(200), random(200));
   ellipse (mouseX+170, mouseY-170, i*5, i*5); 
  }

}   


for(int i = 0; i < 50; i+=5 ){
if (mouseX > width/10 && mouseY > height/10){

  fill (random(200), random(200), random(200), random(200));
   ellipse (mouseX-170, mouseY+170, i*5, i*5); 
  }

}  

 
for(int i = 0; i < 50; i+=5 ){
if (mouseX > width/10 && mouseY > height/10){

  fill (random(200), random(200), random(200), random(200));
   ellipse (mouseX+170, mouseY+170, i*5, i*5); 
  }

}   

 
 
 
} 

