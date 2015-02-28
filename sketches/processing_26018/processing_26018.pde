
//-------------------------------------------------------------------------
//
// Pacman Remake 1.0
//
//-------------------------------------------------------------------------

int[][] level = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                 {1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,1},
                 {1,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1},
                 {1,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,1},
                 {1,0,1,1,0,1,1,0,1,0,0,1,0,1,1,0,1,1,0,1},
                 {1,0,0,1,0,1,1,0,0,1,1,0,0,1,1,0,1,0,0,1},
                 {1,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,1},
                 {1,0,0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0,0,1},
                 {1,0,0,0,0,0,1,0,1,1,1,1,0,1,0,0,0,0,0,1},
                 {1,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,0,1},
                 {1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1},
                 {1,0,1,0,1,0,1,0,0,0,0,0,0,1,0,1,0,1,0,1},
                 {1,0,1,1,1,1,1,0,0,1,1,0,0,1,1,1,1,1,0,1},
                 {1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1},
                 {1,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,1},
                 {1,0,1,0,0,1,0,0,0,1,1,0,0,0,1,0,0,1,0,1},
                 {1,0,1,1,0,1,1,1,0,1,1,0,1,1,1,0,1,1,0,1},
                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};


int[][] level2 = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                 {1,0,0,0,1,0,0,1,1,0,0,1,1,0,0,1,0,0,0,1},
                 {1,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,1},
                 {1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1},
                 {1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,1},
                 {1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1},
                 {1,0,1,1,1,0,1,1,0,0,0,0,1,1,0,1,1,1,0,1},
                 {1,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,1},
                 {1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1},
                 {1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,1},
                 {1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,1},
                 {1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1},
                 {1,0,1,1,1,1,1,0,1,0,0,1,0,1,1,1,1,1,0,1},
                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                 {1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1},
                 {1,0,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,1},
                 {1,0,0,0,1,0,0,0,1,1,1,1,0,0,0,1,0,0,0,1},
                 {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                 {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};



int[] tasten = {0,0,0,0};
int posx1 = 200;
int posy1 = 200;
int posx_geist1 = 100;
int posy_geist1 = 180;
int richtung = 0;
int richtung_geist1 =2;
int p=0;
int spielstatus = 0;



void setup()
  {
    ellipseMode(CORNER);
    size(400,400);
  }

void draw()
  {
    if(spielstatus == 0)
      {
        startfenster();
      }
    if(spielstatus == 1)
      {
        level();
        titel();
        Exit();
        frameRate(75);
        Pac1_laufen();
        fill(#F2542C);
        geistLaufen1();
        score();
        Pause();
        cheat();
        if (abstand()<20)
            {
               noLoop();
               fill(#000000,90);
               rect(0,0,400,400);
               fill(#F70C28);
               text("GAME OVER",100,150);
               text("Your Score : "+p,100,200);
               text("Klicke unten auf den Button Restart Game",100,250);
               text("wenn du noch einmal spielen moechtest.",100,280);
            }
      }
    if(spielstatus == 2)
     {
        fill(#38C6FC,20);
        rect(0,0,399,399);
        stroke(#80FC2E);
                line(5,5,5,100);
                line(395,5,395,100);
                line(5,5,100,5);
                line(395,5,295,5);
                line(5,395,5,295);
                line(5,395,100,395);
                line(395,395,295,395);
                line(395,395,395,295);
                line(100,70,300,70);
        rect(150,275,100,50);
        fill(#FC6D38);
        text("||| PAUSE |||",170,130);
        fill(#FC2E84);
        text("Weiter",180,305);
        text("Wenn du weiter spielen moechtest, druecke",55,180);
        text("auf Weiter und gleichzeitig auf der Tastatur",55,210);
        text("in eine belibige Richtung",120,240);
     }
  }    

// Level --------------------------------------------------------------------------------------------------------------------------

void startfenster()
  {
    fill(#D1D1D1);
    rect(0,0,399,399);
    fill(#64D8F7);
    rect(150,275,100,50);
    fill(#FBFF2E);
    smooth();
    arc(50,300,18,18,0+0.5,1.75*PI);
    arc(70,300,18,18,0+0.5,1.75*PI);
    arc(90,300,18,18,0+0.5,1.75*PI);
    arc(290,300,18,18,0+0.5,1.75*PI);
    arc(310,300,18,18,0+0.5,1.75*PI);
    arc(330,300,18,18,0+0.5,1.75*PI);
    fill(#FC4747);
    text("Herzlich Willkommen !",145,20);
    text("Das ist das Spiel Pacman", 135,50);
    text("Druecke W,A,S,D auf deiner Tastatur", 100,100);
    text("um den Pacman durch das Level zu bewegen.", 70, 130);
    text("Versuche alle Punkte in kuerzester Zeit einzusammeln.",52,160);
    text("Doch lasse dich nicht vom Geist fangen.",100,190);
    text("Wenn du nun bereit bist, druecke unten auf Start.",68,220);
    text("Viel Glueck : )",165,250);
    text("START",180,305);
    stroke(#302EFC);
    line(150,105,190,105);
  }

void neustart()
  {
    for(int i=0; i<level.length; i++)
      {
        for(int n=0; n<level.length;n++)
          {
            level[i][n] = level2[i][n];
          }
      }
  }


void level()
  {
    for (int i=0; i < level.length; i++)
      {
        for (int n=0; n < level[i].length; n++)
          {
            if (level[i][n] == 1) {stroke(#6E6F69); fill(#A79A9A);}
            if (level[i][n] != 1) {noStroke(); fill(#00CEFF);}
            rect (n*width/level[0].length,i*height/level.length,width/level[0].length,height/level.length);
            if (level[i][n] == 0) {fill(#FFFFFF); smooth(); ellipse(n*width/level[0].length+7,i*height/level.length+7,6,6);}
          }
      }
  }
  
void score()
  {
    PFont font;
    font = loadFont("Aharoni-Bold-48.vlw");
    textFont(font, 14);
    text("Score",5,16);
    text(""+p,61,16);
    if (p == 216)
      {
        neustart();
      }
    if(p== 448)
      {
        noLoop();
        fill(#000000,90);
        rect(0,0,400,400);
        fill(#F70C28);
        text("WINNER",100,150);
        text("Score : "+p,100,200);
        text("LEVEL ZWEI COMPLETE !",100,300);
        fill(#FF2424);
      }
      
  }

void Pause()
  {
    if(key == 't' || key == 'T')
      {
        spielstatus = 2;
      }  
  }  
  
void cheat()
  {
    if(key == '.')
      {
        p=p+1;
      }
  }    

void Exit()
  {
    fill(#FC2E84);
    text("Druecke P fuer Exit",277,397.5);
    text("Druecke T fuer Pause",0,397.5);
    if (key == 'p' || key == 'P')
      {
        exit();
      }
  }
  
void titel()
  {
    fill(#DEFA30);
    text("Pa     man",164,16);   
    float wertx;
    float werty;
    if (posx1%20 < 10) {wertx = posx1%20;} else {wertx = 20-posx1%20;}
    if (posy1%20 < 10) {werty = posy1%20;} else {werty = 20-posy1%20;}
    
    if (richtung == 0) {arc(181,1,18,18,0+wertx*0.1,2*PI-wertx*0.1);}
    if (richtung == 1) {arc(181,1,18,18,0+wertx*0.1,2*PI-wertx*0.1);}
    if (richtung == 2) {arc(181,1,18,18,0+wertx*0.1,2*PI-wertx*0.1);}
    if (richtung == 3) {arc(181,1,18,18,0+wertx*0.1,2*PI-wertx*0.1);}
    if (richtung == 4) {ellipse(181,1,18,18);}
}
    
    
// Pacman  ---------------------------------------------------------------------------------------------------------------------------------


void pacZeichnen()
  {
    float wertx;
    float werty;
    if (posx1%20 < 10) {wertx = posx1%20;} else {wertx = 20-posx1%20;}
    if (posy1%20 < 10) {werty = posy1%20;} else {werty = 20-posy1%20;}
    
    if (richtung == 0) {arc(posx1,posy1,20,20,1.5*PI+werty*0.1,3.5*PI-werty*0.1);}
    if (richtung == 1) {arc(posx1,posy1,20,20,PI+wertx*0.1,3*PI-wertx*0.1);}
    if (richtung == 2) {arc(posx1,posy1,20,20,0.5*PI+werty*0.1,2.5*PI-werty*0.1);}
    if (richtung == 3) {arc(posx1,posy1,20,20,0+wertx*0.1,2*PI-wertx*0.1);}
    if (richtung == 4) {ellipse(posx1,posy1,20,20);}
  }
  
void Pac1_laufen()
  {
    if (posx1%20 == 0 && posy1%20 == 0)
      {
      lenken();
      punkteSammeln();
      }
    if (richtung == 0) {posy1-=2;}
    if (richtung == 1) {posx1-=2;}
    if (richtung == 2) {posy1+=2;}
    if (richtung == 3) {posx1+=2;}
    fill(#DEFA30);
    pacZeichnen();
  }
  
  
void punkteSammeln()
  {
     if (level[((posy1)/(width/level[0].length))][((posx1)/(width/level[0].length))] == 0)
        {
          level[((posy1)/(width/level[0].length))][((posx1)/(width/level[0].length))] = 2;
          p=p+1;
        }
  }
      
void lenken()
  {
    richtung = 4;
    if (tasten[0] == 1 && level[posy1/20-1][posx1/20] != 1) {richtung = 0;}
    if (tasten[1] == 1 && level[posy1/20][posx1/20-1] != 1) {richtung = 1;}
    if (tasten[2] == 1 && level[posy1/20+1][posx1/20] != 1) {richtung = 2;}
    if (tasten[3] == 1 && level[posy1/20][posx1/20+1] != 1) {richtung = 3;}
  }
  
void keyPressed()
  {
    if (key == 'w' || key == 'W') {tasten[0] = 1;}
    if (key == 'a' || key == 'A') {tasten[1] = 1;}
    if (key == 's' || key == 'S') {tasten[2] = 1;}
    if (key == 'd' || key == 'D') {tasten[3] = 1;}
  }

void keyReleased()
  {
  if (key == 'w' || key == 'W') {tasten[0] = 0;}
  if (key == 'a' || key == 'A') {tasten[1] = 0;}
  if (key == 's' || key == 'S') {tasten[2] = 0;}
  if (key == 'd' || key == 'D') {tasten[3] = 0;}
  }
  
void mousePressed()
   {
     if(mouseX > 150 && mouseX < 250 && mouseY > 275 && mouseY < 325 && mousePressed)
      {
        spielstatus=1; 
      }
   }
// Ghost -------------------------------------------------------------------------------------------------------------


void geistZeichnen1()
  {
     stroke(#FA2821);
     line(posx_geist1+5,posy_geist1,posx_geist1,posy_geist1+20);
     line(posx_geist1,posy_geist1+20,posx_geist1+5,posy_geist1+17);
     line(posx_geist1+5,posy_geist1+17,posx_geist1+10,posy_geist1+20);
     line(posx_geist1+10,posy_geist1+20,posx_geist1+15,posy_geist1+17);
     line(posx_geist1+15,posy_geist1+17,posx_geist1+20,posy_geist1+20);
     line(posx_geist1+20,posy_geist1+20,posx_geist1+15,posy_geist1);
     line(posx_geist1+15,posy_geist1,posx_geist1+5,posy_geist1);
     stroke(#000000);
     line(posx_geist1+5,posy_geist1+5,posx_geist1+10,posy_geist1+5);
     line(posx_geist1+7,posy_geist1+3,posx_geist1+13,posy_geist1+3);
     fill(#F2FA21);
     ellipse(posx_geist1+7.5,posy_geist1+7.5,5,5);
     noFill();
     ellipse(posx_geist1+5,posy_geist1+5,10,10);
  }


void lenken_geist1()
  {
    richtung_geist1 = lenken_geist1_verfolgen();
  }


int lenken_geist1_verfolgen()
          {
            int wahlx;
            int wahly;
            if (posy_geist1 > posy1) {wahly = 0;} else {wahly = 2;}
            if (posx_geist1 > posx1) {wahlx = 3;} else {wahlx = 1;}
            if (abs(posx_geist1-posx1) < abs(posy_geist1-posy1)) {richtung_geist1 = wahly;} else {richtung_geist1 = wahlx;}
            
            println(richtung_geist1);
            
            // Hier wird die Richtung überprüft
            
            if (richtung_geist1 == 0 && level[posy_geist1/20-1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 1 && level[posy_geist1/20][posx_geist1/20+1] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 2 && level[posy_geist1/20+1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 3 && level[posy_geist1/20][posx_geist1/20-1] != 1) {return (richtung_geist1);}
                
            // Hier ist die 2 Wahl
            
            if (richtung_geist1 == wahly) {richtung_geist1 = wahlx;} else {richtung_geist1 = wahly;}
            if (richtung_geist1 == 0 && level[posy_geist1/20-1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 1 && level[posy_geist1/20][posx_geist1/20+1] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 2 && level[posy_geist1/20+1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 3 && level[posy_geist1/20][posx_geist1/20-1] != 1) {return (richtung_geist1);}
                        
            if (abs(posx_geist1-posx1) < abs(posy_geist1-posy1)) {richtung_geist1 = (wahly+2)%4;} else {richtung_geist1 = (wahlx+2)%4;}
            if (richtung_geist1 == 0 && level[posy_geist1/20-1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 1 && level[posy_geist1/20][posx_geist1/20+1] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 2 && level[posy_geist1/20+1][posx_geist1/20] != 1) {return (richtung_geist1);}
            if (richtung_geist1 == 3 && level[posy_geist1/20][posx_geist1/20-1] != 1) {return (richtung_geist1);}

            boolean variable = false;
            int randzahl = 0;
            while(!variable)
              {
                randzahl = (int)random(0, 3.99);
                if (randzahl == 0 && level[posy_geist1/20-1][posx_geist1/20] != 1) {variable=true;}
                if (randzahl == 1 && level[posy_geist1/20][posx_geist1/20+1] != 1) {variable=true;}
                if (randzahl == 2 && level[posy_geist1/20+1][posx_geist1/20] != 1) {variable=true;}
                if (randzahl == 3 && level[posy_geist1/20][posx_geist1/20-1] != 1) {variable=true;}
              }
            return(4);
          }


void geistLaufen1()
  {
    if (posx_geist1%20 == 0 && posy_geist1%20 == 0) {lenken_geist1();}
    if (richtung_geist1 == 0) {posy_geist1--;}
    if (richtung_geist1 == 1) {posx_geist1++;}
    if (richtung_geist1 == 2) {posy_geist1++;}
    if (richtung_geist1 == 3) {posx_geist1--;}
    fill(#F2542C);
    geistZeichnen1();
  }


float abstand()
  {
    return sqrt(sq(posx1-posx_geist1)+sq(posy1-posy_geist1));
  }
  
  
// End --------------------------------------------------------------------------------------------------------------------

