
int[][] points = { {50,18}, {61,37}, {83,43}, {69,60},  
        {71,82}, {50,73}, {29,82}, {31,60},  
        {17,43}, {39,37} }; 

int tam;
int tam2;
int tam3;
  
  void setup()
  {
  size(480,317);
  noStroke();
tam = 0;
tam2 = 50;
tam3 = 100;

  }
  
  void draw()
  {
  
  PImage img = loadImage("meteoro1.jpg");
  background(0);
  
  //translate(mouseX, mouseY);
  //ellipse(0,0, 200,200);

   fill(255, 50);
    ellipse( random(mouseX/4, mouseX*4) ,random(mouseY/4,mouseY*4), tam3++ , tam3++ );
       fill(255, 150);
    ellipse( random(mouseX/2, mouseX*2) ,random(mouseY/2,mouseY*2), tam2++ , tam2++ );
       fill(255);
    ellipse( random(mouseX-30, mouseX+30) ,random(mouseY-30,mouseY+30), tam++ , tam++ );
    
if(tam >= 50){tam = 0;};
if(tam2 >= 100){tam2 = 50;};
if(tam3 >= 150){tam3 = 100;};
  /*
    //Con esta función translado el punto 0, 0 a la 
    //coordenada que indico, en este caso la del mouse
    translate(mouseX - 50, mouseY - 50);
     
    //Acá empiezo a crear una forma
    beginShape(); 
    for (int i = 0; i < points.length; i++) { 
      
      //Aca usamos la función vertex para crear una figura con vertice.
      //Luego veremos mejor como funciona.
      vertex(points[i][0], points[i][1]);
    }
    //Acá termino de crear una forma
    endShape(); 
   */ 
    blend(img, 0, 0, width, height, 0, 0, width, height, DARKEST); 
  }

