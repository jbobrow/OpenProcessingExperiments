
void setup(){

  size (600,600);
  background(#BAF2DD);
  
}

void draw(){

  background(#BAF2DD);
  strokeWeight(4);
  
  fill(#31878B);
  rect(mouseX-83,mouseY+5,30,100,100,100,100,100);
  rect(mouseX+53,mouseY+5,30,100,100,100,100,100);
  
  fill(#F0DD9B);
  ellipse(mouseX-73, mouseY+100,30,30);
  ellipse(mouseX+73,mouseY+100,30,30);
  
  fill(#A04025);
  ellipse(mouseX-40,mouseY+140,80,-50);
  ellipse(mouseX+40,mouseY+140,80,-50);
  
  fill(#FFFFFF);
  rect(mouseX-70, mouseY,140,150,20,20,60,60);
  
  fill(#F0DD9B);//lhe hagut de posar aqui perque sinó el rectangle es sobreposava a les altres formes
  ellipse(mouseX, mouseY+30, 60,60);
  ellipse(mouseX,mouseY-30,150,150); 
  
  fill(0);
  ellipse(mouseX-20,mouseY-30,20,20);
  ellipse(mouseX+20,mouseY-30,25,25);
  
  fill(#624E44);
  curve(mouseX-90,mouseY+650, mouseX-100,mouseY-40,mouseX+100,mouseY-40, mouseX+90,mouseY+650);
  line(mouseX-100,mouseY-40,mouseX+100,mouseY-40);
  
  noCursor();
  
}
