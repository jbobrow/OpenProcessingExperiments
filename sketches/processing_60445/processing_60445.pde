
PFont miTipo;
PFont miTipo2;
PFont miTipo3;

int incremento;


void setup()

{
  size (600,600);
  
 
  
  miTipo=loadFont ("CenturyGothic-50.vlw");
    miTipo2=loadFont ("ARG219am-50.vlw");
    miTipo3=loadFont ("Arial-Black-50.vlw");
   frameRate(8);
 
  incremento=0;
  
}

void draw()
{

   background(0);
  fill(100,100,255,100);
 rect( random(0) , random(10) , 50 , 50 );
 
 fill(224,0,166,100);
  rect( random(10) , random(400) , 50 , 50 );
  
  fill(146,6,237,100);
 rect( random(300) , random(300) , 50 , 50 );
 
    fill(224,0,166,100);
  rect( random(200) , random(340) , 80 , 80 );
  
    fill(146,6,237,100);
 rect( random(500) , random(550) , 50 , 50 );
 
    fill(224,0,166,100);
  rect( random(550) , random(550) , 80 , 80 );
  
  fill(100,100,255,100);
 rect( random(100) , random(300) , 80 , 80 );
 
  fill(146,6,237,100);
 rect( random(300) , random(240) , 80 , 80 );
  
  fill(224,0,166,100);
  rect( random(250) , random(100) , 120 , 120 );
  
  fill(100,100,255,100);
 rect( random(width) , random(height) , 120 , 120 );
 
  fill(146,6,237,100);
 rect( random(width) , random(height) , 120 , 120 );
  
  
  
  
  
  
textFont(miTipo); 

 fill(random(224),random(0),random(166));
  
  text("RocanLover",random(width) , random(height));

  textFont(miTipo);
  
  
  fill(random(224),random(0),random(166));
  
  text("RocanLover",random(width) , random(height));
  
  textFont(miTipo2,incremento);
  
  
  fill(random(146),random(6),random(237));
  
  text("Reptilectic",random(width) , random(height));
  
   textFont(miTipo2);
  
  
  fill(random(146),random(6),random(237));
  
  text("Reptilectic",random(width) , random(height));
  
  
    incremento++;
    
    textFont(miTipo3);
    text("Zoé",mouseX,mouseY);
    
    if (mousePressed){

 incremento=0;
 background(0);
}

}
