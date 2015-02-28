
/* @pjs preload="prueba.png","borrar.png","Images.png","guardar.png","logo.png","imagenes.png","Texto.png","TexDer.png","TexIzq.png","TextCent.png","Almohada.png","Cama.png","Cocina.png","Comida.png","Computador.png","Ducha.png","Fiesta.png","llave.png","Puerta.png","Ropa.png","Sofa.png"; font="Hashtag.ttf"; */
Butons botonImagenes;
Butons botonTexto;
Butons logo; 
Butons saves;
Butons borrar;
ArrayList imagenes;
ArrayList textos;
PanelTexto panelTexto;
PanelImagen panelImagen;
Boolean textoSelected;
Boolean imagenselected;
Boolean selectorImagenes;
PImage templateBasico;


SelectorImages selector;
void setup() {
  size(820, 620);
  logo = new Butons ("logo.png", 43, 43);  
  botonImagenes = new Butons ("imagenes.png", 22, 160); 
  botonTexto = new Butons ("Texto.png", 64, 160);
  saves =  new Butons ("guardar.png", 42, 590);
  borrar= new Butons("borrar.png",42,550);
  imagenes = new ArrayList();
  textos = new ArrayList();
  panelTexto= new PanelTexto();
  textoSelected = false;
  imagenselected= false;
  selectorImagenes = false;
  selector= new SelectorImages();
  panelImagen = new PanelImagen();
  templateBasico=  loadImage("Images.png");
}

void draw() {
  background(255);

  if (selectorImagenes==false) {
          image(templateBasico, 453,310,734,620);

    for (int i = 0; i <imagenes.size(); i++) { 
      Images imagenn = (Images) imagenes.get(i);
      imagenn.paint();
    }

    for (int i = 0; i <textos.size(); i++) { 
      Textfield textoss =  (Textfield) textos.get(i);
      textoss.paint();
    }

    noStroke();
         fill(255);
    rect(44, 310, 86, 620);
    fill(211, 77, 41);
    rect(43, 310, 86, 620);
 

    noFill();
    logo.paint();
    botonImagenes.paint();
    botonTexto.paint();
    saves.paint();
    borrar.paint();
    if (textoSelected) {
      panelTexto.paint();
    }

    if (imagenselected) {
      panelImagen.paint();
    }
  }
  else {
    selector.paint();
  }
}
void mouseDragged() { 


  for (int i = 0; i <imagenes.size(); i++) { 
    Images imagenn = (Images) imagenes.get(i);
    if (imagenn.isActive())
      if (imagenn.over() == true) {
        imagenn.move(mouseX, mouseY);
        imagenes.set(i, imagenn);
      }
  }


  for (int i = 0; i <textos.size(); i++) { 
    Textfield textoss =  (Textfield) textos.get(i);
    if (textoss.isActive())
      if (textoss.over() == true) {
        textoss.move(mouseX, mouseY);
        textos.set(i, textoss);
      }
  }
}

