
PFont miletra;
PFont miTipo;
String[] mistipos = PFont.list();
int a=1;
void setup(){
size(1080,500);
frameRate(2);
textAlign(CENTER);

//println(mistipos); //Despliega fuentes cargadas en mistipos

}

void draw(){
  background(255);
    fill(0);
  
  rect(0,0,width,height/2-150);
  rect(0,height-height/2+150,width,height);
  

miTipo= createFont(mistipos[a],30);
textFont(miTipo);
textSize(40);
text(".",width/2,height/2-100);
textSize(30);
text("The quick brown fox jumps over the lazy dog",width/2,height/2-50);
textSize(20);
text("Aa Bb Cc Dd Ee Ff Gg Hh Ii Jj Kk Ll Mm",width/2,height-height/2);
text("Nn Oo Pp Qq Rr Ss Tt Uu Vv Ww Xx Yy Zz", width/2,height-height/2+30);
text("0 1 2 3 4 5 6 7 8 9",width/2, height-height/2+60); 
textSize(25);

text("El veloz murciélago hindú comía feliz cardillo y kiwi",width/2, height-height/2+100); 

a = int(random(1500));

}



