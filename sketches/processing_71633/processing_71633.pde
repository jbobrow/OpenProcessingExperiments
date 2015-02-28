
int n=15;
int b=0;
float x[]= new float [n];
float y[]= new float [n];
String[] mistipos = PFont.list();
int a=1;
PFont letra;
PFont miTipo;
//velocidad
float v=0.1;

void setup(){
size(1000,800);
letra= createFont("FedraSans-Book-48",1);
textFont(letra,48);
}
void draw(){
background(255);

x[0] += v * (mouseX-x[0]);
y[0] += v * (mouseY-y[0]);

//lena el arreglo y la distancia de cada palabra
for (int i=1; i<n;i++){
x[i] += v * (x[i-1]-x[i]);
y[i] += v * (y[i-1]-y[i]);
}

//dibuja las letras
for (int i=0;i<n;i++){
  
  miTipo= createFont(mistipos[a],30);
textFont(miTipo);
  fill(0);
text("The quick brown fox jumps over the lazy dog",x[i],y[i]);
if (b>1000){
  b=0;

a=int(random(1200));
}
b++;
}
}

