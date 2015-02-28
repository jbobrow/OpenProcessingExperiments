
/* Paulo Otavio Panichek Ribeiro
   trabalho para a disciplina de Algoritmos 1.
   30/04/2014.
   Este trabalho mostra a parte da música: 
   "Que o chefe da polícia carioca avisa pelo celular
    Que lá na praça Onze tem um videopôquer para se jogar..."
    */

int x, y,cursor_x = 0, cursor_y = 0;
boolean pressed = false;
void setup()
{
background(22,59,157);
size(600,600);
rectMode(CORNERS);
fill(209,202,202);
rect(150,50,450,520, 10);
fill(244,242,255);
rect(160,60,440,230,6);
fill(255);
rect(160,245,240,295,6);
rect(260,245,340,295,6);
rect(360,245,440,295,6);
rect(160,310,240,360,6);
rect(260,310,340,360,6);
rect(360,310,440,360,6);
rect(160,375,240,425,6);
rect(260,375,340,425,6);
rect(360,375,440,425,6);
rect(160,440,240,490,6);
rect(260,440,340,490,6);
rect(360,440,440,490,6);
fill(0);
textSize(20);
text("1",175,275);
text("2",275,275);
text("3",375,275);
text("4",175,340);
text("5",275,340);
text("6",375,340);
text("7",175,405);
text("8",275,405);
text("9",375,405);
text("0",275,470);
text("*",175,470);
text("#",405,470);
textSize(15);
text("abc",290,275);
text("def",390,275);
text("oo",190,275);
text("jkl",290,340);
text("mno",390,340);
text("ghi",190,340);
text("tuv",290,405);
text("wxyz",390,405);
text("pqrs",190,405);
text("+",210,480);
text("*",370,470);
text("-",370,475);
text("|___|",290,470);
textSize(20);
text("Partiu Videopôquer",165,85);
text("na Onze?",165,105);

}

void draw()
{
textSize(20);
if (!pressed){
if (mousePressed)
{
    for (x = 160; x <= 360; x += 100){
    for (y = 245; y <= 440; y += 65){
        if (mouseY > y && mouseY <= y+50 && mouseX > x && mouseX <= x + 80)
        {

          if (cursor_x < 270 && cursor_y < 45){
          if ((y-195)/50 != 4){
          text(str(((x/100)+((y-195)/50-1)*3)), 165 + cursor_x, 195 + cursor_y);
          }
          else {
                if (x/100 == 1)
                text("*", 165 + cursor_x, 195 + cursor_y);
                else if (x/100 == 2)
                text("0", 165 + cursor_x, 195 + cursor_y);
                else
                text("#", 165 + cursor_x, 195 + cursor_y);
                
          }
          cursor_x += 10;
          if (cursor_x == 260){
          cursor_y += 15;
          cursor_x = 0;
          }
          pressed = true;
          }

}
}
}
}
}   
}

void mouseReleased()
{
  pressed = false;
}









