
//int[] lista= {32,5,31,0,-40};
//print(lista[2]);
//lista[0]= 8;

//float[] otra= new float [8000]; 

//for(int pLista= 0; pLista<8000 ; pLista++){
 //otra[pLista] =int (random(100));
//println(otra[pLista]); 
//}
//println(otra[52]);
int cuantos = 5000;
float[] px = new float[cuantos];
float[] py = new float[cuantos];
float[] tm = new float[cuantos];
float[] vl = new float[cuantos];
color[] colores = new color[cuantos];
void setup() {
  colorMode(HSB);
  size(500,500);
noStroke();
//strokeWeight(7);
  for (int L = 0; L<cuantos ; L++) {
    px[L] = random(500);
    py[L] = random(500);
    tm[L] = random(2,10);
    vl[L] = random(0.1,5);
    colores[L] = color(random(200),255,255);
  }
}
void draw(){
  background(255);
  for (int L = 0; L<cuantos ; L++) {
    fill(colores[L]);
    ellipse(px[L],py[L],tm[L],tm[L]);
    px[L] = px[L] + vl[L];
    if(px[L]>width){
    px[L]=0;
    }
  }
}
