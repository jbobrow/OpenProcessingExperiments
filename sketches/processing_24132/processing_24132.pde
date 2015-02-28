
/*Authors: Lopez, Omar
 *         Simmons, Cliff
 *         Syrkin, Vlada
 *  Title: Rock Paper Scissors
 *  Class: DMA 28 | Winter 2011
 *
 */
 
           //PART A0 - Declare Variables
       int countera;
       int counterb;
     float duration = 1000; //each second is worth 1000 units, i.e. 2 seconds would be 2000
     float dx;
     float now;
     PFont gametype; 
    String screenstate = "start_screen";
    String playstate = "nothing";
    String pointsa = "";
    String pointsb = "";
       int roundnumber = 1;
     float then;
     float thenweaponsdisplay;
    String proceedtostep = "nothing";
       int weapona;
       int weaponb;

    
           //PART B0 - Setup
      void setup()
           {
             size(640, 480);
             //smooth();
             
             gametype = loadFont("GameOver.vlw");
             
             textMode(MODEL);
           }
          
           //PART C0 - Drawing
      void draw()
           {
             /* Adjust variables */
             now = millis();
             
             /* Make white Background */
             background(0);
             
             if(screenstate == "start_screen") //lets player decide whether to face computer or another human being
             {
               fill(0,255,0);
               noStroke();
               
               textAlign(CENTER);
               textFont(gametype,110);
               text("ROCK, PAPER AND SCISSORS",width/2,60);
               
               textAlign(LEFT);
               textFont(gametype,45);
               text("human vs computer", 25, 450);
               text("human vs human", 470, 450);
               
               textAlign(LEFT);
               textFont(gametype,45);
               text("for P1 press:", 25*1, width/2 - 75);
               text("for P2 press:", 25*1, width/2 + 25 - 75);
               drawRock(25*2+128.75*1, width/2 - 140 - 75.0, .45);
               text("\"A\"", 25*2+128.75*1, width/2 - 75);
               text("\"J\"", 25*2+128.75*1, width/2+25 - 75);
               drawPaper(25*3+128.75*2, width/2 - 140 - 75, .5);
               text("\"S\"", 25*3+128.75*2, width/2 - 75);
               text("\"K\"", 25*3+128.75*2, width/2+25 - 75);
               drawScissors(25*4+128.75*3, width/2 - 140 - 75, .5);
               fill(0,255,0);
               text("\"D\"", 25*4+128.75*3, width/2 - 75);
               text("\"L\"", 25*4+128.75*3, width/2+25 - 75);
               
                              
               if(mouseX>25 && mouseX<192 && mouseY>430 && mouseY<458)
               {
                 fill(0,255,0);
                 rect(20,430,190,25);
                 fill(0);
                 text("human vs computer", 25, 450);
                 if(mousePressed)
                 {
                   proceedtostep = "PREP_human_vs_computer_difficulty_menu_screen";
                   then = now;
                 }
               }
               
               else if(mouseX>465 && mouseX<612 && mouseY>430 && mouseY<458)
               {
                 fill(0,255,0);
                 rect(430,430,190,25);
                 fill(0);
                 text("human vs human", 470, 450);
                 if(mousePressed)
                 {
                   proceedtostep = "PREP_play_screen";
                   playstate = "human_vs_human";
                   then = now;
                 }
               }
              
               if(proceedtostep == "PREP_human_vs_computer_difficulty_menu_screen" || proceedtostep == "PREP_play_screen")
               {
                 if(now <= then + duration)
                 {
                   fill(0);
                   noStroke();
                   if(playstate == "human_vs_human") rect(width*(1-((now-then)/duration)),0,width,height);
                   else rect(width*(1-((now-then)/duration)),420,width,60);
                 }
                 else if( now > then + duration)
                 {
                   if(proceedtostep == "PREP_human_vs_computer_difficulty_menu_screen")
                   {
                     proceedtostep = "nothing";
                     screenstate = "human_vs_computer_difficulty_menu_screen";
                   }
                   else if(proceedtostep == "PREP_play_screen")
                   {
                     proceedtostep = "nothing";
                     screenstate = "play_screen";
                   }
                 }
               }
             }
             //------------------------------------------------------------------------------------------
             else if(screenstate == "human_vs_computer_difficulty_menu_screen")
             {
               fill(0,255,0);
               noStroke();
           
               textFont(gametype,110);
               textAlign(CENTER);
               text("ROCK, PAPER AND SCISSORS",width/2,60);
               
               textAlign(LEFT);
               textFont(gametype,45);
               text("select difficulty:", 25, 450 - 5*25);
               text("   NORMAL", 25, 450 - 4*25);
               text("   HARD", 25, 450 - 3*25);
               text(">>back", 25 - 16, 450);
               
               textAlign(LEFT);
               textFont(gametype,45);
               text("for P1 press:", 25*1, width/2 - 75);
               text("for P2 press:", 25*1, width/2 + 25 - 75);
               drawRock(25*2+128.75*1, width/2 - 140 - 75, .45);
               text("\"A\"", 25*2+128.75*1, width/2 - 75);
               text("\"J\"", 25*2+128.75*1, width/2+25 - 75);
               drawPaper(25*3+128.75*2, width/2 - 140 - 75, .5);
               text("\"S\"", 25*3+128.75*2, width/2 - 75);
               text("\"K\"", 25*3+128.75*2, width/2+25 - 75);
               drawScissors(25*4+128.75*3, width/2 - 140 - 75, .5);
               text("\"D\"", 25*4+128.75*3, width/2 - 75);
               text("\"L\"", 25*4+128.75*3, width/2+25 - 75);
               
               if(mouseX>25 - 16 && mouseX<192 - 16 - 100 && mouseY>430 && mouseY<458)
               {
                 fill(0,255,0);
                 rect(20 - 16,430,190 - 100,25);
                 fill(0);
                 text(">>back", 25 - 16, 450);
                 if(mousePressed)
                 {
                   proceedtostep = "PREP_start_screen";
                   then = now;
                 }
               }
               
               if(mouseX>20 && mouseX<20+120 && mouseY>330 && mouseY<355)
               {
                 fill(0,255,0);
                 rect(20,330,120,25);
                 fill(0);
                 text("   NORMAL", 25, 350);
                 if(mousePressed)
                 {
                   proceedtostep = "PREP_play_screen";
                   playstate = "human_vs_cpu_normal";
                   then = now;
                 }
               }
               
               if(mouseX>20 && mouseX<20+120 && mouseY>355 && mouseY<380)
               {
                 fill(0,255,0);
                 rect(20,355,120,25);
                 fill(0);
                 text("   HARD", 25, 375);
                 if(mousePressed)
                 {
                   proceedtostep = "PREP_play_screen";
                   playstate = "human_vs_cpu_hard";
                   then = now;
                 }
               }
               
               if(proceedtostep == "PREP_start_screen" || proceedtostep == "PREP_play_screen")
               {
                 if(now <= then + duration)
                 {
                   fill(0);
                   noStroke();
                   if (proceedtostep == "PREP_start_screen") rect((width-500)*(1-((now-then)/duration)),280,width,200);
                   else rect(width*(1-((now-then)/duration)),0,width,height);
                 }
                 else if( now > then + duration)
                 {
                   if(proceedtostep == "PREP_start_screen")
                   {
                     proceedtostep = "nothing";
                     screenstate = "start_screen";
                     then = now;
                   }
                   else if(proceedtostep == "PREP_play_screen")
                   {
                     proceedtostep = "nothing";
                     screenstate = "play_screen";
                     then = now;
                   }
                 }
               }

             }
             //------------------------------------------------------------------------------------------
             else if(screenstate == "play_screen")
             {
               if(now <= then + 6*duration)
               {
                 if(now < then + 2*duration)
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 110);
                   textAlign(CENTER);
                   text("ROUND "+roundnumber+" GET READY!",width/2,height/2);
                 }
                 else if(now < then + 3*duration)
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 110);
                   textAlign(CENTER);
                   text("3",width/2,height/2);
                 }
                 else if(now < then + 4*duration)
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 110);
                   textAlign(CENTER);
                   text("2",width/2,height/2);
                 }
                 else if(now < then + 5*duration)
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 110);
                   textAlign(CENTER);
                   text("1",width/2,height/2);
                 }
                 else if(now < then + 6*duration)
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 110);
                   textAlign(CENTER);
                   text("GO!",width/2,height/2);
                 }
                 
                 if(playstate == "human_vs_human")
                 {
                   noStroke();
                   fill(0,255,0);
                   textFont(gametype, 40);
                   textAlign(CENTER);
                   text("(Be sure to cover your side of the keyboard from your opponents gaze)",width/2,height - 100);
                 }
               }
               if(now > then + 6*duration)
               {
                 stroke(0,255,0);
                 line(width/2,0,width/2,height);
                 noStroke();
                 
                 fill(0,255,0);
                 textFont(gametype, 45);
                 textAlign(LEFT);
                 text("player 1 | "+pointsa, 25, 450);
                 textAlign(RIGHT);
                 if(playstate == "human_vs_human") text(pointsb+" | player 2", 615, 450);
                 else text(pointsb+" | computer", 615, 450);
               }
               
               if(playstate == "human_vs_human") //---------------------------------------------------------HUMAN VS HUMAN
               {                  
                 if(keyPressed)
                 {
                   /*---Player 1---*/
                   if((key=='A' || key=='a') && countera == 0)
                   {
                     weapona = 1;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='S' || key=='s') && countera == 0)
                   {
                     weapona = 2;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='D' || key=='d') && countera == 0)
                   {
                     weapona = 3;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   /*---Player 2---*/
                   if((key=='J' || key=='j') && counterb == 0)
                   {
                     weaponb = 1;
                     counterb++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='K' || key=='k') && counterb == 0)
                   {
                     weaponb = 2;
                     counterb++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='L' || key=='l') && counterb == 0)
                   {
                     weaponb = 3;
                     counterb++;
                     thenweaponsdisplay = now;
                   }
                 }
                 /*---Finishing round process---*/
                 if(countera != 0 && counterb !=0)
                 {
                   if(now <= thenweaponsdisplay + 2*duration)
                   {
                     if(weapona == 1) drawRock(.25*width - 50, 200, .45);
                     else if(weapona == 2) drawPaper(.25*width - 50, 200, .5);
                     else if(weapona == 3) drawScissors(.25*width - 50, 200, .5);
                       
                     if(weaponb == 1) drawRock(.75*width - 50, 200, .45);
                     else if(weaponb == 2) drawPaper(.75*width - 50, 200, .5);
                     else if(weaponb == 3) drawScissors(.75*width - 50, 200, .5);
                   }
                   else
                   { 
                     /*--Print Points--*/
                     if(weapona==1 && weaponb==1){pointsa += "x"; pointsb += "x";} //rock doesn't destroy rock
                     if(weapona==2 && weaponb==2){pointsa += "x"; pointsb += "x";} //paper doesn't destroy paper
                     if(weapona==3 && weaponb==3){pointsa += "x"; pointsb += "x";} //scissors doesn't destroy scissors
                     if(weapona==1 && weaponb==2){pointsa += ""; pointsb += "x";} //rock gets destroyed by paper
                     if(weapona==1 && weaponb==3){pointsa += "x"; pointsb += "";} //rock destroys scissors
                     if(weapona==2 && weaponb==1){pointsa += "x"; pointsb += "";} //paper destroys rock
                     if(weapona==2 && weaponb==3){pointsa += ""; pointsb += "x";} //paper gets destroyed by scissors
                     if(weapona==3 && weaponb==1){pointsa += ""; pointsb += "x";} //scissors gets destroed by rock
                     if(weapona==3 && weaponb==2){pointsa += "x"; pointsb += "";} //scissors destroys paper
                     
                     /*--Refresh Game --*/ 
                     countera = 0;
                     counterb = 0;
                     weapona = 0;
                     weaponb = 0;
                     roundnumber++;
                     if(roundnumber>3)
                     {
                       screenstate = "points_screen";
                       proceedtostep = "nothing";
                     }
                     then=now;
                   }
                 }
                 /*---Exiting round process---*/
                 if(proceedtostep == "PREP_points_screen")
                 {
                   if(now <= then + duration)
                   {
                     noStroke();
                     fill(0,255,0);
                     rect(width*(1-((now-then)/duration)),0,width,height);
                   }
                   else if(now > then + duration)
                   {
                     screenstate = "points_screen";
                     proceedtostep = "nothing";
                   }
                 }
               }
               else if(playstate == "human_vs_cpu_hard")  //---------------------------------------------------------HUMAN VS CPU HARD
               {
                 if(keyPressed)
                 {
                   /*---Player 1---*/
                   if((key=='A' || key=='a') && countera == 0)
                   {
                     weapona = 1;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='S' || key=='s') && countera == 0)
                   {
                     weapona = 2;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='D' || key=='d') && countera == 0)
                   {
                     weapona = 3;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   /*---CPU---*/
                   if(counterb == 0)
                   {
                     if(weapona == 1) weaponb = 2;
                     if(weapona == 2) weaponb = 3;
                     if(weapona == 3) weaponb = 3;
                     counterb++;
                   }
                 }
                 /*---Finishing round process---*/
                 if(countera != 0 && counterb !=0)
                 {
                   if(now <= thenweaponsdisplay + 2*duration)
                   {
                     if(weapona == 1) drawRock(.25*width - 50, 200, .45);
                     else if(weapona == 2) drawPaper(.25*width - 50, 200, .5);
                     else if(weapona == 3) drawScissors(.25*width - 50, 200, .5);
                       
                     if(weaponb == 1) drawRock(.75*width - 50, 200, .45);
                     else if(weaponb == 2) drawPaper(.75*width - 50, 200, .5);
                     else if(weaponb == 3) drawScissors(.75*width - 50, 200, .5);
                   }
                   else
                   { 
                     /*--Print Points--*/
                     if(weapona==1 && weaponb==1){pointsa += "x"; pointsb += "x";} //rock doesn't destroy rock
                     if(weapona==2 && weaponb==2){pointsa += "x"; pointsb += "x";} //paper doesn't destroy paper
                     if(weapona==3 && weaponb==3){pointsa += "x"; pointsb += "x";} //scissors doesn't destroy scissors
                     if(weapona==1 && weaponb==2){pointsa += ""; pointsb += "x";} //rock gets destroyed by paper
                     if(weapona==1 && weaponb==3){pointsa += "x"; pointsb += "";} //rock destroys scissors
                     if(weapona==2 && weaponb==1){pointsa += "x"; pointsb += "";} //paper destroys rock
                     if(weapona==2 && weaponb==3){pointsa += ""; pointsb += "x";} //paper gets destroyed by scissors
                     if(weapona==3 && weaponb==1){pointsa += ""; pointsb += "x";} //scissors gets destroed by rock
                     if(weapona==3 && weaponb==2){pointsa += "x"; pointsb += "";} //scissors destroys paper
                     
                     /*--Refresh Game --*/ 
                     countera = 0;
                     counterb = 0;
                     weapona = 0;
                     weaponb = 0;
                     roundnumber++;
                     if(roundnumber>3)
                     {
                       screenstate = "points_screen";
                       proceedtostep = "nothing";
                     }
                     then=now;
                   }
                 }
                 /*---Exiting round process---*/
                 if(proceedtostep == "PREP_points_screen")
                 {
                   if(now <= then + duration)
                   {
                     noStroke();
                     fill(0,255,0);
                     rect(width*(1-((now-then)/duration)),0,width,height);
                   }
                   else if(now > then + duration)
                   {
                     screenstate = "points_screen";
                     proceedtostep = "nothing";
                   }
                 }
               }
               else if(playstate == "human_vs_cpu_normal") //---------------------------------------------------------HUMAN VS CPU NORMAL
               {
                 if(keyPressed)
                 {
                   /*---Player 1---*/
                   if((key=='A' || key=='a') && countera == 0)
                   {
                     weapona = 1;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='S' || key=='s') && countera == 0)
                   {
                     weapona = 2;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   else if((key=='D' || key=='d') && countera == 0)
                   {
                     weapona = 3;
                     countera++;
                     thenweaponsdisplay = now;
                   }
                   /*---CPU---*/
                   if(counterb == 0)
                   {
                     weaponb = round(random(1,3));
                     counterb++;
                   }
                 }
                 /*---Finishing round process---*/
                 if(countera != 0 && counterb !=0)
                 {
                   if(now <= thenweaponsdisplay + 2*duration)
                   {
                     if(weapona == 1) drawRock(.25*width - 50, 200, .45);
                     else if(weapona == 2) drawPaper(.25*width - 50, 200, .5);
                     else if(weapona == 3) drawScissors(.25*width - 50, 200, .5);
                       
                     if(weaponb == 1) drawRock(.75*width - 50, 200, .45);
                     else if(weaponb == 2) drawPaper(.75*width - 50, 200, .5);
                     else if(weaponb == 3) drawScissors(.75*width - 50, 200, .5);
                   }
                   else
                   { 
                     /*--Print Points--*/
                     if(weapona==1 && weaponb==1){pointsa += "x"; pointsb += "x";} //rock doesn't destroy rock
                     if(weapona==2 && weaponb==2){pointsa += "x"; pointsb += "x";} //paper doesn't destroy paper
                     if(weapona==3 && weaponb==3){pointsa += "x"; pointsb += "x";} //scissors doesn't destroy scissors
                     if(weapona==1 && weaponb==2){pointsa += ""; pointsb += "x";} //rock gets destroyed by paper
                     if(weapona==1 && weaponb==3){pointsa += "x"; pointsb += "";} //rock destroys scissors
                     if(weapona==2 && weaponb==1){pointsa += "x"; pointsb += "";} //paper destroys rock
                     if(weapona==2 && weaponb==3){pointsa += ""; pointsb += "x";} //paper gets destroyed by scissors
                     if(weapona==3 && weaponb==1){pointsa += ""; pointsb += "x";} //scissors gets destroed by rock
                     if(weapona==3 && weaponb==2){pointsa += "x"; pointsb += "";} //scissors destroys paper
                     
                     /*--Refresh Game --*/ 
                     countera = 0;
                     counterb = 0;
                     weapona = 0;
                     weaponb = 0;
                     roundnumber++;
                     if(roundnumber>3)
                     {
                       screenstate = "points_screen";
                       proceedtostep = "nothing";
                     }
                     then=now;
                   }
                 }
                 /*---Exiting round process---*/
                 if(proceedtostep == "PREP_points_screen")
                 {
                   if(now <= then + duration)
                   {
                     noStroke();
                     fill(0,255,0);
                     rect(width*(1-((now-then)/duration)),0,width,height);
                   }
                   else if(now > then + duration)
                   {
                     screenstate = "points_screen";
                     proceedtostep = "nothing";
                   }
                 }
               }
             } 
             //------------------------------------------------------------------------------------------
             else if(screenstate == "points_screen") // displays winner and whether or not to pay again or o to main menu
             {
               if(playstate == "human_vs_human")
               {
                 fill(0,255,0);
                 textFont(gametype, 110);
                 textAlign(CENTER);
                 if(pointsa.length() > pointsb.length()) text("PLAYER 1 WINS",width/2,height/2);
                 if(pointsa.length() < pointsb.length()) text("PLAYER 2 WINS",width/2,height/2);
                 if(pointsa.length() == pointsb.length()) text("TIE GAME",width/2,height/2);
               }
               
               else if(playstate == "human_vs_cpu_normal" || playstate == "human_vs_cpu_hard")
               {
                 fill(0,255,0);
                 textFont(gametype, 110);
                 textAlign(CENTER);
                 if(pointsa.length() > pointsb.length()) text("HUMAN WINS",width/2,height/2);
                 if(pointsa.length() < pointsb.length()) text("COMPUTER WINS",width/2,height/2);
                 if(pointsa.length() == pointsb.length()) text("TIE GAME",width/2,height/2);
               }
               
               textFont(gametype, 45);
               textAlign(CENTER);
               text("go again",width/2,height/2 + 100);
               text("main menu",width/2,height/2 + 125);
               
               if(mouseX>(width/2 - 40) && mouseX<(width/2 + 40) && mouseY>(height/2 + 100 - 20) && mouseY<(height/2 + 100 + 5))
               {
                 fill(0,255,0);
                 rect((width/2 - 40), (height/2 + 100 - 20), 80 ,25);
                 fill(0);
                 textFont(gametype, 45);
                 textAlign(CENTER);
                 text("go again",width/2,height/2 + 100);
                 if(mousePressed)
                 {
                   screenstate = "play_screen";
                   pointsa = "";
                   pointsb = "";
                   roundnumber = 1;
                   then = now; 
                 }
               }
               
               if(mouseX>(width/2 - 45) && mouseX<(width/2 + 45) && mouseY>(height/2 + 100 - 20 + 25) && mouseY<(height/2 + 100 + 5 + 25))
               {
                 fill(0,255,0);
                 rect((width/2 - 45), (height/2 + 100 - 20 + 25), 90 ,25);
                 fill(0);
                 textFont(gametype, 45);
                 textAlign(CENTER);
                 text("main menu",width/2,height/2 + 100 + 25);
                 if(mousePressed)
                 {
                   screenstate = "start_screen";
                   pointsa = "";
                   pointsb = "";
                   roundnumber = 1; 
                 }
               }
             }
          }

