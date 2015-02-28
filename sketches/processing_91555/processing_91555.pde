
 

int x = (int)random(550)-50;

int y = -50;

int x2 = 550;

int y2 = (int)random(550) - 50;

int x3 = (int)random(550) - 50;

int y3 = -50;

 int x4 = -50;

int y4 = (int)random(550) - 50;

int life1 = 3;

int life2 = 3;

int life3 = 3;

int life4 = 3;

int lifecontroller = 100;

int kills = 0;
 
int score = 0;

int xtroll = (int)(random(450));

int ytroll = (int)(random(450));

int extracounter = 0;

int clicker = 0;

double accuracy = 0;

double t = 0;
 
long starttime = System.currentTimeMillis();

long endtime = System.currentTimeMillis();

double totaltime = 0;

double totaltimeseconds = 0;

double FRPM = 0;

double scorefinal = 0;
 
int finalrank = 0;

int rank1 = 0;

int rank2 = 0;

int rank3 = 0;

int rank4 = 0;

//int wave = 1;

//int n = 0;

 

 

 

 
 

void setup() {

  size(500, 500);
}

void mousePressed() {

  clicker++;

  if ((mouseX > xtroll && mouseX < xtroll + 20 && mouseY < ytroll + 20 && mouseY > ytroll)) {
 
    if (lifecontroller > 0)    

      extracounter++;

    if (life1 < 3)

      life1++;

    if (life2 < 3)

      life2++;

    if (life3 < 3)
 
      life3++;

    if (life4 < 3)

      life4++;

    xtroll = (int)(random(450));

    ytroll = (int)(random(450));

    while ( (xtroll > 225 && xtroll < 325 && ytroll > 225 && ytroll < 325)) {
 
      xtroll = (int)(random(450));

      ytroll = (int)(random(450));
    }
  }

  else {

    if ((mouseX > x && mouseX < x + 50 && mouseY < y + 50 && mouseY > y)) {
 
      x = (int)random(550)-50;

      y = -50;

      if (life1-1 > 1) {

        life1--;
      }

      else {

        life1=1;
      }

      if (lifecontroller > 0)
 
        kills++;
    }

    else {

      if ((mouseX > x2 && mouseX < x2 + 50 && mouseY < y2 + 50 && mouseY > y2)) {

        x2 = 550;

        y2 = (int)random(550) - 50;
 
        if (life2-1 > 1) {

          life2--;
        }

        else {

          life2=1;
        }

        if (lifecontroller > 0)

          kills++;
       }

      else {

        if ((mouseX > x3 && mouseX < x3 + 50 && mouseY < y3 + 50 && mouseY > y3)) {

          x3 = 550;

          y3 = (int)random(550) - 50;
 
          if (life3-1 > 1) {

            life3--;
          }

          else {

            life3=1;
          }

          if (lifecontroller > 0)

            kills++;
         }

        else {

          if ((mouseX > x4 && mouseX < x4 + 50 && mouseY < y4 + 50 && mouseY > y4)) {

            x4 = (int)random(550)-50;

             y4 = 500;

            if (life4-1 > 1) {

              life4--;
            }

            else {

              life4=1;
            }

            if (lifecontroller > 0)
 
              kills++;
          }
        }
      }
    }
  }
}

