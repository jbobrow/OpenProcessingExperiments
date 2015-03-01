
size(600, 600, P3D);
translate(200, 400, -100);



    for(int i=0; i<300; i +=50){
      for (int x = 0; x<300-i; x+=50) {
  for ( int z = 0; z< 300-i; z += 50) {

      pushMatrix();
      translate(x+i/2, -i, z+i/2);
      box(50);
      popMatrix();
    }
  }
}
