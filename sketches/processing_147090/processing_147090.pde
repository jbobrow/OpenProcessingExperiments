
/* Trabalho Calculo Numerico - Serie de fourier - 1s2014 - IMECC - Unicamp
 
 Descricao: O programa faz a animacao dos fasores da serie de fourier de uma onda quadrada.
 A onda quadrada eh aproximada por fourier pela serie: f(x) = sin(x) + sin(3x)/3 + sin(5x)/5 + ...
 Entao o programa desenha cada termo da serie como um fasor
 
 Grupo:
 Caio Volpato - 145544 - caioalgusto@gmail.com
 Caique Rodrigues - 145580
 Lucas Garcia - 148762
 Henrique Grigoli - ???
 Rodrigo Oliveira  - ???
 
 TODO:
 -limpar codigo - ok?
 -fazer onda triangular?
 
 Comandos no teclado: 
 
 trocar de modos: 
 fasores - f
 grafico - g
 hibrido - h
 
 alterar #termos: 
 +1 - m
 +10 - d
 -1 -l
 -10 - b
 
 */

int n = 500;/*numero max de termos*/

int na = 1;/*numero atual de termos*/

float[] xs = new float [n+1];/*coordenadas x dos fasores*/
float[] ys = new float [n+1];/*coordenadas y dos fasores*/

float a = 180; /*amplitude da onda */
float w = 0.02f; /*velocidade angular*/

/*definicao dos modos*/

boolean ml = false;

boolean fas = true;

boolean graf = false;

boolean hib = false ;

float st = width -20 ; /*pos inicial do grafico*/

int lk ; /*ultima tecla presionada*/

public void setup() {
  size(840, 620);/*inicializa a "tela"*/
  xs[0]=width/2;/*centraliza o desenho*/
  ys[0]=height/2;
  int j = 1;/*inicializa as coordenadas dos fasores*/
  for (int i =1;i<=n;i++) {
    xs[i]=a/j;
    ys[i]=0;
    j+=2;
  }
}

public void draw() {
  if (!graf) {
    background(255);/*redesenha a tela*/
  }
  float xt, yt;/*xt e yt sao as coordenadas resultante das somas parciais dos fasores*/
  xt=xs[0];
  yt=ys[0];
  for (int i =1 ;i<=na;i++) { /*calcula a soma parcial e desenha os fasores*/
    if ((fas&&!graf)||hib) {
      stroke(0, 0, 255);
      fill(0, 0, 255);
      ellipse(xt, yt, 8, 8);
      stroke(255, 0, 0);
      line(xt, yt, xt+xs[i], yt+ys[i]);
    }
    xt=xt+xs[i];
    yt=yt+ys[i];
  }
  if ((fas&&!graf)||hib) {/*desenha ou nao o modo hibrido*/
    fill(0, 255, 0);
    ellipse(xt, yt, 8, 8);
  }
  if (graf||hib) {  /*desenha a bolinha auxiliar pro grafico*/
    stroke(0, 0, 255);
    fill(255, 0, 0);
    ellipse(st, yt, 10, 10);
    if (hib) {
      line(st, height/2, st, yt);
      line(0, yt, width, yt);
    }
    st-=1;
    if (st<10) {
      st=width -20;
      background(255);/*o grafico ja desenhou a tela inteira, entao recomeca o grafico*/
    }
  }
  textSize(20);
  fill(0, 0, 255);/*desenha na tela o #termos*/
  text("#termos=", width-200, height-50);
  text(na, width-100, height-50);
  int j = 1;
  for (int i = 1 ;i<=n;i++) {/*calcula a nova posicao dos fasores*/
    float cosr = cos(w*j);/*aplica a matriz de rotacao em cada fasor*/
    float sinr = sin(w*j);
    float xa = xs[i]*cosr + ys[i]*sinr;
    float ya = -xs[i]*sinr + ys[i]*cosr;
    xs[i]=xa;
    ys[i]=ya;
    j+=2;
  }
}

void keyPressed() {/*lidar com as teclas precionadas do teclado*/
  if (key!=lk||key=='m'||key=='l'||key=='d'||key=='b') {
    switch(key) {
    case 'd':
      na+=10;
      println("+10 termos");
      break;
    case 'b':
      na-=10;
      println("-10 termos");
      break;
    case 'm':
      na++;
      println("+1 termo");
      break;
    case 'l':
      na--;
      println("-1 termo");
      break;
    case 'f':
      fas = true;
      graf = false;
      hib = false;
      println("modo fasores :D ");
      break;
    case 'g':
      fas=false;
      graf=true;
      hib = false;
      println("modo grafico xD ");
      //println("alternei os fasores");
      break;
    case 'h':
      graf=false;
      hib = true;
      println("modo hibrido :D ");
      break;
    default:
      println("caractere nao reconhecido! fazer um listagem das teclas! ");
      break;
    }
    na = constrain(na, 0, n);
    println(na);
    background(255);
    lk = key;
  }
  else {
    println("mesma tecla ¬¬");
  }
}

