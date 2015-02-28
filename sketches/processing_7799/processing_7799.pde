
PFont console;
PImage rabbit;
PImage rabbit2;
PImage morph;
PImage morph2;
PImage morph3;
PImage way11;
PImage way21;
PImage way12;
PImage way22;
PImage word;
PImage lobster;
PImage cards;
PImage finish;
PImage guess;
String inputNum = "";
int[] tictac = new int[9];
boolean[] showMem = new boolean[10];
int tempImg = 11;
int tempImg2 = 11;
int score;
int guesse;
int realNum = 0;
int guesses;
boolean newMove = true;
PImage[] mem = new PImage[5];
Integer[] toShuffle = new Integer[]{
 new Integer(1),
 new Integer(1),
 new Integer(2),
 new Integer(2),
 new Integer(0),
 new Integer(0),
 new Integer(3),
 new Integer(3),
 new Integer(4),
 new Integer(4),
};
int moves;
int pause = millis();
int n=0;
int textSceene = 0;
int page = 1;
void setup(){
 size(640,480);
 smooth();

 console = loadFont("LucidaConsole-24.vlw");
 textFont(console,24);
 rabbit = loadImage("rabbit.gif");
 rabbit2 = loadImage("rabbit2.gif");
 morph = loadImage("morph.gif");
 morph2 = loadImage("morph2.gif");
 morph3 = loadImage("morph3.gif");
 way11 = loadImage("way11.gif");
 way21 = loadImage("way21.gif");
 way12 = loadImage("way12.gif");
 way22 = loadImage("way22.gif");
 word = loadImage("word.gif");
 lobster = loadImage("lobster.gif");
 finish = loadImage("finish.gif");
 cards = loadImage("cards.gif");
 guess = loadImage("guess.gif");
 mem[0] = loadImage("mem1.gif");
 mem[1] = loadImage("mem2.gif");
 mem[2] = loadImage("mem3.gif");
 mem[3] = loadImage("mem4.gif");
 mem[4] = loadImage("mem5.gif");
 background(0);

}
void draw(){

 switch(page){
   case 1:
     screenone();
     break;
   case 2:
     screentwo();
     break;
   case 3:
     screenthree();
     break;
   case 4:
     screenfour();
     break;
   case 5:
     screenfive();
     break;
   case 6:
     screensix();
     break;
   case 7:
     screenseven();
     break;
   case 8:
     screeneight();
     break;
 }



}
void drawText(String hej){

 fill(#00C120);
 if(n<hej.length() && millis()>pause+random(40,70)){
 //if(n<hej.length()){
   text(hej.charAt(n),20+n*16,35*(textSceene+1));
    pause=millis();
    n++;
  }else if(n==hej.length()){
    textSceene++;
    n=0;
  }


}

void screenone(){
   if(overButton(640-rabbit.width,480-rabbit.height,rabbit.width,rabbit.height)){
   image(rabbit2,640-rabbit.width,480-rabbit.height);
 }else{
   image(rabbit,640-rabbit.width,480-rabbit.height);
 }

 switch(textSceene){
   case 0:
      drawText("WAKE UP, ALICE...");
      break;
   case 1:
       drawText("THE HOLE HAS YOU");
       break;
   case 2:
       drawText("FOLLOW THE WHITE RABBIT");
       break;
   case 3:
       drawText("KNOCK, KNOCK");
       break;
 }
}
void screentwo(){
 if(overButton(410,208,32,52)){
   image(morph3,200,160);
 }else if(overButton(320,350,32,52)){
   image(morph2,200,160);
 }else{
   image(morph,200,160);
 }

 switch(textSceene){
   case 0:
      drawText("HELLO ALICE!");
      break;
   case 1:
       drawText("MY NAME IS MORPHEUS");
       break;
   case 2:
       drawText("WHAT WOULD YOU PREFER?");
       break;
   case 3:
       drawText("BLUE PILL OR RED PILL?");
       break;
 }
}

void screenthree(){
 if(overButton(67,208,132,270)){
 image(way12,30,210);
 }else{
 image(way11,30,210);
 }
 if(overButton(410,238,172,200)){
 image(way22,300,210);
 }else{
 image(way21,300,210);
 }

 switch(textSceene){
   case 0:
      drawText("WHAT WAY ALICE?");
      break;
   case 1:
     drawText("CHOOSE CAREFULLY...");
       break;
   }
}

void screenfour(){

 image(word,100,130);
 fill(0);
 stroke(#00c120);
 rect(25,103,180,33);
 rect(155,146,50,33);
 if(overButton(155,146,50,33)){
   fill(#ffffff);
 }else{
   fill(#00c120);
 }
 text("GO!", 161,174);
 fill(#00c120);
 text(inputNum.toUpperCase(),30,130);


 switch(textSceene){
   case 0:
      drawText("REARRANGE THE LETTERS OF");
      break;
   case 1:
     drawText("'NOR DO WE' TO MAKE ONE WORD!");
       break;
   }

}

void screenfive(){
 image(lobster,400,50);
 stroke(#00c120);

 for(int n = 0; n <9;n++){
   if(tictac[n]==1){
     if(n<3){
       line(35+(n*100), 155, 125+(n*100), 245);
       line(35+(n*100), 245, 125+(n*100), 155);
     }else if(n<6){
       line(35+((n-3)*100), 255, 125+((n-3)*100), 345);
       line(35+((n-3)*100), 345, 125+((n-3)*100), 255);
     }else if(n<9){
       line(35+((n-6)*100), 355, 125+((n-6)*100), 445);
       line(35+((n-6)*100), 445, 125+((n-6)*100), 355);
     }
   }
 }
 fill(0);
 for(int n = 0; n <9;n++){
   if(tictac[n]==2){
     if(n<3){
       ellipse(80+(n*100), 200, 80,80);
     }else if(n<6){
       ellipse(80+((n-3)*100), 300, 80,80);
     }else if(n<9){
       ellipse(80+((n-6)*100), 400, 80,80);
     }
   }
 }


 line(30, 150, 30, 450);
 line(330, 150, 330, 450);
 line(30, 150, 330, 150);
 line(30, 450, 330, 450);

 line(130, 150, 130, 450);
 line(230, 150, 230, 450);
 line(30, 250, 330, 250);
 line(30, 350, 330, 350);

 switch(textSceene){
   case 0:
      drawText("CAN YOU BEAT ME IN A");
      break;
   case 1:
     drawText("GAME OF TIC-TAC-TOE?");
       break;
   }

   
   if(moves==3){
     if(tictac[0]==1 && tictac[0]==tictac[1] && tictac[1] == tictac[2]){
       background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[3]==1 &&tictac[3]==tictac[4] && tictac[4] == tictac[5]){
        background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[6]==1 &&tictac[6]==tictac[7] && tictac[7] == tictac[8]){
        background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[0]==1 &&tictac[0]==tictac[4] && tictac[4] == tictac[8]){
        background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[2]==1 &&tictac[2]==tictac[4] && tictac[4] == tictac[6]){
        background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[0]==1 &&tictac[0]==tictac[3] && tictac[3] == tictac[6]){
       background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[1]==1 &&tictac[1]==tictac[4] && tictac[4] == tictac[7]){
       background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else if(tictac[2]==1 &&tictac[2]==tictac[5] && tictac[5] == tictac[8]){
       background(0);
       textSceene=0;
       n=0;
       page=7;
       moves=0;
     }else{
       background(0);
       textSceene=0;
       n=0;
       page=1;
       moves=0;
     }
   }


}

void screensix(){
fill(#00c120);
 for(int n=0;n<5;n++){
   if(showMem[n] || tempImg == n || tempImg2 == n){
     image(mem[toShuffle[n]],(n*100)+80,100);
   }else{
     rect((n*100)+78,98,84,138);
   }
 }
 for(int n=0;n<5;n++){
   if(showMem[n+5] || tempImg == n+5 || tempImg2 == n+5){
     image(mem[toShuffle[n+5]],(n*100)+80,280);
   }else{
     rect((n*100)+78,278,84,138);
   }
 }

 noFill();
 stroke(#00c120);
 for(int n=0;n<5;n++){
   rect((n*100)+78,98,84,138);
 }
 for(int n=0;n<5;n++){
   rect((n*100)+78,278,84,138);
 }
 fill(0);
 rect(585,12,40,30);
 fill(#00c120);
 text("MOVES LEFT: " + (10-moves), 425,35);
 

 switch(textSceene){
   case 0:
      drawText("LETS PLAY A GAME");
      break;
   case 1:
     drawText("OF MEMORY, SHALL WE?");
       break;
   }
   if(score==5){
     page=8;
     background(0);
     textSceene=0;
     n=0;
   }else if(moves>9){
     page=1;
     background(0);
     textSceene=0;
     n=0;
     score=0;
     moves=0;
     tempImg=11;
     tempImg2=11;
     for(int n=0;n<10;n++){
      showMem[n]=false;
      
     } 
   }
}


void screenseven(){
  image(guess,280,10);
  
  switch(textSceene){
   case 0:
      drawText("CAN YOU GUESS WHAT NUMBER");
      break;
   case 1:
     drawText("I AM THINKING OF?");
       break;
   }
   stroke(#00c120);
   line(30, 150, 30, 360);
   line(240, 150, 240, 360);
   line(30, 150, 240, 150);
   line(30, 360, 240, 360);

   line(100, 150, 100, 360);
   line(170, 150, 170, 360);
   line(30, 220, 240, 220);
   line(30, 290, 240, 290);

   for(int n=0;n<9;n++){
     if(n<3){
       if(overButton(30+(70*n),150,70,70)){
         fill(#ffffff);
        }else{
         fill(#00c120); 
        }
       text(n+1, 60+(70*n),195);
     }else if(n<6){
       if(overButton(30+(70*(n-3)),220,70,70)){
         fill(#ffffff);
        }else{
         fill(#00c120); 
        }
       text(n+1, 60+(70*(n-3)),265);
     }else{
       if(overButton(30+(70*(n-6)),290,70,70)){
         fill(#ffffff);
        }else{
         fill(#00c120); 
        }
       text(n+1, 60+(70*(n-6)),335);
     }
   }
   fill(#00c120);
   
}
void screeneight(){
  image(finish,280,80);
  image(cards,10,100);
  switch(textSceene){
   case 0:
      drawText("YOU GOT OUT OF THE RABBIT HOLE!");
      break;
   case 1:
     drawText("CONGRATULATIONS!");
       break;
   }
}

boolean overButton(int x, int y, int w, int h) {
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
   return true;
 }
 else {
   return false;
 }
}
void keyTyped() {
 if(page == 4){
   if(inputNum.length()<10){
     if(int(key) > 64 && int(key) <122 || int(key)==32){
       inputNum = inputNum + key;
     }
   }
   if(int(key)==8 || int(key)==127){
     if(inputNum.length()>0){
     inputNum = inputNum.substring(0,inputNum.length()-1);
     }
   }
   if(int(key) == 10){
     if(inputNum.equalsIgnoreCase("one word")){
       Collections.shuffle(Arrays.asList(toShuffle));
         page=6;
         background(0);
         textSceene=0;
         n=0;
       }else{
         page=1;
         background(0);
         textSceene=0;
         n=0;
       }
       inputNum="";
   }
 }
}

void mouseClicked() {
 switch(page){
  case 1:
    if(overButton(640-rabbit.width,480-rabbit.height,rabbit.width,rabbit.height)){
       page++;
       background(0);
       textSceene=0;
       n=0;
       }
  break;
 case 2:
    if(overButton(410,208,32,52)){
       page=1;
       background(0);
       textSceene=0;
       n=0;
    }else if(overButton(320,350,32,52)){
       page=3;
       background(0);
       textSceene=0;
       n=0;
    }
    break;
   case 3:
    if(overButton(67,208,132,270)){
       page=4;
       background(0);
       textSceene=0;
       n=0;
    }else if(overButton(410,238,172,200)){
       page=5;
       background(0);
       textSceene=0;
       n=0;
       moves=0;
       tictac = new int[9];
    }
    break;
    case 4:
     if(overButton(155,146,50,33)){
       if(inputNum.equalsIgnoreCase("one word")){
         Collections.shuffle(Arrays.asList(toShuffle));
         page=6;
         background(0);
         textSceene=0;
         n=0;
       }else{
         page=1;
         background(0);
         textSceene=0;
         n=0;
        }
       inputNum="";
     }
     case 5:
     if(moves<3){
       if(overButton(30,150,99,99)){
         //1.1
         if(tictac[0] == 0){
           tictac[0]=1;
           compMove();
           moves++;
         }
       }else if(overButton(130,150,99,99)){
         //1.2
         if(tictac[1] == 0){
           tictac[1] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(230,150,99,99)){
         //1.3
         if(tictac[2] == 0){
           tictac[2] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(30,250,99,99)){
         //2.1
         if(tictac[3] == 0){
           tictac[3] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(130,250,99,99)){
         //2.2
         if(tictac[4] == 0){
           tictac[4] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(230,250,99,99)){
         //2.3
         if(tictac[5] == 0){
           tictac[5] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(30,350,99,99)){
         //3.1
         if(tictac[6] == 0){
           tictac[6] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(130,350,99,99)){
         //3.2
        if(tictac[7] == 0){
           tictac[7] = 1;
           compMove();
           moves++;
         }
       }else if(overButton(230,350,99,99)){
         //3.3
         if(tictac[8] == 0){
           tictac[8] = 1;
           compMove();
           moves++;
         }
       }
     }

     break;

     case 6:
       for(int n=0;n<5;n++){
         if(overButton((n*100)+80,100,84,138)){
          if(showMem[n]!=true){
          if(newMove == true){
            tempImg2=11;
             tempImg = n;
             newMove = false;
            }else if(tempImg != n){
              moves++;
             if((int)toShuffle[n]==(int)toShuffle[tempImg]){
               score++;
               showMem[n]=true;
               showMem[tempImg]=true;
               tempImg =11;
               newMove=true;
             }else{
                newMove = true;
                tempImg2=n;
             }
           } 
         }
         }
       }
       for(int n=0;n<5;n++){
         if(overButton((n*100)+80,280,84,138)){
           if(showMem[n+5]!=true){
           if(newMove == true){
            tempImg2=11;
             tempImg = n+5;
             newMove = false;
            }else if(tempImg != n+5){
              moves++;
             if((int)toShuffle[n+5]==(int)toShuffle[tempImg]){
               score++;
               showMem[n+5]=true;
               showMem[tempImg]=true;
               tempImg =11;
               newMove=true;
             }else{
               
                newMove = true;
                tempImg2=n+5;
             }
           } 
         
         }
         }
           
       }
     break;
     
     case 7:
     noStroke();
     fill(#000000);
     rect(10,90,100,50);
     fill(#00c120);
     if(realNum==0){
       realNum = (int)random(1,9);
     }
     for(int n=0;n<9;n++){
     if(n<3){
       if(overButton(30+(70*n),150,70,70)){
         
         if(realNum == n+1){
           page=8;
           background(0);
           textSceene=0;
           
           
         }else if(realNum > n+1){
          text("HIGHER",20,110);
         }else{
          text("LOWER",20,110);
         } 
        }
       
     }else if(n<6){
       if(overButton(30+(70*(n-3)),220,70,70)){
         
        if(realNum == n+1){
          page=8;
           background(0);
           textSceene=0;
           
          
         }else if(realNum > n+1){
          text("HIGHER",20,110);
         }else{
          text("LOWER",20,110);
         } 
        }
       
     }else{
       if(overButton(30+(70*(n-6)),290,70,70)){
          
         if(realNum == n+1){
           page=8;
            background(0);
           textSceene=0;
           
           
         }else if(realNum > n+1){
          text("HIGHER",20,110);
         }else{
          text("LOWER",20,110);
         } 
        }
      
     }
   }
 
     
     break;


 }
}
void compMove(){
 boolean move = true;

 while(move && moves<3){
   int x = int(random(0,8));
   if(tictac[x] == 0){
   tictac[x] =2;
    move=false;
  }
 }
}



