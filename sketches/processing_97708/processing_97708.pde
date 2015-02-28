
/*Maite Iriondo Lozano
  Práctica 4-Informática-Grupo2
*/


  //Definir variables
  float x,y;
  int NumBolas=10;
  int posX, posY, velX, velY;
  int posX1, posY1, velX1, velY1;
  int posX2, posY2, velX2, velY2;
  int posX3, posY3, velX3, velY3;
  int posX4, posY4, velX4, velY4;
  int posX5, posY5, velX5, velY5;
  int posX6, posY6, velX6, velY6;
  int posX7, posY7, velX7, velY7;
  int posX8, posY8, velX8, velY8;
  int posX9, posY9, velX9, velY9;

  void setup()
  {
  size(600,600);
  smooth();
  background(255);
  
  //Definir posición y velocidad de cada una de las pompas
  //Posición inicial: el mismo punto de la pantalla para todas
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 8 ;
  
  posX1 = width/2;
  posY1 = height/2;
  velX1 = 10;
  velY1= 5;
  
  posX2 = width/2;
  posY2 = height/2;
  velX2 = 10;
  velY2 = 12;
  
  posX3 = width/2;
  posY3 = height/2;
  velX3 = 2;
  velY3 = 6;
  
  posX4 = width/2;
  posY4 = height/2;
  velX4 = 3;
  velY4 = 4;
  
  posX5 = width/2;
  posY5 = height/2;
  velX5 = 6;
  velY5 = 8;
  
  posX6 = width/2;
  posY6 = height/2;
  velX6 = 4;
  velY6 = 8;
  
  posX7 = width/2;
  posY7 = height/2;
  velX7 = 7;
  velY7 = 10;
  
  posX8 = width/2;
  posY8 = height/2;
  velX8 = 20;
  velY8 = 10;
  
  posX9 = width/2;
  posY9 = height/2;
  velX9 = 10;
  velY9 = 20;
  
  }
  
  void draw()
  {
  //(Fondo de repetición)
  //Determinamos un patrón de repetición en el eje X y Y
  {
  for(int i=0; i<NumBolas; i=i+1)
 
    {
  for (int j=0; j<NumBolas; j=j+1)
      {
        x=map(i,0,NumBolas-1,10,width-10);
        y=map(j,0,NumBolas-1,10,height-10);
        
        
        //Si j es mas grande o igual que i, se cumplen unas características 
        if(j>=i)
        {
          fill(160,247,247,75);
          stroke(173,223,255);
        }
        //...y sino se cumplen estas otras
        else
        { 
        fill(random(100,255), random(100,255),random (100,255));}
        ellipse(x,y,100,100);
        ellipse(x,y,50,50);
        }
        
        }
        
        //Se repite esta misma operación para las 9 pompas
        
        //Actualización de las posiciones
        posX = posX+velX;
        posY = posY+velY;
     
        //Figura:Pompas
        fill(255,150);
        ellipse(posX,posY,70,70);
        fill(173,223,255);
        ellipse(posX,posY,35,35);
        
      
        //Condicional para que la figura rebote en las paredes,dentro de unos límites en X
        if((posX-25<0)||(posX+25>width)){
        velX = -velX;
 
}
   
        //Condicional para que la figura rebote en las paredes,dentro de unos límites en Y
        if((posY-25<0)||(posY+25>height)){
        velY = -velY;
  }

        posX1 = posX1+velX1;
        posY1 = posY1+velY1;
        
        fill(255,150);
        ellipse(posX1,posY1,70,70);
        fill(173,223,255);
        ellipse(posX1,posY1,35,35);
        
        
        
        if((posX1-25<0)||(posX1+25>width)){
        velX1 = -velX1;
 
}
   

        if((posY1-25<0)||(posY1+25>height)){
        velY1 = -velY1;
  }
         
        posX2 = posX2+velX2;
        posY2 = posY2+velY2;
     
        fill(255,150);
        ellipse(posX2,posY2,70,70);
        fill(173,223,255);
        ellipse(posX2,posY2,35,35);
        
        
        
        if((posX2-25<0)||(posX2+25>width)){
        velX2 = -velX2;
 
}
   

        if((posY2-25<0)||(posY2+25>height)){
        velY2 = -velY2;
  }
        
        posX3 = posX3+velX3;
        posY3 = posY3+velY3;
        
        fill(255,150);
        ellipse(posX3,posY3,70,70);
        fill(173,223,255);
        ellipse(posX3,posY3,35,35);
        
        
        
        if((posX3-25<0)||(posX3+25>width)){
        velX3 = -velX3;
 
}
   

        if((posY3-25<0)||(posY3+25>height)){
        velY3 = -velY3;
  
   }
           
        posX4= posX4+velX4;
        posY4 = posY4+velY4;
        
        fill(255,150);
        ellipse(posX4,posY4,70,70);
        fill(173,223,255);
        ellipse(posX4,posY4,35,35);
        
        
        
        if((posX4-25<0)||(posX4+25>width)){
        velX4 = -velX4;
 
}
   

        if((posY4-25<0)||(posY4+25>height)){
        velY4 = -velY4;
  
   }
              
        posX5= posX5+velX5;
        posY5 = posY5+velY5;
        
        fill(255,150);
        ellipse(posX5,posY5,70,70);
        fill(173,223,255);
        ellipse(posX5,posY5,35,35);
        
        
        
        if((posX5-25<0)||(posX5+25>width)){
        velX5 = -velX5;
 
}
   

        if((posY5-25<0)||(posY5+25>height)){
        velY5= -velY5;
  
   }
              
        posX6= posX6+velX6;
        posY6 = posY6+velY6;
        
        fill(255,150);
        ellipse(posX6,posY6,70,70);
        fill(173,223,255);
        ellipse(posX6,posY6,35,35);
        
        
        
        if((posX6-25<0)||(posX6+25>width)){
        velX6 = -velX6;
 
}
   

        if((posY6-25<0)||(posY6+25>height)){
        velY6= -velY6;
  
   }
        
        posX7= posX7+velX7;
        posY7 = posY7+velY7;
        
        fill(255,150);
        ellipse(posX7,posY7,70,70);
        fill(173,223,255);
        ellipse(posX7,posY7,35,35);
        
        
        
        if((posX7-25<0)||(posX7+25>width)){
        velX7 = -velX7;
 
}
   

        if((posY7-25<0)||(posY7+25>height)){
        velY7= -velY7;
  
   }
       
        posX8= posX8+velX8;
        posY8 = posY8+velY8;
        
        fill(255,150);
        ellipse(posX8,posY8,70,70);
        fill(173,223,255);
        ellipse(posX8,posY8,35,35);
        
        
        
        if((posX8-25<0)||(posX8+25>width)){
        velX8= -velX8;
 
}
   

        if((posY8-25<0)||(posY8+25>height)){
        velY8= -velY8;
  
   }
                      
        posX9= posX9+velX9;
        posY9 = posY9+velY9;
        
        fill(255,150);
        ellipse(posX9,posY9,70,70);
        fill(173,223,255);
        ellipse(posX9,posY9,35,35);
        
        
        
        if((posX9-25<0)||(posX9+25>width)){
        velX9= -velX9;
 
}
   

        if((posY9-25<0)||(posY9+25>height)){
        velY9= -velY9;
  
   }
  }
  }
       



