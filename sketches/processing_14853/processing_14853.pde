
int card = 1;
float count = 0.0;
PFont font;
PImage card1;
PImage card2;
PImage snake;
PImage beetle;
PImage kite;
PImage eyes;
PImage card3;
PImage card4;
PImage card5;
PImage card6;
PImage card7;
PImage card8;
PImage home;
PImage homeH;
PImage horn;
PImage hornH;
PImage snakeH;
PImage beetleH;
PImage eggs;
PImage eggsH;
PImage kiteH;
PImage quill;
PImage quillH;
PImage secret;
PImage card300;
PImage card102;
PImage card200;

void setup() {
  size(640,480);
  smooth();
  font = loadFont("AngsanaNew-48.vlw");
  textFont(font);
  fill(0);
  card1 = loadImage("card1.jpg");
  card2 = loadImage("card2.jpg");
  kite = loadImage("kite.png");
  beetle = loadImage("beetle.png");
  snake = loadImage("snake.png");
  eyes = loadImage("eyes.png");
  card3 = loadImage("card3.jpg");
  card4 = loadImage("card4.jpg");
  card5 = loadImage("card5.jpg");
  card6 = loadImage("card6.jpg");
  card7 = loadImage("card7.jpg");
  card8 = loadImage("card8.jpg");
  home = loadImage("home.png");
  homeH = loadImage("homeH.png");
  horn = loadImage("horn.png");
  hornH = loadImage("hornH.png");
  snakeH = loadImage("snakeH.png");
  beetleH = loadImage("beetleH.png");
  eggs = loadImage("eggs.png");
  eggsH = loadImage("eggsH.png");
  kiteH =loadImage("kiteH.png");
  quill = loadImage("quill.PNG");
  quillH = loadImage("quillH.png");
  card102 = loadImage("card102.jpg");
  card200 = loadImage("card200.jpg");
  secret = loadImage("secret.png");
  card300 = loadImage("card300.jpg");
}


