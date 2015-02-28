
void setup()
{
  size(300,400);// para cambiar el tamaño de ROBOTIN, modificar los dos factores en la misma proporción
  background(250);
  smooth();
  cabeza();
  cuerpo();
  extremidades();
}

void cabeza()

{

    noStroke();
  fill(30,154,200);
  triangle (height /5,width/3,width /30,height/5,width/15,height/10); // oreja derecha
  triangle (width/2.14,width/3,height/2,height/3.3,height/2,height/5); // oreja derecha
  fill(100,50,255);
  rect(width/5,height/10,width/3, height/3.3); // cabeza
  fill (50, 30,50);
 rect (width/4.28,height/3.07,height/5,width /30);
   rect(width/6, height/10, height/3.3, width/10);// gorro 1
  rect(width/4.28,width/10,height/5,height/10);// gorro 2
   ellipse (width/3.3,width/3.3,width/15,width/15); // ojo derecho
  ellipse (height/3.07,width/3.3,width/15,width/15); // ojo izqierdo
}
    void cuerpo()
{
fill(100,50,255);
   triangle (width/10,width/.85,width/2.8,width/2.8,height/2,width/.85); // cuerpo
   
}
 void extremidades()

{
fill(100,50,255);
  quad (height/10,width,width/10,height/1.6,width/4.28,width/1.87,height/5,height/2.2);// brazo derecho
   quad ( width/1.57,width,height/2,height/1.6,width/1.87,width/1.87,width/2,height/2.2);// brazo izquierdo
      fill(30,154,200);    
      ellipse (width/5, height/1.08,width/5,width/5);// pie grande izquierdo
      ellipse (width/1.87,height/1.08,width/5,width/5);// pie grande derecho
     fill (50, 30,50);
   ellipse ( width/5,height/1.08,height/10,height/10);// pie izquierdo
      ellipse ( width/1.87,height/1.08,height/10,height/10);// pie derecho
  }  
                