void mouseClicked() {
  if (selectorImagenes==false) {
    if (botonImagenes.over()) {

      textoSelected = false;

      selectorImagenes =true;
    }
    else if (botonTexto.over()) {
      textos.add( new Textfield (400, 200, "Your Text Here"));
      textoSelected = true;
      imagenselected=false;
    }
    else if(saves.over()){

    
     save("paraImprimir.pdf"); 
    } else if(borrar.over()){
      
      
        for (int i = 0; i <textos.size(); i++) { 
        Textfield textoss =  (Textfield) textos.get(i);
        if (textoss.isActive()) {
         textos.remove(i); 
        }
      }
      
      
           for (int i = 0; i <imagenes.size(); i++) { 
        Images imagenn = (Images) imagenes.get(i);
        if (imagenn.isActive()) {
               imagenes.remove(i);   
        }

      }
      
    } else if(logo.over()){
      
      imagenes = new ArrayList();
      textos = new ArrayList();
    }
    else {

      for (int i = 0; i <imagenes.size(); i++) { 
        Images imagenn = (Images) imagenes.get(i);
        if (imagenn.over()) {
          textoSelected = false;
          imagenselected = true;

          imagenn.active(true);

          imagenes.set(i, imagenn);
        }
        else if (mouseX>86) {
          imagenn.active(false);
          imagenes.set(i, imagenn);
        }
      }



      for (int i = 0; i <textos.size(); i++) { 
        Textfield textoss =  (Textfield) textos.get(i);
        if (textoss.over()) {

          textoSelected = true;
          imagenselected= false;

          textoss.active(true);

          textoss.set(i, textoss);
        }
        else if (mouseX>88) {
          textoss.active(false);
          textos.set(i, textoss);
        }
      }
    }


    if ( panelTexto.inputtOver()) {
      panelTexto.inputtActive(true);
    }
    else if (panelTexto.inputtActive()) {

      for (int i = 0; i <textos.size(); i++) { 
        Textfield textoss =  (Textfield) textos.get(i);
        if (textoss.isActive()) {
          textoss.cambiarTamano(panelTexto.inputtDevolverValor());
        }

        textos.set(i, textoss);
      }
      panelTexto.inputtActive(false);
    }

    if ( panelImagen.inputtOver()) {
      panelImagen.inputtActive(true);
    }
    else if (panelImagen.inputtActive()) {

      for (int i = 0; i <imagenes.size(); i++) { 
        Images imagenn = (Images) imagenes.get(i);
        if (imagenn.isActive()) {
          imagenn.resize(float(panelImagen.inputtDevolverValor()/100));
        }

        imagenn.set(i, textoss);
      }


      panelImagen.inputtActive(false);
    }
  }
  else {
    imagenes.add( new Images (selector.clickedd(), 400, 200));
    imagenselected = true;
    selectorImagenes = false;
  }
}






void keyPressed() {
  for (int i = 0; i <imagenes.size(); i++) { 
    Images imagenn = (Images) imagenes.get(i);
    if ((imagenn.isActive())&&((keyCode== BACKSPACE)|| (keyCode== DELETE)))
      imagenes.remove(i);
  }

  if (panelTexto.inputtActive()==false) {
    for (int i = 0; i <textos.size(); i++) { 
      Textfield textoss =  (Textfield) textos.get(i);
      if (textoss.isActive()) {
        if ((keyCode== BACKSPACE)|| (keyCode== DELETE)) {
          textoss.eraselastchar();
        }
        else if (keyCode!= RETURN || keyCode!=ENTER) {
          textoss.changeText(key);
        }

        textos.set(i, textoss);
      }
    }
  }
  else {
    if ((keyCode== BACKSPACE)|| (keyCode== DELETE)) {
      panelTexto.inputtEraselastchar();
    }
    else {
      panelTexto.inputtChangeText(key);
    }
  }


  if (panelImagen.inputtActive()) {
    if ((keyCode== BACKSPACE)|| (keyCode== DELETE)) {
      panelImagen.inputtEraselastchar();
    }
    else {
      panelImagen.inputtChangeText(key);
    }
  }
}

class Butons {  
  PImage img; 
  int x;
  int y;
  int w;
  int h ;
  int nH;
  int nW;
  boolean act;
  Butons (String name, int nX, int nY ) { 
   
    x= nX;
    y= nY;
      imageMode(CENTER);
      rectMode(CENTER);
      noFill();

    img = loadImage(name);
     w=img.width;
     h =img.height;
     nH=h;
     nW=w;
     act = false;
   
  } 
  
  
  void paint() { 


     if(over(mouseX,mouseY)){
 tint(220);    
}
    image(img, x,y,nW,nH );

tint(255);
     
  }
  
 

  
  boolean over (int mouX, int mouY){
    if((mouseX<((nW/2)+x))&&(mouseX>(x-(nW/2)))&&(mouseY<((nH/2)+y))&&(mouseY>(y-(nH/2)))){
     return true; 
    }else{
    return false;
    }
  }
  

  

  
}
  
  

