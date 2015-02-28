
float x = 200;
float y = 200;

void setup(){
size (600,600);
smooth ();
background (0);
}


void draw(){ 
  for (int i=0; i<width/2; i++){
ellipse(mouseX, mouseY, 200, 100);
strokeWeight(.5);
fill(random(125));
quad(20,20,20,i++,20,20,mouseX+20,mouseY+30);
fill(mouseX, mouseY, i++, i);
  }


}

 void mouseClicked() {
   ellipse (random(width), random(height), 40, 40);
   fill(255, mouseX, mouseX);
   line(mouseX, mouseY,300,300);
}

