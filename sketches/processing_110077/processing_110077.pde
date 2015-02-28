
PImage fundo;
int vazio = 0;
int tabuleiro[][] = {
    {vazio, vazio, vazio}, 
    {vazio, vazio, vazio},
    {vazio, vazio, vazio}
  
};

int colunas = 3;
int linhas = 3;
int ladox;
int ladoy;
int a, b, c, d, e, f, g, h, i,r,s,t,u,v,w,x,y,z;


/* função ganhador */
void Ganhou(int a, int b, int c, int d, int e, int f, int g, int h, int i, int r, int s, int t, int u, int v, int w, int x, int y, int z){
            textAlign(CENTER);
            if((a == 1 && b == 1 && c == 1) || (d == 1 && e == 1 && f == 1) || (g == 1 && h == 1 && i == 1) || ( c == 1 && e == 1 && g == 1) 
               || (a == 1 && e == 1 && i == 1) || (a == 1 && d == 1 && g == 1) || (b == 1 && e == 1 && h == 1) || (c == 1 && f == 1 && i == 1)) {
                 image(fundo,0,0); 
                 textSize(32);
                 text ("Bola ganhou!", width/2, height/2);
               }
             else if((r == 1 && s == 1 && t == 1) || (u == 1 && v == 1 && w == 1) ||(x == 1  && y == 1 && z == 1 ) ||(t == 1 && v == 1 && x == 1) 
                     ||(r == 1 && v == 1 && z == 1) ||(r == 1 && u == 1 && x == 1) ||(s == 1 && v == 1 && y == 1) ||(t == 1 && w == 1 && z == 1)) {
                 
                 image(fundo,0,0); 
                 textSize(50);
                 text ("X ganhou!", width/2, height/2);
                     }
               
  
                } 
  
  
  
  
void setup() {
    size(300, 300);
    background(255);
    fundo = loadImage("background.jpg");
    strokeWeight(8);
    ladox = width / colunas;
    ladoy = height / linhas;
    tabuleiro();

}

void draw() {

}

/* criação do tabuleiro */
void tabuleiro() {
    for (int i = 0; i < colunas; i++) {
        for (int j = 0; j < linhas; j++) {
            rect(j * ladox, i * ladoy, ladox, ladoy);
        }
    }
}

void mouseClicked() {

    if (mouseButton == LEFT) {

        //primeira coluna
        if (mouseX < 100) {
            if (mouseY < 100 && r != 1)
            ellipse(50, 50, 50, 50);{
            a = 1;
            }
            if (mouseY > 100 && mouseY < 200 && s != 1) {
                ellipse(50, 150, 50, 50);
                b = 1;
            }
            if (mouseY > 200 && mouseY < 300 && t != 1) {
                ellipse(50, 250, 50, 50);
                c = 1;
            }
        }
        //segunda coluna
        if (mouseX > 100 && mouseX < 200) {
            if (mouseY < 100 && u != 1) {
                ellipse(150, 50, 50, 50);
                d = 1;
            }
            if (mouseY > 100 && mouseY < 200 && v != 1) {
                ellipse(150, 150, 50, 50);
                e = 1;
            }
            if (mouseY > 200 && mouseY < 300 && w != 1) {
                ellipse(150, 250, 50, 50);
                f = 1;
            }
        }

        //terceira coluna
        if (mouseX > 200 && mouseX < 300) {
            if (mouseY < 100 && x != 1) {
                ellipse(250, 50, 50, 50);
                g = 1;
            }
            if (mouseY > 100 && mouseY < 200 && y != 1) {
                ellipse(250, 150, 50, 50);
                h = 1;
            }
            if (mouseY > 200 && mouseY < 300 && z != 1) {
                ellipse(250, 250, 50, 50);
                i = 1;
            }
        }
    }
    
         Ganhou(a, b, c, d, e, f, g, h, i,r,s,t,u,v,w,x,y,z);
    if (mouseButton == RIGHT) {

        strokeWeight(8);
        //primeira coluna
        if (mouseX < 100) {
            if (mouseY < 100 && a != 1) {
                line(25, 25, 80, 80);
                line(25, 80, 80, 25);
                r = 1;
            }
            if (mouseY > 100 && mouseY < 200 && b != 1) {
                line(25, 125, 80, 180);
                line(25, 180, 80, 125);
                s = 1;
            }
            if (mouseY > 200 && mouseY < 300 && c != 1) {
                line(25, 225, 80, 280);
                line(25, 280, 80, 225);
                t = 1;
            }
        }

        //segunda coluna
        if (mouseX > 100 && mouseX < 200) {
            if (mouseY < 100 && d != 1) {
                line(125, 25, 180, 80);
                line(125, 80, 180, 25);
                u = 1;
            }
            if (mouseY > 100 && mouseY < 200 && e != 1) {
                line(125, 125, 180, 180);
                line(125, 180, 180, 125);
                v = 1;
            }
            if (mouseY > 200 && mouseY < 300 && f != 1) {
                line(125, 225, 180, 280);
                line(125, 280, 180, 225);
                w = 1;
            }

        }

        //terceira coluna
        if (mouseX > 200 && mouseX < 300) {
            if (mouseY < 100 && g != 1) {
                line(225, 25, 280, 80);
                line(225, 80, 280, 25);
                x = 1;
            }
            if (mouseY > 100 && mouseY < 200 && h != 1) {
                line(225, 125, 280, 180);
                line(225, 180, 280, 125);
                y = 1;
            }
            if (mouseY > 200 && mouseY < 300 && i != 1) {
                line(225, 225, 280, 280);
                line(225, 280, 280, 225);
                z = 1;
            }
            Ganhou(a, b, c, d, e, f, g, h, i,r,s,t,u,v,w,x,y,z);
          
    }
    }

         

}
