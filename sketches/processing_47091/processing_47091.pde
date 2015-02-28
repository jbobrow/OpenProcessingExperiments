

PImage foto;
float x=0.98;
float y=0.68;
//int x=10;   
//int y=23;
void setup(){     
size (400, 400); 
foto = loadImage("fondoprocessing.JPG");
background (0); 
image(foto, 0,0,400,400 );
}

void draw (){   
  
fill (random (194),random (119),random (191),240);
ellipse (mouseX,222, mouseY ,x);
x= x+0.2;
y= y+0.1;
}



