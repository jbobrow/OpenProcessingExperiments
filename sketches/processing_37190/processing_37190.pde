
size (300, 300);
background (255);


  //float ntri = 10;


for (int x=10; x<300; x=x+30){
 for(int y=10; y<300; y=y+30){
   
 
float mySpacing= 20;
float trisize= 10;
 float greyVal = map(y, 1,300, 255,0); 
fill(greyVal);
 

triangle (x,y, x*mySpacing,y*trisize, x*(mySpacing*2),y);
//}
//}
//



}
}

                