void draw() {
  background(100);
  textSize(48);
  if (card == 1) {
    textAlign(CENTER);
    image(card1,0,0);
    text("You are the Eagle!", width/2,height/4);
    textSize(30);
    text("Click to begin!",width/2, height-30);
    count = 0;
  }
  else if(card==2) {
    textAlign(LEFT);
    image(card2,0,0);
    fill(239,254,3);
    rect(15,300,275,175);
    cursor(eyes,22,17);
    fill(0);
    text("One day, the noble Eagle was strolling through the forest when he came across a...", 17,302, 275, 470);
    if(mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195){
      image(kite, 142,77);
    }
    if(mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430){
      image(beetle,572,370);
    }
    if(mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
      image(snake,418,90);
    }
  }
  else if(card==3) {
    image(card3,0,0);
    text("Wild Serpent!",100,134);
  }
  else if(card==4) {
    image(card4,0,0);
    text("Tiny Beetle",371,140);
  }
  else if(card==5) {
    image(card5,0,0);
    textAlign(CENTER);
    text("Small Kite-Bird",397,300,150,150);
    textAlign(LEFT);
  }
  else if(card==6) {
    image(card6,0,0);
    fill(255);
    textSize(27);
    text("The Serpent had succeeded in surprising the Eagle and had wrapped himself around the Eagle's neck. The Eagle could not reach the Serpent, neither with beak nor claws. Far into the sky he soared trying to shake off his enemy. But the Serpent's hold only tightened, and slowly the Eagle sank back to earth, gasping for breath.",55,60,540,300);
    text("A Countryman chanced to see the unequal combat. In pity for the noble Eagle he rushed up and soon had loosened the coiling Serpent and freed the Eagle.",55,180,540,300);
    text("The Serpent was furious. He had no chance to bite the watchful Countryman. Instead he struck at the drinking horn, hanging at the Countryman's belt, and into it let fly the poison of his fangs.",55,255,540,300);
    text("The Countryman now went on toward home. Becoming thirsty on the way, he filled his horn at a spring, and was about to drink. There was a sudden rush of great wings. Sweeping down, the Eagle seized the poisoned horn from out his savior's hands, and flew away with it to hide it where it could never be found.",55,330,540,300);
  }
  else if(card==7) {
    image(card7,0,0);
    fill(255);
    textSize(27);
    text("The Beetle had once begged the Eagle to spare a Hare which had run to her for protection. But the Eagle pounced upon her prey, the sweep of her great wings tumbling the Beetle a dozen feet away. Furious at the disrespect shown her, the Beetle flew to the Eagle's nest and rolled out the eggs. Not one did she spare. The Eagle's grief and anger knew no bounds, but who had done the cruel deed she did not know.",55,60,540,300);
    text("Next year the Eagle built her nest far up on a mountain crag; but the Beetle found it and again destroyed the eggs. In despair the Eagle now implored great Jupiter to let her place her eggs in his lap. There none would dare harm them. But the Beetle buzzed about Jupiter's head, and made him rise to drive her away; and the eggs rolled from his lap.",55,215,540,300);
    text("Now the Beetle told the reason for her action, and Jupiter had to acknowledge the justice of her cause. And they say that ever after, while the Eagle's eggs lie in the nest in spring, the Beetle still sleeps in the ground. For so Jupiter commanded.",55,350,540,300);
  }
  else if(card==8) {
    image(card8,0,0);
    fill(255);
    textSize(27);
    text("The Eagle sat high in the branches of a great Oak. She seemed very sad and drooping for an Eagle. A Kite saw her.",55,60,540,300);
    text("\"Why do you look so woebegone?\" asked the Kite.",55,110,540,300);
    text("\"I want to get married,\" replied the Eagle, \"and I can't find a mate who can provide for me as I should like.\"",55,137,540,300);
    text("\"Take me,\" said the Kite; \"I am very strong, stronger even than you!\"",55,189,540,300);
    text("\"Do you really think you can provide for me?\" asked the Eagle eagerly.",55,220,540,300);
    text("\"Why, of course,\" replied the Kite. \"That would be a very simple matter. I am so strong I can carry away an Ostrich in my talons as if it were a feather!\"",55,250,540,300);
    text("The Eagle accepted the Kite immediately. But after the wedding, when the Kite flew away to find something to eat for his bride, all he had when he returned, was a tiny Mouse.",55,320,540,300);
    text("\"Is that the Ostrich you talked about?\" said the Eagle in disgust.",55,386,540,300);
    text("\"To win you I would have said and promised anything,\" replied the Kite.",55,412,540,300);
  }
  else if(card==9) {
    textAlign(CENTER);
    fill(255);
    image(card6,0,0);
    text("Moral:",width/2,height/2-15);
    text("An act of kindness is well repaid.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if(card==10) {
    textAlign(CENTER);
    fill(255);
    image(card7,0,0);
    text("Moral:",width/2,height/2-15);
    textSize(36);
    text("Even the weakest may find means to avenge a wrong.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if(card==11) {
    textAlign(CENTER);
    fill(255);
    image(card8,0,0);
    text("Moral:",width/2,height/2-15);
    text("Everything is fair in love.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 100) {
    image (card102,0,0);
  }
  else if (card == 101) {
    image (card102,0,0);
  }
  else if (card == 102) {
    image (card102,0,0);
  }
  else if (card == 20) {
    image(card3,0,0);
    image(home, 330,400);
    image(horn, 530,230);
    fill(0);
    if(mouseX >320 && mouseX < 430 && mouseY > 350){
      image(homeH,330,400);
    }
    if(mouseX >530 && mouseY > 230 && mouseY < 300){
      image(hornH, 530,230);
    }
    if(mouseX < 525 && mouseX > 295 && mouseY < 340){
      image(snakeH,277,0);
    }
    text("The Countrymen came back looking for his horn, but it was nowhere to be found...", 50, 40,270,400);
  }
  else if (card == 40) {
    image(card4,0,0);
    fill(0);
    image(home, 30,400);
    image(eggs, 450,240,100,80);
    if(mouseX <130 && mouseY > 350){
      image(homeH,30,400);
    }
    if(mouseX >200 && mouseX < 500 && mouseY > 330){
      image(beetleH,160,291);
    }
    if(mouseX <550 && mouseX > 450 && mouseY < 310 && mouseY > 230){
      image(eggsH,450,240,100,80);
    }
    text("The Eagle discovered that the Beetle was the one destroying it's eggs and...", 285, 45, 270, 300);
  }
  else if (card == 60) {
    image(card5,0,0);
    image(home, 30,30);
    image(quill,250,270,70,200);
    fill(0);
    if(mouseX <130 && mouseY < 105){
      image(homeH,30,30);
    }
    if(mouseX < 250 && mouseY > 105){
      image(kiteH,0,0);
    }
    if(mouseX >250 && mouseX <310 && mouseY > 270){
      image(quillH,250,270,70,200);
    }
    text("Having discovered the Kite's treachery, the Eagle decided to...", 340, 265,275,300);
  }
  else if (card == 30) {
    image(card2,0,0);
    fill(239,254,3);
    rect(15,300,277,136);
    cursor(eyes,22,17);
    fill(0);
    text("On his way back home, the eagle came across another creature. The...", 17,302, 275, 470);
    if(mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195){
      image(kite, 142,77);
    }
    if(mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430){
      image(beetle,572,370);
    }
  }
  else if (card == 50) {
    image(card2,0,0);
    fill(239,254,3);
    rect(15,300,277,136);
    cursor(eyes,22,17);
    fill(0);
    text("On his way back home, the eagle came across another creature. The...", 17,302, 275, 470);
    if(mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195){
      image(kite, 142,77);
    }
    if(mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
      image(snake,418,90);
    }
  }
  else if (card == 70) {
    image(card2,0,0);
    fill(239,254,3);
    rect(15,300,277,136);
    cursor(eyes,22,17);
    fill(0);
    text("On his way back home, the eagle came across another creature. The...", 17,302, 275, 470);
    if(mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430){
      image(beetle,572,370);
    }
    if(mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
      image(snake,418,90);
    }
  }
  else if (card == 21) {
    image(card6,0,0);
    fill(255);
    textSize(27);
    text("The Countrymen questioned the Eagle, furious as to why he had taken his horn. But with no way to tell him his reasons, the Eagle could do nothing could do nothing but take the verbal lashing.",55,160,540,300);
    text("As the Man yelled, the Serpent slunk back, unbeknownst to anyone else and gave the him a bite filled with so much venom it could have slayed thirty boars.",55,250,540,300);
  }
  else if (card == 41) {
    image(card7,0,0);
    fill(255);
    textSize(27);
    text("The Eagle was outraged with the Beetle. \"Why would you do such terrible things? What possible Justification do you have?\"",55,160,540,300);
    text("\"You ate my friend!\" Said the Beetle. Upon hearing this the Eagle was stunned.",55,220,540,300);
    text("\"That was over a year ago and I need the food to survive! You Justify killing 3 generations of my offspring because I may myself a meal that happened to be your friend?!?\" ",55,280,540,300);
    text("\"Yes, I do\" Said the Beetle.",55,360,540,300);
  }
  else if (card == 61) {
    image(card8,0,0);
    fill(255);
    textSize(27);
    text("The Eagle realized that he had to stay with the Kite for the rest of his days. Not even the gods themselves can sever the bonds of marriage.",55,160,540,300);
    text("And so the Eagle and the Kite lived a peaceful life with each other. The Eagle working all day to supply food for the both of them.",55,220,540,300);
    text("The Kite lived happily ever after.",55,310,540,300);
  }
  else if (card == 22) {
    image(card6,0,0);
    fill(255);
    textSize(27);
    text("The Countrymen questioned the Eagle, furious as to why he had taken his horn. The Eagle, fed up with the ignorant rage of the man, conceded and brought the Horn out of hiding.",55,160,540,300);
    text("\"That's more like it,\" said the Man, \"You should no better then to steal, especially from someone who just showed you kindness!\" And with one great gulp from the Horn, the Man fell dead from the venom within. ",55,250,540,300);
  }
  else if (card == 42) {
    image(card7,0,0);
    fill(255);
    textSize(27);
    text("Outraged and filled with hatred, the Eagle hatched a plan. Waiting until the Beetle left it's eggs ungaurded, the Eagle snuck into it's home and broke all the eggs, one by one.",55,127,540,300);
    text("When the Beetle came home, he was appalled and quickly turned to anger. He flew to Apollo and asked him to take revenge on the Eagle. Apollo clipped the Eagles wings, making it so he could never fly again.",55,200,540,300);
    text("\"The Beetle breaks my eggs three times when all I did was kill a hare,\" pleaded the Eagle, \"yet you side with him. But all I do is enact my justified revenge and I lose my gift of flight?",55,275,540,300);
    text("\"That is right,\" Apollo boomed, \"Though it may seem unjust now, eventually you will see the error of your ways.\" And then he flew away, back to his throne.",55,350,540,300);
  }
  else if (card == 62) {
    image(card8,0,0);
    fill(255);
    textSize(27);
    text("The Eagle tried to file for divorce, but was told it would take two months for the papers to go through. \"Until then,\" the Eagle said with a menacing look in it's eye, \"You are going to get me the Ostrich you promised.\'",55,100,540,300);
    text("Everyday for the next two months, the Eagle worked the Kite until it couldn't lift a wing. The Eagle made the Kite do everything for him, barely moving himself at all.",55,190,540,300);
    text("Finally, after two months of hard labor, the papers went through and the Kite was freed from the tyranical marriage to the Eagle. ",55,280,540,300);
    text("With The Eagle's worker gone, he had forgotten how to do anything by himself! Left in a pile of his own filth, the Eagle wasted away until he died in the very spot he sat in.",55,340,540,300);
  }
  else if (card == 23) {
    image(card6,0,0);
    textAlign(CENTER);
    textSize(40);
    text("(Appended) Moral:",width/2,height/2-15);
    text("Don't sweat the little things, it might kill you.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 24) {
    image(card6,0,0);
    textAlign(CENTER);
    text("(Appended) Moral:",width/2,height/2-15);
    text("No good deed goes unpunished.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 43) {
    image(card7,0,0);
    textAlign(CENTER);
    text("(Appended) Moral:",width/2,height/2-15);
    text("You can't change what's happened.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 44) {
    image(card7,0,0);
    textAlign(CENTER);
    textSize(40);
    text("(Appended) Moral:",width/2,height/2-15);
    text("Sometimes our plans don't allign with the Gods.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 63) {
    image(card8,0,0);
    textAlign(CENTER);
    textSize(44);
    text("(Appended) Moral:",width/2,height/2-15);
    text("Sometimes settling is just the easiest option.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 64) {
    image(card8,0,0);
    textAlign(CENTER);
    text("(Appended) Moral:",width/2,height/2-15);
    textSize(30);
    text("Sometimes a bad relationship is better then no relationship at all.",width/2,height/2 + 15);
    textAlign(LEFT);
  }
  else if (card == 200) {
    image(card200,0,0);
  }
  //SECRET ENDING STUFF
  else if (card == 31) {
    image(card3,0,0);
    image(secret, 330,400);
    image(horn, 530,230);
    fill(0);
    if(mouseX >530 && mouseY > 230 && mouseY < 300){
      image(hornH, 530,230);
    }
    if(mouseX < 525 && mouseX > 295 && mouseY < 340){
      image(snakeH,277,0);
    }
    text("The Countrymen came back looking for his horn, but it was nowhere to be found...", 50, 40,270,400);
  }
  else if (card == 51) {
    image(card4,0,0);
    fill(0);
    image(secret, 30,400);
    image(eggs, 450,240,100,80);
    if(mouseX >200 && mouseX < 500 && mouseY > 330){
      image(beetleH,160,291);
    }
    if(mouseX <550 && mouseX > 450 && mouseY < 310 && mouseY > 230){
      image(eggsH,450,240,100,80);
    }
    text("The Eagle discovered that the Beetle was the one destroying it's eggs and...", 285, 45, 270, 300);
  }
  else if (card == 71) {
    image(card5,0,0);
    image(secret, 30,30);
    image(quill,250,270,70,200);
    fill(0);
    if(mouseX < 250 && mouseY > 105){
      image(kiteH,0,0);
    }
    if(mouseX >250 && mouseX <310 && mouseY > 270){
      image(quillH,250,270,70,200);
    }
    text("Having discovered the Kite's treachery, the Eagle decided to...", 340, 265,275,300);
  }
  else if (card == 300) {
    image(card300,0,0);
    fill(255);
    textAlign(CENTER);
    textSize(27);
    text("Everyone the Eagle met was so horrible and mean to him that it took it's new spouse, near death experience, and loss of all offspring and went home, never to be heard from again.",55,100,540,300);
    textSize(48);
    text("(Appended) Moral:",width/2,height/2+15);
    text("You win some, you lose a lot more.",width/2,height/2 + 45);
    textAlign(LEFT);
  }
}
  void mousePressed(){
    if (card == 1) {
      card = 2;
    }
    else if (card ==2) {
      if (mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
        card = 3;
      }
      else if (mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430) {
        card = 4;
      }
      else if (mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195) {
        card = 5;
      }
    }
    else if (card == 3) {
      card = 6;
    }
    else if (card == 4) {
      card = 7;
    }
    else if (card == 5) {
      card = 8;
    }
    else if (card == 6) {
      card = 9;
    }
    else if (card == 7) {
      card = 10;
    }
    else if (card == 8) {
      card = 11;
    }
    else if (card == 3) {
      card = 6;
    }
    else if (card == 4) {
      card = 7;
    }
    else if (card == 9) {
      card = 100;
    }
    else if (card == 10) {
      card = 101;
    }
    else if (card == 11) {
      card = 102;
    }
    else if (card == 100) {
      if (count != 2.0){
      card = 20;
      }
      if (count == 2.0){
      card = 31;
      }
    }
    else if (card == 101) {
      if (count != 2.0){
      card = 40;
      }
      if (count == 2.0){
      card = 51;
      }
    }
    else if (card == 102) {
      if (count != 2.0){
      card = 60;
      }
      if (count == 2.0){
      card = 71;
      }
    }
    else if (card == 20) {
      if(mouseX < 525 && mouseX > 295 && mouseY < 340) {
        card = 21;
      }
      else if(mouseX >530 && mouseY > 230 && mouseY < 300) {
        card = 22;
      }
      else if(mouseX >320 && mouseX < 430 && mouseY > 350){
        card = 30;
        count = count + 1;
      }
    }
    else if (card == 40) {
      if(mouseX >200 && mouseX < 500 && mouseY > 330) {
        card = 41;
      }
      else if(mouseX <550 && mouseX > 450 && mouseY < 310 && mouseY > 230) {
        card = 42;
      }
      else if(mouseX <130 && mouseY > 350){
        card = 50;
        count = count + 1;
      }
    }
    else if (card == 60) {
      if(mouseX < 250 && mouseY > 105) {
        card = 61;
      }
      else if(mouseX >250 && mouseX <310 && mouseY > 270) {
        card = 62;
      }
      else if(mouseY < 110 && mouseX < 130){
        count = count + 1;
        card = 70;
      }
    }
    else if (card == 30) {
      if (mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430) {
        card = 4;
      }
      else if (mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195) {
        card = 5;
      }
    }
    else if (card == 50) {
      if (mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
        card = 3;
      }
      else if (mouseX > 150 && mouseX < 235 && mouseY > 80 && mouseY < 195) {
        card = 5;
      }
    }
    else if (card == 70) {
      if (mouseX < 560 && mouseX > 470 && mouseY > 90 && mouseY <190){
        card = 3;
      }
      else if (mouseX > 580 && (mouseX < 630) && (mouseY > 370) && mouseY < 430) {
        card = 4;
      }
    }
    else if (card == 31) {
      if(mouseX < 525 && mouseX > 295 && mouseY < 340) {
        card = 21;
      }
      else if(mouseX >530 && mouseY > 230 && mouseY < 300) {
        card = 22;
      }
      else if(mouseX >320 && mouseX < 430 && mouseY > 350){
        card = 300;
      }
    }
      else if (card == 51) {
      if(mouseX >200 && mouseX < 500 && mouseY > 330) {
        card = 41;
      }
      else if(mouseX <550 && mouseX > 450 && mouseY < 310 && mouseY > 230) {
        card = 42;
      }
      else if(mouseX <130 && mouseY > 350){
        card = 300;
      }
    }
    else if (card == 71) {
      if(mouseX < 250 && mouseY > 105) {
        card = 61;
      }
      else if(mouseX >250 && mouseX <310 && mouseY > 270) {
        card = 62;
      }
      else if(mouseY < 110 && mouseX < 130){
        card = 300;
      }
    }
    else if (card == 21) {
      card = 23;
    }
    else if (card == 22) {
      card = 24;
    }
    else if (card == 41) {
      card = 43;
    }
    else if (card == 42) {
      card = 44;
    }
    else if (card == 61) {
      card = 63;
    }
    else if (card == 62) {
      card = 64;
    }
    else if (card == 23 || card == 24 || card == 43 || card == 44 || card == 63 || card == 64){
      card = 200;
    }
    else if (card == 200) {
      card = 1;
    }
    else if (card == 300) {
      card = 200;
    }
    
  } 

