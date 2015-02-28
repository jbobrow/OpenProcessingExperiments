
//Autor:Manel Lopez 1DAm BucleWHILE
//Fondo
void setup(){
  size(300,200);
  noStroke();
}
//Interaccion
void draw(){
  background(255);
  int i=0;
  while(i<=300){
    fill(0);
    rect(i,0,10,250);
    fill(random(300));
    rect(mouseX-i,0,10,200);
  i=i+10;
  }
  //Condicion de hacer click
  if (mousePressed){
  
  stroke(int(random(250)),int(random(250)), int(random(250)) );
  

   fill(255);
//Imprimir por pantalla Canal codificado
   text ("Canal codificado",100,100);
   
  

  


 

    }

}