void draw() {

  background(0);

  getcolorspec(lifecontroller);
  noFill();
  rect(225, 225, 100, 100);
 

  if (lifecontroller > 0 || (life1==0 && life2==0 && life3==0 && life4==0)) {

    textSize(32);

    if (lifecontroller > 0) {

      endtime = System.currentTimeMillis();
 
      totaltime = endtime - starttime; 

      totaltime = totaltime/60000;

      score = kills;

      accuracy = clicker;
    }

    if (lifecontroller <= 0) {

      lifecontroller = 0;
     }   

    text("HEALTH: " + lifecontroller, 10, 30);

    textSize(32);

    text("KILLS:" + kills, 320, 30);

    textSize(26);


    //    textSize(32);
 
    //    text("WAVE:" + wave, 250, 220);
  }

  else {

    // text(String.format("%.1f", totaltime), 10, 470);

    textSize(50);

    fill(255, 0, 0);
 
    scorefinal = (score/300*15000) + (t/100*15000) + (totaltimeseconds/180*15000) + (FRPM/200*15000);

    text("GAMEOVER!", 100, 100);

    textSize(35);

    fill(0, 255, 255);
 
    text("SCORE: " + String.format("%.0f", scorefinal), 10, 150);

    textSize(32);    

    t = (((kills + extracounter)/accuracy)*100);

    totaltimeseconds = totaltime * 60;
 
    FRPM = (accuracy/totaltime);

    textSize(26);

    //text("FRPM:" + String.format("%.0f", FRPM), 10, 400);

    fill(255);

    text("Press any key to restart the game", 20, 30);
 
    textSize(26);

    if (kills >= 150) {

      fill(0, 255, 0);

      text("Immortal", 300, 350);

      text("Kills: " + kills, 10, 350);

      rank4 = 1;
     }

    else {

      if (kills >= 100) {

        fill(#E0D873);

        text("War-Hero", 300, 350);

        text("Kills: " + kills, 10, 350);
 
        rank4 = 2;
      }

      else {

        if (kills >= 50) {

          fill(0, 255, 255);

          text("Average", 300, 350);

          text("Kills: " + kills, 10, 350);
 
          rank4 = 3;
        }

        else {

          if (kills >= 10) {

            fill(255, 50, 50);

            text("Novice", 300, 350);

            text("Kills: " + kills, 10, 350);
 
            rank4 = 4;
          }

          else {

            fill(255, 0, 0);

            text("Failure", 300, 350);

            text("Kills: " + kills, 10, 350);
 
            rank4 = 5;
          }
        }
      }
    }

    if (totaltimeseconds >= 70) {

      fill(0, 255, 0);

      text("Juggernaut", 300, 300);

       text("Survival Time: " + String.format("%.1f", totaltimeseconds), 10, 300);

      rank3 = 1;
    }

    else {

      if (totaltimeseconds >= 50) {

        fill(#E0D873);
 
        text("Survivalist", 300, 300);

        text("Survival Time: " + String.format("%.1f", totaltimeseconds), 10, 300);

        rank3 = 2;
      }

      else {
 
        if (totaltimeseconds >= 30) {

          fill(0, 255, 255);

          text("Average", 300, 300);

          text("Survival Time: " + String.format("%.1f", totaltimeseconds), 10, 300);
 
          rank3 = 3;
        }

        else {

          if (totaltimeseconds >= 15) {

            fill(255, 50, 50);

            text("Suicide Bomber?", 300, 300);
 
            text("Survival Time: " + String.format("%.1f", totaltimeseconds), 10, 300);

            rank3 = 4;
          }

          else {

            fill(255, 0, 0);
 
            text("Failure", 300, 300);

            text("Survival Time: " + String.format("%.1f", totaltimeseconds), 10, 300);

            rank3 = 5;
          }
         }
      }
    }

    if (FRPM >=150) {

      fill(0, 255, 0);

      text("Spam-Master", 300, 250);

      text("FRPM: " + String.format("%.0f", FRPM), 10, 250);
 
      rank2 = 1;
    }

    else {

      if (FRPM >= 100) {

        fill(#E0D873);

        text("Trigger-Happy", 300, 250);

        text("FRPM: " + String.format("%.0f", FRPM), 10, 250);
 
        rank2 = 2;
      }

      else {

        if (FRPM >= 80) {

          fill(0, 255, 255);

          text("Average", 300, 250);

          text("FRPM: " + String.format("%.0f", FRPM), 10, 250);
 
          rank2 = 3;
        }

        else {

          if (FRPM >= 50) {

            fill(255, 100, 100);

            text("Slow", 300, 250);

            text("FRPM: " + String.format("%.0f", FRPM), 10, 250);
 
            rank2 = 4;
          }

          else {

            fill(255, 0, 0);

            text("Failure", 300, 250);

            text("FRPM: " + String.format("%.0f", FRPM), 10, 250);
 
            rank2 = 5;
          }
        }
      }
    }

    if (t >= 98) {

      fill(0, 255, 0);

      text("SharpShooter", 300, 200);

      text("ACCURACY: " + String.format("%.2f", t) + "%", 10, 200);
 
      rank1 = 1;
    }

    else {

      if (t >= 80) {

        fill(#E0D873);

        text("Marksman", 300, 200);

        text("ACCURACY: " + String.format("%.2f", t) + "%", 10, 200);
 
        rank1= 2;
      }

      else {

        if (t >= 50) {

          fill(0, 255, 255);

          text("Average", 300, 200);

          text("ACCURACY: " + String.format("%.2f", t) + "%", 10, 200);
 
          rank1 = 3;
        }

        else {

          if (t>=20) {

            fill(255, 100, 100);

            text("Novice", 300, 200);

            text("ACCURACY: " + String.format("%.2f", t) + "%", 10, 200);
 
            rank1 = 4;
          }

          else {

            fill(255, 0, 0);

            text("Failure", 300, 200);

            text("ACCURACY: " + String.format("%.2f", t) + "%", 10, 200);
 
            rank1 = 5;
          }
        }
      }
    }

    fill(0, 255, 255);

    text("Overall Rank: ", 10, 400);

    finalrank = rank1 + rank2 + rank3 + rank4;
 
    text(finalrank - 3, 300, 400);

    switch(finalrank) {

    case 4:

      fill(255);

      text("Commander ", 10, 450);

      break;

    case 5:
 
      fill(255);

      text("General ", 10, 450);

      break;

    case 6:

      fill(255);

      text("Lieutenant ", 10, 450);

      break;
 
    case 7:

      fill(255);

      text("Lieutenant General ", 10, 450);

      break;

    case 8:

      fill(255);

      text("Major General ", 10, 450);
 
      break;

    case 9:

      fill(255);

      text("Brigadier General ", 10, 450);

      break;

    case 10:

      fill(255);

      text("Colonel ", 10, 450);
 
      break;

    case 11:

      fill(255);

      text("Lieutenant Colonel ", 10, 450);

      break;

    case 12:

      fill(255);

      text("Major ", 10, 450);
 
      break;

    case 13:

      fill(255);

      text("Captain ", 10, 450);

      break;

    case 14:

      fill(255);

      text("1st Lieutenant ", 10, 450);
 
      break;

    case 15:

      fill(255);

      text("Commander Sergeant Major ", 10, 450);

      break;

    case 16:

      fill(255);

       text("Sergeant Major ", 10, 450);

      break;

    case 17:

      fill(255);

      text("First Sergeant ", 10, 450);

      break;

    case 18:
 
      fill(255);

      text("Sergeant ", 10, 450);

      break;

    case 19:

      fill(255);

      text("Corporal ", 10, 450);

      break;
 
    case 20:

      fill(255);

      text("Private ", 10, 450);

      break;
    }
  }  

 

  getcolorspec(lifecontroller);

  rect(225, 225, 100, 100);
 
  //  if(life1 == 0 && life2 == 0 && life3 == 0 && life4 == 0);

  //  while (wave < 10){

  //  while(wave != n){

  if (lifecontroller >= 0) {

    getcolor(life1);
     noFill();
    rect(x, y, 50, 50);

    getcolor(life2);
    noFill();
    rect(x2, y2, 50, 50);

    getcolor(life3);
    noFill();
    rect(x3, y3, 50, 50);

    getcolor(life4);
     noFill();
    rect(x4, y4, 50, 50);

    getcolor(0);
    noFill();
    rect(xtroll, ytroll, 20, 20);

    move1();

    move2();

    move3();

    move4();
 
    //  }

    //  n++;

    //  }
  }
  else {

    noFill();

    noStroke();

    rect(x4, y4, 50, 50);

    rect(x3, y3, 50, 50);

    rect(x2, y2, 50, 50);
 
    rect(x, y, 50, 50);

    textSize(26);

    rect(xtroll, ytroll, 20, 20);

    move1();

    move2();

    move3();

    move4();
  }
}

//}
 
 


void getcolorspec(float a) {

  if (a >= 90 && a <= 100) {

    stroke(255);
  }

  else {

    if (a >= 80 && a < 90) {

      stroke(#76766e);
     }

    else {

      if (a >= 70 && a < 80) {

        stroke(100, 0, 100);
      }

      else {

        if (a >= 60 && a < 70) {

           stroke(0, 0, 255);
        }

        else {

          if (a >= 50 && a < 60) {

            stroke(#00ffc3);
          }

          else {

            if (a >= 40 && a < 50) {
 
              stroke(#2a9c3b);
            }

            else {

              if (a >= 30 && a < 40) {

 

 

 

                stroke(#a1bd68);
               }

              else {

                if (a >= 20 && a < 30) {

                  stroke(#fdf700);
                }

                else {

  

 

 

                  if (a >= 10 && a < 20) {

                    stroke(#ff0055);
                  }

                  else {

                    if (a > 0 && a < 10) {
 
 

 

 

                      stroke(#ff003c);
                    }

                    else {

                      if (a <= 0) {

                        noFill();
 
                        noStroke();

                        rect(225, 225, 100, 100);
                      }
                    }
                  }
                }
              }
            }
           }
        }
      }
    }
  }
}

void getcolor(float a) {

  if (a >= 3) {

    stroke(#00CD00);
  }

  else {

    if (a == 2) {

      stroke(#EE1289);
     }

    else {

      if (a == 1) {

        stroke(#FF0000);
      }

      else {

        if (a == 0) {

          stroke(0, 0, 255);
        }
      }
     }
  }
}

void move1() {

  if (y >= 230 && y <= 320 && x >= 230 && x <=320) {

    lifecontroller-=(6/life1);

    x = (int)random(550)-50;
 
    y = -50;
  }

  else {

    if (x < 225 && x > 325 && y > 225 && y < 325) {

 

 

 

      x = (int)random(550) - 50;
 
      y = 0;
    }

    else {

      if (250 > y && 250 > x && life1 > 0) {

        y = y + 3/life1;

        x = x + 3/life1;
      }

 
 
 

 

      else {

        if (250 < y && 250 < x && life1 > 0) {

          y = y - 3/life1;

          x = x - 3/life1;
        }

         else {

          if (250 < x && 250 > y && life1 > 0) {

            x = x - 3/life1;

            y = y + 3/life1;
          }

          else {
 
            if (250 > x && 250 < y && life1 > 0) {

 

 

 

              x = x + 3/life1;

              y = y - 3/life1;
            }
 
            else {

              if (250 == x && 250 > y && life1 > 0) {

                y+=3/life1;
              }

              else {

                if (250 == x && 250 < y && life1 > 0) {
 
                  y-=3/life1;
                }

                else {

 

 

 

                  if (250 == y && 250 > x && life1 > 0) {

                     x+=3/life1;
                  }

                  else {

                    if (250 == y && 250 < x && life1 > 0) {

 

 

 
 
                      x-=3/life1;
                    }

                    else {

                      if (y == 250 && x == 250) {

                        lifecontroller--;
 
                        x = (int)random(550)-50;

                        y = 0;
                      }
                    }
                  }
                }
              }
            }
           }
        }
      }
    }
  }
}

 

 

 

 

 

 

 

 

 

void move2() {

  if (y2 >= 230 && y2 <= 320 && x2 >= 230 && x2 <=320) {
 
    lifecontroller-=(6/life2);

    x2 = 550;

    y2 = (int)random(550) - 50;
  }

  else {

    if (250 > y2 && 250 > x2 && life2 > 0) {

      y2 = y2 + 3/life2;
 
      x2 = x2 + 3/life2;
    }

    else {

      if (250 < y2 && 250 < x2 && life2 > 0) {

 

 

 

        y2 = y2 - 3/life2;

         x2 = x2 - 3/life2;
      }

      else {

        if (250 < x2 && 250 > y2 && life2 > 0) {

          x2 = x2 - 3/life2;

 

 

 
 
          y2 = y2 + 3/life2;
        }

        else {

          if (250 > x2 && 250 < y2) {

            x2 = x2 + 3/life2;

            y2 = y2 - 3/life2;
          }
 
 

 

 

          else {

            if (250 == x2 && 250 > y2 && life2 > 0) {

              y2+=3/life2;
            }

            else {
 
              if (250 == x2 && 250 < y2 && life2 > 0) {

 

 

 

                y2-=3/life2;
              }

              else {

                if (250 == y2 && 250 > x2 && life2 > 0) {
 
                  x2+=3/life2;
                }

 

 

 

                else {

                  if (250 == y2 && 250 < x2 && life2 > 0) {
 
                    x2-=3/life2;
                  }

                  else {

 

 

 

                    if (250 == x2 && 250 == y2) {

                      x2 = 550;
 
                      y2 = (int)random(550) - 50;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
 
 

 

 

 


void move3() {

  if (y3 >= 230 && y3 <= 320 && x3 >= 230 && x3 <=320) {

    lifecontroller-=(6/life3);
 
    x3 = 550;

    y3 = (int)random(550) - 50;
  }

  else {

    if (250 > y3 && 250 > x3 && life3 > 0) {

      y3 = y3 + 3/life3;

      x3 = x3 + 3/life3;
     }

    else {

 

 

 

      if (250 < y3 && 250 < x3 && life3 > 0) {

        y3 = y3 - 3/life3;

        x3 = x3 - 3/life3;
       }

      else {

        if (250 < x3 && 250 > y3 && life3 > 0) {

 

 

 

          x3 = x3 - 3/life3;

          y3 = y3 + 3/life3;
         }

        else {

          if (250 > x3 && 250 < y3 && life3 > 0) {

            x3 = x3 + 3/life3;

 

 

 

            y3 = y3 - 3/life3;
           }

          else {

            if (250 == x3 && 250 > y3 && life3 > 0) {

              y3+=3/life3;
            }

 

 

 

             else {

              if (250 == x3 && 250 < y3 && life3 > 0) {

                y3-=3/life3;
              }

              else {

                if (250 == y3 && 250 > x3 && life3 > 0) {
 
 

 

 

                  x3+=3/life3;
                }

                else {

                  if (250 == y3 && 250 < x3 && life3 > 0) {
 
                    x3-=3/life3;
                  }

                  else {

                    if (250 == x3 && 250 == y3) {

                      x3 = 550;

                      y3 = (int)random(550) - 50;
                     }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

 

 

 

 


 void move4() {

  if (y4 >= 230 && y4 <= 320 && x4 >= 230 && x4 <=320) {

    lifecontroller-=(6/life4);

    x4 = (int)random(550)-50;

    y4 = 550;
   }

  else {

    if (250 > y4 && 250 > x4 && life4 > 0) {

      y4 = y4 + 3/life4;

      x4 = x4 + 3/life4;
    }

    else {

      if (250 < y4 && 250 < x4 && life4 > 0) {
 
        y4 = y4 - 3/life4;

        x4 = x4 - 3/life4;
      }

      else {

 

 

 

        if (250 < x4 && 250 > y4 && life4 > 0) {
 
          x4 = x4 - 3/life4;

          y4 = y4 + 3/life4;
        }

        else {

          if (250 > x4 && 250 < y4 && life4 > 0) {

 

 
 
 

            x4 = x4 + 3/life4;

            y4 = y4 - 3/life4;
          }

          else {

            if (250 == x4 && 250 > y4 && life4 > 0) {
 
              y4+=3/life4;
            }

            else {

              if (250 == x4 && 250 < y4 && life4 > 0) {

                y4-=3/life4;
              }
 
              else {

 

 

 

                if (250 == y4 && 250 > x4 && life4 > 0) {

                  x4+=3/life4;
                }

                 else {

                  if (250 == y4 && 250 < x4 && life4 > 0) {

 

 

 

                    x4-=3/life4;
                  }
 
                  else {

                    if (250 == x4 && 250 == y4 && life4 > 0) {

                      x4 = (int)random(550)-50;

 

 

 
 
                      y4 = 500;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void keyPressed() {
 
  setup();

  x = (int)random(550)-50;

  y = -50;

  x2 = 550;

  y2 = (int)random(550)-50;

  x3 = (int)random(550) - 50;

  y3 = -50;

  x4 = -50;
 
  y4 = (int)random(550) - 50;

  life1 = 3;

  life2 = 3;

  life3 = 3;

  life4 = 3;

  lifecontroller = 100;

  kills = 0;

  score = 0;

  xtroll = (int)(random(450));
 
  ytroll = (int)(random(450));

  extracounter = 0;

  clicker = 0;

  accuracy = 0;

  t = 0;

  starttime = System.currentTimeMillis();

  endtime = System.currentTimeMillis();
 
  totaltime = 0;

  totaltimeseconds = 0;

  FRPM = 0;

  scorefinal = 0;

  finalrank = 0;

  rank1 = 0;

  rank2 = 0;

  rank3 = 0;

  rank4 = 0;
 }

