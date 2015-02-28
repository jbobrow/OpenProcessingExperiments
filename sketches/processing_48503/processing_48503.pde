

int bx, by;
int[][] quadrados = new int[8][8]; 
int primeiro, clicks;
float pontos, ponto;

PFont fontA;

PGraphics A, B;




/////////////////////////////////////////////////////////////
void setup()
{
  size(768, 384);
  background(255);
  //smooth();
  //frameRate(1);

  A = createGraphics(width, height, P3D);
  B = createGraphics(width, height, P3D);  

  fontA = loadFont("Arial.vlw");

  textFont(fontA, 32);

  for (int x = 0; x<8; x++)
    for (int y = 0; y<8; y++)
      quadrados[x][y] = 0;

  rect(0, 0, 384, 384);


  for (int x = 0; x<8; x++)
  {
    line(48*(x+1), 0, 48*(x+1), 384  );
    line(0, 48*(x+1), 384, 48*(x+1) );
  }

  bx = 0;
  by = 0;

  primeiro = 0;
  clicks = 0;
  pontos = 0.0;

  //-------------------------------------------------------

  fill(0);

  text("Clicks:", 384+32, 64);
  text("Ponto:", 384+32, 64+32);
  text("Total:", 384+32, 64+64);
  //-------------------------------------------------------
}

/////////////////////////////////////////////////////////////

void draw()
{
}

/////////////////////////////////////////////////////////////

void mouseClicked()
{
  println(mouseX + " " + mouseY);


  for (int x = 0; x<8; x++)
    for (int y = 0; y<8; y++)
    {
      if (mouseX<384)
      {
        if ( mouseX/48==x && mouseY/48==y)
        {  

          if (quadrados[x][y]==0)
          {
            
            A.beginDraw();
            A.fill(0);
            A.rect(x*48, y*48, 48, 48 );
            A.endDraw();
            
            B.beginDraw();
            B.strokeWeight(5);
            B.stroke(color(0,255,clicks*4));

            if (primeiro == 1)
            {
              B.line(bx+24, by+24, x*48+24, y*48+24);
              clicks++;
              ponto = sqrt(x*x + y*y); 
              pontos += sqrt(x*x + y*y);
            }  



            B.strokeWeight(1);
            B.stroke(0);      
            B.endDraw();
            
            bx = x*48;
            by = y*48;

            quadrados[x][y] = 1;
          }
        }
      }
    }
  primeiro = 1;

  fill(255);
  stroke(255);

  rect(528, 35, 200, 200);

  fill(0);
  text(clicks, 384+150, 64);
  text(ponto, 384+150, 64+32);  
  text(pontos, 384+150, 64+64);
  
  image(A, 0, 0);
  image(B, 0, 0);
}
/////////////////////////////////////////////////////////////

                
                
