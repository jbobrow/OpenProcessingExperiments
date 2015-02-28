
/*Okay, so, this code was made when I was still new to Processing,
and didn't know that things like Box2D exsisted. Were I to code 
this today, it would be unspeakably awesome. As it is though, 
the code is huge and bulky, but most importantly it functions.
Mostly.*/

int playX, playY, deathCount, damX, damX1, damY, eyes, gameState, bylineRan;
int [] bull = {75, playX+10, 410, 525, 425, 75, 225, 475, 525, 175, 225, 275, 375, 425, 475};
boolean [] evil = {true, true, true, true, true, true, true, true, true, true, true, true, true, true};
boolean [] shoot = {false, false, false, false, false, false, false, false, false, false, false, false, false, false}; 
boolean [] hat = {true, true, true, true, true, true, true, true, true};
boolean lasers, tHat, caneState;
PFont theFont, aFont;
String [] tex = {"Dying really isn't going to help you reach your goals.", "Maybe if you had some kind of weapon.", "Now you have a monocle, same as those brutes there.", "You want to hold  Z to shoot Left, and X to shoot Right.", "Jolly Good! Now you have a tophat.With that you can", "take one hit from those ruffians without dying.", "This here is that broad you were after. You might want to save her.", "Good Show! Now you have a cane. It doesn't do ", "very much, but it makes you look quite dashing!", "Well, I say, Old Chap! She's gone and run off!", "Guess you looked like someone else..." };
String words, byline, instructions, instructions2;

void setup(){
  size (600, 400);
  smooth();
  playX = 30;
  playY = 370;
  lasers = false;
  tHat = false;
  caneState = false;
  theFont = loadFont ("candaraFont.vlw");
  aFont = loadFont ("chiller100.vlw");
  deathCount = 0;
  words = tex[0];
  damX = 460;
  damY = 320;
  eyes = 5;
  gameState = 0;
  bylineRan = int(random(1,5));
  byline = "meh";
  instructions = "Right oh, then. So here's the run down. Seems there was some lovely little owl tart you had started to take a shine to. Problem is these ruffians, the Dire Owls, decided to take her somewhere against her will. Group of bloody brutes, they are. So now, you've got to go rescue her from their clutches. Or talons, as the case may be. Must keep a stiff upper lip though, Old Sport. But do watch out. Sometimes if you're not careful, you can become what you seek to destroy. Or some sort of bullocks to that effect.";
  instructions2 = "You'll need to use the arrow keys to move around the Dire Owls' dastardly lair. Certainly, you'll have to do more than that, but I suppose you can figure that out as you go. Right, Old Chap?";
  damX1 = 360;
  
}

