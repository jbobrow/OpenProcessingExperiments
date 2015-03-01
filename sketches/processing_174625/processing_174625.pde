

int x, y;  

 
 
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed == true){
  
    fill(random(255),0,30);
    noStroke();
    triangle(mouseX,  mouseY, pmouseX-15, mouseY-30, mouseX+15, mouseY-30);

  }
}

void keyPressed(){
  switch(key){
case 'z': 
background(200); 
break;
  }
}