class Butons2 {  
  PImage img; 
  int x;
  int y;
  int w;
  int h ;
  int nH;
  int nW;
  boolean act;
  String path;
  Butons2 (String name, int nX, int nY ) { 
   path=name;
    x= nX;
    y= nY;
      imageMode(CENTER);
      rectMode(CENTER);
      noFill();

    img = loadImage(name);
     w=img.width;
     h =img.height;
     nH=40;
     nW=40;
     act = false;
   
  } 
  
  
  void paint() { 

if(over())
tint (150);

if(img.width<img.height){
    image(img, x,y,(img.width*125)/img.height,125 );
    nH=125;
    nW=(img.width*150)/img.height;
}
if(img.width>img.height){
    image(img, x,y,150,(img.height*150)/img.width );
   nH=(img.height*150)/img.width;
    nW=150;
}
tint(255);
     
  }
  
 

  
  boolean over (){
    if((mouseX<((nW/2)+x))&&(mouseX>(x-(nW/2)))&&(mouseY<((nH/2)+y))&&(mouseY>(y-(nH/2)))){
     return true; 
    }else{
    return false;
    }
  }
  
String returnNamer(){

 return path; 
}
  

  
}
  
class Images { 
  PImage img; 
  int x;
  int y;
  int w;
  int h ;
  int nH;
  int nW;
  boolean act;
  Images (String name, int nX, int nY ) { 
   
    x= nX;
    y= nY;
      imageMode(CENTER);
      rectMode(CENTER);
      noFill();

    img = loadImage(name);
     w=img.width;
     h =img.height;
     nH=h;
     nW=w;
     act = true;
   
  } 
  
  
  void paint() { 


     
    image(img, x,y,nW,nH );
    if(isActive()){
      stroke(211,77,41);
           noFill();

     rect(x,y,nW+10,nH+10);
     fill(255);
     rect((x+(nW/2))+5,(y+(nH/2))+5,10,10);
     rect((x+(nW/2))+5,(y-(nH/2))-5,10,10);
     rect((x-(nW/2))-5,(y+(nH/2))+5,10,10);
     rect((x-(nW/2))-5,(y-(nH/2))-5,10,10);
     noStroke();
     noFill();
 }

     
  }
  
  void move(int nX, int nY){
    x = nX;
    y = nY;

  }
  
  void resize(float procentaje){
   nH = round(h*procentaje);
   nW =round(w*procentaje);
  }
  
  boolean over (){
    if((mouseX<((nW/2)+x))&&(mouseX>(x-(nW/2)))&&(mouseY<((nH/2)+y))&&(mouseY>(y-(nH/2)))){
     return true; 
    }else{
    return false;
    }
  }
  
  void active(boolean n){
    act= n;
  }

  boolean isActive(){
   return act; 
  }
  

}
  
  

class PanelImagen{

  Textbox inputt;


  PanelImagen(){
      textFont(createFont("serif"), 20);
      inputt = new Textbox(43,290);
      inputt.cambiarUnidades("%");
      inputt.setText("100");
  }
  
  void paint(){
    fill(255);
     textFont(createFont("serif"), 16);
    textAlign(CENTER, TOP);
    text("resize", 43, 250);
    inputt.paint();
    
    

  }
  
  
   Boolean inputtActive(){
     return inputt.isActive();
   }
   
      void inputtActive(Boolean s){
      inputt.active(s);
   }
   
      void inputtChangeText(char s){
      inputt.changeText(s);
   }
   
      void inputtEraselastchar(){
      inputt.eraselastchar() ;
   }
   
   Boolean inputtOver(){
     return inputt.over();
   }
   
   int inputtDevolverValor(){
    return  inputt.getText();
   }
   

}
class PanelTexto{

