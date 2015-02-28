
int[] colors = new int[13];
boolean[] words = new boolean[2];
PFont font1, font2, font3;

void setup() {
  size(700,700);
  font1 = loadFont("Norasi-24.vlw");
  font2 = loadFont("Purisa-BoldOblique-36.vlw");
  font3 = loadFont("Courier10PitchBT-Bold-48.vlw");
}

void draw() {
  background(0);
  if(words[0] && words[1]){
    fill(255,200,0);
    textFont(font3);
    text("amirite?",350,690);
    fill(0);
  }
  else{fill(255);}
  text(mouseX, 40, 49);
  int count = 0;
  while(count<13) {
    if(colors[count]>0){colors[count]-=5;}
    if(words[0] && words[1]){colors[count]=0;}
    count++;
  }
  textAlign(CENTER);
  textFont(font2);
  fill(colors[0]);
  text("The Juice is Loose...", 350, 50);
  if(words[0]){fill(255,200,0);text("ice is", 324, 50);}
  textFont(font1);
  fill(colors[1]);
  text("Our Pro Athletes are always looking for an edge,", 350, 120);
  fill(colors[2]);
  text("so when they’ve got an idea we listen. After", 350, 150);
  fill(colors[3]);
  text("months in the lab we perfected the “Juice Monster.”", 350, 180);
  fill(colors[4]);
  text("We started with our original Monster flavor, mixed in", 350, 220);
  fill(colors[5]);
  text("a killer combo of natural juices, then powered it", 350, 250);
  fill(colors[6]);
  text("up with the full load of our energy blend and stood back.", 350, 280);
  textFont(font2);
  fill(colors[7]);
  text("It's Alive...", 350, 350);
  textFont(font1);
  fill(colors[8]);
  text("Monster Khaos, an insane Juice-Monster hybrid bubbling", 350, 420);
  fill(colors[9]);
  text("with the great Monster taste and the big bad buzz", 350, 450);
  if(words[1]){fill(255,200,0);text("great", 213, 450);}
  fill(colors[10]);
  text("you know and love.", 350, 480);
  textFont(font2);
  fill(colors[11]);
  text("50% juice - 100% Monster!", 350, 550);
  fill(colors[12]);
  text("www.monsterenergy.com", 350, 650);
  
  if(abs(mouseY-pmouseY)>0) {
  if(mouseY<100){colors[0]=255;
    if(mouseX>273 && mouseX<382){words[0]=true;}
  }
  else if(mouseY<120){colors[1]=255;}
  else if(mouseY<150){colors[2]=255;}
  else if(mouseY<180){colors[3]=255;}
  else if(mouseY<220){colors[4]=255;}
  else if(mouseY<250){colors[5]=255;}
  else if(mouseY<280){colors[6]=255;}
  else if(mouseY<400){colors[7]=255;}
  else if(mouseY<420){colors[8]=255;}
  else if(mouseY<450){colors[9]=255;
    if(mouseX>191 && mouseX<238){words[1]=true;}
  }
  else if(mouseY<480){colors[10]=255;}
  else if(mouseY<600){colors[11]=255;}
  else if(mouseY<701){colors[12]=255;}
  }
}

  

