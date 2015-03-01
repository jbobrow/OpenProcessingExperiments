
size(500,500,P3D);
translate(0,height/2,-250);
rotateX(PI/8);
for(int z= 0; z<150; z+=50);
  for(int x= 0; x<150; x+=50){
    for(int y= 0; y<150; y+=50){
      pushMatrix();
      translate(x,y,z);
      float h=50;
      translate(0,-h/2,0);
      fill(random(255), random(255),random(255));
      box(50,h,50);
      popMatrix();
    }
  }


