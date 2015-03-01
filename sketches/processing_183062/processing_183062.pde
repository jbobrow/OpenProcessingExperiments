
size(800,800,P3D);

translate(12, height/2, -900);
  rotate(PI);
  
  for (int x=0; x<300; x+=100){
    for (int y=0; y<300; y+=200){
  for (int z=0; z<300; z+=100){
    
      float h=100;
      translate(0,-h/2,0);
      
  
       pushMatrix();
      translate(x,y,z);
      fill(random(255), random(255), random(255));
      box(100, h, 100);
      popMatrix();
    }
    }
  }
