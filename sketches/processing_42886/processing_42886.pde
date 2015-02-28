



void draw() {



  if (detailActive == false) {
   image(fakeUI, 0, -40);
   image(img, 0, 0);
     

    //for (int n = 0; n < csv[30][0]; n++) {
    //
    //    if (csv[n][7].equals("0"))
    //      countPresenceDetail++;
    //  }
    //
    //  println(csv.length + "/" + countPresenceDetail);

    // println("mouseX:" +mouseX);
    //println("mouseY:" +mouseY);


    if (dist(mouseX, mouseY, 54, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(111, 141, 153);
      rect(10, 620, 320, 80);
      fill(10);
      text("Brainstorm a list of as many of Venice’s nomadic worker as you can. Make a combined list by the whole class. Later, choose three categories from the combined list and brainstorm their possible needs. Using images where possible, present these needs to the class.", 20, 630, 300, 150);
    }

    if (dist(mouseX, mouseY, 187, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(141, 185, 206);
      rect(40, 620, 320, 60);
      fill(10);
      text("Steffen Klaue teaches Processing, a programming language for designers. Those with good Processing skills will be set a more advanced project.", 50, 630, 300, 150);
    }

    if (dist(mouseX, mouseY, 315, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(193, 224, 211);
      rect(160, 620, 320, 80);
      fill(10);
      text("Choose some of the categories listed in the Brainstorming phase, or invent some new ones Brainstorm as many concepts as you can for relevant mobile-accessed services. At the end of this phase, divide into design teams.", 170, 630, 300, 150);
    }
    if (dist(mouseX, mouseY, 431, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(189, 203, 152);
      rect(300, 620, 270, 50);
      fill(10);
      text("Using text and images, define precisely what and who your project is for.", 310, 630, 250, 50);
    }
    if (dist(mouseX, mouseY, 567, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(142, 160, 95);
      rect(500, 620, 140, 50);
      fill(10);
      text("Design your project.", 510, 630, 300, 150);
    }
    if (dist(mouseX, mouseY, 679, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(155, 112, 149);
      rect(615, 620, 170, 50);
      fill(10);
      text("Design your project in detail.", 625, 630, 300, 150);
    }
    if (dist(mouseX, mouseY, 818, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(203, 175, 179);
      rect(660, 620, 320, 60);
      fill(10);
      text("Visiting faculty help you program your service and install a working prototype on a mobile phone. The workshop ends with the project’s final crit.", 670, 630, 300, 150);
    }

    if (dist(mouseX, mouseY, 947, 610)<50) {
      textSize(11);
      textLeading(12);
      fill(239, 221, 196);
      rect(800, 620, 220, 60);
      fill(10);
      text("Document the final design and present it on the Lab’s final-project website as preparation for the exam.", 810, 630, 200, 150);
    }

    if (c != 0)
      cursor(HAND );

    c = fakeUI.get(mouseX, mouseY+40);

    if (c != 0) {
      //println(c);
      cursor(HAND);


      if (c == -16777216) {
        if (mousePressed) {
          i=0;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );

          println("thursday 29");
        }
      }

      if (c ==-16579837) {
        if (mousePressed) {

          i=1;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 30");
        }
      }


      if (c ==-16448251) {  
        if (mousePressed) {

          i=2;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 3");
        }
      }

      if (c ==-16250872) {  
        if (mousePressed) {
          i=3;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 4");
        }
      }

      if (c ==-16119286) {  
        if (mousePressed) {
          i=4;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("wendsday 5");
        }
      }

      if (c ==-15921907) {  
        if (mousePressed) {
          i=5;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 6");
        }
      }


      if (c ==-15790321) {  
        if (mousePressed) {
          i=6;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 7");
        }
      }


      if (c ==-15592942) {  
        if (mousePressed) {
          i=7;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 10");
        }
      }

      if (c ==-15461356) {  
        if (mousePressed) {
          i=8;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 11");
        }
      }

      if (c ==-15263977) {  
        if (mousePressed) {
          i=9;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("wendsday 12");
        }
      }

      if (c ==-15066598) {  
        if (mousePressed) {
          i=10;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 13");
        }
      }

      if (c ==-14935012) {  
        if (mousePressed) {
          i=11;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 14");
        }
      }

      if (c ==-14737633) {  
        if (mousePressed) {
          i=12;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 17");
        }
      }

      if (c ==-14606047) {  
        if (mousePressed) {
          i=13;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 18");
        }
      }

      if (c ==-14408668) {  
        if (mousePressed) {
          i=14;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 20");
        }
      }

      if (c ==-14277082) {  
        if (mousePressed) {
          i=15;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 21");
        }
      }

      if (c ==-14079703) {  
        if (mousePressed) {
          i=16;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("sunday 23");
        }
      }

      if (c ==-13948117) {  
        if (mousePressed) {
          i=17;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 24");
        }
      }

      if (c ==-13750738) {  
        if (mousePressed) {
          i=18;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 25");
        }
      }

      if (c ==-13619152) {  
        if (mousePressed) {
          i=19;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 27");
        }
      }

      if (c ==-13421773) {  
        if (mousePressed) {
          i=20;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 28");
        }
      }

      if (c ==-13224394) {  
        if (mousePressed) {
          i=21;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 31");
        }
      }
      if (c ==-13092808) {  
        if (mousePressed) {
          i=22;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 1");
        }
      }
      if (c ==-12895429) {  
        if (mousePressed) {
          i=23;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 3");
        }
      }
      if (c ==-12763843) {  
        if (mousePressed) {
          i=24;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 4");
        }
      }

      if (c ==-12566464) {  
        if (mousePressed) {
          i=25;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 7");
        }
      }

      if (c ==-12434878) {  
        if (mousePressed) {
          i=26;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 8");
        }
      }

      if (c ==-12237499) {  
        if (mousePressed) { 
          i=27;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 10");
        }
      }

      if (c ==-12105913) {  
        if (mousePressed) {
          i=28;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 11");
        }
      }

      if (c ==-11908534) {  
        if (mousePressed) {
          i=29;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 14");
        }
      }

      if (c ==-11711155) {  
        if (mousePressed) {
          i=30;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 15");
        }
      }

      if (c ==-11579569) {  
        if (mousePressed) {
          i=31;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 17");
        }
      }

      if (c ==-11382190) {  
        if (mousePressed) {
          i=32;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 18");
        }
      }
      if (c ==-11250604) {  
        if (mousePressed) {
          i=33;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 21");
        }
      }

      if (c ==-11053225) {  
        if (mousePressed) {
          i=34;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 22");
        }
      }

      if (c ==-10921639) {  
        if (mousePressed) {
          i=35;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("wendsday 23");
        }
      }

      if (c ==-10724260) {  
        if (mousePressed) {
          i=36;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 24");
        }
      }
      if (c ==-10592674) {  
        if (mousePressed) {
          i=37;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 25");
        }
      }
      if (c ==-10395295) {  
        if (mousePressed) {
          i=38;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 28");
        }
      }

      if (c ==-10263709) {  
        if (mousePressed) {
          i=39;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 29");
        }
      }

      if (c ==-10066330) {  
        if (mousePressed) {
          i=40;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("wendsday 30");
        }
      }
      if (c ==-9868951) {  
        if (mousePressed) {
          i=41;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 1");
        }
      }
      if (c ==-9737365) {  
        if (mousePressed) {
          i=42;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 2");
        }
      }

      if (c ==-9539986) {  
        if (mousePressed) {
          i=43;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 5");
        }
      }
      if (c ==-9408400) {  
        if (mousePressed) {
          i=44;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 6");
        }
      }
      if (c ==-9211021) {  
        if (mousePressed) {
          i=45;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("thursday 8");
        }
      }
      if (c ==-9079435) {  
        if (mousePressed) {
          i=46;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("friday 9");
        }
      }
      if (c ==-8882056) {  
        if (mousePressed) {
          i=47;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("monday 12");
        }
      }
      if (c ==-8750470) {  
        if (mousePressed) {
          i=48;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );
          println("tuesday 13");
        }
      }
      if (c ==-8553091) {  
        if (mousePressed) {
          i=49;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );

          println("friday 16");
        }
      }
      if (mousePressed)
      {
        println(c);
      }
      if (c ==-8355712) {  
        if (mousePressed) {
          i=50;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );

          println("friday 16");
        }
      }
      if (c ==-8224126) {  
        if (mousePressed) {
          i=51;
          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );

          println("friday 16");
        }
      }

      if (c ==-8026747) {  
        if (mousePressed) {
          i=52;

          //day, week, month, time, gillinan, phil, steffen, presence, topic, phase
          drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9] );

          println("friday 16");
        }
      }
    }
  }
}


void mousePressed() {
  if (detailActive == true) {
    println("false");
    if (mousePressed && dist(mouseX, mouseY, xRect+88, yRect+88)> 120) {
      //println(dist(mouseX,mouseY, xRect+88, yRect+88));
      detailActive = false;
    }
    if (mousePressed && dist(mouseX, mouseY, xRect+30, yRect+142)< 22) {
      if (csv[i][7].equals("0"))
        csv[i][7] = "1";
      else
        csv[i][7] = "0";


      drawDetail (csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9]);
    }

    if (mousePressed && dist(mouseX, mouseY, xRect+190+7, yRect+yRect/2)< 15) {
      if (i < 52) {
        i = i + 1;
        drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9]);
        // println("ciao");
        // detailActiveArrow=false;
      }
    }

    if (mousePressed && dist(mouseX, mouseY, xRect-30+7, yRect+ yRect/2 )< 15) {
      if (i > 0) {
        i = i - 1;
        drawDetail(csv[i][0], csv[i][1], csv[i][2], csv[i][3], csv[i][4], csv[i][5], csv[i][6], csv[i][7], csv[i][8], csv[i][9]);
      }
      // detailActiveArrow=false;
    }
  }
}


