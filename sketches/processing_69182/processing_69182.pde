
PFont miletra;
PFont miTipo;
String[] mistipos = PFont.list();
int a=1;
int b=1;
int c=1;
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
  

miTipo= createFont(mistipos[a],200);
textFont(miTipo);
text("a",width/2+300,height/2+60);
miTipo= createFont(mistipos[b],200);
textFont(miTipo);

text("a",width/2,height-height/2+60);
miTipo= createFont(mistipos[c],200);
textFont(miTipo);

text("a", width/2-300,height-height/2+60);
 
a = int(random(1500));
b = int(random(1500));
c = int(random(1500));

}