  Textbox inputt;


  PanelTexto(){
      textFont(createFont("serif"), 20);
      inputt = new Textbox(43,290);
      
  }
  
  void paint(){
    fill(255);
     textFont(createFont("serif"), 16);
    textAlign(CENTER, TOP);
    text("size", 43, 250);
    inputt.paint();
    
    

  }
  
  
   Boolean inputtActive(){
     return inputt.isActive();
   }
   
      void inputtActive(Boolean s){
      inputt.active(s);
   }
   
      void inputtChangeText(char s){
      inputt.changeText(s);
   }
   
      void inputtEraselastchar(){
      inputt.eraselastchar() ;
   }
   
   Boolean inputtOver(){
     return inputt.over();
   }
   
   int inputtDevolverValor(){
    return  inputt.getText();
   }
   

}
class SelectorImages {
  Butons2 almohada;
  Butons2 cama;
  Butons2 cocina;
  Butons2 comida;
  Butons2 computadora;
  Butons2 ducha;
  Butons2 fiesta;
  Butons2 llave;
  Butons2 puerta;
  Butons2 ropa;
  Butons2 sofa;
  SelectorImages() {
    int tama =(600/3);
    int nTama = (800/4);
    almohada = new Butons2("Almohada.png", (nTama/2)+(nTama*0), (tama/2)+(tama*0));
    cama = new Butons2("Cama.png", (nTama/2)+(nTama*1), (tama/2)+(tama*0));
    cocina = new Butons2("Cocina.png", (nTama/2)+(nTama*2), (tama/2)+(tama*0));
    comida = new Butons2("Comida.png", (nTama/2)+(nTama*3), (tama/2)+(tama*0));
    computadora = new Butons2("Computador.png", (nTama/2)+(tama*0), (tama/2)+(nTama*1));
    ducha = new Butons2("Ducha.png", (nTama/2)+(nTama*1), (tama/2)+(tama*1));
    fiesta = new Butons2("Fiesta.png", (nTama/2)+(nTama*2), (tama/2)+(tama*1));
    llave = new Butons2("Llave.png", (nTama/2)+(nTama*3), (tama/2)+(tama*1));
    puerta = new Butons2("Puerta.png", (nTama/2)+(nTama*0), (tama/2)+(tama*2));
    ropa = new Butons2("Ropa.png", (nTama/2)+(nTama*1), (tama/2)+(tama*2));
    sofa = new Butons2("Sofa.png", (nTama/2)+(nTama*2), (tama/2)+(tama*2));
  }

  void paint() {
    almohada.paint();
    cama.paint();
    cocina.paint();
    comida.paint();
    computadora.paint();
    ducha.paint();
    fiesta.paint();
    llave.paint();
    puerta.paint();
    ropa.paint();
    sofa.paint();
  }

  String clickedd() {
    if (almohada.over()){
    return  almohada.returnNamer();
    }
    if (cama.over()){
    return  cama.returnNamer();
    }
    if (cocina.over()){
    return  cocina.returnNamer();
    }
    if (comida.over()){
    return  comida.returnNamer();
    }
    if (computadora.over()){
    return  computadora.returnNamer();
    }
    if (ducha.over()){
    return  ducha.returnNamer();
    }
    if (fiesta.over()){
    return  fiesta.returnNamer();
    }
    if (llave.over()){
    return  llave.returnNamer();
    }
    if (puerta.over()){
    return  puerta.returnNamer();
    }
    if (ropa.over()){
    return  ropa.returnNamer();
    }
    if (sofa.over())
    return  sofa.returnNamer();
  }
}

class Textbox {
  String texto;
  Boolean act;
  int w;
  int h;
  int x;
  int y;
  String origen; 
  String unidades;

  Textbox(int nX, int nY ) {
    unidades= "pt";
    origen= "30 pt";
    x=nX;
    y=nY; 
    textFont(createFont("serif"), 20);
    w=80;
    h=25;
    act=false;
    texto="";
  }

