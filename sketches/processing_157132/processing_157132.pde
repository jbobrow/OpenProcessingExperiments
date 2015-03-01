
PFont font;
int step;
int step2;
int step3;
int cursorNum;
int loadTime = 3000; //set back to 10000 when done
boolean yes = false;
boolean no = false;
boolean enter = false;
boolean noJoke = false;
PImage img1;
PImage img2;
PImage img3;
float xPos;
float yPos;
boolean ast1Click;
boolean ast2Click;
boolean ast3Click;
boolean ast1Align;
boolean ast2Align;
boolean ast3Align;
boolean navClick;
boolean trav1;
boolean trav2;
boolean trav3;
boolean mine = false;
boolean email1 =false;
boolean email2 = false;
boolean email3 = false;
boolean email4 = false;
boolean close = false;
boolean comBar = false;


void setup(){
 size(1000,600);
 font = loadFont("DS-Digital-48.vlw" );
 textFont(font, 30);
 textAlign(LEFT, TOP);
 img1 = loadImage("ast1.png");
 img2 = loadImage("ast2.png");
 img3 = loadImage("ast3.png");
 xPos = 350;
 yPos = 100;
 ast1Align = false;
 ast2Align = false;
 ast3Align = false;
}

void draw(){
  int passedTime = millis();
  background(0);
  fill(255,0,0);
  loadScreen(); // this is the very first screen, shows for 10sec
  if(passedTime > loadTime){ //timer to move to next screen
    welcomeScreen();
  }
  mousePos();
}

void mousePos(){
  if(mousePressed){
    println(mouseX + " : " + mouseY);
  }
}


//<-----------this is the boot screen---------->
void loadScreen(){
    text("BOOTING UP . . .", 0, 10);
  if(step == 0){
      fill(255,0,0);
      rect(180, 8, 15,23);
  }
  step = (step+1)%30;
}

//<----------bootscreen loads to welcome screen-------->
void welcomeScreen(){
  int screenTime = millis();
  background(0);
  text("GOOD MORNING ABRAHAM . . .", 0, 10);
  if(screenTime>6000){ //change this back to 13000
    text("SHALL WE GET STARTED ?", 0, 40);
    if(step2 == 0 && yes == false && no == false){
      fill(255,0,0);
      rect(0, 60, 15,23);
    }
    step2 = (step2+1)%30;
    if(keyPressed){
      if(key == 'y'){
        yes = true;
        no = false;
      }
    }
    if(keyPressed){
      if(key == 'n'){
        yes = false;
        no = true;
      }
    }
    //below is default flashing box

    //below will create the flashing box after Y
    if(yes == true && no == false){
      text("Y  ", 0, 65);
      if(step2 == 0){
        fill(255,0,0);
        rect(20,60,15,23);
      }
    }
    
    if(no == true && yes == false){
      text("N  ", 0, 65);
      if(step2 == 0){
        fill(255,0,0);
        rect(20,60,15,23);
      }
    }
    //below create function for hitting "enter"
    if(keyPressed){
      if(key == 10){
        enter = true;
        println("enter is working");
      }
    }
    if(enter == true && yes == true){
      mainPage();
    }
    if(enter == true && no == true){
        text("I'M NOT PROGRAMMED FOR HUMOR . . . YOU SHALL COMMENSE WORK IMMEDIATELY", 0, 90);
        step3 = (step3+1)%150;
        if(step3 == 0){
          noJoke = true;
        }
        
        if(noJoke == true){
          mainPage();
        }
        
    }
  }
   
}

