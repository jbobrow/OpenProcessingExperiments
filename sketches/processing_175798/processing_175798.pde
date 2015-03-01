
float counter = 0;

void setup()
{ smooth();
  colorMode(HSB,360,100,100);
  size(500,500);
}

void draw()
{ 
  //Hintergrund
  float hintergrundfarbe=map(mouseX,0,500,100,50);
  background(200,100, hintergrundfarbe);
  noStroke();
  fill(#33C94A);
 
 
 
   //Gras
   for (int i=0; i<width; i+=40)
   {
     
   pushMatrix();
   fill(#199B1E);
 
   float ver = sin(millis()/1000.0+i)*5;
   text ("Gras",i+ver,500);
   text ("Gras",i+ver,450);
   popMatrix();
   
   }
  
  
  //Wolken
    fill(#FFFFFF);
    //1 Reihe
    textSize(50);
    text("Wolke",10,110);
    text("Wolke",300,110);
    text("Wolke",150,100);
    text("Wolke",400,100);
    //2 Reihe
    textSize(30);
    text("Wolke",10,80);
    text("Wolke",300,80);
    text("Wolke",150,90);
    text("Wolke",400,90);
    //3 Reihe
    textSize(60);
    text("Wolke",10,50);
    text("Wolke",300,50);
    text("Wolke",150,40);
    text("Wolke",400,70);
    

  
  //BLumen
  strokeWeight(2);//Dicke des B.S
  stroke(#0C671B);//Farbe des B.S
  
  float amplitude = map(sin(counter), -1, 1, -50, 50);
  counter += 0.025;
  
  line(250+amplitude,250,250,410);//Position des B.S
   for (int i=0; i<360; i+=40){
   
   
  }
  
  ellipseMode(CENTER);
  fill(#FFE603);
  noStroke();
  ellipse(250+amplitude,250,50,50);
  textMode(CENTER);
  fill(#FFFFFF);
  }
  