  void paint() {
 
      rect(x, y, 80, 25);
    fill(211,77,41);
    if (texto.equals("")&&(act==false)) {
      text(origen, x, y-10);
    }
    else {
      text(texto+" " + unidades, x, y-10);
    }


    fill(255);
  }



  boolean over () {
    if ((mouseX<(w+x-(w/2)))&&(mouseX>x-(w/2))&&(mouseY<(h+y-(h/2)))&&(mouseY>y-(h/2))) {
      return true;
    }
    else {
      return false;
    }
  }

  void active(boolean n) {
    act= n;
    if (n) {
      texto = "";
    }
  }

  boolean isActive() {
    return act;
  }


  void changeText(char s) {
    if ((s == '1')||(s == '2')||(s == '3')||(s == '4')||(s == '5')||(s == '6')||(s == '7')||(s == '8')||(s == '9')||(s == '0')) {
    texto = texto + String(s);
    }
  }
  
  void setText(String s){
    texto = s;
  }

  void eraselastchar() {
    int n= texto.length() - 1;

    texto= texto.substring(0, n) ; 
  }
  
  void cambiarUnidades(String s){
    
   unidades = s; 
    
  }
  
  
  int getText(){
   return int(texto); 
  }
}
class Textfield {
  String texto;
  Boolean act;
  int w;
  int h;
  int x;
  int y; 
  String unidades;
  String position;
  int espacios;
 int tamano;
 int H;
  Textfield(int nX, int nY, String ste) {
    unidades="";
    x=nX;
    y=nY; 
    w=80;
    h=25;
    act=true;
    texto=ste;
    position ="left";
     espacios =1;
     tamano=30;

  }

  void paint() {
    textFont(createFont("Hashtag.ttf"), 12);

    fill(211,77,41);
    
    
  
    textAlign(LEFT, TOP);
    textSize(tamano);
      text(texto+" " + unidades, x, y);
    
     H = textAscent()+ textDescent();
    fill(255);
    
    if(act){
     
      stroke(211,77,41);
         noFill();
     rect(x+(textWidth(texto)/2),y+(H/2),textWidth(texto)+10,H+10);
     fill(255);
     rect(((x+(textWidth(texto)/2))+(textWidth(texto)/2))+5,((y+(H/2))+(H/2))+5,10,10);
     rect(((x+(textWidth(texto)/2))+(textWidth(texto)/2))+5,((y+(H/2))-(H/2))-5,10,10);
     rect(((x+(textWidth(texto)/2))-(textWidth(texto)/2))-5,((y+(H/2))+(H/2))+5,10,10);
     rect(((x+(textWidth(texto)/2))-(textWidth(texto)/2))-5,((y+(H/2))-(H/2))-5,10,10);
      if(frameCount%60>30) line(x+textWidth(texto),y+5,x+textWidth(texto),(H+y));
     noStroke();
     noFill();
     
     
      } 
   
     
 }
    
  



  boolean over () {
        textSize(tamano);
    if ((mouseX<(x+textWidth(texto)))&&(mouseX>x)&&(mouseY<(H+y))&&(mouseY>y)) {
      return true;
    }
    else {
      return false;
    }
  }

  void active(boolean n) {
    act= n;
    if (n) {
 
    }
  }

  boolean isActive() {
    return act;
  }


  void changeText(char s) {
    texto = texto + String(s);
  }

  void eraselastchar() {
    int n= texto.length() - 1;

    texto= texto.substring(0, n) ;
  }

  void cambiarUnidades(String s) {
   
    unidades = s;
  }


  String getText() {
    return texto;
  }
  
    void move(int nX, int nY){
    x = nX-(textWidth(texto)/2);
    y = nY-(H/2);

  }
  
  void cambiarTamano(int s){
    tamano = s;
  }
}



