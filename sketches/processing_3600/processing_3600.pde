
float[][] a=new float[40][2];void draw(){a[0][0]=mouseX;a[0][1]=mouseY;for(int i=1;i<40;i++){stroke(99,0,i*3,i*4);line(a[i][0],a[i][1],a[i][0]+=(a[i-1][0]-a[i][0])/i,a[i][1]+=(a[i-1][1]-a[i][1])/i);}}

