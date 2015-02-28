
void setup ()
{
  size(1000,610);
  
  background (0);
 

   frameRate (5); 
  

} 


 
 
int i = 0 ;

  //je déclare ma première pos° integer
  int stY=0;

  
//je déclare une variable de type integer
  int stX;
void draw ()

   

{  fill (#53B6D3);
  textFont(createFont("Vectorbattle",90));
  text("Process", 0,50*i);
  
  
  fill (#FFFFFF);
   text("Process", 510,610-50*i);
  
  
  fill (#FFFFFF);
   text("Process", 250,610-50*i);
   
   
  i = i+1;

  } 
  


