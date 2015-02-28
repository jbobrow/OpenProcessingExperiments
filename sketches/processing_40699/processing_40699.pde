
int x = -100;
int xx = 800;
int y = height/2;

void setup(){
  
 size(700,400);
 
  
}

void draw(){
  background(0);
 stroke(255);
 noFill();
 
  if(mousePressed == true){
  curve(mouseX, mouseY, 0, height/2, 700, height/2, mouseX, mouseY);
  
  }else{curve(-500, 200, 0, height/2, 700, height/2, 1200, 200);
   
}
}

