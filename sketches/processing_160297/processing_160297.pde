
/*@title:Figuras de lissajous

@author:caioau@bardeen (caioalgusto@gmail.com)

TODO:ASAP:printar a freq x e y
     -alterar a velocidade pelo teclado?-ok
     -alterar a amplitude pelo teclado?
     -alterar a onda pelo teclado?
     -comentar!

*/
int sample = 500;
int freqx=1;
int freqy=1;
float amplitudex=250;
float amplitudey=250;
float pre=HALF_PI;
float pres = 0.01;
float step=TWO_PI/sample;
float[] xs = new float [sample+1];/*coordenadas x dos fasores*/
float[] ys = new float [sample+1];/*coordenadas y dos fasores*/

void setup() {
  for (int i=0; i<=sample; i++) {
    xs[i]=amplitudex*sin(step*i*freqx)+width/2;
    ys[i]=amplitudey*sin(step*i*freqy+pre)+height/2;
  }
  size(960, 620);
  background(255);
}

void draw() {
  background(255);
  fill(0, 0, 255);
  strokeWeight(3);
  stroke(0,0,120);
  for (int i=1; i<=sample; i++) {
    line(xs[i-1],ys[i-1],xs[i],ys[i]);    
    //ellipse(xs[i], ys[i], 5, 5);
  }
  for (int i=0; i<=sample; i++) {
    xs[i]=amplitudex*sin(step*i*freqx)+width/2;
    ys[i]=amplitudey*sin(i*step*freqy+pre)+height/2;
  }
  pre=pre+pres;
  if(pre>TWO_PI){
    pre=0;
  }
  textSize(20);
  text("freqx=",width-150, height-50);
  text(freqx,width-80,height-50);
  text("freqy=",width-150, height-30);
  text(freqy,width-80,height-30);
}

void keyPressed(){
 switch(key){
   case 'x':
   freqx++;
   break;
   case 'y':
   freqy++;
   break;
   case 'c':
   freqx--;
   freqx=constrain(freqx,0,1000);
   break;
   case 'u':
   freqy--;
   freqy=constrain(freqy,0,1000);
   break;
   case 'b':
    pres=pres+0.005;
   break;
   case 'v':
   pres = pres - 0.005;
   break;
 } 
}
