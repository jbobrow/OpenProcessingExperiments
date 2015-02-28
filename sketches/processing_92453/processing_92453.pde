
int dir = 4; //direccao actual.  4 direccoes: 1=cima, 2=baixo, 3=esquerda e 4=direita
int dirant = 0; //direccao anterior
int snake_size; //tamanho da snake
int i[] = new int[100]; //posicao inicial da snake
int j[] = new int[100];  //posicao inicial da snake
int w = 300; //largura ecra
int h = 300; //altura ecra
int snake_w = 9; //largura da snake
int snake_h = 9; //altura da snake
float fRate = 10; //framerate (velocidade)
int sp = 10; 
int a = 100; int b = 100; //posicao inicial da maça
int score, inicio, fim;
boolean game;

void setup() {
  size(300, 300);
  game = true;
  int it;
  score = inicio = 0;
  snake_size = 1;
  for (it=0;it<i.length;it++) {
    i[it] = 0;
    j[it] = 0;
  }
  i[0] = j[0] = 150;
  size(w,h);
  background(100);
  stroke(0);
  smooth();
  draw();
}   

void sides () {
  int it;
  for (it=0;it<snake_size;it++) {
    
    if (i[it]>width-10) {
      i[it]=0;
    }
    
    if (i[it]<0) {
      i[it]=width-10;
    }
    
    if (j[it]>height-10) {
      j[it]=0;
    }
    
    if (j[it]<0) {
      j[it]=height-10;
    }
  }
}

void apple () {
  int n = snake_size;
  fill (255,65,65);
  //rect (a, b, snake_w, snake_h);
  ellipseMode(CORNER);
  ellipse(a,b,snake_w,snake_w);
  if (i[0]==a && j[0]==b) {
    a = int (random (0,(width/10)-1)) * 10; //posição aleatória da maçã
    b = int (random (0,(height/10)-1)) * 10; //posição aleatória da maçã
    fRate += 0.25;
    score += 10;
    switch(dir) {
    case 1:
      j[n]=j[n-1]+sp;
      i[n]=i[n-1];
      break;
    case 2: 
      j[n]=j[n-1]-sp;
      i[n]=i[n-1];
      break;
    case 3: 
      i[n]=i[n-1]-sp;
      j[n]=j[n-1];
      break;
    case 4: 
      i[n]=i[n-1]+sp;
      j[n]=j[n-1];
      break;
    }
    snake_size++;
  }
}

int tail () {
  int val=0;
  int x = snake_size-1;
  int y = snake_size-2;
  if (j[y]==j[x]-10 && i[y]==i[x]) val=1;
  else if (j[x]==j[y]-10 && i[y]==i[x]) val=2;
       else if (i[y]==i[x]-10 && j[y]==j[x]) val=3;
            else if (i[x]==i[y]-10 && j[y]==j[x]) val=4;
                  else {
                    if (j[x]<j[y] && i[y]==i[x]) val=1;
                    if (j[x]>j[y] && i[y]==i[x]) val=2;
                    if (i[x]<i[y] && j[y]==j[x]) val=3;
                    if (i[x]>i[y] && j[y]==j[x]) val=4;
                  }
  return val;
}

void display () {
  int a,t;
  t = 0;
  fill (0); 
  if (snake_size==1) rect (i[0], j[0], snake_w, snake_h,3,3,3,3);
  else {
          t = tail();
          switch(dir) {
            case 1: rect (i[0], j[0], snake_w, snake_h,10,10,0,0);break;
            case 2: rect (i[0], j[0], snake_w, snake_h,0,0,10,10);break;
            case 3: rect (i[0], j[0], snake_w, snake_h,10,0,0,10);break;
            case 4: rect (i[0], j[0], snake_w, snake_h,0,10,10,0);break;
          }
          for (a=1;a<snake_size-1;a++) {
            rect (i[a], j[a], snake_w, snake_h);
          }
          switch(t) {
            case 1: rect (i[a], j[a], snake_w, snake_h,0,0,10,10);break;
            case 2: rect (i[a], j[a], snake_w, snake_h,10,10,0,0);break;
            case 3: rect (i[a], j[a], snake_w, snake_h,0,10,10,0);break;
            case 4: rect (i[a], j[a], snake_w, snake_h,10,0,0,10);break;
          }
  }
}

void move () {
  int it;
  if ((dir==1 && dirant==2) || (dir==2 && dirant==1) || (dir==3 && dirant==4) || (dir==4 && dirant==3)) //não permite a snake inverter a direcção 180 graus
  {
    dir = dirant;
  }
  for (it=snake_size-1;it>0;it--) {
    i[it]=i[it-1];
    j[it]=j[it-1];
  }
  switch(dir) {
  case 1:
    j[0]=j[0]-sp; 
    break;
  case 2:
    j[0]=j[0]+sp; 
    break;
  case 3:
    i[0]=i[0]-sp; 
    break;
  case 4:
    i[0]=i[0]+sp; 
    break;
  }
  dirant = dir;
}

void game_over () {
    int time, time2;
    game = false;
    fim = millis();
    score = score - ((fim-inicio) / 2718);
    score = round(score);
    fill (200);
    rect (195, 275, 130, 40);
    String s = "Novo Jogo";
    fill(50);
    textSize(20);
    text(s, 200, 295);
    text("Score: " + score, 5, 295);
    noLoop();
    fill(200,0,0);
    rect (i[0], j[0], snake_w, snake_h,3,3,3,3);
}

void colision () {
  int it;
  for (it=3;it<snake_size;it++) {
      if (i[0]==i[it] && j[0]==j[it]) {
           game_over();
         }
       }
}

void show_score () {
  if (game) {
    fill (127);
    textSize(20);
    text(score/10, 5, 295);
  }
}
     
void draw() {  
  frameRate (fRate);
  background (153, 204, 153);
  apple ();
  move ();
  sides ();
  display ();
  colision ();
  show_score();
}

void restart () {
  dir = 4;
  dirant = 0;
  fRate = 10;
  a = b = 100;
  game = true;
  int it;
  score = 0;
  snake_size = 1;
  for (it=0;it<i.length;it++) {
    i[it] = 0;
    j[it] = 0;
  }
  i[0] = j[0] = 150;
  size(w,h);
  background(100);
  stroke(0);
  smooth();
  inicio = millis();
  loop();
}

void mousePressed() {
  if(mouseX > 195 && mouseX < 300 && mouseY > 275 && mouseY < 300 && !game) {restart();}
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)    {dir = 1;}
    if (keyCode == DOWN)  {dir = 2;}
    if (keyCode == LEFT)  {dir = 3;}
    if (keyCode == RIGHT) {dir = 4;}
  }
}

