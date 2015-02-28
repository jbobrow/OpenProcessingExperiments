
void setup()
{  
  size(400,400);
     
}

boolean estado = true;

void draw(){
  
  float botonX = 10;
  float botonY = 340;
  float botonSize = 50;
  float cantidad =10;
  float sep;
  
  

  

  
if (mouseX > botonX && mouseX < botonSize+botonX && mouseY > botonY && mouseY < botonY+botonSize && mousePressed )
{
 estado= !estado;
}


  
if (estado == true){
   cantidad =10;
}
   


if (estado == false){
  cantidad = 50;  
}


   fill(128); 
   rect(0,0,width,height);
   
   if (estado) {
   fill(50);
   rect(botonX,botonY,botonSize,botonSize);
   }
   else{
     fill(150);
   rect(botonX,botonY,botonSize,botonSize);
   }


   sep = height/cantidad;
   for (int i= 10; i<=400; i+=sep){
   fill(150,150,30); 
   ellipse(i,i,20,20);
  
}


}

 








