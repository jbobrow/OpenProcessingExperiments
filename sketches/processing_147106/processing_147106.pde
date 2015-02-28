
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioSample door;
AudioSample scream;
AudioSample smile;
AudioSample cry;
AudioSample call;
AudioSample bomb;
AudioSample knock;
AudioSample sing;
AudioSample laugh;
AudioSample laugh2;

PFont SCPLight, SCPExtraLight, SCPBlack, SCPRegular;
String letter="";
String s1="You are Diane.\nYou are on the verge of going mad.\nBut now, you've fell asleep, dreaming a departed lover, a hopeless life, a party, a muder, a key, a big secret...\n\nIf you desire an answer, please be patient and listen to me.";
String s2="Betty: It'll be just like in the movies. Pretending to be somebody else.";
String c="type dream or reality to keep going; or type back to go back.\nYou can only go back in the dream, \nbecause the real time is always keep going.";
String c1="type next to continue";
String r18="\n\n\nYour beloved aunt and uncle raised you up, but they have been dead for years.";
String r19="\n\n\nYou are an idealistic, ambitious and naive young woman, won a jitterbug dance contest in Deep River, that offered a trip to Hollywood as first prize.";
String r20="[Audition Studio]\n\nYou are disappointed by most of your encounters with film industry people and had failed to find success. ";
String r21="Instead, you strike up a romance with a charismatic and successful actress Camilla who later has an affair with the director.";
String r22="[Your Apartment]\n\nYou fall in love with each other, at least you think so.\nShe comes to your house with blond wig every time.\nYou love her, and make love with her.";
String r23="\n\n\nShe treated you carelessly, dumping you to marry her director Adam, as well as to pursue a new romance on the side with a young un-named actress.\n\nDiane: You want me to make this easy for you? No fucking way! It’s not gonna be. It’s not easy for me!";
String r24="[Adam's Home]\n\nThings come to a head at a Mulholland Drive party hosted by Camilla and her lover, not you, but Adam, to announce and celebrate their marriage.\nYou, still in love and obsess, is invited to the party by her and the two arrive at the event by limo. ";
String r25="\n\n\nIn a range at your lover’s betrayal and your own humiliation, you want to kill her.";
String r26="You hire a hitman to murder Camilla.\n\nHitman: Now, once you hand that over to me, it’s a done deal. Are you sure you want this?\nDiane: More than anything in this world.\nAt the meeting, he showed you object as the his signal when the hit is completed. ";
String r266="\n\n\nWhat is the signal? Type one of the choices below.\n\nname tag, money, blue box, blue key";
String r27="[Coffee Shop}\n\nYou go to a coffee shop, see a waitress with a name tag ___\n\nWhat is the name on the name tag? Type one of the choices below.\nBetty, Rita, Adam, Diane";
String r28="{Your Apartment}\n\nYou retreat to your dumpy apartment, receive the blue key, and fuel by drugs and alcohol…\n\nFell asleep...";
String r29="{Your Apartment}\n\nThe detectives are knocking at the door, and you, overwhelmed by your situation.";
String r30="YOU END YOUR LIFE, \n\nAND THE GAME.";
String d2="Along Mulholland Dr.above Los Angeles, an attractive brunette woman was riding in a limousine.\nSuddenly, the driver stops and orders her out of the car at gunpoint.";
String d222="Woman: What are you doing!\n\nWe don't stop here!";
String d2222="CAR ACCIDENT!";
String d22222="The next morning, she is still alive. She sneaks into one of the apartments as her tenant.";
String d3="[In the airport.]\n\nBetty arrives from Deep River, saying goodbye to a friendly old couples. The couples then leave by taxi with contented but strange smile.";
String d4="\n\n\nBetty stay in her aunt's apartment.She found the brunette cowering in the shower. This unknown woman took the name Rita and admitted she didn't remember anything.";
String d5="[Apartment]\n\nBetty says to Rita: She’s letting me stay here while she’s working on a movie that’s being made in Canada. But I guess you already know that. Well, I couldn’t afford a place like this in a million years...unless, of course, I’m discovered and become a movie star. Of course, I’d rather be known as a grea actress…\nI’m sorry. I’m just so excited to be here. I mean I just came here from Deep River, Ontario, and now I’m in this dream place.";
String d6="\n\n\nThey open Rita’s purse, there were thousands of dollars and a bizarre blue key. ";
String d7="[Audition Studio]\n\nAunt arranged an audition for Betty. Betty did so well that the casting director immediately took her to see Adam, the director. ";
String d8="\n\n\nThey arrived at the studio and Betty and Adam made eye contact and seemed to connect.";
String d9="[Adam's Home]\n\nAdam drove home and found his wife in bed with the pool cleaner.\n\nCleaner: Just forget you ever saw it. It's better that way.";
String d10="[Coffee Shop]\n\nAt the coffee shop, Betty and Rita saw a waitress with a name tag as ___\n\nWhat is the name on the name tag?\n\nType one of the following choices or type back:\nBetty, Rita, Diane, Camilla";
String d11="\n\nThey looked up “Diane”’s address in the phone book.\n\nBetty: It’s strange calling yourself.";
String d12="[Diane's Apartment]\n\nBut when they go to her apartment, they find a decomposing corpse in the bedroom.";
String d13="[Betty's Apartment]\n\nDistraught, Rita tried cutting off her hair when she and Betty returned home, but Betty persuaded her to wear a blonde wig instead.\nThat night, Betty and Rita made love.\n\nBetty: Have you ever done this before?\nRita: I don’t know. Have you?\nBetty: I want to with you";
String d14="\n\n\nIn her blonde wig, Rita looks like Betty.\n\nNow, do you have the answer about who is Betty in reality? \n\nType one of the following choices or type back:\nDiane, Camilla, both";
String d15="[Club Silencio]\n\nThey go to the Club Silencio.\n\nDeeply moved, cry.\n\nThere is a blue box in Rita's purse.";
String d16="[Betty's Apartment]\n\nBetty suddenly disappeared, leaving Rita to open the box with the blue key.\n\nRita: Betty? Betty? Where are you? Donde estas...\n\nTHe box seems to swallow the bedroom, then she drops it to the floor.";
String d17="[Betty's Apartment]\n\nA cowboy knocked the door.\n\nCowboy: Hey, pretty gril, time to wake up";
String q1="DREAM";
String q2=" Mulholland\nD  r  i ve";
String q3="Mulholland\nD r ive";
String q4="   Mulholland\nD rive";
String q5="     Mulholland\n  Drive";
String q11="DREAM";


