
int mida = 50;
float llarg= 40;
float pos =1;

void setup(){
size (500,500);

}

void draw (){
background(#FA0303);

ellipse (mouseX,0, mida, mida);
rect (0,mouseY-20, 20,50);
fill(#FFFFFF);

stroke(#F50707);

ellipse (mouseX,500, mida, mida);

rect (480,mouseY-20, 20,50);
rect (mouseX-100,mouseY-100,200,200);
noFill ();

ellipse (mouseX,mouseY-100,mida,mida);
ellipse (mouseX,mouseY+100,mida,mida);
rect (mouseX+80, mouseY-20, 20,50);
rect (mouseX-mida*2, mouseY-20, 20,50);
fill(#FFFFFF);

llarg= mouseY/4;

line (mouseX-llarg , mouseY -llarg , mouseX+llarg ,mouseY+llarg );
line (mouseX-llarg , mouseY + llarg  , mouseX+llarg ,mouseY-llarg );




  pos = pos + 4 ;
  ellipse (pos, pos, mida, mida);
  
  ellipse (pos,pos,mida,mida);
  
  println(pos);
  
} 


