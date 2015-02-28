
size (800, 800);
background (0);
for (float x = 0; x<= 800; x+=0.5){
  //colorMode(HSB, 360, 100, 100);
  //for (int i = 0; i<800 ;i+=10){
    //float r = 53 + ( i*0.78);
    //float g = 9 + ( i*0.56);
    //float b = 255 - ( i*1.12);
    stroke (x+10, x, x*0.5);
    
    //line (x, 0, 0, x+6);
    //line (width-x, 800, 800 , x);
    line (800, height-x, x , 800);
    //line (height/2, x, x , 1000);
  //}
}


