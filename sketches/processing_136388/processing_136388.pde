
int offset = 20;
int inc_i = 30;
int[] misx;
boolean adentro = false;
int x_i, y_i, cont;
void setup()
{
  size(800, 700);
  int tam = (width-offset)/inc_i;
  misx = new int[tam];

  println("tamano: " +tam);
}

void draw()
{
  x_i = pmouseX;
  y_i = pmouseY;
  
  fill(0);
  for (int i=10; i< width-offset; i+=inc_i )
  {
    misx[cont] = i;

    // println("cuenta: " + cont +"\t"+ "valor: " + i);
    println(cont);
    stroke(#190869);
    
    int i_c = i + inc_i;
    
    if ((x_i >i) && (x_i<i_c) && mousePressed  ) {
      
      
      fill(random(255), random(255), random(255));
      quad(i, offset, i, height-offset, i_c, height-offset, i_c, offset);

      }else
      {
        fill(0);
        quad(i, offset, i, height-offset, i_c, height-offset, i_c, offset);
      }

      if ( i < width - offset)
      {
        cont++;
      } 

      
    }
    
    cont = 0;
    
    
  //println(misx[25]);
  }
  
  
  void mouseDragged()
  {
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  