int mode = 1;

void setup(){
  minim=new Minim(this);
  player=minim.loadFile("Mulholland Drive [RERLS]-17-Mulholland Drive -Love Theme.mp3");
  player.play();
  door=minim.loadSample("吱吱缓慢的开门声.mp3",512);
  scream=minim.loadSample("17.WAV",512);
  smile=minim.loadSample("6.WAV",512);
  cry=minim.loadSample("14.WAV",512);
//  call=minim.loadSample("61.WAV");
  sing=minim.loadSample("4.WAV");
  laugh=minim.loadSample("11.WAV");
  bomb=minim.loadSample("爆炸：隆隆声增大至爆炸.mp3",512);
  knock=minim.loadSample("door-knock-1.mp3",512);
  laugh2=minim.loadSample("9.WAV");
  size(1024,768);
  frameRate(14);
  SCPLight=createFont("SourceCodePro-Light.otf",20);
  SCPBlack=createFont("SourceCodePro-Black.otf",20);  
  SCPExtraLight=createFont("SourceCodePro-ExtraLight.otf",20);
  SCPLight=createFont("SourceCodePro-Regular.otf",20);
  textFont(SCPLight);
  if(door==null)println("no door");
}

void draw(){
  background(0);
 
  if (mode ==1){
     textFont(SCPBlack);
     fill(100,40);
     textSize(150);
     text(q2,0,0);
     textFont(SCPBlack);
     fill(100,50);
     textSize(200);
     text(q4,3,200);
     textFont(SCPBlack);
     fill(100,50);
     textSize(150);
     text(q3,20,400);
     textFont(SCPBlack);
     fill(100,50);
     textSize(200);
     text(q5,10,600);
    textFont(SCPExtraLight);
    fill(100);
    text(s1,200,100,500,500);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode ==111){
    textFont(SCPBlack);
     fill(100,40);
     textSize(150);
     text(q2,0,0);
     textFont(SCPBlack);
     fill(100,50);
     textSize(200);
     text(q4,3,200);
     textFont(SCPBlack);
     fill(100,50);
     textSize(150);
     text(q3,20,400);
    textFont(SCPExtraLight);
    fill(100);
    text(s2,200,100,500,500);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode == 2){
  textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d2,200,100,500,500);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode == 222){
  textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d222,200,100,500,500);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode == 2222){
  textFont(SCPBlack);
  fill(100,70);
  textSize(random(200,250));
  text("CAR",random(0,40),random(400,500));
  text("ACCIDENT",random(200,250),random(400,500));
    textFont(SCPBlack);
    textSize(50);
    fill(100);
    text(d2222,200,100,500,500);
    textFont(SCPExtraLight);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode == 22222){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d22222,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 3){
    textFont(SCPBlack);
//  fill(100,30);
  textSize(random(300,320));
//  text(q1,random(-60,500),random(20,550));
//  text(q11,random(10,500),random(30,600));
    fill(100,random(20,45));
    text("smile",150,450);
    textFont(SCPExtraLight);
    fill(100);
    text(d3,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 4){
    textFont(SCPBlack);
  fill(100,10);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d4,200,100,500,500);
    textFont(SCPExtraLight);
    text(c1,200,500);
    text(letter,200,600);
  }else if (mode == 5){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d5,130,100,650,500);
    textFont(SCPExtraLight);
    text(c,130,500);
    text(letter,130,600);
  }else if (mode == 6){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d6,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 7){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d7,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 8){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d8,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 9){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d9,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 10){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d10,200,100,500,500);
    textFont(SCPExtraLight);
    text(letter,200,600);
    text(letter,200,600);
  }else if (mode == 11){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d11,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 12){
    textFont(SCPLight);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text("CORPSE",random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d12,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 13){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,600));
  text(q11,random(30,500),random(30,400));
    textFont(SCPExtraLight);
    fill(100);
    text(d13,160,100,650,500);
    textFont(SCPExtraLight);
    text(c,160,500);
    text(letter,160,600);
  }else if (mode == 14){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(20,400),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d14,200,100,500,500);
    textFont(SCPExtraLight);
    text(letter,200,600);
    text(letter,200,600);
  }else if (mode == 15){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d15,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 16){
    textFont(SCPBlack);
  fill(100,60);
  textSize(random(30,400));
  text("BOX",300,450);
    textFont(SCPExtraLight);
    fill(100);
    text(d16,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 17){
    textFont(SCPBlack);
  fill(100,30);
  textSize(random(300,400));
  text(q1,random(-60,500),random(20,550));
  text(q11,random(10,500),random(30,600));
    textFont(SCPExtraLight);
    fill(100);
    text(d17,200,100,500,500);
    textFont(SCPExtraLight);
    text(c,200,500);
    text(letter,200,600);
  }else if (mode == 18){
    textFont(SCPExtraLight);
    fill(204);
    text(r18,200,100,500,500);
    text(c,200,500);
    textSize(65);
    text(letter,200,400);
  }else if (mode == 19){
    textFont(SCPExtraLight);
    fill(204);
    text(r19,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
  }else if (mode == 20){
    textFont(SCPExtraLight);
    fill(204);
    text(r20,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
  }else if (mode == 21){
    textFont(SCPExtraLight);
    fill(204);
    text(r21,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
  }else if (mode == 22){
    textFont(SCPExtraLight);
    fill(204);
    text(r22,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
  }else if (mode == 23){
    textFont(SCPExtraLight);
    fill(204);
    text(r23,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
  }else if (mode == 24){
    textFont(SCPExtraLight);
    fill(204);
    text(r24,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
   }else if (mode == 25){
     textFont(SCPExtraLight);
     fill(204);
    text(r25,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
   }else if (mode == 26){
     textFont(SCPExtraLight);
     fill(204);
    text(r26,200,100,600,500);
    textFont(SCPExtraLight);
    text(c1,200,600);
   textSize(65);
    text(letter,200,400);
   }else if (mode == 266){
     fill(204);
    textFont(SCPExtraLight);
    text(r266,200,100,600,500);
    textFont(SCPExtraLight);
   textSize(65);
    text(letter,200,400);
   }else if (mode == 27){
     textFont(SCPExtraLight);
     fill(204);
    text(r27,200,100,600,500);
    textFont(SCPExtraLight);
   textSize(65);
    text(letter,200,450);
     }else if (mode == 28){
    textFont(SCPExtraLight);
    fill(204);
    text(r28,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
     }else if (mode == 29){
    textFont(SCPExtraLight);
    fill(204);
    text(r29,200,100,600,500);
    textFont(SCPExtraLight);
    text(c,200,500);
   textSize(65);
    text(letter,200,400);
     }else if (mode == 30){
       textFont(SCPBlack);
       textSize(50);
       fill(204);
    text(r30,150,100,800,500);
    textFont(SCPLight);
    textSize(20);
    text("Confuse?\ntype back to the beginning of the story in the real life",150,500);
    text(letter,150,450);
     }
     saveFrame("frames/####.tif");
}


void keyPressed(){
  if((key==ENTER)||(key==RETURN)){
    if(mode==1){
      if(letter.equals("next")){
        mode=111;
      }
    }else if(mode==111){
       if(letter.equals("next")){
         mode=2;
      }
     }
     else if(mode==2){
       if(letter.equals("next")){
        mode=222;
      }
     }else if (mode==222){
        if(letter.equals("next")){
          mode=2222;
          bomb.trigger();
      }
     }else if(mode==2222){
       if(letter.equals("next")){
         mode=22222;
         door.trigger();
       }
     }else if(mode==22222){
       if(letter.equals("dream")){
         mode=3;
         smile.trigger();
       }else if (letter.equals("reality")){
         mode=24;
         laugh.trigger();
         laugh2.trigger();
       }
     }
     else if(mode==3){
       if(letter.equals("dream")){
        mode=4;
      }else if (letter.equals("reality")){
        mode=18;
        sing.trigger();
      }else if(letter.equals("back")){
         mode=2;
       }
     }
     else if(mode==4){
       if(letter.equals("next")){
         mode=5;
       }
     }
     else if(mode==5){
       if(letter.equals("dream")){
        mode=6;
      }else if (letter.equals("reality")){
        mode=19;
      }else if(letter.equals("back")){
         mode=4;
       }
     }
     else if(mode==6){
       if(letter.equals("dream")){
        mode=7;
      }else if (letter.equals("reality")){
        mode=26;
      }else if(letter.equals("back")){
         mode=5;
       }
     }
     else if(mode==7){
       if(letter.equals("dream")){
        mode=8;
      }else if (letter.equals("reality")){
        mode=20;
      }else if(letter.equals("back")){
         mode=6;
       }
     }
     else if(mode==8){
       if(letter.equals("dream")){
        mode=9;
      }else if (letter.equals("reality")){
        mode=21;
      }else if(letter.equals("back")){
         mode=7;
       }
     }
     else if(mode==9){
       if(letter.equals("dream")){
        mode=10;
      }else if (letter.equals("reality")){
        mode=23;
        cry.trigger();
      }else if(letter.equals("back")){
         mode=8;
       }
     }
     else if(mode==10){
       if(letter.equals("Diane")){
        mode=11;
//        call.trigger();
      }else if(letter.equals("back")){
         mode=9;
       }
     }
     else if(mode==11){
       if(letter.equals("dream")){
        mode=12;
        scream.trigger();
      }else if (letter.equals("reality")){
        mode=27;
      }else if(letter.equals("back")){
         mode=10;
       }
     }
     else if(mode==12){
       if(letter.equals("dream")){
        mode=13;
      }else if (letter.equals("reality")){
        mode=25;
      }else if(letter.equals("back")){
         mode=11;
       }
     }
     else if(mode==13){
       if(letter.equals("dream")){
        mode=14;
      }else if (letter.equals("reality")){
        mode=22;
      }else if(letter.equals("back")){
         mode=12;
       }
     }
     else if(mode==14){
       if(letter.equals("both")){
        mode=15;
      }else if(letter.equals("back")){
         mode=13;
       }
     }
     else if(mode==15){
       if(letter.equals("dream")){
        mode=16;
      }else if (letter.equals("reality")){
        mode=26;
      }else if(letter.equals("back")){
         mode=14;
       }
     }
     else if(mode==16){
       if(letter.equals("dream")){
        mode=17;
        knock.trigger();
      }else if (letter.equals("reality")){
        mode=28;
      }else if(letter.equals("back")){
         mode=15;
       }
     }
     else if(mode==17){
       if(letter.equals("dream")){
        mode=30;
      }else if (letter.equals("reality")){
        mode=30;
      }else if(letter.equals("back")){
         mode=16;
       }
     }
     else if(mode==18){
       if(letter.equals("dream")){
        mode=3;
        smile.trigger();
      }else if (letter.equals("reality")){
        mode=19;
      }
     }
     else if(mode==19){
       if(letter.equals("dream")){
        mode=5;
      }else if (letter.equals("reality")){
        mode=20;
      }
     }
     else if(mode==20){
       if(letter.equals("dream")){
        mode=7;
      }else if (letter.equals("reality")){
        mode=21;
      }
     }
     else if(mode==21){
       if(letter.equals("dream")){
        mode=8;
      }else if (letter.equals("reality")){
        mode=22;
      }
     }
     else if(mode==22){
       if(letter.equals("dream")){
        mode=13;
      }else if (letter.equals("reality")){
        mode=23;
        cry.trigger();
      }
     }
     else if(mode==23){
       if(letter.equals("dream")){
        mode=9;
      }else if (letter.equals("reality")){
        mode=24;
        laugh.trigger();
        laugh2.trigger();
      }
     }
     else if(mode==24){
       if(letter.equals("dream")){
        mode=2;
      }else if (letter.equals("reality")){
        mode=25;
      }
     }else if(mode==25){
       if(letter.equals("dream")){
        mode=12;
        scream.trigger();
      }else if (letter.equals("reality")){
        mode=26;
      }
     }
     else if(mode==26){
       if(letter.equals("next")){
        mode=266;
      }
     }
     else if(mode==266){
       if(letter.equals("dream")){
        mode=6;
      }else if (letter.equals("blue key")){
        mode=27;
      }
     }
     else if(mode==27){
       if(letter.equals("dream")){
        mode=10;
      }else if (letter.equals("Betty")){
        mode=28;
      }
     }
     else if(mode==28){
       if(letter.equals("dream")){
        mode=16;
      }else if (letter.equals("reality")){
        mode=29;
        knock.trigger();
      }
     }
     else if(mode==29){
       if(letter.equals("dream")){
        mode=17;
      }else if (letter.equals("reality")){
        mode=30;
      }
     }
     else if(mode==30){
       if(letter.equals("back")){
        mode=18;
        sing.trigger();
      }
     }
     else if (mode==random(2,23)){
       if(letter.equals("back")){
         mode=1;
      } 
     }
     letter="";
  }else if ((key>31)&&(key!=CODED)){
    letter=letter+key;
  }else if (key==BACKSPACE){
    letter=letter.substring(0,letter.length()-1);
  }
}

