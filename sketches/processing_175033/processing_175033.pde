
float colorPaleta1 = random (255);
float colorPaleta2 = random (255);
float colorPaleta3 = random (255);
float ancho= 1;

void setup()
{
 size (1000,900);
 background(255,255,255);

}
void draw()
{
  
  //line();
  if(mousePressed){
  if (mouseX > 149){
   
   strokeWeight(ancho); 
  stroke(colorPaleta1,colorPaleta2,colorPaleta3);
line(mouseX, mouseY, pmouseX, pmouseY);
strokeWeight(1);
  } 
  
  if(mouseX>16 && mouseX<31 && mouseY > 51 && mouseY<526){
   colorPaleta1 = 255;
 colorPaleta2 = 0;
 colorPaleta3 = 0;
  }
  else if (mouseX>32 && mouseX<45 && mouseY>51 && mouseY<526){
   colorPaleta1 = 0;
 colorPaleta2 = 255;
 colorPaleta3 = 0;
  }
  else if (mouseX>49 && mouseX<65 && mouseY>51 && mouseY<526){
   colorPaleta1 = 0;
 colorPaleta2 = 0;
 colorPaleta3 = 255;
  }
   else if (mouseX>66 && mouseX<83 && mouseY>51 && mouseY<526){
   colorPaleta1 = 0;
 colorPaleta2 = 0;
 colorPaleta3 = 0;
  }
   else if (mouseX>84 && mouseX<105 && mouseY>51 && mouseY<526){
   colorPaleta1 = 255;
 colorPaleta2 = 255;
 colorPaleta3 = 255;
  }
   else if (mouseX>105 && mouseX<125 && mouseY>51 && mouseY<526){
   colorPaleta1 = random(255);
 colorPaleta2 = random(255);
 colorPaleta3 = random(255);
  }
   if (mouseX>22 && mouseX<48 && mouseY>539 && mouseY<569){
   background(255,255,255);
  }
/*  else {
    colorPaleta1 = 0;
 colorPaleta2 = 0;
 colorPaleta3 = 0;
  }*/
}
  
//paleta
   noStroke();
 fill(143,143,143);
  rect(0,0,150,900);
fill(colorPaleta1,colorPaleta2,colorPaleta3);
  rect(15,50,111,800);
  
  //Titulo
  
   textSize(20);
   text("Jpaint",35,30);
   
   //Color Rojo
   fill(255,0,0);
   stroke(255,255,255);
   rect(15,50,20,478);
   
   //color Verde
   fill(0,255,0);
   stroke(255,255,255);
   rect(30,50,20,478);
   
   //Color Azul
    fill(0,0,255);
   stroke(255,255,255);
   rect(46,50,20,478);
   
   //Color Negro
    fill(0,0,0);
   stroke(255,255,255);
   rect(65,50,20,478);
   
   //Color Blanco
    fill(255,255,255);
   stroke(255,255,255);
   rect(85,50,20,478);
   
     //Color Random
    fill(random(255),random(255),random(255));
     stroke(255,255,255);
   rect(105,50,20,478);
   
  
   
 
   
 // println(mouseX,mouseY);
 //Reset
 fill(255,255,255);
ellipse(34,553,30,30);
  fill(0,0,0);
  textSize(25);
   text("R",28,563);
   
   
   //Aumentar pincel
   
   fill(255,255,255);
  ellipse(74,553,30,30);
   strokeWeight(5);
   stroke(0,0,0);
  line(74,540,74,565);
  line(61,552,87,552);
  strokeWeight(1);
  if(mouseX>60 && mouseX<91 && mouseY>539 && mouseY<572){
  ancho=5;
  }
  
  //Disminuir pincel
    fill(255,255,255);
  ellipse(107,553,30,30);
   strokeWeight(5);
   stroke(0,0,0);
 // line(107,540,107,565);
 line(97,552,117,552);
  strokeWeight(1);
  if(mouseX>95 && mouseX<124 && mouseY>538 && mouseY<572){
  ancho=1;
  
  }

}


