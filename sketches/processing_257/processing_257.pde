
public class Campo{ 
  Flor[] flores = new Flor[100]; 
  public int contFlores =0 ; 
  public int tamanio = 10; 
  color colorTallo; 
  Campo(){ 
    println("Campo >> init"); 
    colores.initPalette(2); //color verde 
    colorTallo = colores.devuelveColores(3); 
    println("colorTallo:"+hex(colorTallo)); 
    initFlores(); 
  }  
  void draw(){ 
    drawFlores(); 
  } 
  void drawFlores(){ 
    for(int i=0;i<contFlores;i++) { 
      flores[i].go(tamanio,colores.devuelveColores()); 
    } 
  } 
  void initFlores(){ 
    colores.initPalette(); 
    flores[contFlores] = new Flor(contFlores,(int) random(tamanio),colores.devuelveColores(),colorTallo); 
    contFlores = (contFlores + 1) % flores.length;  // note the use of modulo 
  } 

} 




