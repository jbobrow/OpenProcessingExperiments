
size (250,250);
background(0,0,0);
translate(80,-60);
rotate(0.5);
smooth();


for(int a=10; a<150; a+=5)

{

  //red
  stroke(255,0,0);
  line(125,a,a+100,125); //top right
  
  //green
  stroke(0,255,0);
  line(125,a,-a+120,125); //top left
  
  //blue
  stroke(0,0,255);
  line(125,a+130,a,125); //botom left
  
  //yellow
  stroke(255,255,50);
  line(125,250-a,130+a,125); //botom right



  

}
 