void mainPage(){
  background(0);
  //below is the header
  stroke(255,0,0);
  fill(0);
  beginShape();
  vertex(200,0);
  vertex(300,100);
  vertex(700,100);
  vertex(800,0);
  endShape();
  stroke(0);
  textSize(60);
  fill(255,0,0);
  textAlign(CENTER);
  text("WEYLAND INDUSTRIES",500,40);
  textSize(24);
  text("building a better tomorrow today",500,80);
  //end header
  //below are the "menu" options
  stroke(255,0,0);
  fill(0);
  rect(350,200,300,50);
  rect(350,300,300,50);
  rect(350,400,300,50);
  rect(350,500,300,50);
  fill(255,0,0);
  textSize(30);
  text("NAVIGATION MAP",500,235);
  text("SOLAR MAP", 500, 335);
  text("SYSTEMS CHECK", 500, 435);
  text("COMMUNICATIONS",500,535);
  
  //below is the "ships" quick stats
  fill(0);
  stroke(255,0,0);
  rect(0,200,150,200);
  fill(255,0,0);
  stroke(0);
  textSize(24);
  text("USCSS-KURTZ",75,225);
  stroke(255,0,0);
  line(0,230,150,230);
  stroke(0);
  textSize(14);
  fill(255,0,0);
  text("STAR-DATE : 04-02-2066",75,250);
  text("OXYGEN LEVEL : 100%",65,280);
  text("POWER LEVELS NORMAL", 68, 310);
  
  //below are the calls to other menus
  if(mouseX>350 && mouseX<650 && mouseY>200 && mouseY<250){
    if(mousePressed){
      
      navClick = true;

      println("Nav box works");
    }
  }
  
  if(mouseX>350 && mouseX<650 && mouseY>300 && mouseY<350){
    if(mousePressed){
      //call solar map function here
      println("Map box works");
    }
  }
  
  if(mouseX>350 && mouseX<650 && mouseY>400 && mouseY<450){
    if(mousePressed){
      //call systems check function here
      println("systems box works");
    }
  }
  
  if(mouseX>350 && mouseX<650 && mouseY>500 && mouseY<550 && navClick == false){
    if(mousePressed){
        comBar = true;
      println("communications box works");
    }
  }
  
  if(navClick == true){
    navigation();
  }
  
  if(comBar == true){
    communications();
  }
}

