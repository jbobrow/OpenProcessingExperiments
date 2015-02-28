
//------------------------------------------------------------------------------------------------------------
//   clase    FIGURA
//------------------------------------------------------------------------------------------------------------
//
//  José Casanova 2010
//  
//
class Figura{

  float x, y; //posicion de la figura
  float direccion; //direccion en la que avanza
  float velocidad; //velocidad a la que avanza
  float dx,dy;  //desplazamiento en x e y deducido de la direccion y velocidad.
  float radio; //tamanio del objeto
  color col;
  int fig; // tipo de figura
  Boolean mouse;
  Texto esta;

   
   Figura(){
      
      mouse = false;
      x = random(width);
      y = random(height);
      col = color(random(200),random(50,200),random(50,200),30);
      radio = random(12, 30);
      velocidad = map(radio,12,25,0.09, 1.5); 
      fig = int(random(1,4));
      direccion = random(45 *velocidad); //inicia con una direcci�n al azar
   //  esta  = new Texto("fghbbbn fd","gfhfghfg","100");
     // energia = 
   }
   
   
   void mover(){
     

      variarAngulo( 5 ); //caria la direccion en un rango
      // de 30 grados para cada lado
      dx = velocidad * cos(direccion); //deduce el desplazamiento en X
      dy = velocidad * sin(direccion); //deduce el desplazamiento en Y
      x += dx; //aplica los desplazamiento
      y += dy; //aplica los desplazamiento

      // el espacio es toroidal
      // entonces revisa si se pasó de límite

            x = ( x>width ? x-width : x );
            x = ( x<0 ? x+width : x );
            y = ( y>height ? y-height : y );
            y = ( y<0 ? y+height : y );

      if(mouseX < x + 15 &&  mouseX > x - 15  &&  mouseY < y + 15 &&  mouseY > y - 15 ){
        velocidad = 0;
        mouse = true;
     //   esta.mostrar();
      }
      else{
        velocidad = map(radio,12,25,0.09, 1.5);
        mouse = false;
      }
       //     println( " figura x = "+x+"   y = "+y +  " mouseX = "+ mouseX+"   mouseY =  "+ mouseY  );
     
   }
   void dibujar(){
       fill(col);
       pushMatrix();
       switch(fig){
         case 1:
           pushMatrix();
           translate(x,y);
           rotate(direccion);
           ellipse(0,0,radio*2, radio*2);
           popMatrix();
           break;
         case 2:
            pushMatrix();
            translate(x,y);
            rotate(direccion);
            triangle(0,-radio,radio,radio,-radio,radio);
            popMatrix();
           break;
         case 3:
           rectMode(CENTER);
           pushMatrix();
           translate(x,y);
           rotate(direccion);
           rect(0,0,radio*2,radio*2);
           popMatrix();
           break;
         default:
           println("ERROR: esto no deberia suceder  - Figura.dibujar");
           break;
       
       }
       
       
       
       //translate(x,y);
     //  rotate(direccion);
       //rect(0,0,10,10);
       popMatrix();
   }
  
  
   void variarAngulo(float amplitud){
      float radi = radians( amplitud ); //transforma los grados
     // en radianes
      direccion += random( -radi , radi ); //aplica un valor
      // al azar dentro del rango
   }

  Boolean mouseSobreFigura(){
    return mouse;
  }
  
 void resaltar(){
 
 } 

}

