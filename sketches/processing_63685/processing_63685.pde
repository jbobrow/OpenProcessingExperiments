
int page=0;
PFont myFont= createFont("Verdana", 12);
int nameX=200;
int nameVX=3;
color playC=#00FF00;
//page 1
float t=31;
color a1=#00FF00;
color b1=#00FF00;
color c1=#00FF00;
color d1=#00FF00;
//page 2
color a2=#00FF00;
color b2=#00FF00;
color c2=#00FF00;
color d2=#00FF00;
//page 3
color a3=#00FF00;
color b3=#00FF00;
color c3=#00FF00;
color d3=#00FF00;
//page 4
color a4=#00FF00;
color b4=#00FF00;
color c4=#00FF00;
color d4=#00FF00;
//page 5
color a5=#00FF00;
color b5=#00FF00;
color c5=#00FF00;
color d5=#00FF00;
//page 6
color a6=#00FF00;
color b6=#00FF00;
color c6=#00FF00;
color d6=#00FF00;
//page 7
color a7=#00FF00;
color b7=#00FF00;
color c7=#00FF00;
color d7=#00FF00;
//page 8
color a8=#00FF00;
color b8=#00FF00;
color c8=#00FF00;
color d8=#00FF00;
//page 9
color a9=#00FF00;
color b9=#00FF00;
color c9=#00FF00;
color d9=#00FF00;
//page 10
color a10=#00FF00;
color b10=#00FF00;
color c10=#00FF00;
color d10=#00FF00;
//page 11
color lastButtonC=#00FF00;

void setup() {
  size(500, 400);
  frameRate(30);
}

