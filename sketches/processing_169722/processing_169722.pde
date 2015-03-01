
color col;

void setup() {  //setup function called initially, only once
  size(300, 300);
  col = color(0);
  background(col);  //set background white
  noStroke();
  
  
}

void draw() {  //draw function loops 
  background(0);
  
  fill(255,150,50); // orange
  ellipse(150,150,250,200);
  
  fill(col); // noir
  triangle(80,130,120,130,100,90); // oeil gauche
  triangle(180,130,220,130,200,90); // oeil droit
  
  triangle(130,170,170,170,150,140); // nez
  
  rect(80,190,140,25); // bouche
  
  // dents
  fill(255,150,50);
  rect(100,190,20,15);
  rect(160,200,20,15);
  
  // tige
  fill(125,45,25);
  rect(135,35,30,20);
  triangle(135,35,165,35,165,15);
  
  
}

void mousePressed(){
col = color(random(255), random(255), random(255));

}
