
int WIDTH  = 20  //largura
  , HEIGHT = 20  //altura
  , MINES = 20;  //numero de minas

// define o campo minado
int [][] minefield = new int[WIDTH][HEIGHT];

// constantes de estado das minas
int OPEN_MINE = 3
  , OPEN = 2
  , HIDDEN_MINE = 1
  , HIDDEN = 0;

// constantes de vitória/perda
int VICTORY = 0int WIDTH  = 20  //largura
  , HEIGHT = 20  //altura
  , MINES = 20;  //numero de minas

// define o campo minado
int [][] minefield = new int[WIDTH][HEIGHT];

// constantes de estado das minas
int OPEN_MINE = 3
  , OPEN = 2
  , HIDDEN_MINE = 1
  , HIDDEN = 0;

// constantes de vitória/perda
int VICTORY = 0
  , LOSS = 0;

void setup()
{
  size(WIDTH * 20, HEIGHT * 20);
  background(#EEEEEE);
  prepareMinefield();
}

void draw()
{
  drawMinefield();
  endGame();
}

// prepara o campo minado, preenchendo todas as células
// com minas escondidas e depois aleatóriamente colocando
// minas em outras
void prepareMinefield()
{
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      minefield[i][j] = HIDDEN;
    }
  }

  int x, y;
  for (int i = 0; i < MINES; i++)
  {
    x = (int) random(WIDTH);
    y = (int) random(HEIGHT);
    minefield[x][y] = HIDDEN_MINE;
  }
}

// desenha o campo minado, e cada célula dependendo de seu estado
void drawMinefield()
{
  rectMode(CORNER);
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      int tile = minefield[i][j];

      // Hidden tile
      fill(#CCCCCC);

      if (tile == OPEN)
      {
        fill(#FFFFFF);
      }
      else if (tile == OPEN_MINE || (tile == HIDDEN_MINE && (LOSS == 1 || VICTORY == 1)))
      {
        fill(#FF0000);
      }

      rect(i * 20, j * 20, 20, 20);
    }
  }
}

void mouseClicked()
{
  // enquanto nao perder ou ganhar, o jogo prossegue e as celulas sao abertas
  if (LOSS == 0 && VICTORY == 0)
  {
    int x = mouseX / 20
      , y = mouseY / 20;

    int tile = minefield[x][y];

    if (tile == HIDDEN)
    {
      minefield[x][y] = OPEN;

      // Opens surrounding
      // abre aleatoriamente celulas vazias em volta da area clicada
      int radius = (int) random(5);
      for (int i = 1; i <= radius; i++)
      {
        openTile(x - i, y - i);
        openTile(x - i, y);
        openTile(x - i, y + i);
        openTile(x, y - i);
        openTile(x, y + i);
        openTile(x + i, y - i);
        openTile(x + i, y);
        openTile(x + i, y + i);
      }

      VICTORY = allFound();
    }
    else if (tile == HIDDEN_MINE)
    {
      minefield[x][y] = OPEN_MINE;
      LOSS = 1;
    }
  }
  // reinicia o jogo caso tenha sido finalizado
  else
  {
    LOSS = 0;
    VICTORY = 0;
    prepareMinefield();
  }
}

// verifica se celula adjacente esta dentro do campo minado
boolean insideBounds(int x, int y)
{
  return x >= 0 && y >= 0 && x < WIDTH && y < HEIGHT;
}

// abre celula adjacente a celula clicada
void openTile(int x, int y)
{
  if (insideBounds(x, y) && minefield[x][y] == HIDDEN)
  {
    minefield[x][y] = OPEN;
  }
}

// exibe tela de finalizacao de jogo
void endGame()
{
  textSize(32);
  fill(#000000);

  if (LOSS == 1)
  {
    text("Booooom! Você perdeu!", WIDTH, HEIGHT * 20 / 2);
  }

  if (VICTORY == 1)
  {
    text("Uhul, você ganhou!", WIDTH, HEIGHT * 20 / 2);
  }

  noFill();
}

// verifica se todas as celulas vazias foram encontradas,
// definindo a condicao de vitoria
int allFound()
{
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      if (minefield[i][j] == HIDDEN)
      {
        return 0;
      }
    }
  }

  return 1;
}
  , LOSS = 0;

