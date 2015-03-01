
size(300,600);

for (int i=0; i<=600; i+=30){
  fill(96,219,184,i/3);
  noStroke();
  rectMode(CENTER);
  rect(150,i,300,30);
}

pushMatrix();
translate (150,150); 
rotate(radians(45)); 
fill(41,187,201,200);
rect (-50,0,250,250);
popMatrix();

pushMatrix();
translate (150,300);  
rotate(radians(22.5));
fill(148,166,201,150);
rect (-10,0,150,150);
popMatrix();

pushMatrix();
translate (150,380);  
rotate(radians(10));
fill(197,166,201,150);
rect (40,0,75,75);
popMatrix();

pushMatrix();
translate (150,400);  
fill(255,226,214,100);
rect (70,25,30,30);
popMatrix();
