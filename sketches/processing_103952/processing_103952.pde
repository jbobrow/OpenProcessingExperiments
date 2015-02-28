
//Copyright (c) 2013 Sivagurunathan


int q1=0, q2=0, q3=0, q4=0, q5=0, track=0;
int state=0, quote= 1, timer=0;
float jitter, angle;
PFont font;
PImage img;
Maxim maxim;
AudioPlayer player1;
AudioPlayer[] players;

void setup()
{
  size(1250, 500);
  background(255);
  maxim = new Maxim(this);
  players= new AudioPlayer[2];
  player1 = maxim.loadFile("i1.wav");
  players[0] = maxim.loadFile("g1.wav");
  players[1] = maxim.loadFile("g2.wav");
  player1.setLooping(true);
  players[0].setLooping(true);
  players[1].setLooping(true);
  img = loadImage("forever.jpg");
  
  noStroke();
  fill(255);
  smooth();
}
void draw()
{
  switch(state)
  {
  case 0:
    background(50);
    player1.play();
    fill(255);
    font = loadFont("Chiller-Regular-48.vlw");
    textFont(font, 20);
    textAlign(CENTER);
    text("Greetings from Sivagurunathan", width/2, height/2+100);

    rectMode(CENTER);
    // during even-numbered seconds (0, 2, 4, 6...)
    if (second() % 2 == 0) {  
      jitter = random(-0.1, 0.1);
    }
    angle = angle + jitter;
    float c = cos(angle);
    translate(width/2, height/2);
    rotate(c);
    fill(255, 0, 0);
    rect(0, 0, 120, 120);
    enter();


    break;
  case 1:

    player1.stop();
    players[track].play();
    background(255);    
    draw_tree();
    draw_hearts();
    draw_bird();
    fill(0, 100, 255);
    font = loadFont("script1.vlw");
    textFont(font, 30);
    //text("Replay", width/2+500, height-30);
    text("Change Track", 100, height-30);

    timer++;
    if (timer == 255)
    {
      if (quote!=5)
        quote++;
      timer=0;
    }
    if (quote==1)
    {
      font = loadFont("broad1.vlw");
      textAlign(LEFT);
      textFont(font, 30);
      q1=q1+2;
      fill(230, q1);
      text("I won't say I ll never make you cry", width/2, 100);
      fill(0, q1);
      text("I won't say I ll never make you cry", width/2+1.5, 100+1.5);

      fill(230, q1);
      text("but I ll make you smile before", width/2+100, 200);
      fill(0, q1);
      text("but I ll make you smile before", width/2+100+1.5, 200+1.5);

      fill(230, q1);
      text("your tears get dry....", width/2, 300);
      fill(0, q1);
      text("your tears get dry....", width/2+1.5, 300+1.5);
    }
    else if (quote==2)
    {
      font = loadFont("broad1.vlw");
      textAlign(LEFT);
      textFont(font, 30);
      q2=q2+2;

      fill(230, q2);
      text("I won't say i ll never tell a lie", width/2, 100);
      fill(0, q2);
      text("I won't say i ll never tell a lie", width/2+1.5, 100+1.5);

      fill(230, q2);
      text("But if I do", width/2+100, 200);
      fill(0, q2);
      text("But if I do", width/2+100+1.5, 200+1.5);

      fill(230, q2);
      text("there will be some reason....", width/2, 300);
      fill(0, q2);
      text("there will be some reason....", width/2+1.5, 300+1.5);

      fill(230, q2);
      text("some day I ll tell you why", width/2+100, 400);
      fill(0, q2);
      text("some day I ll tell you why", width/2+100+1.5, 400+1.5);
    }
    else if (quote==3)
    {
      font = loadFont("broad1.vlw");
      textAlign(LEFT);
      textFont(font, 30);
      q3=q3+2;

      fill(230, q3);
      text("I don't say we ll never have a fight", width/2, 100);
      fill(0, q3);
      text("I don't say we ll never have a fight", width/2+1.5, 100+1.5);

      fill(230, q3);
      text("but I ll say I am really sorry", width/2+100, 200);
      fill(0, q3);
      text("but I ll say I am really sorry", width/2+100+1.5, 200+1.5);

      fill(230, q3);
      text("when I realise you are right", width/2, 300);
      fill(0, q3);
      text("when I realise you are right", width/2+1.5, 300+1.5);
    }
    else if (quote==4)
    {
      font = loadFont("broad1.vlw");
      textAlign(LEFT);
      textFont(font, 30);
      q4=q4+2;

      fill(230, q4);
      text("I don't say life together will be easy and bright", width/2, 100);
      fill(0, q4);
      text("I don't say life together will be easy and bright", width/2+1.5, 100+1.5);

      fill(230, q4);
      text("but when things get tough....", width/2+100, 200);
      fill(0, q4);
      text("but when things get tough....", width/2+100+1.5, 200+1.5);

      fill(230, q4);
      text("I ll hold you tight..!", width/2, 300);
      fill(0, q4);
      text("I ll hold you tight..!", width/2+1.5, 300+1.5);
    }
    else if (quote==5)
    {
      q5=q5+2;
      image(img, width/2, 70);
      font = loadFont("broad1.vlw");
      textAlign(LEFT);
      textFont(font, 30);
      fill(230,q5);
      text("LOVE YOU FOREVER", width/2+180, 300);
      fill(255,0,0,q5);
      text("LOVE YOU FOREVER", width/2+180+1.5, 300+1.5);
      draw_menu();
    }
    break;
  }
  if (mouseX > (width/2)+490 && mouseX < (width/2)+570 && mouseY > (height-60) && mouseY < (height-20) && (quote==5))
  {
    fill(255, 0, 0);
    font = loadFont("script1.vlw");
    textFont(font, 30);
    text("Replay", width/2+500, height-30);
  }

  else if (mouseX > 90 && mouseX < 250 && mouseY > (height-60) && mouseY < (height-20))
  {
    fill(255, 0, 0);
    font = loadFont("script1.vlw");
    textFont(font, 30);
    text("Change Track", 100, height-30);
  }
}
void enter()
{
  fill(255);
  font = loadFont("Harrington.vlw");
  textFont(font, 32);
  text("Play", -5, 5);
}
void draw_menu()
{
  noStroke();
  fill(0, 100, 255);
  font = loadFont("script1.vlw");
  textFont(font, 30);
  //text("Music", width/2+300, height-30);
  text("Replay", width/2+500, height-30);
}