void setup()
{
  size(WIDTH * 20, HEIGHT * 20);
  background(#EEEEEE);
  prepareMinefield();
}

void draw()
{
  drawMinefield();
  endGame();
}

// prepara o campo minado, preenchendo todas as células
// com minas escondidas e depois aleatóriamente colocando
// minas em outras
void prepareMinefield()
{
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      minefield[i][j] = HIDDEN;
    }
  }

  int x, y;
  for (int i = 0; i < MINES; i++)
  {
    x = (int) random(WIDTH);
    y = (int) random(HEIGHT);
    minefield[x][y] = HIDDEN_MINE;
  }
}

// desenha o campo minado, e cada célula dependendo de seu estado
void drawMinefield()
{
  rectMode(CORNER);
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      int tile = minefield[i][j];

      // Hidden tile
      fill(#CCCCCC);

      if (tile == OPEN)
      {
        fill(#FFFFFF);
      }
      else if (tile == OPEN_MINE || (tile == HIDDEN_MINE && (LOSS == 1 || VICTORY == 1)))
      {
        fill(#FF0000);
      }

      rect(i * 20, j * 20, 20, 20);
    }
  }
}

void mouseClicked()
{
  // enquanto nao perder ou ganhar, o jogo prossegue e as celulas sao abertas
  if (LOSS == 0 && VICTORY == 0)
  {
    int x = mouseX / 20
      , y = mouseY / 20;

    int tile = minefield[x][y];

    if (tile == HIDDEN)
    {
      minefield[x][y] = OPEN;

      // Opens surrounding
      // abre aleatoriamente celulas vazias em volta da area clicada
      int radius = (int) random(5);
      for (int i = 1; i <= radius; i++)
      {
        openTile(x - i, y - i);
        openTile(x - i, y);
        openTile(x - i, y + i);
        openTile(x, y - i);
        openTile(x, y + i);
        openTile(x + i, y - i);
        openTile(x + i, y);
        openTile(x + i, y + i);
      }

      VICTORY = allFound();
    }
    else if (tile == HIDDEN_MINE)
    {
      minefield[x][y] = OPEN_MINE;
      LOSS = 1;
    }
  }
  // reinicia o jogo caso tenha sido finalizado
  else
  {
    LOSS = 0;
    VICTORY = 0;
    prepareMinefield();
  }
}

// verifica se celula adjacente esta dentro do campo minado
boolean insideBounds(int x, int y)
{
  return x >= 0 && y >= 0 && x < WIDTH && y < HEIGHT;
}

// abre celula adjacente a celula clicada
void openTile(int x, int y)
{
  if (insideBounds(x, y) && minefield[x][y] == HIDDEN)
  {
    minefield[x][y] = OPEN;
  }
}

// exibe tela de finalizacao de jogo
void endGame()
{
  textSize(32);
  fill(#000000);

  if (LOSS == 1)
  {
    text("Booooom! Você perdeu!", WIDTH, HEIGHT * 20 / 2);
  }

  if (VICTORY == 1)
  {
    text("Uhul, você ganhou!", WIDTH, HEIGHT * 20 / 2);
  }

  noFill();
}

// verifica se todas as celulas vazias foram encontradas,
// definindo a condicao de vitoria
int allFound()
{
  for (int i = 0; i < WIDTH; i++)
  {
    for (int j = 0; j < HEIGHT; j++)
    {
      if (minefield[i][j] == HIDDEN)
      {
        return 0;
      }
    }
  }

  return 1;
}