void draw(){
  if (gameState == 0){
    background (0);
    fill(0, 255, 0);
    textFont (theFont, 48);
    text ("Start!", 350, 380);
    if (mouseX > 350 && mouseX < 460 && mouseY < 380 && mouseY > 340){
      stroke (255);
      noFill();
      rect (350, 340, 110, 50);
      if (mousePressed){
        gameState = 2;
      }
    }
    fill (0, 0, 255);
    text ("Instructions", 300, 340);
    if (mouseX > 300 && mouseX <550 && mouseY < 340 && mouseY > 290){
     stroke(255);
     noFill();
     rect (300, 300, 250, 50); 
     if (mousePressed){
      gameState = 1; 
     }
    }
    fill (255, 0,0);
    text ("DIRE OWL", 260, 120);
    textFont (theFont, 20);
    text ("*", 460, 100);
    textFont (theFont, 10);
    text ("*With apologies to the webcomic HappleTea", 10, height-10);
   
    //owl
    fill (#E59B2A);
   stroke (0);
   rect (50, 70, 150, 150);
   fill (#7E1D05);
   triangle (50, 70, 50+75, 70, 50+38, 70-38);
   triangle (50+150, 70, 50+75, 70, 50+113, 70-38);
   ellipse (50, 70+80, 60, 120);
   fill (#7E1D05);
   ellipse (50+150, 70+80, 60, 120);
   fill(0);
   ellipse (50+50, 70+40, 20,20);
   line (115, 110, 95, 90);
   ellipse (50+100, 70+40, 20,20);
   line (135, 110, 155, 90);
   fill (#ED891D);
   triangle (50+75, 70+80, 50+85, 70+60, 50+65, 70+60);
   //text continued
    fill(255, 0, 0);
    textFont (aFont, 100);
    text ("APOCOLYPSE", 140, 200);
    textFont (aFont, 30);
    text (byline, 230, 230);
   if (bylineRan == 1){
     byline = "This time, it's personal!";
   }
   if (bylineRan == 2){
    byline = "THE RECKONING!"; 
   }
   if (bylineRan == 3){
     byline = "Looks like the rules just got SCREWED!";
   }
   if (bylineRan == 4){
     byline = "It's just been revoked!";
   }
  // the following "}" ends gameState 0
  }
  
  if (gameState == 1){
    background (180);
    fill(255, 0, 0);
    textFont (aFont, 50);
    text ("Dire Owl Apocalypse", 150, 50);
    fill (0, 0, 255);
    textFont (theFont, 30);
    text ("Instructions", 220, 80);
    textFont (theFont, 15);
    text (instructions, 100, 100, 400, 200);
    text (instructions2, 100, 300, 400, 200);
    fill (255, 0, 0);
    textFont (aFont, 40);
    text ("Start!", 500, 390);
    if (mouseX > 500 && mouseX < 590 && mouseY < 390 && mouseY > 360){
     stroke(255);
      noFill();
      rect (490, 360, 90, 35);
      if (mousePressed){
       gameState = 2; 
      }
    }
    fill (255, 0, 0);
    textFont (theFont, 25);
    text ("Back to Main Menu", 10, 390);
    if (mouseX > 5 && mouseX < 210 && mouseY < 395 && mouseY > 365){
     stroke(255);
      noFill();
      rect (5, 365, 210, 30);
      if(mousePressed){
       gameState = 0; 
       bylineRan = int(random(1,5));
      }
    }
    fill (#E59B2A);
    stroke (0);
   rect (30, 100, 30, 30);
   fill (#7E1D05);
   triangle (30, 100, 30+15, 100, 30+6, 100-10);
   triangle (30+30, 100, 30+15, 100, 30+24, 100-10);
   ellipse (30, 100+17, 10, 20);
   fill (#7E1D05);
   ellipse (30+30, 100+17, 10, 20);
   fill(0);
   ellipse (30+9, 100+10, 5,5);
   ellipse (30+21, 100+10, 5,5);
   fill (#ED891D);
   triangle (30+15, 100+20, 30+12, 100+15, 30+18, 100+15);
   fill (0);
   textFont(theFont, 25);
   text ("You", 25, 150);
   
   evil (30, 250, 30, 1);
   fill (0);
   textFont(theFont, 25);
   text ("Dire", 20, 320);
   text ("Owl", 20, 340);
   
   text("jump", 520, 100);
   text("left", 520, 200);
   text("right", 520, 300);
   
   textFont (theFont, 50);
   text ("^", 530, 65);
   text ("|", 536, 70);
   text ("<", 515, 170);
   text ("—", 520, 170);
   text (">", 551, 270);
   text ("—", 520, 270);
 
   //gameState1 ends here 
  }
  
  
  if(gameState == 2){
  background (180);
 //first row
 block (100, 350); block (150, 350); block (200, 350); block (250, 350); block (300, 350); block (350, 350); block (400, 350); block (450, 350);
 //second row
 block (300, 300); block (350, 300); block (400, 300);
 //third row
 block (0, 250); block (50, 250); block (100, 250); block (150, 250); block (200, 250); block (300, 250); block (400, 250); block (450, 250); block (500, 250); 
 //fourth row
 block (0, 200); block (400, 200); block (500, 200);
 //fifth row
 block (0, 150); block (50, 150); block (150, 150); block (200, 150); block (250, 150); block (300, 150); block (350, 150); 
 //sixth row
 block (150, 100); block (250, 100); block (300, 100); block (350, 100); block (400, 100); block (500, 100);
 //seventh row
 block (50, 50); block (100, 50); block (150, 50); block (500, 50);
 //eight row
 block (250, 0); block (300, 0); block (350, 0); block (400, 0);
 if (evil[0] || evil[1] || evil[2] || evil[3] || caneState == false){
   block(550, 250);
 }
 //player
 fill (#E59B2A);
 stroke (0);
 rect (playX, playY, 30, 30);
 fill (#7E1D05);
 triangle (playX, playY, playX+15, playY, playX+6, playY-10);
 triangle (playX+30, playY, playX+15, playY, playX+24, playY-10);
 ellipse (playX, playY+17, 10, 20);
 if (caneState == true){
   cane (playX+35, playX+38, playX+29, playX+26, playX+36, playX+34, playY-5);
 }
 fill (#7E1D05);
 ellipse (playX+30, playY+17, 10, 20);
 fill(0);
 ellipse (playX+9, playY+10, 5,5);
 ellipse (playX+21, playY+10, 5,5);
 fill (#ED891D);
 triangle (playX+15, playY+20, playX+12, playY+15, playX+18, playY+15);
 if (keyPressed){
  if(key == CODED){
   if (keyCode == RIGHT){
    playX = playX +1;  
   }
   if(keyCode == LEFT){
    playX = playX -1; 
   }
   if (keyCode == UP){
    playY = playY -2; 
   }
  } 
 }
 if (playY < height - 30){
  playY = playY+1; 
 }
 if (playX == 0){
   playX = playX+1;
 }
 if (playX + 30 == width){
   playX = playX-1;
 }
 //if monocle is on
 if (lasers == true){
  fill(#D6AF20);
  stroke (0);
  ellipse (playX+8, playY+8, 15, 15);
  fill(255);
  stroke(0);
  ellipse (playX+8, playY+8, 10, 10); 
 }
 if (lasers == true && keyPressed){
   if (key == 'z' || key == 'Z'){
     fill (0, 0, 255);
     stroke (0);
     ellipse (bull[1], playY+10, 10, 10);
     bull[1] = bull[1]-5;
   }
 }else{
   bull[1] = playX+10;}
 if (lasers == true && keyPressed){
   if (key == 'x' || key == 'X'){
     fill (0, 0, 255);
     stroke (0);
     ellipse (bull[1], playY+10, 10, 10);
     bull[1] = bull[1]+5;
   }
 }else{
   bull[1] = playX+10;}
 if (bull[1] > width || bull[1] < 0){
  bull[1] = playX+10; 
 }
 //if hat is on
 if (tHat == true){
  tophat (playX+10, playY-13); 
 }
 
//Take this out later. Testing
/*
 if (keyPressed){
   if(key=='q' || key =='Q'){
     playX = 550;
     playY = 0;
    lasers = true; 
   }}
   if (keyPressed){
   if(key=='d' || key =='D'){
     lasers = true;
     tHat = true;
   }}
   if (keyPressed){
   if(key=='p' || key =='P'){
    evil[0] = false;
    evil[1] = false;
    evil[2] = false;
    evil[3] = false;
   }}
   if (keyPressed){
    if(key=='3'){
     gameState =3; 
    } 
   }
   if (keyPressed){
   if(key=='4'){
     gameState = 4;
   }}
    */
  
   
 
 //enemy
 if (evil[0] == true){
   evil (65, 210, 65, 1);
 }
 if (lasers== true && dist(bull[1], playY+10, 75, 230) < 20){
  evil[0] = false;
 }
 if (evil[0] == false){
  bull[0] = -10; 
 }
 if (evil[0] == true && playY >= 210 && playY <= 210 +40 && dist (playX, playY, 65, 210) < 200){
   bullet (bull[0], 230);
   shoot[0] = true;
 }else if(bull[0] > playX + 20){
    bull[0] = 75;
    shoot[0] = false; 
 }
 if (tHat == false && evil[0] == true && dist(bull[0], 210, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[0] = 75;  
    shoot[0] = false;
    deathCount++;
  }
  if (tHat == true && evil[0] == true && dist(bull[0], 210, playX, playY) < 20){
    tHat = false;
    bull[0] = 75;  
    shoot[0] = false;
  }
  if (shoot[0] == true){
    bull[0] = bull[0] + 5;
  }
  
  //enemy2
  if (evil[1] == true){
   evil (415, 60, 435, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 425, 80) < 20){
  evil[1] = false;
 }
 if (evil[1] == false){
  bull[2] = -1000; 
 }
 if (evil[1] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 415, 60) < 250){
   bullet (bull[2], 80);
   shoot[1] = true;
 }else if(bull[2] < playX - 20){
    bull[2] = 410;
    shoot[1] = false; 
 }
 if (tHat == false && evil[1] == true && dist(bull[2], 60, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[2] = 410;  
    shoot[1] = false;
    deathCount++;
  }
  if (tHat == true && evil[1] == true && dist(bull[2], 60, playX, playY) < 20){
    tHat = false;
    bull[2] = 410;  
    shoot[1] = false;
  }
  if (shoot[1] == true){
    bull[2] = bull[2] - 5;
  }
  
  //enemy3
   if (evil[2] == true){
   evil (515, 160, 535, -1);
   }
   if (lasers== true && dist(bull[1], playY+10, 525, 180) < 20){
      evil[2] = false;
   }
   if (evil[2] == false){
      bull[3] = -10; 
   }
   if (evil[2] == true && playY >= 160 && playY <= 160 +40 && dist (playX, playY, 515, 160) < 100){
     bullet (bull[3], 180);
     shoot[2] = true;
   }else if(bull[3] < playX - 20){
      bull[3] = 525;
      shoot[2] = false; 
   }
   if (tHat == false && evil[2] == true && dist(bull[3], 160, playX, playY) < 20){
      playX = 30;
      playY = 370;
      bull[3] = 525;  
      shoot[2] = false;
      deathCount++;
    }
   if (tHat == true && evil[2] == true && dist(bull[3], 160, playX, playY) < 20){
       tHat = false;
       bull[3] = 525;  
       shoot[2] = false;
    }
   
    if (shoot[2] == true){
      bull[3] = bull[3] - 5;
    }
  
    //enemy4
   if (evil[3] == true){
   evil (415, 160, 415, 1);
   }
   if (lasers== true && dist(bull[1], playY+10, 425, 180) < 20){
      evil[3] = false;
   }
   if (evil[3] == false){
      bull[4] = -10; 
   }
   if (evil[3] == true && playY >= 160 && playY <= 160 +40 && dist (415, 160, playX, playY) < 200){
     bullet (bull[4], 180);
     shoot[3] = true;
   }else if(bull[4] > playX + 20){
      bull[4] = 425;
      shoot[3] = false; 
   }
   if (tHat == false && evil[3] == true && dist(bull[4], 160, playX, playY) < 20){
      playX = 30;
      playY = 370;
      bull[4] = 425;  
      shoot[3] = false;
      deathCount++;
    }
    if (tHat == true && evil[3] == true && dist(bull[4], 160, playX, playY) < 20){
      tHat =  false;
      bull[4] = 425;  
      shoot[3] = false;
    }
    if (shoot[3] == true){
      bull[4] = bull[4] + 5;
    }
  
  //monocle
  if (lasers == false){
    fill(#D6AF20);
    stroke (0);
    ellipse (375, 275, 15, 15);
    fill(255);
    stroke(0);
    ellipse (375, 275, 10, 10);
  }
  if (lasers== false && dist(playX, playY, 375, 275) < 25){
    lasers = true;
  }
  if (lasers== true && dist(playX, playY, 375, 275) < 25){
    fill(0);
    textFont (theFont, 13);
    text (tex[2], 1, 310, 400, 20);
    text (tex[3], 1, 330, 400, 20);
  }
  
  
  //tophat
  if (hat[0] == true){
    tophat (220,125);
  }
  if (tHat == false && hat[0] == true && dist(playX, playY, 220, 125) < 20){
    //150, 100
    tHat = true;
    hat[0] = false;
  }
  if (dist(playX, playY, 220, 125) < 20){
    fill(0);
    textFont (theFont, 13);
    text (tex[4], 1, 310, 400, 20);
    text (tex[5], 1, 330, 400, 20);
  }
  //tophat2
  if (hat[1] == true){
   tophat (520, 25); 
  }
  if (tHat == false && hat[1] == true && dist(playX, playY, 520, 25) < 20){
    tHat = true;
    hat[1] = false;
  }
  
  //cane
  if (caneState == false){
    cane (475, 478, 469, 466, 476, 474, 200);
  }
   if (dist(playX, playY, 475, 200) < 30){
    caneState = true;
    fill(0);
    textFont (theFont, 13);
    text (tex[7], 1, 310, 400, 20);
    text (tex[8], 1, 330, 400, 20);
  }
  
  //words and stuff
  if (lasers == false && deathCount == 1){
    fill(0);
    textFont (theFont, 13);
    text (words, 1, 330, 400, 20);
    if(playX > 150){
      words = tex[1];
    }
  }
  
  //damsel
  fill (#E0DEDC);
  stroke (0);
  rect (damX, damY, 30, 30);
  fill (#ADABA9);
  triangle (damX, damY, damX+15, damY, damX+6, damY-10);
  triangle (damX+30, damY, damX+15, damY, damX+24, damY-10);
  ellipse (damX, damY+17, 10, 20);
  ellipse (damX+30, damY+17, 10, 20);
  fill(0);
  ellipse (damX+9, damY+10, eyes,eyes);
  ellipse (damX+21, damY+10, eyes,eyes);
  fill (#ED891D);
  triangle (damX+15, damY+20, damX+12, damY+15, damX+18, damY+15);
  
  if (deathCount == 0 && playX < 100 && playY > 300){
    fill(0);
    textFont (theFont, 13);
    text (tex[6], 505, 300, 100, 100);
  }
  if (playX > width-100 && playY > height-100){
    eyes = 10;
    fill(255);
    ellipse (damX+9, damY+10, 5,5);
    ellipse (damX+21, damY+10, 5,5);
  }
  if (playX > width-100 && playY > height-50){
   damX = damX+5;
  }
  if (damX > width){
    fill(0);
    textFont (theFont, 13);
    text (tex[9], 1, 310, 400, 20);
    text (tex[10], 1, 330, 400, 20);
    fill(255, 0, 0);
    textFont (theFont, 20);
    text ("Carry On?", 500, 340); 
    if (mouseX > 498 && mouseX < 592 && mouseY < 345 && mouseY > 320){
      noFill();
      stroke(0);
      rect (498, 320, 90, 25);
      if (mousePressed){
       gameState = 3; 
       playX = 30;
       playY = 370;
       lasers = true;
       caneState = false;
       eyes = 5;
      }
    }
  }
  
  //the following "}" ends the condition for gameState2 
  }
  
  if (gameState == 3){
   background (180);
  //row one
  block (100, 350); block (150, 350); block (200, 350);  block (250, 350); block (350, 350);
  //row two
  block (350, 300); block (450, 300);  block (500, 300);  block (550, 300);
  //row three
  block (50, 250); block (150, 250); block (200, 250); /*block (250, 250);*/
  //row four
  block (0, 200); block (50, 200); block (150, 200); block (200, 200); block (250, 200); block (300, 200); block (350, 200); block (400, 200); block (450, 200);
  //row five
  block (150, 150); block (200, 150); block (400, 150); block (450, 150);
  //row six
  block (0, 100); block (50, 100); block (150, 100); block (200, 100); block (300, 100); block (350, 100); block (400, 100); block (450, 100);
  //row seven
  block (0, 50); block (50, 50);
  //row eight
  block (150, 0); block (200, 0); block (250, 0); block (300, 0); block (350, 0); block (400, 0); block (450, 0);
   
   if (playX <50 && playY > 350){
     textFont (theFont, 25);
     text ("Bullocks.", 10, 350);
   } 
   
   //player
 fill (#E59B2A);
 stroke (0);
 rect (playX, playY, 30, 30);
 fill (#7E1D05);
 triangle (playX, playY, playX+15, playY, playX+6, playY-10);
 triangle (playX+30, playY, playX+15, playY, playX+24, playY-10);
 ellipse (playX, playY+17, 10, 20);
 if (caneState == true){
   cane (playX+35, playX+38, playX+29, playX+26, playX+36, playX+34, playY-5);
 }
 fill (#7E1D05);
 ellipse (playX+30, playY+17, 10, 20);
 fill(0);
 ellipse (playX+9, playY+10, 5,5);
 ellipse (playX+21, playY+10, 5,5);
 fill (#ED891D);
 triangle (playX+15, playY+20, playX+12, playY+15, playX+18, playY+15);
 if (keyPressed){
  if(key == CODED){
   if (keyCode == RIGHT){
    playX = playX +1;  
   }
   if(keyCode == LEFT){
    playX = playX -1; 
   }
   if (keyCode == UP){
    playY = playY -2; 
   }
  } 
 }
 if (playY < height - 30){
  playY = playY+1; 
 }
 if (playX == 0){
   playX = playX+1;
 }
 if (playX + 30 == width){
   playX = playX-1;
 }
 //if monocle is on
 if (lasers == true){
  fill(#D6AF20);
  stroke (0);
  ellipse (playX+8, playY+8, 15, 15);
  fill(255);
  stroke(0);
  ellipse (playX+8, playY+8, 10, 10); 
 }
 if (lasers == true && keyPressed){
   if (key == 'z' || key == 'Z'){
     fill (0, 0, 255);
     stroke (0);
     ellipse (bull[1], playY+10, 10, 10);
     bull[1] = bull[1]-5;
   }
 }else{
   bull[1] = playX+10;}
 if (lasers == true && keyPressed){
   if (key == 'x' || key == 'X'){
     fill (0, 0, 255);
     stroke (0);
     ellipse (bull[1], playY+10, 10, 10);
     bull[1] = bull[1]+5;
   }
 }else{
   bull[1] = playX+10;}
 if (bull[1] > width || bull[1] < 0){
  bull[1] = playX+10; 
 }
 //if hat is on
 if (tHat == true){
  tophat (playX+10, playY-13); 
 }
 
 
  
  
  //tophat
  if (hat[2] == true){
    tophat (20,20);
  }
  if (tHat == false && hat[2] == true && dist(playX, playY, 20, 20) < 25){
    tHat = true;
    hat[2] = false;
  }
  //tophat2
  if (hat[3] == true){
   tophat (20, 170); 
  }
  if (tHat == false && hat[3] == true && dist(playX, playY, 20, 170) < 25){
    tHat = true;
    hat[3] = false;
  }
    //tophat3
  if (hat[4] == true){
   tophat (270, 320); 
  }
  if (tHat == false && hat[4] == true && dist(playX, playY, 270, 320) < 25){
    tHat = true;
    hat[4] = false;
  }
  
    //tophat4
  if (hat[5] == true){
   tophat (320, 370); 
  }
  if (tHat == false && hat[5] == true && dist(playX, playY, 320, 370) < 25){
    tHat = true;
    hat[5] = false;
  }
    //tophat5
  if (hat[6] == true){
   tophat (470, 370); 
  }
  if (tHat == false && hat[6] == true && dist(playX, playY, 470, 370) < 25){
    tHat = true;
    hat[6] = false;
  }
    //tophat6
  if (hat[7] == true){
   tophat (520, 370); 
  }
  if (tHat == false && hat[7] == true && dist(playX, playY, 520, 370) < 25){
    tHat = true;
    hat[7] = false;
  }
    //tophat7
  if (hat[8] == true){
   tophat (570, 270); 
  }
  if (tHat == false && hat[8] == true && dist(playX, playY, 570, 270) < 25){
    tHat = true;
    hat[8] = false;
  }
  //cane
  if (caneState == false){
    cane (570, 573, 564, 561, 571, 569, 360);
  }
   if (dist(playX, playY, 570, 360) < 30){
    caneState = true;
  }
  //enemy
 if (evil[4] == true){
   evil (65, 160, 65, 1);
 }
 if (lasers== true && dist(bull[1], playY+10, 75, 180) < 20){
  evil[4] = false;
 }
 if (evil[4] == false){
  bull[5] = -10; 
 }
 if (evil[4] == true && playY >= 160 && playY <= 160 +40 && dist (playX, playY, 65, 160) < 100){
   bullet (bull[5], 180);
   shoot[4] = true;
 }else if(bull[4] > playX + 20){
    bull[5] = 75;
    shoot[4] = false; 
 }
 if (tHat == false && evil[4] == true && dist(bull[5], 180, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[5] = 75;  
    shoot[4] = false;
    deathCount++;
  }
  if (tHat == true && evil[4] == true && dist(bull[5], 180, playX, playY) < 20){
    tHat = false;
    bull[5] = 75;  
    shoot[4] = false;
  }
  if (shoot[4] == true){
    bull[5] = bull[5] + 1;
  }
    //enemy2
 if (evil[5] == true){
   evil (215, 310, 235, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 225, 330) < 20){
  evil[5] = false;
 }
 if (evil[5] == false){
  bull[6] = -10; 
 }
 if (evil[5] == true && playY >= 310 && playY <= 310 +40 && dist (playX, playY, 215, 310) < 200){
   bullet (bull[6], 330);
   shoot[5] = true;
 }else if(bull[6] < playX){
    bull[6] = 225;
    shoot[5] = false; 
 }
 if (tHat == false && evil[5] == true && dist(bull[6], 330, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[6] = 225;  
    shoot[5] = false;
    deathCount++;
  }
  if (tHat == true && evil[5] == true && dist(bull[6], 330, playX, playY) < 20){
    tHat = false;
    bull[6] = 225;  
    shoot[5] = false;
  }
  if (shoot[5] == true){
    bull[6] = bull[6] - 5;
  }
    //enemy3
 if (evil[6] == true){
   evil (465, 260, 485, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 475, 280) < 20){
  evil[6] = false;
 }
 if (evil[6] == false){
  bull[7] = -10; 
 }
 if (evil[6] == true && playY >= 260 && playY <= 260 +40 && dist (playX, playY, 465, 260) < 200){
   bullet (bull[7], 280);
   shoot[6] = true;
 }else if(bull[7] < playX + 20){
    bull[7] = 475;
    shoot[6] = false; 
 }
 if (tHat == false && evil[6] == true && dist(bull[7], 280, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[7] = 475;  
    shoot[6] = false;
    deathCount++;
  }
  if (tHat == true && evil[6] == true && dist(bull[7], 280, playX, playY) < 20){
    tHat = false;
    bull[7] = 475;  
    shoot[6] = false;
  }
  if (shoot[6] == true){
    bull[7] = bull[7] - 2;
  }
     //enemy4
 if (evil[7] == true){
   evil (515, 260, 535, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 525, 280) < 20){
  evil[7] = false;
 }
 if (evil[7] == false){
  bull[8] = -10; 
 }
 if (evil[7] == true && playY >= 260 && playY <= 260 +40 && dist (playX, playY, 515, 260) < 200){
   bullet (bull[8], 280);
   shoot[7] = true;
 }else if(bull[8] < playX + 20){
    bull[8] = 525;
    shoot[7] = false; 
 }
 if (tHat == false && evil[7] == true && dist(bull[8], 280, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[8] = 525;  
    shoot[7] = false;
    deathCount++;
  }
  if (tHat == true && evil[7] == true && dist(bull[8], 280, playX, playY) < 20){
    tHat = false;
    bull[8] = 525;  
    shoot[7] = false;
  }
  if (shoot[7] == true){
    bull[8] = bull[8] - 4;
  }
     //enemy5
 if (evil[8] == true){
   evil (165, 60, 185, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 175, 80) < 20){
  evil[8] = false;
 }
 if (evil[8] == false){
  bull[9] = -10; 
 }
 if (evil[8] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 165, 60) < 200){
   bullet (bull[9], 80);
   shoot[8] = true;
 }else if(bull[9] < playX+20){
    bull[9] = 175;
    shoot[8] = false; 
 }
 if (tHat == false && evil[8] == true && dist(bull[9], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[9] = 175;  
    shoot[8] = false;
    deathCount++;
  }
  if (tHat == true && evil[8] == true && dist(bull[9], 80, playX, playY) < 20){
    tHat = false;
    bull[9] = 175;  
    shoot[8] = false;
  }
  if (shoot[8] == true){
    bull[9] = bull[9] - 2;
  }
   //enemy6
 if (evil[9] == true){
   evil (215, 60, 235, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 225, 80) < 20){
  evil[9] = false;
 }
 if (evil[9] == false){
  bull[10] = -10; 
 }
 if (evil[9] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 215, 60) < 200){
   bullet (bull[10], 80);
   shoot[9] = true;
 }else if(bull[10] < playX+20){
    bull[10] = 225;
    shoot[9] = false; 
 }
 if (tHat == false && evil[9] == true && dist(bull[10], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[10] = 225;  
    shoot[9] = false;
    deathCount++;
  }
  if (tHat == true && evil[9] == true && dist(bull[10], 80, playX, playY) < 20){
    tHat = false;
    bull[10] = 225;  
    shoot[9] = false;
  }
  if (shoot[9] == true){
    bull[10] = bull[10] - 4;
  }  
  //enemy7
 if (evil[10] == true){
   evil (265, 60, 285, -1);
 }
 if (lasers== true && dist(bull[1], playY+10, 275, 80) < 20){
  evil[10] = false;
 }
 if (evil[10] == false){
  bull[11] = -10; 
 }
 if (evil[10] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 265, 60) < 200){
   bullet (bull[11], 80);
   shoot[10] = true;
 }else if(bull[11] < playX+20){
    bull[11] = 275;
    shoot[10] = false; 
 }
 if (tHat == false && evil[10] == true && dist(bull[11], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[11] = 275;  
    shoot[10] = false;
    deathCount++;
  }
  if (tHat == true && evil[10] == true && dist(bull[11], 80, playX, playY) < 20){
    tHat = false;
    bull[11] = 175;  
    shoot[10] = false;
  }
  if (shoot[10] == true){
    bull[11] = bull[11] - 5;
  }
   //enemy8
 if (evil[11] == true){
   evil (365, 60, 365, 1);
 }
 if (lasers== true && dist(bull[1], playY+10, 375, 80) < 20){
  evil[11] = false;
 }
 if (evil[11] == false){
  bull[12] = -10; 
 }
 if (evil[11] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 365, 60) < 200){
   bullet (bull[12], 80);
   shoot[11] = true;
 }else if(bull[12] > playX+20){
    bull[12] = 375;
    shoot[11] = false; 
 }
 if (tHat == false && evil[11] == true && dist(bull[12], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[12] = 375;  
    shoot[11] = false;
    deathCount++;
  }
  if (tHat == true && evil[11] == true && dist(bull[12], 80, playX, playY) < 20){
    tHat = false;
    bull[12] = 375;  
    shoot[11] = false;
  }
  if (shoot[11] == true){
    bull[12] = bull[12] + 5;
  }
     //enemy9
 if (evil[12] == true){
   evil (415, 60, 415, 1);
 }
 if (lasers== true && dist(bull[1], playY+10, 425, 80) < 20){
  evil[12] = false;
 }
 if (evil[12] == false){
  bull[13] = -10; 
 }
 if (evil[12] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 415, 60) < 200){
   bullet (bull[13], 80);
   shoot[12] = true;
 }else if(bull[13] > playX+20){
    bull[13] = 425;
    shoot[12] = false; 
 }
 if (tHat == false && evil[12] == true && dist(bull[13], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[13] = 425;  
    shoot[12] = false;
    deathCount++;
  }
  if (tHat == true && evil[12] == true && dist(bull[13], 80, playX, playY) < 20){
    tHat = false;
    bull[13] = 425;  
    shoot[12] = false;
  }
  if (shoot[12] == true){
    bull[13] = bull[13] + 4;
  }
     //enemy10
 if (evil[13] == true){
   evil (465, 60, 465, 1);
 }
 if (lasers== true && dist(bull[1], playY+10, 475, 80) < 20){
  evil[13] = false;
 }
 if (evil[13] == false){
  bull[14] = -10; 
 }
 if (evil[13] == true && playY >= 60 && playY <= 60 +40 && dist (playX, playY, 465, 60) < 200){
   bullet (bull[14], 80);
   shoot[13] = true;
 }else if(bull[14] > playX+20){
    bull[14] = 475;
    shoot[13] = false; 
 }
 if (tHat == false && evil[13] == true && dist(bull[14], 80, playX, playY) < 20){
    playX = 30;
    playY = 370;
    bull[14] = 475;  
    shoot[13] = false;
    deathCount++;
  }
  if (tHat == true && evil[13] == true && dist(bull[14], 80, playX, playY) < 20){
    tHat = false;
    bull[14] = 475;  
    shoot[13] = false;
  }
  if (shoot[13] == true){
    bull[14] = bull[14] + 2;
  }
  
  if (caneState == false || evil[4] == true || evil[5] == true || evil[6] == true || evil[7] == true || evil[8] == true || evil[9] == true || evil[10] == true || evil[11] == true || evil[12] == true || evil[13] == true){
   block (250, 100); 
  }
  
  //damsel
  fill (#E0DEDC);
  stroke (0);
  rect (damX1, 170, 30, 30);
  fill (#ADABA9);
  triangle (damX1, 170, damX1+15, 170, damX1+6, 170-10);
  triangle (damX1+30, 170, damX1+15, 170, damX1+24, 170-10);
  ellipse (damX1, 170+17, 10, 20);
  ellipse (damX1+30, 170+17, 10, 20);
  fill(0);
  ellipse (damX1+9, 170+10, eyes,eyes);
  ellipse (damX1+21, 170+10, eyes,eyes);
  fill (#ED891D);
  triangle (damX1+15, 170+20, damX1+12, 170+15, damX1+18, 170+15);
  
  if (playX > 250 && playX < 400 && playY > 150 && playY < 200){
   lasers = false;
   tHat = false; 
   damX1--;
   if (damX1 <= playX+30){
    gameState = 4; 
   }
  }
  //Testing 
  /*
 if (keyPressed){
   if(key=='q' || key =='Q'){
     playX = 300;
     playY = 250;
    lasers = true; 
   }}
    if (keyPressed){
   if(key=='w' || key =='W'){
     playX = 0;
     playY = 0;
    lasers = true;
   }}
   if (keyPressed){
   if(key=='e' || key =='E'){
     playX = 550;
     playY = 0;
    lasers = true;
   }}
   if (keyPressed){
   if(key=='d' || key =='D'){
     lasers = true;
     tHat = true;
   }}
   if (keyPressed){
   if(key=='p' || key =='P'){
     evil[4] = false; evil[5] = false; evil[6] = false; evil[7] = false; evil[8] = false; evil[9] = false; evil[10] = false; evil[11] = false; evil[12] = false; evil[13] = false;
   }}
   */
  
    
    
    //ends gamestate3
  }
  
  if (gameState == 4){
    background(0);
    fill (255, 0, 0);
    textFont (theFont, 48);
    text ("You Win!", 210, 50);
    text ("Play Again?", 10, 380);
    if (mouseX > 10 && mouseX < 250 && mouseY < 390 && mouseY > 340){
      noFill();
      stroke(255);
      rect (10, 340, 240, 50);
      if (mousePressed){
       gameState = 0;
       /* playX = 30;
        playY = 370; 
        damX = 460;
        damY = 320;*/
        exit();
      }
    }
    fill (255, 0, 0);
    noStroke();
    ellipse (230, 150, 150, 150);
    ellipse (370, 150, 150, 150);
    ellipse (300, 200, 50, 50);
    triangle (174, 200, 426, 200, 300, 325);
    
    fill (#E0DEDC);
    stroke (0);
    rect (310, 150, 30, 30);
    fill (#ADABA9);
    triangle (310, 150, 310+15, 150, 310+6, 150-10);
    triangle (310+30, 150, 310+15, 150, 310+24, 150-10);
    ellipse (310, 150+17, 10, 20);
    ellipse (310+30, 150+17, 10, 20);
    fill(0);
    ellipse (310+9, 150+10, eyes,eyes);
    ellipse (310+21, 150+10, eyes,eyes);
    fill (#ED891D);
    triangle (310+15, 150+20, 310+12, 150+15, 310+18, 150+15);
  
   fill (#E59B2A);
   stroke (0);
   rect (260, 150, 30, 30);
   fill (#7E1D05);
   triangle (260, 150, 260+15, 150, 260+6, 150-10);
   triangle (260+30, 150, 260+15, 150, 260+24, 150-10);
   ellipse (260, 150+17, 10, 20);
   fill (#7E1D05);
   ellipse (260+30, 150+17, 10, 20);
   fill(0);
   ellipse (260+9, 150+10, 5,5);
   ellipse (260+21, 150+10, 5,5);
   fill (#ED891D);
   triangle (260+15, 150+20, 260+12, 150+15, 260+18, 150+15);
 
  
    
    
  
    
    
    //ends gamestate 4
  }
  

 
}

void block(int x, int y){
  fill(40);
  stroke (0);
  rect (x, y, 50, 50);
  if (playX == x - 30 && playY+30 > y && playY < y+50){
     playX = playX - 1;
  } 
  if (playX == x + 50 && playY+30 > y && playY < y+50){
   playX = playX +1;  
  }
  if (playY == y-30 && playX+30 > x && playX < x+50){
    playY = playY -1;
  }
  if (playY == y+50 && playX+30 > x && playX < x+50){
   playY = playY+1; 
  }  
}
//z is to determine which way its facing (same as x if forward, x + 20 if backwards). n is either positive or negative one.
void evil (int x1, int y1, int z, int n){
    fill (100);
    stroke (0);
    rect (x1, y1, 20, 40);
    tophat (x1+5, y1 - 13);
    fill (100);
    triangle (z, y1, z+(16 * n), y1, z-(2 * n), y1-10);
    fill(#D6AF20);
    rect (z+(20*n), y1+3, 3*n, 12);
    fill (#ED891D);
    triangle (z+(20*n), y1+15, z+(20*n), y1+20, z+(28*n), y1+20);
    cane (z-(5*n), (z-(5*n))-(3*n), (z-(5*n))+(6*n), (z-(5*n))+(9*n), (z-(5*n))-n, (z-(5*n))+n, y1);
    fill (100);
    ellipse (z+(5*n), y1+20, 20, 30);
    
 }
void bullet (int x, int y){
   fill (255, 0, 0);
   stroke (0);
   ellipse (x, y, 15, 15); 
}

void tophat (int x, int y){
   fill (0);
   stroke (0);
   rect (x, y, 10, 10);
   rect (x - 3, y + 10, 16, 3);
   fill (#D6AF20);
   rect (x, y+7, 10, 3);
}
//x, x+3, x-6, x-9, x+1, x-1, y
void cane (int x1, int x2, int x3, int x4, int x5, int x6, int y){
  fill(0);
 //quad (x, x+3, x-6, x-9);
 quad (x1, y, x2, y+5, x3, y+35, x4, y+30);
 stroke (0);
 fill(#D6AF20);
 //quad (x, x+3, x+1, x-1);
 quad (x1, y, x2, y+5, x5, y+10, x6, y+5);
}
  


