
//Declaració d'imatges
PImage  bina,octa,deci,hexa,calc,esbo,quadI,textB,quadB,textO,quadO,textD,quadD,textH,quadH;

//Declaració Text/Scanner
String typedText = "Selecciona un tipus";
PFont font;

boolean binari, octal, decimal, hexadecimal = false;

void setup(){
  size (400,400);
  background (200);
  
  //Càrrega d'imatges
  bina = loadImage("img/bina.png");
  octa = loadImage("img/octa.png");
  deci = loadImage("img/deci.png");
  hexa = loadImage("img/hexa.png");
  quadI = loadImage("img/quadI.png");
  calc = loadImage("img/calc.png");
  esbo = loadImage("img/esbo.png");
  textB = loadImage("img/textB.png");
  quadB = loadImage("img/quadB.png");
  textO = loadImage("img/textO.png");
  quadO = loadImage("img/quadO.png");
  textD = loadImage("img/textD.png");
  quadD = loadImage("img/quadD.png");
  textH = loadImage("img/textH.png");
  quadH = loadImage("img/quadH.png");
  
  //Càrrega Text/Scanner
  font = createFont("Helvetica", 18);
}

void draw(){
  //Dibuix d'imatges
  image(bina, 10,20);
  image(octa, 110,20);
  image(deci, 210,20);
  image(hexa, 310,20);
  image(quadI, 45,70);
  image(calc, 100,125);
  image(esbo, 210,125);
  image(textB, 15,187);
  image(quadB, 75,187);
  image(textO, 15,237);
  image(quadO, 75,237);
  image(textD, 15,287);
  image(quadD, 75,287);
  image(textH, 15,337);
  image(quadH, 75,337);
  //Dibuix línia
  line(7,170, 393,170);
  
  //Canvis icones fletxa/mà/text
    //Botó Binari
    if (mouseX > 10 && mouseX < 90 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
    //Botó Octal
    }else if (mouseX > 110 && mouseX < 190 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
    //Botó Decimal
    }else if (mouseX > 210 && mouseX < 290 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
    //Botó Hexadecimal
    }else if (mouseX > 310 && mouseX < 390 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
    //Botó Calcula
    }else if (mouseX > 100 && mouseX < 190 && mouseY > 125 && mouseY < 155) {
        cursor(HAND);
    //Botó Esborra
    }else if (mouseX > 210 && mouseX < 300 && mouseY > 125 && mouseY < 155) {
        cursor(HAND);
    //Quadrat Text/Scanner
    }else if (mouseX > 45 && mouseX < 355 && mouseY > 70 && mouseY < 105) {
        cursor(TEXT);
    //Predeterminat
    }else{
        cursor(ARROW);
    }
  
  //Dibuix Text/Scanner
  fill(0,0,0);
  textFont(font,18);
    //Barra baixa que fa pampallugues
    text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 55, 95);
  
  //Coordenades
  //println(mouseX + ":" + mouseY);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

void mousePressed(){
    //Botó Binari
    if (mouseX > 10 && mouseX < 90 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
        binari = true;
        octal = decimal = hexadecimal = false;
    //Botó Octal
    }else if (mouseX > 110 && mouseX < 190 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
        octal = true;
        binari = decimal = hexadecimal = false;
    //Botó Decimal
    }else if (mouseX > 210 && mouseX < 290 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
        decimal = true;
        octal = binari = hexadecimal = false;
    //Botó Hexadecimal
    }else if (mouseX > 310 && mouseX < 390 && mouseY > 20 && mouseY < 50) {
        cursor(HAND);
        hexadecimal = true;
        octal = decimal = binari = false;
    //Botó Calcula
    }else if (mouseX > 100 && mouseX < 190 && mouseY > 125 && mouseY < 155) {
        cursor(HAND);
        calcular();
    //Botó Esborra
    }else if (mouseX > 210 && mouseX < 300 && mouseY > 125 && mouseY < 155) {
        cursor(HAND);
        esborrar();
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

void calcular(){
  //println("binari:"+binari+" decimal:"+decimal+" octal:"+octal+" hexadecimal:"+hexadecimal);
  String resDecimal,resHexa,resBinari,resOctal="";
  
  if (decimal==true){
     int num_deci = Integer.parseInt(typedText);
     
     //Decimal
     resDecimal = String.valueOf(num_deci);
     text(resDecimal, 85, 315);
     
     // Passar a binari
     int aux=0;
     resBinari="";
            while(num_deci!=0){
                aux=num_deci%2;
                resBinari=String.valueOf(aux)+resBinari;
                num_deci=num_deci/2;
            }
      text(resBinari, 85, 215);
      
      //Passar a octal
      aux=0;
      resOctal="";
      num_deci = Integer.parseInt(typedText);
            while(num_deci!=0){
                    aux=num_deci%8;
                    resOctal=String.valueOf(aux)+resOctal;
                    num_deci=num_deci/8;
            }
      text(resOctal, 85, 265);
            
      //Passar a hexadecimal
      aux=0;
      resHexa="";
      char c ='a';
      num_deci = Integer.parseInt(typedText);
            while(num_deci!=0){
                    aux=num_deci%16;
                    if (aux < 10){
                      resHexa=String.valueOf(aux)+resHexa;
                    }else{
                        switch(aux){
                            case 10 :c ='A';break;
                            case 11 :c ='B';break;
                            case 12 :c ='C';break;
                            case 13 :c ='D';break;
                            case 14 :c ='E';break;
                            case 15 :c ='F';break;
                        }
                        resHexa=String.valueOf(c)+resHexa;
                    }
                    num_deci=num_deci/16;
            }
      text(resHexa, 85, 365);
  
  /*************************************************************/
  
  }else if (octal == true){
    //Passar a decimal
     int num_oct = Integer.parseInt(typedText);
     
     int aux=1;
     int res = 0;
     resDecimal="";
     
            while(num_oct!=0){
                 int x = num_oct % 10;
                 res += x*aux;
                 num_oct /= 10;
                 aux = aux * 8;
            }
            
     text(res, 85, 315);
            
  /*************************************************************/
  
  }else if (binari == true){
    
    //Passar a decimal
     int num_bin = Integer.parseInt(typedText);
     
     int aux=1;
     int res = 0;
     resDecimal="";
     
            while(num_bin!=0){
                 int x = num_bin % 10;
                 res += x*aux;
                 num_bin /= 10;
                 aux = aux * 2;
            }
            
     text(res, 85, 315);
            
  /*************************************************************/
  
  }else if (hexadecimal == true){
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

void esborrar(){
  typedText="";
  background (200);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

//Text/Scanner
void keyReleased(){
    if (key != CODED){
        switch(key){
        case BACKSPACE:
            typedText = typedText.substring(0,max(0,typedText.length()-1));
            break;
        case ENTER:
        case RETURN:
        case ESC:
        case DELETE:
            break;
        default:
            typedText += key;
        }
    }
}

