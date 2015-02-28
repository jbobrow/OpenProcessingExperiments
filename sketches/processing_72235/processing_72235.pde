
String texto = "";
String textoOriginal = "";
String letra;

void setup()
{
  size(800,280);

}

void draw()
{
  background(255);
  
  textSize(22);
  text(textoOriginal,260,215);
  text(texto,260,165);
  text("Texto original:",20,215);
  text("Texto transformado:",20,165);
  
  textSize(9);  
  text("Iacopo Garizio Villena",690,275);

  for(int i = 0; i < 8; i++){
  fill(255/(i+1),50*i,50*i);    
  rect((width*i/4)+70, 20, 60, 60, 3, 3, 3, 3);
  }
  
  fill(37, 232, 159);
  rect(285, 100, 230, 20, 3, 3, 3, 3);
  fill(255,0,0);
  textSize(18);
  text("¡Nuevo!",289,116);
  fill(0);
  textSize(12.3);
  text("Transformar a modo flaite.",358,115);

  fill(0);
  textSize(10);
  text("Mayúsculas", 72.5, 78);
  text("CamelCase",(width/4) + 72.5, 78);
  textSize(11);
  text("Invertido",(width/2) + 76, 78);
  text("Numérico",(3*width/4) + 75, 78);

  text("Ingrese un texto y transfórmelo seleccionando los botones. Para volver al texto original haga click en cualquier lugar.", 5, 9);

  textSize(55);
  text("M", 77, 66);
  textSize(46);
  text("Cc",(width/4) + 72.5, 63);
  textSize(35);
  text("Ii",(width/2) + 76, 53);
  text("iI",(width/2) + 103, 63);
  textSize(30);
  text("4BC",(3*width/4) + 72, 58);
  }


void mouseClicked() {

  if(mouseX > 70 && mouseX < 130 && mouseX > 20 && mouseY < 80){
    texto = textoOriginal.toUpperCase();
  }


if(mouseX > 270 && mouseX < 330 && mouseX > 20 && mouseY < 80 && textoOriginal.length() != 0){

  letra = textoOriginal.charAt(0) + "";
  letra = letra.toUpperCase();
  texto = letra;

  for (int i = 1; i < textoOriginal.length(); i++) {
   
    if(textoOriginal.charAt(i) == ' ' && i < textoOriginal.length() - 1){
      
      letra = " " + textoOriginal.charAt(i+1);
      letra = letra.toUpperCase();

      i++;
      
    }else{
      
      letra = textoOriginal.charAt(i) + "";
    }
    
    texto = texto + letra;
  }
}


 if(mouseX > 470 && mouseX < 530 && mouseX > 20 && mouseY < 80){
   texto = "";   
   for (int i = textoOriginal.length(); i > 0; i--) {
   texto = texto + textoOriginal.charAt(i-1) + "";
  }
 }
 
  if(get(mouseX, mouseY) == -1){
   texto = textoOriginal;   
 }
 
 
 if(mouseX > 670 && mouseX < 730 && mouseY > 20 && mouseY < 80){
   
   texto = "";
   
   for (int i = 0; i < textoOriginal.length(); i++) {
     
     letra = textoOriginal.charAt(i) + "";
     switch(textoOriginal.charAt(i)){
       case 'a':
       case 'A':
       letra = 4 + "";
       break;
       
       case 'e':
       case 'E': 
       letra = '3' + "";
       break;
       
       case 'i':
       case 'I': 
       letra = 1 + "";
       break;
       
       case 'o':
       case 'O': 
       letra = 0 + "";
       break;
     }
     
     texto = texto + letra;
   }
 }
 
 
 
 
  if(mouseX > 285 && mouseX < 515 && mouseY > 100 && mouseY < 120){
   
   texto = "";
   
   for (int i = 0; i < textoOriginal.length(); i++) {
     
     letra = textoOriginal.charAt(i) + "";
     switch(textoOriginal.charAt(i)){
       
       
       case 'a':
       case 'A':
       letra = 'á' + "";
       if(i < textoOriginal.length()-1){
       if(textoOriginal.charAt(i+1) == ' '){
       letra = "ahh" + "";
       } else {
       if(random(0,100) > 80){
       letra = "áá";
       }
       }
       }
       break;
       
       case 'e':
       case 'E':
       letra = 'é' + "";
       if(i < textoOriginal.length()-1){
       if(textoOriginal.charAt(i+1) == ' '){
       letra = "ehh" + "";
       } else {
       if(random(0,100) > 70){
       letra = "éé";
       }
       }
       }
       break;
       
       case 'i':
       case 'I': 
       letra = 'í' + "";
       if(random(0,100) > 50){
       letra = "íí";
       }     
       break;
       
       case 'o':
       case 'O': 
       letra = 'ó' + "";
       break;
       
       
       case 'u':
       case 'U': 
       letra = 'ú' + "";
       break;

       case 'y':
       case 'Y': 
       letra = 'ý' + "";
       break;
       
       case 'z':
       case 'Z':
       letra = "zh" + "";
       break;

       
       case 'c':
       case 'C':      
       switch(textoOriginal.charAt(i+1)){
         
       case 'h':
       letra = "x" + "";       
       i++;
       break;
       
       case 'a':
       case 'o':
       case 'u':
       letra = "k" + "";       
       break;
       
       case 'i':
       case 'e':
       if(random(0, 100) > 70){
       letra = "s" + "";  
       }     
       break;
       }
       
       break;
       
       
     }
     
     texto = texto + letra;
   }
   switch(int(random(0,5))){
     
     case 0:
     texto = texto + " bíéén ásícááláó";
     break;
     
     case 1:
     texto = texto + " bíéén réádý";    
     break;
     
     case 2:
     texto = texto + " oezíii";
     break;
     
   }
 }
 }


void keyPressed()
{
  if(keyCode == 8 && texto.length() != 0)
  {
    texto = texto.substring(0, texto.length()-1);
    
    if(texto.length() == textoOriginal.length()-1){
    textoOriginal = textoOriginal.substring(0, texto.length());
    }
  }
  
  else if(keyCode != 16 && keyCode != 8)
  {
    texto += key;
    textoOriginal += key;
  }
}

