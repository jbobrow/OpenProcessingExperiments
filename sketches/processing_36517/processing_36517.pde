
float xpos = 10;
float ypos = 5;
float nor = 100;
int x,y = 0;
int z = 700;
int e = 400;

void setup (){

  
  noCursor();
  smooth();
  size(700,400);
  
}

void draw (){

  background (0);
  stroke(255);
  fill(random(12),random(44),55,5); 
  pushMatrix();
  ellipse(mouseX,mouseY,xpos,ypos);
  popMatrix();
 
  xpos = xpos +(mouseX - xpos)/25.0;
  ypos = ypos +(mouseY - ypos)/24.0;
  
   if(xpos >= ypos) { 
    stroke(255);
    
    line(x,y,xpos - xpos,ypos - ypos);
    line(x++,y++,xpos + xpos,ypos + ypos);  
  }
 
 
}

void mousePressed (){
 
  xpos = xpos -(mouseX + xpos);
  ypos = ypos -(mouseY + ypos);
  translate(xpos,ypos);
  rotate (PI/3.0);

}

void mouseMoved (){ 
  ellipse(x++,y++, 10, 10);
  
}

