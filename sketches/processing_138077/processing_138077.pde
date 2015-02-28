
float y = 100;
float scale;

void setup() {

size(400, 400); 
background(0); 
noStroke(); 
  scale = width/50;
   




}

void draw() { 
int a = 10;
for (int x = a; x <= width - a; x += a) {
  for (int y = a; y <= height - 2+a; y += a) {
    noStroke();
    fill(255);
    rect(x-2, y-1, 9, 8);
  line(0, y, width, y);  
    line(0, y+0.3, width, y-3);  
 
  }
  {
  
  for (int i = 3; i < scale; i++) {
    fill(millis()*((i+0.1) * height/2 ));
    rect(i*scale, 0, scale, height/2);
    ellipse(mouseX,20,200,23);
    ellipse(mouseX,mouseY,200,23);
    
   
  }

  

 

}
}
}



