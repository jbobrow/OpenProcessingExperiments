
void setup(){
  size(600,600);
  background(55,0,22);
}


void draw(){
  
  
  for (int i = 0; i < 20; i = i++)
  {
    
    
    
    
    background(mouseX);
    fill(i,i,10,30);
    triangle(mouseX, mouseY, 58, 20, 300, i++);
    fill(i,39,0,i);
    triangle(30, i, 58, mouseX, 300, 400);
    fill(i,i,10,40);
    triangle(i, 75, mouseX, 20, 300, 500);
    fill(i,70,i,30);
    triangle(30,75,58,20,mouseY,600);
    fill(i,i++,0,70);
    triangle(mouseY,75,58,20,mouseY,700);
    fill(i++,200,0,mouseX);
    triangle(30,75,i,i++,400,200);
    fill(i,200,1,40);
    triangle(i,75,58,i++,mouseX,300);
    fill(i,i++,i);
    triangle(30,i,580,mouseY,400,400);
    fill(200,200,i);
    triangle(i,i++,i++,mouseY,i,mouseX);
    fill(i++,i++,i);
    triangle(i++,75,58,mouseX,200,300);
    fill(i,200,i);
    triangle(mouseX,75,58,20,500,mouseX);
    triangle(30,75,mouseY,20,500,300);
    ellipse(mouseX,i,mouseX,i);
  }
}

