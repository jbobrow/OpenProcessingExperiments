
size(800,600,P3D);
translate(0,height/2,-200);


for(int x=0;x<150;x+=50){
  for(int y=0;y<150;y+=50){
      for(int z=0; z<150;z+=50){
  pushMatrix();
  translate(x,y,z);
  box(50,50,50);
  popMatrix();
}
}
}



