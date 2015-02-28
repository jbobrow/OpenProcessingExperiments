


class Balle
{
  //Déclarations des variables.
  float x,y,angle,dx,dy;
  //dx,dy contiennent le decalage relatif a l'angle de tir
  
   void draw()
   {
     pushMatrix();
     
         //Dessinne la balle
         translate(x,y);
         rotate(angle);
         
         fill(#E8C200);
         stroke(0);
         rect(0, 0, 2, 5);//dessin de la balle
     
     popMatrix();
     
     
   }
 
  
  
}

