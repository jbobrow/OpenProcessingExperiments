
/**
gerador de arte abstrata sketch versão beta001

http://oficinaprocessing.com

Caleb Mascarenhas

 */
PFont texto, texto2;
float a;
float r ;
float y ;
float corMouseX;
float corMouseY;
void setup() {
  size(600, 500);
  smooth(); 
  background(0);
  texto = loadFont("Faltura-48.vlw");
  a=0;
}

void draw() {
  corMouseX=mouseX;
  corMouseY=mouseY;
stroke(230);
  for ( int x = 0; x < width; x+=50) {
    
      
      line(x, 0, x, height);
      for (int z=0;z<height;z+=25) {
      noStroke();
        if(x%75 == 0){
        fill(0,corMouseY+random(255),0,150);
        ellipse(x+(random(-5,5)),random(z),2+x/30,2+z/30);
        
      }else if(z%200==0||x%80==0){
      fill(corMouseX,0,random(55),230);
        rect(x+a,z,x,z);
      }
    }
  }
a++;
if(a>=width/2||a<0){
  a=a*-1;
}
  fill(255);
  textAlign(CENTER);
  textFont(texto, 80);
  text("Oficina Processing", width/2, 130);
  textFont(texto, 80);
  text("Outubro 2011", width/2, 190);
  textFont(texto, 60);
  text("18 a 21 Sesc Riberão Preto", width/2, 330);
textFont(texto, 60);
  text("25 a 4/nov Sesc Belenzinho", width/2, 380);
  textFont(texto, 25);
  text("http://oficinaprocessing.com", width/2, 420);
  
}


void keyPressed() {
  redraw();
}


