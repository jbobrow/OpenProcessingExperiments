
//int i = 0;      
int eSize = 3;  
 
size(510, 510);
background(200);
stroke(130,100,160);

//for(int y = 50; y <= height-50; y += 10){ 
  for(int x = 0; x <= width; x+=1) {   //1=abra 10=senn 
  //ellipse(x, y, eSize, eSize);  
 
  stroke(x,10,50,60);    //naname1
  line(x, height ,0, 0);
 
  stroke(x,80,100,180);  //GBR(ougi1)
  line(x,width,0,x);
 
  stroke(x,80,200,100);    //ougi2
  line(510,x,x,0);
  
  stroke(x,10,100,50);   //naname2
  line(510,510,x,0);
  
  
  //i = i + 5;

//println(x);
 
 
  }
//}