void mouseClicked()
{
  if (((width/2-80) < mouseX) & (mouseX < (width/2+80)) & ((height/2-80) < mouseY) & (mouseY<(height/2+80)))
  {
    state=1;
    timer=0;
    q1=0;
    q2=0;
    q3=0;
    q4=0;
    q5=0;
  }
  else if ((((width/2)+490) < mouseX) & (mouseX < ((width/2)+570)) & ((height-60) < mouseY) & (mouseY<(height-20))&&(quote==5))
  {
    state=0;
    quote=1;
    players[track].stop();
  }
  else if (mouseX > 90 && mouseX < 300 && mouseY > (height-60) && mouseY < (height-20))
  {
    players[track].stop();
    if (track==0)
      track=1;
    else
      track=0;
  }
}

void draw_tree()
{
  stroke(50, 100, 5);
  strokeWeight(8); 
  //base branch
  line(0, height, 100, height-130);
  strokeWeight(6); 
  //branch1
  line(100, height-130, 120, height-250);

  //branch2
  line(100, height-130, 300, height-230);
  strokeWeight(4);
  //branch1.1
  line(120, height-250, 100, height-300);
  //branch1.2
  line(120, height-250, 180, height-350);
  //branch2.1
  line(300, height-230, 400, height-300);
  //branch2.2
  line(300, height-230, 400, height-200);  

  strokeWeight(2);
  //branch1.1.1
  line(100, height-300, 50, height-370);
  //branch1.1.2
  line(100, height-300, 100, height-400);

  //branch1.2.1
  line(180, height-350, 280, height-400);
  //branch1.2.1
  line(180, height-350, 210, height-430);  

  //branch2.1.1
  line(400, height-300, 490, height-400);
  //branch2.1.2
  line(400, height-300, 500, height-300);

  //branch2.2.1
  line(400, height-200, 480, height-250);
  //branch2.2.2
  line(400, height-200, 450, height-150);

  strokeWeight(1);
  //branch1.1.1.1
  line(50, height-370, 10, height-390);
  //branch1.1.1.2
  line(50, height-370, 40, height-400);

  //branch1.1.2.1
  line(100, height-400, 85, height-420);
  //branch1.1.2.2
  line(100, height-400, 105, height-440);

  //branch1.2.1.1
  line(280, height-400, 290, height-430);
  //branch1.2.1.2
  line(280, height-400, 310, height-390);

  //branch1.2.1.1
  line(210, height-430, 200, height-450);  
  //branch1.2.1.1
  line(210, height-430, 220, height-470);  

  //branch2.1.1.1
  line(490, height-400, 485, height-420);
  //branch2.1.1.1
  line(490, height-400, 510, height-440);

  //branch2.1.2.1
  line(500, height-300, 550, height-350);
  //branch2.1.2.2
  line(500, height-300, 540, height-280);
}
void draw_hearts()
{
  fill(255, 0, 0);  
  noStroke();
  //branch1.1.1.1
  ellipse(10, height-390, 7, 7);
  ellipse(15, height-390, 7, 7);

  //branch1.1.1.2
  ellipse(40, height-405, 7, 7);
  ellipse(35, height-400, 7, 7);
  ellipse(45, height-395, 7, 7);

  //branch1.1.2.1
  ellipse(85, height-420, 7, 7);
  ellipse(85, height-410, 7, 7);
  ellipse(90, height-420, 7, 7);

  //branch1.1.2.2
  ellipse(105, height-445, 7, 7);
  ellipse(110, height-440, 7, 7);

  //branch1.2.1.1
  ellipse(285, height-420, 7, 7);

  //branch1.2.1.2
  ellipse(310, height-390, 10, 10);
  ellipse(305, height-398, 7, 7);

  //branch1.2.1.1
  ellipse(203, height-450, 7, 7);
  ellipse(202, height-440, 7, 7);
  ellipse(195, height-455, 7, 7);

  //branch1.2.1.1
  ellipse(220, height-470, 7, 7);
  ellipse(215, height-460, 7, 7);
  ellipse(225, height-465, 7, 7);

  //branch2.1.1.1
  ellipse(485, height-420, 7, 7);
  ellipse(480, height-410, 7, 7);
  ellipse(490, height-415, 7, 7);

  //branch2.1.1.1
  ellipse(510, height-440, 7, 7);
  ellipse(505, height-435, 7, 7);
  ellipse(515, height-430, 7, 7);  

  //branch2.1.2.1
  ellipse(550, height-355, 7, 7);
  ellipse(545, height-355, 7, 7);
  ellipse(555, height-345, 7, 7);  

  //branch2.1.2.2
  ellipse(540, height-280, 7, 7);
  ellipse(535, height-280, 7, 7);
  ellipse(545, height-285, 7, 7);

  //branch2.2.1
  ellipse(480, height-250, 7, 7);
  ellipse(470, height-247, 7, 7);
  ellipse(475, height-245, 7, 7);

  //branch2.2.2
  ellipse(450, height-143, 7, 7);
  ellipse(455, height-150, 7, 7);
  ellipse(445, height-150, 7, 7);
}

