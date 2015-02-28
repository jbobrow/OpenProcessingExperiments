
// Patrícia e Thais 
//Flor
int x=-100;
 int y=25;
 void setup (){
  size (200, 200);
  background (250);
}
    
 void draw (){
  int spacing= 05;// espaço entre as bolinhas
  int endegs=200;
  stroke (252,41,18);
  strokeWeight(6);
    x=x+spacing;
    point (x+100,x*x/100+100); //linha de baixo
     point (-x+100,-x*x/100+100); //linha de cima
      point (x*x/100+100, x+100); // lateral
     point (-x*x/100+100, -x+100);// lateral
      
  }
