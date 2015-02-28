
PImage gordo;

color cor1 = #E500FF;
color cor2 = #00A8FF;
color cor3 = #65FF00;
color cor4 = #FAFF00;

boolean primeiro = false;
boolean segundo = false;
boolean terceiro = false;
boolean quarto = false;

int frames = 0;
boolean texto = false;

void setup ()
{
  size (900, 700);
  background(0);
  gordo = loadImage("telles.png");
}

void draw ()
{
    background(0);
    image (gordo, 350, 0);
    
    fill(255);
    textSize (30);
    text ("Pinte o Telles:",50,450);
    
    //----------------opções de cores
    
    rectMode(CORNERS);
    fill(cor1);
    rect (50, 480, 100, 550);
    
    fill(cor2);
    rect (110, 480, 160, 550);
    
    fill(cor3);
    rect (170, 480, 220, 550);
    
    fill (cor4);
    rect (230, 480, 280, 550);
    
    //----------------pinta a imagem de acordo com a cor
    
    if (primeiro == true)
      tint(cor1,255);
    else if (segundo == true)
      tint(cor2);
    else if (terceiro == true)
      tint(cor3);
    else if (quarto == true)
      tint(cor4);
    
    
    //caso escolha rosa
    if (texto == true)
    {
      frames++;
      fill(random(255),random(255),random(255));
      textSize(120);
      text("rosa\né gay", 10, 200);
    }
      
    if (frames > 80)
    {
      texto = false;
      frames= 0;
    }
    
    primeiro = false;
    segundo = false;
    terceiro = false;
    quarto = false;

}

//-------------------clique para escolher a cor

void mouseClicked ()
{
    if (mouseX > 50 && mouseX < 100 && mouseY > 480 && mouseY < 550)   
    {
       primeiro = true;
       texto = true; 
    }    
    if (mouseX > 110 && mouseX < 160 && mouseY > 480 && mouseY < 550)
        segundo = true;
    if (mouseX > 170 && mouseX < 220 && mouseY > 480 && mouseY < 550)
        terceiro = true;
    if (mouseX > 230 && mouseX < 280 && mouseY > 480 && mouseY < 550)
        quarto = true;

}


