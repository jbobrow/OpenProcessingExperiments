
//随机分布一些点，并将这些点互相连接
float [] Hx = new float[15];
float [] Hy = new float[15];

  int i;
  size(500,500);
  background(0);
  smooth();
 
   for(i=0;i<Hx.length;i++){
       Hx[i]=random(500);
       Hy[i]=random(500);
}


  
   for(i=0;i<Hx.length;i++){
     for(int j=1;j<Hx.length;j++){
       float d = dist(Hx[i],Hy[i],Hx[j],Hy[j]);
       stroke(255,d/5);
       strokeWeight(d/180);
       line(Hx[i],Hy[i],Hx[j],Hy[j]);
       
       //noFill();
        //ellipse(Hx[i],Hy[i],20,20);
      
    }
}
