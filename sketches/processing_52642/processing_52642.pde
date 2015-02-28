
size (250,250);
background(255);
smooth();

for(int a=10; a<120; a+=20)


{
  line(125,a,a+130,125); //top right
  
  line(125,a,-a+120,125); //top left
  
  line(125,a+130,a,125); //botom left
  
  line(125,250-a,130+a,125); //botom right



  

}
 

