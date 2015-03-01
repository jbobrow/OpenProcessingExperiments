
////colores
color rojo =#ff3333;
color verde=#00d5ac;
color gris=#333333;

void setup()
{
  size(1000,100);
 smooth();
  background(gris);
  frameRate(60);
  colorMode(HSB,360,100,100);
}
//////////////////////////////
void draw()
{
  background(gris);
  randomSeed(frameCount/10);
  
  noStroke();
  translate(0,010);
  
  
  
  for(int e=0;e<5;e++)
      {
    for (int i=0;i<18;i++)
        {
        pushMatrix();
        translate(i*random(100),e*20);
         
         float r=random(4.5);
         
         if (r<1.75){
                   fill(verde);
                   
         }else{
           fill(rojo);
           
         }
          
        punto(50,10); 
          
        popMatrix();
        }
      }
      
      
      
      
    salvar();
      
}
////punto de la linea
void med_form(int ancho,int alto) // medio de la forma
{
  rect(0,0,ancho,alto);   
}
//////////////////////////////////
void ext_form(int ancho,int alto) //extremos de la forma
{
  ellipseMode(CENTER);

  int d=alto-1; //diametro

  ellipse(ancho,alto/2,d,d);
  ellipse(0,alto/2,d,d);  
}
//////////////////////////////////
void punto(int ancho, int alto)
{
  pushMatrix();
  translate(-ancho/2,-alto/2); //traslada la forma al medio
    med_form(ancho,alto);
    ext_form(ancho,alto);
  popMatrix();
}

//////////////////////////
void salvar()
{
  if (mousePressed==true)
  {
    saveFrame("GEN01-####.png");
  }
}
