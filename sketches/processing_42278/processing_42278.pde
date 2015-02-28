


void setup() {
  size (600, 600);
  background (#578119);
}

void draw() {
  noStroke();
  fill (#E06417);
  triangle(300, 300, 150, 300, 225, 150);

  triangle(300, 300, 450, 300, 375, 150);

  triangle(225, 300, 370, 300, 300, 450);

  fill(#21201F);
  ellipse(235, 300, 90, 30);
  
  fill (#6C5C0A);
  triangle (300,451,282,416,317,414);
  
  fill(#21201F);
  ellipse(370, 300, 90, 30);
  
  fill (#C4AB1E);
  triangle (223,184,250,258,199,257);
 
 fill (#C4AB1E);
  triangle (374,190,353,260,401,262);
  
  fill(#21201F);
  ellipse(293,429, 3, 3);
  
  fill(#21201F);
  ellipse(303,429, 3, 3);
  
   fill(#FFFFFF);
  ellipse(230,299, 20, 20);
  
  fill(#FFFFFF);
  ellipse(370,298, 20, 20);
  
  
  
 
 
  
  
  
}

void mousePressed() {
 println(mouseX + " " + mouseY);
  
}