void navigation(){
  textAlign(CENTER);
  background(0);
  stroke(255,0,0);
  fill(0);
  textSize(30);
  mousePos();
  //main space lane curves below
  curve(400,500,20,600,800,0,700,300);
  curve(450,550,100,600,805,0,700,300);
  curve(450,550,200,600,810,0,700,300);
  curve(500,550,300,600,815,0,700,300);
  curve(550,575,400,600,820,0,700,400);
  
  //cross hatch curves below
  noFill();
  curve(520,750,97,528,400,600,100,800);
  curve(450,700,188,450,447,520,150,750);
  curve(400,650,280,376,492,450,200,700);
  curve(380,610,353,319,535,385,250,600);
  curve(300,500,420,266,574,325,350,500);
  curve(200,400,470,229,603,283,450,300);
  curve(180,380,510,197,633,240,500,230);
  curve(160,340,550,169,660,203,530,130);
  curve(300,300,580,146,678,177,600,200);
  curve(400,280,610,125,695,152,620,200);
  curve(420,280,632,108,711,133,620,150);
  curve(500,200,658,90,725,113,650,110);
  curve(550,200,676,77,736,98,650,110);
  curve(600,150,695,65,747,85,680,110);
  curve(600,150,710,55,755,74,680,80);
  curve(650,150,721,47,767,60,700,80);
  curve(650,150,732,40,776,48,730,80);
  curve(700,100,750,29,784,38,750,80);
  curve(750,70,762,21,792,29,750,60);
  curve(760,65,770,16,798,22,760,57);
  curve(790,45,780,10,804,15,765,50);
  curve(790,30,788,6,810,9,785,40);
  curve(790,30,793,4,815,5,785,40);
  
  //below is the shape for the ship
  fill(0);
  ellipse(350,430,40,40);
  beginShape();
  vertex(355,430);
  vertex(310,470);
  vertex(270,470);
  vertex(330,430);
  vertex(355,430);
  endShape();
  beginShape();
  vertex(355,430);
  vertex(310,470);
  vertex(310,500);
  vertex(355,450);
  vertex(355,430);
  endShape();
  rect(270,470,40,30);
  ellipse(290,485,20,20);
  
  //lets make some asteroids
  image(img1, xPos, yPos, 80,80);
  image(img2, xPos+500, yPos+100, 80, 80);
  image(img3, xPos+375, yPos+300, 80, 80);
  
  //below are the if statements for clicking on asteroids
  if(mouseX>350 && mouseX<420 && mouseY>100 && mouseY<160){
    if(mousePressed){
      ast1Click = true;
      ast2Click = false;
      ast3Click = false;
      comBar = false;
      email1 = false;
      email2 = false;
      email3 = false;
      email4 = false;
      println("asteroid 1 clicked");
    }
  }
  
  if(mouseX>860 && mouseX<910 && mouseY>215 && mouseY<245){
    if(mousePressed){
      ast1Click = false;
      ast2Click = true;
      ast3Click = false;
      comBar = false;
      email1 = false;
      email2 = false;
      email3 = false;
      email4 = false;
      println("asteroid 2 clicked");
    }
  }
  
  if(mouseX>730 && mouseX<800 && mouseY>410 && mouseY<450){
    if(mousePressed){
      ast1Click = false;
      ast2Click = false;
      ast3Click = true;
      comBar = false;
      email1 = false;
      email2 = false;
      email3 = false;
      email4 = false;
      println("asteroid 3 clicked");
    }
  }
  
  

    
   if(ast1Click == true){
     fill(0);
      rect(330,50,100, 50);
      fill(255,0,0);
      text("Align", 380, 85);
      if(mouseX>330 && mouseX<430 && mouseY>50 && mouseY<100){
        if(mousePressed){
          ast1Align = true;
        } 
      }
    }
    
    if(ast2Click == true){
      rect(840,150,100, 50);
      fill(255,0,0);
      text("Align", 890, 180);
      if(mouseX>840 && mouseX<940 && mouseY>150 && mouseY<200){
        if(mousePressed){
          ast2Align = true;
          println("Align2 true");
        } 
      }
    }
    
    if(ast3Click == true){
      rect(710,350,100, 50);
      fill(255,0,0);
      text("Align", 760, 380);
      if(mouseX>710 && mouseX<810 && mouseY>350 && mouseY<400){
        if(mousePressed){
          ast3Align = true;
          println("Align3 true");
        } 
      }
    }
    
    if(ast1Align == true){
//      xPos = 530;
//      yPos = 200;
      if(xPos<480){
        xPos++;
        yPos++;
      }
      ast1Click = false;
    
    }
    
    if(ast2Align == true){
//      xPos = 110;
//      yPos = 10;
      if(xPos>190){
        xPos--;
        yPos--;
      }
      ast2Click = false;
    }
    
    if(ast3Align == true){
//      xPos = 75;
//      yPos = -20;

      if(xPos > 145){
        xPos--;
        yPos--;
      }
      ast3Click = false;
    }
    
    if(ast1Align == true && ast1Click == false){
      fill(0);
      rect(100,300, 100,50);
      fill(255,0,0);
      text("TRAVEL", 150, 335);
      if(mouseX>100 && mouseX<200 && mouseY>300 && mouseY<350){
        if(mousePressed){
          trav1 = true;
          println(trav1);
        }
      }
    }
    
    if(ast2Align == true && ast2Click == false){
      fill(0);
      rect(100,300, 100,50);
      fill(255,0,0);
      text("TRAVEL", 150, 335);
      if(mouseX>100 && mouseX<200 && mouseY>300 && mouseY<350){
        if(mousePressed){
          trav2 = true;
          println(trav2);
        }
      }
    }
    
    if(ast3Align == true && ast3Click == false){
      fill(0);
      rect(100,300, 100,50);
      fill(255,0,0);
      text("TRAVEL", 150, 335);
      if(mouseX>100 && mouseX<200 && mouseY>300 && mouseY<350){
        if(mousePressed){
          trav3 = true;
          println(trav3);
        }
      }
    }
    
    if(trav1 == true){
      if(yPos<360){
        xPos--;
        yPos++;
      }
      ast1Align = false;
    }
    
    if(trav2 == true){
      if(yPos<280){
        xPos--;
        yPos++;
      }
      ast2Align = false;
    }
    
    if(trav3 == true){
      if(yPos<70){
        xPos--;
        yPos++;
      }
      ast3Align = false;
    }
    
    if(int(xPos)==350 && int(yPos)==360){
      fill(0);
      rect(550,500,100, 50);
      fill(255,0,0);
      text("MINE", 600, 530);
      if(mouseX>550 && mouseX<650 && mouseY>500 && mouseY<550){
        if(mousePressed){
          mine = true;
          println(mine);
        }
      }
    }
    
    if(int(xPos)==-150 && int(yPos)==280){
      fill(0);
      rect(550,500,100, 50);
      fill(255,0,0);
      text("MINE", 600, 530);
      if(mouseX>550 && mouseX<650 && mouseY>500 && mouseY<550){
        if(mousePressed){
          mine = true;
          println(mine);
        }
      }
    }
    
    if(int(xPos)==-30 && int(yPos)==70){
      fill(0);
      rect(550,500,100, 50);
      fill(255,0,0);
      text("MINE", 600, 530);
      if(mouseX>550 && mouseX<650 && mouseY>500 && mouseY<550){
        if(mousePressed){
          mine = true;
          comBar = false;
          println(mine);
        }
      }
    }
    
//    if(mine == true){
//      //put call to the mining screen here
//    }
    
    fill(0);
    rect(30,50,140,50);
    fill(255,0,0);
    text("MAIN MENU",100,85);
    if(mouseX>30 && mouseX<170 && mouseY>50 && mouseY<100){
      if(mousePressed){
        navClick=false;
      }
    }
    
    if(navClick == false){
      xPos = 350;
      yPos = 100;
      ast1Click = false;
      ast2Click = false;
      ast3Click = false;
      ast1Align = false;
      ast2Align = false;
      ast3Align = false;
      navClick = false;
      trav1 = false;
      trav2 = false;
      trav3 = false;
      mine = false;
    }
    
    fill(0);
    rect(30,120,140,50);
    fill(255,0,0);
    text("COMMS", 100, 155);
    if(mouseX>30 && mouseX<170 && mouseY>120 && mouseY<170 && comBar == false){
      if(mousePressed){

        
        comBar = true;

      }
    }
    
}

