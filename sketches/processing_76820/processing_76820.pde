
int posicion=20;
void setup (){
noStroke();
size (200,200);

}
void draw(){

noStroke();
  size(200,200);

  

  background (0,0,0);

    //ventana
  noStroke();
  fill (0,255,255);
  rect (80,20,50,50);
  
  noStroke();
  fill (0,255,255);
  rect (140,20,50,50);
  
  noStroke();
  fill (0,255,255);
  rect (80,80,50,50);
  
  noStroke();
  fill (0,255,255);
  rect (140,80,50,50);
  //susto
    //ventana 
        if (mousePressed) {
      noStroke();
  fill (87, 35, 100);
  rect (80,20,50,50);
  
  noStroke();
  fill (87, 35, 100);
  rect (140,20,50,50);
  
  noStroke();
  fill (87, 35, 100);
  rect (80,80,50,50);
  
  noStroke();
  fill (87, 35, 100);
  rect (140,80,50,50);
  //cara

    stroke (0);
   fill(255);
   ellipse(100,105,30,50);
   fill(0);
   ellipse(100,116,8,20);
      fill(0);
   ellipse(95,96,8,8);
   ellipse(106,96,8,8);
   noStroke();  
  }
  //cara
  fill (224,195,158); 
  ellipse(0,100,100,100)  ;
  fill (0,0,0); 
  ellipse(20,85,10,mouseY/10)  ;
  arc (50,130,50,mouseY/7,3.14,6.28);
  fill (224,195,158); 
  //rect(0,99,posicion,10);
  arc (0,99,mouseX,10,3.14,8);
  fill (0,0,0);
  stroke (255,255,255,255);
  rect (0,55,50,10);
  rect (0,15,30,40);

  
 
}



