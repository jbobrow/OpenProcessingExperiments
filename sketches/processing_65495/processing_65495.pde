
void backgroundFuncion (){
  

  
   strokeWeight (.7);
 stroke (#CFC0B1);
 fill (#E0D1C7);
 rect (0,mouseY,width*2,height/2);
 stroke (#E0D1C7);
 fill (#CFC0B1);
 rect (0,height/2-mouseY/2,width*2,height-mouseY);
 
 stroke (#E0D1C7);
 fill (#CFC0B1);
 rect (0,height/4+mouseY/4,width*2,height/2-mouseY/2);
 
 for (int i = 0;i<=height;i=i+20){
   strokeWeight (.6);
   stroke (#DEBFB0);
   line (0,mouseY+i,width*2,mouseY+i);
      stroke (#DEDFD7);
   line (0,-mouseY+i*2,width*2,-mouseY+i*2);
 }
 

 
}