void communications(){
  
  if(mouseX>2 && mouseX<102 && mouseY>2 && mouseY<52){
    if(mousePressed){
      comBar = false;
      email1 = false;
      email2 = false;
      email3 = false;
      email4 = false;
    }
  }
  fill(0);
  strokeWeight(10);
  stroke(255,0,0);
  rect(0,0,1000,600);
  strokeWeight(5);
  rect(2,2,100,50); // back button box
  rect(103,2,895,50); //main header box
  rect(2,52,100,543); //date box
  rect(104,52,300 ,543); //sender box
  rect(406,53, width-408, 543); // main body rect
  rect(2,52,100,50); //"date" goes here
  rect(104,52,300 ,50); //"sender" goes here
  rect(406,53, width-408, 50); //"subject" goes here
  strokeWeight(1);
  fill(255,0,0);
  line(0,152,width,152);
  line(0,202,width,202);
  line(0,252,width,252);
  line(0,302,width,302);
  line(0,352,width,352);
  line(0,402,width,402);
  line(0,452,width,452);
  line(0,502,width,502);
  line(0,552,width,552);
  
  //header texts below
  textSize(30);
  text("BACK",50, 35);
  text("WEYLAND INDUSTRIES COMMUNICATION NETWORK",553,35);
  text("DATE",50,85);
  text("SENDER", 250,85);
  text("SUBJECT", 700,85);
  
  //email dates below
  textSize(18);
  text("02-05-66", 50, 135);
  text("02-03-66", 50, 185);
  text("01-30-66", 50, 235);
  text("01-26-66", 50, 285);
  
  //senders below
  textSize(24);
  text("WEYLAND ALERTS", 250, 135);
  text("Elam", 250, 185);
  text("WEYLAND ALERTS", 250, 235);
  text("SARAH", 250, 285);
  
  //subjects below
  text("IMPORTANT: RE: COMMUNICATIONS NETWORK", 700, 135);
  text("DON'T LOSE SIGHT OF YOUR OBJECTIVE", 700, 185);
  text("IMPORTANT: RIOT CONTROL UNDERWAY", 700, 235);
  text("HAPPY BIRTHDAY! WE MISS YOU!!", 700, 285);
  
  //hit boxes for clicking emails
  if(mouseX>0 && mouseX<width && mouseY>102 && mouseY< 152 &&comBar == true){
    if(mousePressed){
        email1 = true;
        email2 = false;
        email3 = false;
        email4 = false;
        println("1 :"+email1);
    }
  }
  
  if(mouseX>0 && mouseX<width && mouseY>152 && mouseY< 202 &&comBar == true){
    if(mousePressed){
        email1 = false;
        email2 = true;
        email3 = false;
        email4 = false;
        println("2 :"+email2);
    }
  }
  
  if(mouseX>0 && mouseX<width && mouseY>202 && mouseY< 252 &&comBar == true){
    if(mousePressed){
        email1 = false;
        email2 = false;
        email3 = true;
        email4 = false;
        println("3 :"+email3);
    }
  }
  
  if(mouseX>0 && mouseX<width && mouseY>252 && mouseY< 302 &&comBar == true){
    if(mousePressed){
        email1 = false;
        email2 = false;
        email3 = false;
        email4 = true;
        println("4 :"+email4);
    }
  }
  
  if(email1 == true){
    fill(0);
    rect(406,53, width-408, height-53);
    rect(width-53, 53,50,50);//close box
    fill(255,0,0);
    textSize(60);
    text("X", width-25, 97);
    textSize(14);
    text("DATE: 02-05-66", width-500, 97 );
    text("SENDER: WEYLAND ALERTS", width-474,118);
    textSize(24);
    text("TO ALL EMPLOYEES:", width-450, 160);
    text("DUE TO RECENT UNREST THE WEYLAND COMMUNICATIONS",width-300, 220);
    text("NETWORK WILL BE BROUGHT DOWN TEMPORARILY . . .", width-325, 250);
    text("WE HOPE TO HAVE IT RESTORED IN TWO WEEKS . . .", width-332, 280);
    text("WE APOLOGIZE FOR ANY INCONVENIENCE", width-378, 310);
    text("--WEYLAND CORPORATE", width-200, 410);
    if(mouseX>width-53 && mouseX<width && mouseY>53 && mouseY<103){
      if(mousePressed){
        email1 = false;
      }
    }
  }
  
  if(email2 == true){
    fill(0);
    rect(406,53, width-408, height-53);
    rect(width-53, 53,50,50);//close box
    fill(255,0,0);
    textSize(60);
    text("X", width-25, 97);
    textSize(14);
    text("DATE: 02-03-66", width-500, 97 );
    text("SENDER: ELAM", width-506,118);
    textSize(24);
    text("HEY LISTEN UP:", width-470, 160);
    text("LOOK I KNOW YOU ARE WORRIED ABOUT YOUR FAMILY",width-330, 220);
    text("BUT DON'T LOSE SIGHT OF THE GREATER OBJECTIVE", width-327, 250);
    text("IF YOU DO NOT FINISH THE JOB WE ARE BOTH FUCKED!", width-319, 280);
    text("CORPORATE GETS WHAT CORPORATE WANTS DO NOT FORGET", width-292, 310);
    text("THAT! THERE IS A LOT MORE AT STAKE HERE THAN YOUR", width-307, 340);
    text("WIFE AND SON. DO NOT FORGET THIS!", width-395, 370);
    text("--Elam", width-150, 410);
    
    if(mouseX>width-53 && mouseX<width && mouseY>53 && mouseY<103){
      if(mousePressed){
        email2 = false;
      }
    }
  }
    
  if(email3 == true){
    fill(0);
    rect(406,53, width-408, height-53);
    rect(width-53, 53,50,50);//close box
    fill(255,0,0);
    textSize(60);
    text("X", width-25, 97);
    textSize(14);
    text("DATE: 01-30-66", width-500, 97 );
    text("SENDER: WEYLAND ALERTS", width-474,118);
    textSize(24);
    text("TO ALL EMPLOYEES:", width-450, 160);
    text("YOU MAY HAVE HEARD OF RECENT UNREST IN",width-334, 220);
    text("ST. LOUIS. THESE RUMORS ARE TRUE. THIS IS", width-332, 250);
    text("NO CAUSE FOR CONCERN. WEYLAND SECURITY", width-332, 280);
    text("FORCES ARE SWIFTLY RESTORING ORDER. CARRY ON", width-300, 310);
    text("--WEYLAND CORPORATE", width-200, 410);
    
    if(mouseX>width-53 && mouseX<width && mouseY>53 && mouseY<103){
      if(mousePressed){
        email3 = false;
      }
    }
    
  }
  
  if(email4 == true){
    
    fill(0);
    rect(406,53, width-408, height-53);
    rect(width-53, 53,50,50);//close box
    fill(255,0,0);
    textSize(60);
    text("X", width-25, 97);
    textSize(14);
    text("DATE: 01-26-66", width-500, 97 );
    text("SENDER: SARAH", width-502,118);
    textSize(24);
    text("HI HONEY!!!", width-490, 160);
    text("HAPPY 35th BIRTHDAY FROM EVERYONE HERE IN ST. LOUIS!",width-300, 220);
    text("WE ALL MISS YOU SO MUCH! YOUR SON ISAAC IS TURNING", width-318, 250);
    text("INTO QUITE THE HEADSTRONG YOUNG MAN. THINKS HIMSELF", width-304, 280);
    text("AN ACTIVIST NOW. HAH TO BE YOUNG AGAIN. DON'T WORRY", width-312, 310);
    text("I AM GOING TO HIS SILLY RALLY TO KEEP HIM OUT OF", width-328,340);
    text("TROUBLE. I HOPE YOUR BIRTHDAY ISN'T TOO LONELY UP", width-318, 370);
    text("THERE! WE CAN'T WAIT TO SEE YOU WHEN YOU GET BACK ", width-315, 400);
    text("IN MAY! WE WILL HAVE A BIG PLATE OF ST. LOUIE ", width-345, 430);
    text("RIBS WAITING FOR YOU!",width-462,460);
    text("--FOREVER YOURS,", width-150, 520);
    text("--SARAH,", width-197, 550);
    
    if(mouseX>width-53 && mouseX<width && mouseY>53 && mouseY<103){
      if(mousePressed){
        email4 = false;
      }
    }
  
  }
 
}


