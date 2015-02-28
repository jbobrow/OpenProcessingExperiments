
/*Trabalho 1 - Sistema de Particulas - calculo numerico - 1s2014 - IMECC - Unicamp

 Prof. Martinez

 Grupo:Caio Augusto - 145544
       Lucas Garcia - 148762
       Caique Conde - 145580
       Henrique Grigolli - 151174

 Descricao:Levando em conta a lei universal da gravitacao ne Newton, dado um sistema com n 
 particulas e suas respectivas condicoes iniciais, "simule" o comportamento de interecao 
 entre as particulas do sistema no dominio do tempo
 */
int n = 4;/*numero de particulas*/
float dt = 0.017;/*Delta tempo (para calcular as medicoes)*/
float G = 10;/*constante universal da gravitacao*/
boolean marks = true;/*se mostra ou nao o traco das particulas*/

massa[] massas = new massa[n];
void setup() {
    size(840, 620);/*inicializa a "tela"*/
    background(255);
    frameRate((int)1/dt);
    println((int)(1/dt));
    for (int i = 0; i<n; i++) { /*inicializa todas as massas*/
        massas[i]=new massa();
    }
    massas[0].px=width/2;/*define as condicoes iniciais*/
    massas[0].py=height/2;
    massas[0].vy=0;
    massas[0].vx=0;
    massas[0].m=330000;
    massas[1].px=width/2;
    massas[1].py=height/2 + 150;
    massas[1].vy=0;
    massas[1].vx=sqrt(massas[0].m*G/250);
    massas[1].m=1;
    massas[2].m=1;
    massas[2].px=width/2;
    massas[2].py=height/2 + 200;
    massas[2].vy=0;
    massas[2].vx=sqrt(massas[0].m*G/200);
    massas[3].m=1;
    massas[3].px=width/2;
    massas[3].py=height/2 + 250;
    massas[3].vy=0;
    massas[3].vx=sqrt(massas[0].m*G/250);
    desenhaMassas();
}

void draw() {
    novaPos();/*calcula a posicao da proxima interacao*/
    desenhaMassas();/*atualiza a tela*/
}

/*se precionado o mouse em qualquer lugar da tela, para de exibir os vetores e mostra o traco*/
void mousePressed() {
    marks=!marks;
    background(255);
}

/*corpo da funcao que desenha as massas e seus vetores forca e velocidade*/
void desenhaMassas() {
    if (marks) {
        background(255);
    }
    fill(255);
    fill(0, 0, 255);
    for (int i=0; i<n; i++) {
        stroke(200);
        ellipse(massas[i].px, massas[i].py, 15, 15);
        if (marks) {
            stroke(0);
            line(massas[i].px, massas[i].py, massas[i].px+massas[i].vx, massas[i].py+massas[i].vy);
            stroke(255, 0, 0);
            line(massas[i].px, massas[i].py, massas[i].px+massas[i].fx, massas[i].py+massas[i].fy);
        }
    }
}

/*corpo da classe que define uma massa*/
class massa {
    float px, py, vx, vy, ax, ay, fx, fy, m;
    void atualizaPos() {/*corpo da funcao que sabendo a forca, calcula a posicao*/
        ax=fx/m;
        ay=fy/m;
        vx+=dt*ax;
        vy+=dt*ay;
        px=px+vx*dt;
        px=fix(px, width);
        py=py+vy*dt;
        py=fix(py, height);
    }
}

/*corpo da funcao usada para que quando uma massa sair da tela ela apareca do outro lado*/
float fix(float val, float lim) {
    if (val>lim) {
        return val%lim;
    }
    else if (val<0) {
        return (lim+val);
    }
    else {
        return val;
    }
}

/*corpo da funcao que calcula a forca resultante em cada particula para entao atualizar suas posicoes*/
void novaPos() {
    float fijx, fijy, d;
    for (int i=0; i<n; i++) {
        massas[i].fx=0;
        massas[i].fy=0;
        for (int j=0; j<n; j++) {
            if (j!=i) {
                d=sqrt(pow((massas[j].px-massas[i].px), 2)+pow((massas[j].py-massas[i].py), 2));
                fijx=((massas[j].px-massas[i].px)*G*massas[j].m*massas[i].m)/pow(d, 3);
                fijy=((massas[j].py-massas[i].py)*G*massas[j].m*massas[i].m)/pow(d, 3);
                massas[i].fx+=fijx;
                massas[i].fy+=fijy;
            }
        }
    }
    for (int i = 0; i<n; i++) { //atualiza a posicao das particulas
        massas[i].atualizaPos();
    }
}
