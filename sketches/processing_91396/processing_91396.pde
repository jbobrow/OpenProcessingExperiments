
class Abc 
{  

  int num =5;
float c;
  
  
  Abc ()
  {
    
     
    

}
  


  void dibujameabc()
  {
    
    pushMatrix();

   translate (570,400);
   // background(0);
  c+=0.001;
  for(int i=1; i<height/num; i++) { 
    float x = (c%i)*i*i;
    stroke(25,50);

  line((i*num ),-450,370-x,i*num);

  /**
   * Modifica la posición de la burbuja
   */


}
  popMatrix();
}
}