void draw_bird()
{
  if (millis()!=0)
  {
    noStroke();
    fill(0);
    triangle(340, 230, 380, 150, 370, 140);
    triangle(150, 290, 135, 200, 145, 190);
  }
  else
  { 
    noStroke();
    fill(0);
    triangle(340, 230, 385, 150, 375, 140);
    triangle(150, 290, 130, 200, 140, 190);
  }
  noStroke();
  strokeWeight(1);
  fill(245, 150, 50);
  ellipseMode(CENTER);
  //bird-head1
  ellipse(210, 260, 40, 40);
  //bird-head2
  ellipse(270, 200, 40, 40);
  ellipseMode(CORNERS);
  ellipse(270, 190, 350, 240);
  ellipse(140, 250, 220, 300);

  //bird-eye1
  stroke(255);
  strokeWeight(2);
  fill(0);
  ellipseMode(CENTER);
  ellipse(216, 256, 15, 15);
  fill(255);
  ellipse(218, 256, 5, 5);


  //bird-eye2
  fill(0);
  ellipseMode(CENTER);
  ellipse(265, 205, 15, 15);
  fill(255);
  ellipse(263, 207, 5, 5);

  if (second()%2 == 0)
  {
    //bird-feather1
    noStroke();
    fill(100, 23, 10);
    ellipseMode(CENTER);
    ellipse(190, 275, 35, 35);
    triangle(185, 257, 190, 293, 145, 305);

    //bird-feather1
    ellipseMode(CENTER);
    ellipse(300, 215, 35, 35);
    triangle(295, 198, 305, 233, 350, 180);
  }
  else
  {
    //bird-feather1
    noStroke();
    fill(100, 23, 10);
    ellipseMode(CENTER);
    ellipse(190, 275, 35, 35);
    triangle(185, 257, 190, 293, 135, 290);

    //bird-feather1
    ellipseMode(CENTER);
    ellipse(300, 215, 35, 35);
    triangle(295, 198, 305, 233, 350, 195);
  }
  if (second()%2 == 0)
  {
    //bird-beak1
    noStroke();
    fill(0);
    triangle(226, 250, 228, 260, 240, 250);
    triangle(228, 260, 226, 270, 240, 270);

    //bird-beak2
    triangle(245, 225, 250, 205, 255, 215);
    triangle(255, 215, 263, 218, 245, 225);
  }
  else
  {
    //bird-beak1
    noStroke();
    fill(0);
    triangle(226, 250, 228, 260, 240, 260);
    triangle(228, 260, 226, 270, 240, 260);

    //bird-beak2
    triangle(240, 215, 250, 205, 255, 215);
    triangle(255, 215, 263, 218, 255, 230);
  }
  //bird-leg1
  stroke(0);
  line(183, 300, 180, 310); 
  line(180, 310, 200, 317); 
  line(190, 300, 190, 305); 
  line(190, 305, 215, 310); 
  //bird-leg2
  line(312, 240, 320, 245); 
  line(320, 245, 310, 260); 
  line(325, 238, 330, 240); 
  line(325, 250, 330, 240);
}