void draw() {
  if (page==0) {
    background(#00FFFF);
    nameX+=nameVX;
    if (nameX>230) {
      nameX=230;
      nameVX*=-1;
    }
    if (nameX<190) {
      nameX=190;
      nameVX*=-1;
    }
    if (dist(mouseX, mouseY, 250, 360)<30) {
      playC=#FFFF00;
    }
    else {
      playC=#00FF00;
    }
    //flag
    stroke(#000000);
    fill(#0000FF);
    rect(30, 220, 50, 100);
    fill(#FFFFFF);
    rect(80, 220, 50, 100);
    fill(#FF0000);
    rect(130, 220, 50, 100);
    //text
    fill(#FFFFFF);
    triangle(500, 320, 450, 310, 460, 280);
    ellipse(425, 290, 120, 60);
    fill(#000000);
    textFont(myFont, 20);
    text("Bonjour!", 380, 300);
    text("AP French Project", 10, 20);
    textFont(myFont, 22);
    text("JC Wu", nameX, 190);
    fill(#0000FF);
    textFont(myFont, 28);
    text("La Géographie", 40, 150);
    fill(#FFFFFF);
    text("de la", 260, 150);
    fill(#FF0000);
    text("France", 350, 150);
    fill(playC);
    ellipse(250, 360, 60, 60);
    fill(#FF0000);
    textFont(myFont, 17);
    text("jouer", 230, 363);
    textFont(myFont, 12);
    text("*Vous avez 30 secondes pour", 300, 363);
    text("chaque question", 300, 377);
  }


  if (page==30) {
    wrong();
  }

  if (page==1) {
    background(#0000FF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a1=#FFFF00;
    }
    else {
      a1=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b1=#FFFF00;
    }
    else {
      b1=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c1=#FFFF00;
    }
    else {
      c1=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d1=#FFFF00;
    }
    else {
      d1=#00FF00;
    }
    text("1. De quelle région est la Paris?", 20, 100); 
    text("A) la Lorraine", 80, 150);
    text("B) l'Île-de-France", 80, 200);
    text("C) la Picardie", 80, 250);
    text("D) l'Aquitaine", 80, 300);
    fill(a1);
    ellipse(50, 140, 20, 20);
    fill(b1);
    ellipse(50, 190, 20, 20);
    fill(c1);
    ellipse(50, 240, 20, 20);
    fill(d1);
    ellipse(50, 290, 20, 20);
  }

  if (page==2) {
    background(#FFFFFF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a2=#FFFF00;
    }
    else {
      a2=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b2=#FFFF00;
    }
    else {
      b2=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c2=#FFFF00;
    }
    else {
      c2=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d2=#FFFF00;
    }
    else {
      d2=#00FF00;
    }
    text("2. Au total, la France a combien de régions?", 20, 100); 
    text("A) 26", 80, 150);
    text("B) 14", 80, 200);
    text("C) 8", 80, 250);
    text("D) 37", 80, 300);
    fill(a2);
    ellipse(50, 140, 20, 20);
    fill(b2);
    ellipse(50, 190, 20, 20);
    fill(c2);
    ellipse(50, 240, 20, 20);
    fill(d2);
    ellipse(50, 290, 20, 20);
  }

  if (page==3) {
    background(#FF0000);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a3=#FFFF00;
    }
    else {
      a3=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b3=#FFFF00;
    }
    else {
      b3=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c3=#FFFF00;
    }
    else {
      c3=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d3=#FFFF00;
    }
    else {
      d3=#00FF00;
    }
    text("3. Quel est le nom du corps de l'eau qui se", 20, 70); 
    text("trouve entre la France et la Grande-Bretagne?", 20, 100);
    text("A) la Méditerranée", 80, 150);
    text("B) la Moselle", 80, 200);
    text("C) la Manche", 80, 250);
    text("D) la mer Caspienne", 80, 300);
    fill(a3);
    ellipse(50, 140, 20, 20);
    fill(b3);
    ellipse(50, 190, 20, 20);
    fill(c3);
    ellipse(50, 240, 20, 20);
    fill(d3);
    ellipse(50, 290, 20, 20);
  }

  if (page==4) {
    background(#0000FF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a4=#FFFF00;
    }
    else {
      a4=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b4=#FFFF00;
    }
    else {
      b4=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c4=#FFFF00;
    }
    else {
      c4=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d4=#FFFF00;
    }
    else {
      d4=#00FF00;
    }
    text("4) Ces pays bordent la France sauf", 20, 100);
    text("A) la Suisse", 80, 150);
    text("B) la Belgique", 80, 200);
    text("C) l'Autriche", 80, 250);
    text("D) la Luxembourg", 80, 300);
    fill(a4);
    ellipse(50, 140, 20, 20);
    fill(b4);
    ellipse(50, 190, 20, 20);
    fill(c4);
    ellipse(50, 240, 20, 20);
    fill(d4);
    ellipse(50, 290, 20, 20);
  }

  if (page==5) {
    background(#FFFFFF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a5=#FFFF00;
    }
    else {
      a5=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b5=#FFFF00;
    }
    else {
      b5=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c5=#FFFF00;
    }
    else {
      c5=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d5=#FFFF00;
    }
    else {
      d5=#00FF00;
    }
    text("5) Quelle est la deuxième plus grande ville", 20, 70);
    text("en France?", 20, 100);
    text("A) la Lyon", 80, 150);
    text("B) la Paris", 80, 200);
    text("C) la Nancy", 80, 250);
    text("D) la Marseille", 80, 300);
    fill(a5);
    ellipse(50, 140, 20, 20);
    fill(b5);
    ellipse(50, 190, 20, 20);
    fill(c5);
    ellipse(50, 240, 20, 20);
    fill(d5);
    ellipse(50, 290, 20, 20);
  }

  if (page==6) {
    background(#FF0000);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a6=#FFFF00;
    }
    else {
      a6=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b6=#FFFF00;
    }
    else {
      b6=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c6=#FFFF00;
    }
    else {
      c6=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d6=#FFFF00;
    }
    else {
      d6=#00FF00;
    }
    text("6) Quel fleuve traverse Strasbourg?", 20, 100);
    text("A) la Seine", 80, 150);
    text("B) l'Ill", 80, 200);
    text("C) la Moselle", 80, 250);
    text("D) la Loire", 80, 300);
    fill(a6);
    ellipse(50, 140, 20, 20);
    fill(b6);
    ellipse(50, 190, 20, 20);
    fill(c6);
    ellipse(50, 240, 20, 20);
    fill(d6);
    ellipse(50, 290, 20, 20);
  }

  if (page==7) {
    background(#0000FF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a7=#FFFF00;
    }
    else {
      a7=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b7=#FFFF00;
    }
    else {
      b7=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c7=#FFFF00;
    }
    else {
      c7=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d7=#FFFF00;
    }
    else {
      d7=#00FF00;
    }
    text("7) Quel est le plus long fleuve en France?", 20, 100);
    text("A) la Moselle", 80, 150);
    text("B) le Rhône", 80, 200);
    text("C) la Seine", 80, 250);
    text("D) la Loire", 80, 300);
    fill(a7);
    ellipse(50, 140, 20, 20);
    fill(b7);
    ellipse(50, 190, 20, 20);
    fill(c7);
    ellipse(50, 240, 20, 20);
    fill(d7);
    ellipse(50, 290, 20, 20);
  }

  if (page==8) {
    background(#FFFFFF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a8=#FFFF00;
    }
    else {
      a8=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b8=#FFFF00;
    }
    else {
      b8=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c8=#FFFF00;
    }
    else {
      c8=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d8=#FFFF00;
    }
    else {
      d8=#00FF00;
    }
    text("8) Quelle est la division correcte de la France?", 20, 100);
    text("A) Région-département-commune-ville", 80, 150);
    text("B) Département-commune-ville-région", 80, 200);
    text("C) Région-département-ville-commune", 80, 250);
    text("D) Commune-département-région-ville", 80, 300);
    fill(a8);
    ellipse(50, 140, 20, 20);
    fill(b8);
    ellipse(50, 190, 20, 20);
    fill(c8);
    ellipse(50, 240, 20, 20);
    fill(d8);
    ellipse(50, 290, 20, 20);
  }

  if (page==9) {
    background(#FF0000);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a9=#FFFF00;
    }
    else {
      a9=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b9=#FFFF00;
    }
    else {
      b9=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c9=#FFFF00;
    }
    else {
      c9=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d9=#FFFF00;
    }
    else {
      d9=#00FF00;
    }
    text("9) Où se trouve les Alpes?", 20, 100);
    text("A) Au nord", 80, 150);
    text("B) Au ouest", 80, 200);
    text("C) Au nord-ouest", 80, 250);
    text("D) Au sud-est", 80, 300);
    fill(a9);
    ellipse(50, 140, 20, 20);
    fill(b9);
    ellipse(50, 190, 20, 20);
    fill(c9);
    ellipse(50, 240, 20, 20);
    fill(d9);
    ellipse(50, 290, 20, 20);
  }

  if (page==10) {
    background(#0000FF);
    t-=.03;
    if (t<0) {
      t=31;
      page=0;
    }
    fill(#000000);
    textFont(myFont, 20);
    text((int)t+ " s", 30, 30);
    if (dist(mouseX, mouseY, 50, 140)<10) {
      a10=#FFFF00;
    }
    else {
      a10=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 190)<10) {
      b10=#FFFF00;
    }
    else {
      b10=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 240)<10) {
      c10=#FFFF00;
    }
    else {
      c10=#00FF00;
    }
    if (dist(mouseX, mouseY, 50, 290)<10) {
      d10=#FFFF00;
    }
    else {
      d10=#00FF00;
    }
    text("10) De quel région est la Lyon?", 20, 100);
    text("A) Rhône-Alpes", 80, 150);
    text("B) Normandie", 80, 200);
    text("C) Midi-Pyrénées", 80, 250);
    text("D) Picardie", 80, 300);
    fill(a10);
    ellipse(50, 140, 20, 20);
    fill(b10);
    ellipse(50, 190, 20, 20);
    fill(c10);
    ellipse(50, 240, 20, 20);
    fill(d10);
    ellipse(50, 290, 20, 20);
  }

  if (page==11) {
    background(#FFFFFF);
    fill(#FFFF00);
    ellipse(250, 250, 100, 125);
    fill(#000000);
    rect(202, 230, 95, 5);
    arc(230, 236, 35, 35, 0, PI);
    arc(270, 236, 35, 35, 0, PI);
    line(250, 250, 240, 270);
    line(240, 270, 250, 270);
    fill(#FFFFFF);
    ellipse(250, 290, 30, 15);
    fill(#000000);
    textFont(myFont, 20);
    text("Félicitation!", 20, 50);
    text("Vous avez fini avec le jeu-questionnaire", 20, 100);
    text("et je suis fier de vous!", 20, 150);
    fill(lastButtonC);
    ellipse(400, 300, 80, 80);
    fill(#000000);
    text("rentre", 370, 305);
    if (dist(mouseX, mouseY, 400, 300)<40) {
      lastButtonC=#FFFF00;
    }
    else {
      lastButtonC=#00FF00;
    }
  }
}

void mousePressed() {
  if (page==0) {
    if (dist(mouseX, mouseY, 250, 360)<30) {
      page=1;
      t=31;
    }
  }
  if (page==30) {
    if (dist(mouseX, mouseY, 100, 320)<30) {
      t=31;
      page=0;
    }
  }
  if (page==1) {
    if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 240)<10||dist(mouseX, mouseY, 50, 290)<10) {
      t=31;
      page=30;
    }
    else if (dist(mouseX, mouseY, 50, 190)<10) {
      t=31;
      page=2;
    }
  }
  else
    if (page==2) {
      if (dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10||dist(mouseX, mouseY, 50, 290)<10) {
        t=31;
        page=30;
      }
      else if (dist(mouseX, mouseY, 50, 140)<10) {
        t=31;
        page=3;
      }
    }
    else
      if (page==3) {
        if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 290)<10) {
          t=31;
          page=30;
        }
        else if (dist(mouseX, mouseY, 50, 240)<10) {
          t=31;
          page=4;
        }
      }
      else
        if (page==4) {
          if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 290)<10) {
            t=31;
            page=30;
          }
          else if (dist(mouseX, mouseY, 50, 240)<10) {
            t=31;
            page=5;
          }
        }
        else
          if (page==5) {
            if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10) {
              t=31;
              page=30;
            }
            else if (dist(mouseX, mouseY, 50, 290)<10) {
              t=31;
              page=6;
            }
          }
          else
            if (page==6) {
              if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 240)<10||dist(mouseX, mouseY, 50, 290)<10) {
                t=31;
                page=30;
              }
              else if (dist(mouseX, mouseY, 50, 190)<10) {
                t=31;
                page=7;
              }
            }
            else
              if (page==7) {
                if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10) {
                  t=31;
                  page=30;
                }
                else if (dist(mouseX, mouseY, 50, 290)<10) {
                  t=31;
                  page=8;
                }
              }
              else 
                if (page==8) {
                if (dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10||dist(mouseX, mouseY, 50, 290)<10) {
                  t=31;
                  page=30;
                }
                else if (dist(mouseX, mouseY, 50, 140)<10) {
                  t=31;
                  page=9;
                }
              }
              else
                if (page==9) {
                  if (dist(mouseX, mouseY, 50, 140)<10||dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10) {
                    t=31;
                    page=30;
                  }
                  else if (dist(mouseX, mouseY, 50, 290)<10) {
                    t=31;
                    page=10;
                  }
                }
                else
                  if (page==10) {
                    if (dist(mouseX, mouseY, 50, 190)<10||dist(mouseX, mouseY, 50, 240)<10||dist(mouseX, mouseY, 50, 290)<10) {
                      t=31;
                      page=30;
                    }
                    else if (dist(mouseX, mouseY, 50, 140)<10) {
                      t=31;
                      page=11;
                    }
                  }
                  else 
                    if(page==11){
                      if (dist(mouseX, mouseY, 400, 300)<40) {
                        t=31;
                        page=0;
                      }
                    }
}

void wrong() {
  background(#FFFFFF);
  fill(#00FF00);
  ellipse(100, 320, 60, 60);
  fill(#000000);
  textFont(myFont, 30);
  text("Vous avez tort...", 50, 150);
  text("recommencer?", 70, 250);
  text("oui", 80, 330);
}


