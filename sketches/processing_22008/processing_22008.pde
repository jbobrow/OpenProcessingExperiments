
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
float stk;
Minim som;
AudioPlayer musica;

void setup () {
  
  stk=0.1;
  
  size (900,700); // tamanho da tela
  
  som = new Minim (this);
  musica = som.loadFile("02.mp3"); // vai buscar o ficheiro de som
  musica.play();
}


void draw () {
  background (random(255),random(230),random(225)); // cor do fundo
  //noFill ();
 stroke (stk);
 strokeWeight (01); 
  print (musica.bufferSize());
  
  beginShape ();
  
  fill(random(200),random(0),random(200));
  
  for (int i=mouseX+150; i<musica.bufferSize();i++)
{
float valor=musica.mix.get(i);
ellipse (i-100,( valor*500) + 350,i/5,i/5);

}
endShape();



 beginShape ();
 
 fill(random(0),random(200),random(200));
 
  for (int i=mouseX; i<musica.bufferSize();i++)
{
float valor=musica.mix.get(i);
ellipse (i,( valor*500) + 100,i/5,i/5);

}
endShape();

beginShape ();

fill(random(200),random(200),random(0));

  for (int i=mouseX+300; i<musica.bufferSize();i++)
{
float valor=musica.mix.get(i);
ellipse (i,( valor*500) + 600,i/5,i/5);

}
endShape();
}

