
int ai_number = -1;   //電腦下的位置
int[] a = new int[225];
int first;       //第一手判斷(重新需歸零)
int[] many = new int[50];  //複數候選
int ma;

void ai() {


  for (int i = 0; i < 225; i++) {
    if (!p[i].player && !p[i].ai) {    //ai勝利點
      p[i].ai = true;
      losecheck();
      if (lose) {
        ai_number = i;
        lose = false;
        println("a");
      }
      p[i].ai = false;
    }
  }

  //-----------------------------------------------

  if (ai_number  == -1) {
    for (int i = 0; i < 225; i++) {    //阻擋玩家勝利點
      if (!p[i].player && !p[i].ai) {
        p[i].player = true;
        wincheck();
        if (win) {
          ai_number = i;
          win = false;
          println("b");
        }
        p[i].player = false;
      }
    }
  }

  //---------------------------------------------------

  if (ai_number == -1) {
    for (int i = 0; i < 225; i++) {      //ai活四點
      if (!p[i].player && !p[i].ai) {
        p[i].ai = true;
        ai_live4check();
        if (ai_live4) {
          many[ma] = i;
          ma++;
          ai_number = i;
          ai_live4 = false;
          println("c");
        }
        p[i].ai = false;
      }
    }

    if (ma > 1) {
      ai_number = many[int(random(ma-0.01))];
    }
    ma = 0;
  }

  //-------------------------------------------------------

  if (ai_number == -1) {
    for (int i = 0; i < 225; i++) {      //阻擋玩家活四點
      if (!p[i].player && !p[i].ai) {
        p[i].player = true;
        player_live4check();
        if (player_live4) {
          many[ma] = i;
          ma++;
          ai_number = i;
          player_live4 = false;
          println("d");
        }
        p[i].player = false;
      }
    }
    if (ma > 1) {
      ai_number = many[int(random(ma-0.01))];
    }
    ma = 0;
  }

  //-------------------------------------------------------

  if (ai_number == -1) {
    for (int i = 0; i < 225; i++) {      //ai雙活三
      if (!p[i].player && !p[i].ai) {
        p[i].ai = true;
        ai_double3check(i);
        if (ai_double3) {
//          if (d3many < 8) {
            ai_number = i;
  //        }
          ai_double3 = false;
          println("e");
        }
        p[i].ai = false;
      }
    }
  }

  //----------------------------------------------------

  if (ai_number == -1) {
    for (int i = 0; i < 225; i++) {      //阻擋玩家雙活三
      if (!p[i].player && !p[i].ai) {
        p[i].player = true;
        player_double3check(i);
        if (player_double3) {
//          if (d3many < 8) {
            ai_number = i;
  //        }
          player_double3 = false;
          println("f");
        }
        p[i].player = false;
      }
    }
  }
  //-------------------------------------------------------

  first++;

  if (first == 1) {
    while ( (ai_number < 0 || ai_number >= 225) || ai_number == last_number || abs(ai_number%15-last_number%15) > 5) {
      ai_number = last_number+int(random(-1.9, 1.9))+15*int(random(-1.9, 1.9));
    }
    println("g");
  }
  else if (ai_number == -1) {      //點數判斷法
    point_check();
    println("h");
  }
 //-------------------------------------------------------
  
  if (ai_number == -1) {    
      ai_number = int(random(224.9));
    while (p[ai_number].ai || p[ai_number].player)
      ai_number = int(random(224.9));
  }
}


