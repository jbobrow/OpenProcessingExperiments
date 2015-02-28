
/* Pierre Pothier-Bradley - YSDN
*/ 

size (250,250);
background(255);

  smooth();

//Credit: Joyce Dang for the following line
 for(int a=10; a<120; a+=20)
//
 
{
//TOP-Right
  line(125,a,a+130,125); 

//TOP-Left 
  line(125,a,-a+120,125); //top left

//BOTTOM-Left 
  line(125,a+130,a,125); 

//BOTTOM-Right  
  line(125,250-a,130+a,125); 
 
 
 
   
 
}


