
size (830, 200);
smooth();
background(255);

for (int i=10; i<791; i=i+10){
  float xPos = 0;
  float yPos = 0;
  
  xPos = xPos + random (1, 10);
  yPos = yPos + (random(1, 10)-xPos);
  ellipse (i + xPos, yPos+40, 10, 10);
}
                
                
