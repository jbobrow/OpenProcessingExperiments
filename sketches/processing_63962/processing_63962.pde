
//Ayako Matsuda
//DESMA 28 Interactivity Project 2

PImage bed;
PImage boy1;
PImage boy2;
PImage boy3;
PImage boy4;
PImage boy5;
PImage closeup;
PImage boycraw1;
PImage boycraw2;
PImage crawl1;
PImage crawl2;
PImage castle;
PImage catking;
PImage branchroad;
PImage forestpath1;
PImage vines;
PImage outsidecave;
PImage handcursor;
PImage cheddar;
PImage ravioli;
PImage table;
PImage cake;
PImage steak;
PImage milk;
PImage mice;
PImage foodtrolley;
PImage sidetable;
PImage magicaldoor;
PImage woodentable;
PImage chalk;
PImage darkforest;
PImage darkhallway;
PImage lady;
PFont font24;
PFont font36;

boolean transition = true;

int page;

void setup()
{
  size (800, 600);
  smooth();

  page = 1;

  bed = loadImage ("bed.png");
  boy1 = loadImage ("boysitting.png");
  boy2 = loadImage ("boyback.png");
  boy3 = loadImage ("boytoright.png");
  boy4 = loadImage ("boytoleft.png");
  boy5 = loadImage ("boyfront.png");
  closeup = loadImage ("closeup.png");
  boycraw1 = loadImage ("boycrawside1.png");
  boycraw2 = loadImage ("boycrawside2.png");
  branchroad = loadImage ("thumb5.jpeg");
  crawl1 = loadImage ("boycrawling1.png");
  crawl2= loadImage ("boycrawling2.png");
  castle = loadImage ("castle.jpg");
  forestpath1 = loadImage ("forest-path.jpg");
  vines = loadImage ("142.jpg");
  outsidecave = loadImage ("outside cave 2.jpg");
  handcursor = loadImage ("hand.png");
  catking = loadImage ("Image680_t.jpg");
  cheddar = loadImage ("cheddar.png");
  ravioli = loadImage ("ravioli.png");
  table = loadImage("table.png");
  cake = loadImage ("shortcake.png");
  steak = loadImage ("Italian-Style_Marinated_Steak.png");
  milk = loadImage ("milk.png");
  mice = loadImage ("mice.png");
  foodtrolley = loadImage ("foodtrolley.png");
  sidetable = loadImage ("sidetable.png");
  magicaldoor = loadImage ("magic door.jpg");
  woodentable = loadImage ("woodsidetable.png");
  chalk = loadImage ("chalk.png");
  darkforest = loadImage ("darkforest.jpg");
  darkhallway = loadImage ("darkhallway.png");
  lady = loadImage ("lady.png");
  font24 = loadFont ("Serif-24.vlw");
  font36 = loadFont("Serif-36.vlw");

  imageMode(CENTER);

  pg14_prev_pressed = false;
  pg14_prev_x = 0;
  pg14_prev_y = 0;
}

float pg2_angle = 0;
float pg2_angle2 = 0;
float pg2_colorred = 175;
float pg2_colorgreen = 238;
float pg2_colorblue = 255;
float pg22_angle = 0;
float pg22_angle2 = 0;
float pg22_colorred = 175;
float pg22_colorgreen = 238;
float pg22_colorblue = 255;
int pg3_counter = 0;
int pg4_counter = 0;
int pg5_counter = 0;
int pg10_state = 0;
boolean pg14_prev_pressed;
int pg14_prev_x;
int pg14_prev_y;
boolean pg14_tl=false;
boolean pg14_tm=false;
boolean pg14_tr=false;
boolean pg14_ml=false;
boolean pg14_mr=false;
boolean pg14_bl=false;
boolean pg14_bm=false;
boolean pg14_br=false;
int pg21_counter = 0;
int pg22_counter = 0;

void draw()
{
  if (page == 1) 
  {
    background (227, 216, 192);
    fill(175, 238, 255);

    quad (0, 0, width, 0, width, 190, 0, 465);
    image (bed, 600, height/2);
    stroke (0);
    quad (180, 260, 280, 225, 280, 368, 180, 403);
    image (boy1, 500, 250, 150, 230);
    fill(0);
    textFont (font36);
    String pg1_text = "One night, a boy finds a door drawn on his wall.";
    text (pg1_text, 50, 500, 500, 100);
    if ((mouseX< 280) && (mouseX>180) && 
      (mouseY< -0.35*mouseX + 466) && (mouseY> -0.35*mouseX+ 323 ) && (mousePressed == true))
    {
      page = 2;
    }
  }
  else if (page == 2)
  {
    background (227, 216, 192);
    stroke(0, 12);
    fill (175, 238, 255);
    rect (0, 0, width, 450);


    //door open 
    float xradius = 300;
    float yradius = 30;
    float zradius = 30;

    rect (300, 210, 300, 240);


    if ((mouseX<600) && (mouseX>300) && (mouseY<450) && (mouseY>210) && 
      (mousePressed == true))
    {
      pg2_angle = map(mouseX, 200, 600, 0, PI/2);
      pg2_angle = constrain (pg2_angle, 0, PI/2);
      pg2_angle2 = map (mouseX, 220, 600, 0, PI/2);
      pg2_angle2 = constrain (pg2_angle2, 0, PI/2);
      pg2_colorred = map (mouseX, 200, 600, 175, 37);
      pg2_colorred = constrain (pg2_colorred, 37, 175);
      pg2_colorgreen = map (mouseX, 200, 600, 238, 42);
      pg2_colorgreen = constrain(pg2_colorgreen, 42, 238);
      pg2_colorblue = map (mouseX, 200, 600, 255, 44);
      pg2_colorblue = constrain(pg2_colorblue, 44, 255);

      fill(200);
      quad(600 - 15*sin(pg2_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg2_angle), 450);
    }

    if ((mouseX>595)&&(mouseX<650)&&(mousePressed)&& (transition))
    {
      page = 3;
      transition = false;
      pg3_counter=0;
    }

    fill (0);
    rect (300, 210, 300, 240);
    fill(pg2_colorred, pg2_colorgreen, pg2_colorblue);
    stroke (0);

    quad (600 - xradius*cos(pg2_angle), 210 + yradius*sin(pg2_angle), 
    600 - 15*sin(pg2_angle), 210, 
    600- 15*sin(pg2_angle), 450, 
    600 - xradius*cos(pg2_angle), 450 - yradius*sin(pg2_angle) );

    fill(200);
    quad(600 - 15*sin(pg2_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg2_angle), 450);

    noCursor();
    image (handcursor, mouseX, mouseY, 300, 300);
  }
  else if (page == 3)
  {
    cursor();
    pg3_counter++;

    //boy walking through tunnel
    background (150);
    fill(0);
    rect (0, 0, width, height/3); 
    rect (0, height*2/3, width, height/3);

    if (pg3_counter / 40 % 2 == 0)
    {
      image (boycraw1, width/2, 326, 320, 190);
    }
    else
    {
      image (boycraw2, width/2, 320, 310, 190);
    }


    if (pg3_counter >= 250)
    {
      page = 4;
      pg4_counter = 0;
    }
  }

  else if (page == 4)
  {
    pg4_counter++;

    //going outside of the tunnel
    background (0);
    image (outsidecave, width/2, height/2);

    if (pg4_counter / 40 % 2 == 0)
    {
      image (crawl1, width/2, 450, 320, 360);
    }
    else
    {
      image (crawl2, width/2, 450, 200, 300);
    }

    if (pg4_counter>= 250)
    {
      page = 5;
      pg5_counter=0;
    }
  }
  else if (page == 5)
  {
    pg5_counter++;
    //boy's close up
    background (0);
    image (vines, width/2, height/2);
    image (closeup, width/2, 343, 300, 420);
    if (pg5_counter>=100)
    {
      page = 6;
    }
  }
  else if (page == 6)
  {
    //environment
    image (forestpath1, width/2, height/2, width, height);
    image (boy2, 525, 400, 120, 280);
    fill(0);
    rect (40, 90, 400, 150);
    fill(255);
    String pg6_text = "After crawling through the tunnel, he finds himself in the middle of the forest.";
    text (pg6_text, 50, 100, 400, 300);
    if ((mousePressed)&&(transition))
    {
      page = 7;
      transition = false;
    }
  }
  else if (page == 7)
  {
    //start walking
    image (branchroad, width/2, height/2, width, height);
    if (mouseX < width/2)
    {
      image(boy3, 520, 500, 150, 300);
    }
    else
    {
      image (boy4, 520, 500, 150, 300);
    }
    if ((mousePressed)&&(transition))
    {
      if (mouseX < width/2)
      {
        page = 19;
        transition = false;
      }
      else
      {
        page = 8;
        transition = false;
      }
    }
  }
  else if (page == 8)
  {
    //castle 
    image (castle, width/2, height/2, width, height);
    image (boy2, 550, 500, 200, 450);
    if ((mousePressed)&&(transition))
    {
      page = 9;
      transition = false;
    }
  }

  else if (page == 9)
  {
    //cat
    background (0);
    image (catking, width/2, height/2, 240, 320);
    fill(255);
    textFont (font36);
    String pg9_text = "Are you looking for the exit?"; 
    text (pg9_text, 50, 100);
    String pg9_text2 = "I can show you if you can bring me my favorite dish.";
    text (pg9_text2, 20, 500);

    if ((mousePressed)&&(transition))
    {
      page = 10;
      transition = false;
    }
  }
  else if (page == 10)
  {
    background (185, 140, 47);
    fill (160, 32, 32);
    quad (0, height/2, width, 450, width, height, 0, height);
    image (sidetable, 600, 400, 200, 250);
    image (table, 300, 400, 600, 450);
    image (boy3, 700, 400, 300, 500);
    image (mice, 200, 500, 350, 180);
    image (foodtrolley, 600, 550, 350, 350);

    fill (0);
    textFont (font36);
    String pg10_text = "Pick a dish for the king!"; 
    text (pg10_text, 100, 100);


    if (pg10_state == 0)
    {
      image (cake, 450, 320, 200, 150 );
      image (steak, 275, 350, 150, 100);
      image (ravioli, 125, height/2, 150, 75);
      image (milk, 600, 260, 100, 100);
      image (cheddar, width/2, 550, 100, 100);
    }
    else if (pg10_state == 1) //ravioli
    {
      image (cake, 450, 320, 200, 150 );
      image (steak, 275, 350, 150, 100);
      image (ravioli, 600, 430, 150, 75);
      image (milk, 600, 260, 100, 100);
      image (cheddar, width/2, 550, 100, 100);
    }
    else if (pg10_state == 2) //steak
    {
      image (cake, 450, 320, 200, 150 );
      image (steak, 600, 440, 150, 100);
      image (ravioli, 125, height/2, 150, 75);
      image (milk, 600, 260, 100, 100);
      image (cheddar, width/2, 550, 100, 100);
    }
    else if (pg10_state == 3) //cake
    {
      image (cake, 600, 400, 200, 150 );
      image (steak, 275, 350, 150, 100);
      image (ravioli, 125, height/2, 150, 75);
      image (milk, 600, 260, 100, 100);
      image (cheddar, width/2, 550, 100, 100);
    }
    else if (pg10_state == 4) //cheeze
    {
      image (cake, 450, 320, 200, 150 );
      image (steak, 275, 350, 150, 100);
      image (ravioli, 125, height/2, 150, 75);
      image (milk, 600, 260, 100, 100);
      image (cheddar, 600, 430, 100, 100);
    }
    else if (pg10_state == 5) //milk
    {
      image (cake, 450, 320, 200, 150 );
      image (steak, 275, 350, 150, 100);
      image (ravioli, 125, height/2, 150, 75);
      image (milk, 600, 410, 100, 100);
      image (cheddar, width/2, 550, 100, 100);
    }
    // king's game
    if ((mousePressed)&&(transition))
    {

      //choice 1: ravioli
      if (50 <= mouseX && mouseX <= 200 &&
        height/2-37 <= mouseY && mouseY <= height/2-37+75)
      {
        pg10_state = 1;
      }
      //choice2: steak
      else if (200 <= mouseX && mouseX <= 350 &&
        300 <= mouseY && mouseY <= 400)
      {
        pg10_state = 2;
      }
      //choice3: cake
      else if (350 <= mouseX && mouseX <= 550 &&
        275 <= mouseY && mouseY <= 395)
      {
        pg10_state = 3;
      }
      //choice4: chedder
      else if (width/2-50 <= mouseX && mouseX <= width/2+50 &&
        500 <= mouseY && mouseY <= 600)
      {
        pg10_state = 4;
      }
      //choice5: milk
      else if (550 <= mouseX && mouseX <= 650 &&
        260 <= mouseY && mouseY <= 335)
      {
        pg10_state = 5;
      }
      //final answer
      else if (550 <= mouseX && mouseX <= 650 &&
        380 <= mouseY && mouseY <= 480)
      {
        if (pg10_state == 5)
        {
          page = 11;
          transition = false;
        }
        else
        {
          page = 23;
          transition = false;
        }
      }
    }
  }
  else if (page == 11)
  {
    background (0);
    image (catking, width/2, height/2, 240, 320);

    fill(255);
    textFont (font36);
    String pg11_text = "Thank you for the meal!"; 
    text (pg11_text, 50, 100);
    String pg11_text2 = "Now, I will have my servant show you the exit."; 
    text (pg11_text2, 50, 500);

    if ((mousePressed)&&(transition))
    {
      page = 12;
      transition = false;
    }
  }
  else if (page == 12)
  {
    background (0);
    image(magicaldoor, width/2, height/2);

    if ((mousePressed)&&(transition))
    {
      page = 13;
      transition = false;
    }
  }
  else if (page == 13)
  {
    background (60);

    fill(30);
    quad(0, 0, width, 0, width-150, 150, 150, 150); //top
    fill(80);
    quad(0, 0, 0, height, 150, height-150, 150, 150); //left
    fill(130);
    quad(0, height, width, height, width-150, height-150, 150, height-150); //bottom
    fill(80);
    quad(width, 0, width, height, width-150, height-150, width-150, 150); //right

    image (woodentable, 600, 450, 150, 150);
    image (chalk, 600, 390, 45, 70);
    
    image (boy2, width/2, 550, 220, 490);

    if ((mousePressed)&&(transition) &&
      573 <= mouseX && mouseX <= 627 &&
      352 <= mouseY && mouseY <= 425)
    {
      page = 14;
      transition = false;
      background (60);
    }
  }
  else if (page == 14)
  {
    fill(200);
    noStroke();
    smooth();

    if (pg14_tl==false) {
      ellipse (200, 100, 20, 20);
    }
    if (pg14_tm==false) {
      ellipse (400, 100, 20, 20);
    }
    if (pg14_tr==false) {
      ellipse (600, 100, 20, 20);
    }
    if (pg14_ml==false) {
      ellipse (200, 300, 20, 20);
    }
    if (pg14_mr==false) {
      ellipse (600, 300, 20, 20);
    }
    if (pg14_bl==false) {
      ellipse (200, 500, 20, 20);
    }
    if (pg14_bm==false) {
      ellipse (400, 500, 20, 20);
    }
    if (pg14_br==false) {
      ellipse (600, 500, 20, 20);
    }

    stroke(5);

    if (mousePressed)
    {
      if (transition == true)
      {
        noStroke();
        fill(color(255));
        ellipse(mouseX, mouseY, 20, 20);

        if ( dist(mouseX, mouseY, 200, 100) <= 10 )
        {
          pg14_tl = true;
        }
        if ( dist(mouseX, mouseY, 400, 100) <= 10 )
        {
          pg14_tm = true;
        }
        if ( dist(mouseX, mouseY, 600, 100) <= 10 )
        {
          pg14_tr = true;
        }

        if ( dist(mouseX, mouseY, 200, 300) <= 10 )
        {
          pg14_ml = true;
        }
        if ( dist(mouseX, mouseY, 600, 300) <= 10 )
        {
          pg14_mr = true;
        }
        if ( dist(mouseX, mouseY, 200, 500) <= 10 )
        {
          pg14_bl = true;
        }
        if ( dist(mouseX, mouseY, 400, 500) <= 10 )
        {
          pg14_bm = true;
        }
        if ( dist(mouseX, mouseY, 600, 500) <= 10 )
        {
          pg14_br = true;
        }

        // Fill in the gap
        if ( pg14_prev_pressed == true)
        {
          fillgap( pg14_prev_x, pg14_prev_y, mouseX, mouseY);
        }

        pg14_prev_x = mouseX;
        pg14_prev_y = mouseY;
        pg14_prev_pressed = true;
      }
    }
    else
    {
      pg14_prev_pressed = false;
    }
    
     fill(255);
    textFont(font36);
    String pg6_text = "Connect the dots and create a new door.";
    text (pg6_text, 50, 50);

    if (pg14_tl && pg14_tm && pg14_tr && 
      pg14_ml&& pg14_mr &&
      pg14_bl && pg14_bm && pg14_br && !mousePressed)
    {
      page = 15;
      transition = false;
    }
  }
  //give another exit
  else if (page == 15)
  {
    background (130);
    fill(30);
    quad (0, 0, 350, 0, 350, 400, 0, height);
    fill(60);
    quad (350, 0, width, 0, width, height, 350, 400);
    noFill();
    stroke (255);
    strokeWeight(3);
    quad (450, 300, 600, 330, 
    600, 513, 450, 445);
    strokeWeight (1);      
    fill(250);
    stroke (0);
    quad (100, 330, 250, 300, 250, 459, 100, 544);
    image (boy3, 550, 480, 250, 420);

    if ((mousePressed)&&(transition))
    {
      page = 16;
      transition = false;
      reset();
    }
  }
  // comeback to room
  else if (page == 16)
  {
    background (130);
    fill(30);
    rect(0, 0, width, 450);
    fill (250);
    rect (300, 210, 300, 240);

    if (pg4_counter / 40 % 2 == 0)
    {
      image (crawl1, 450, 425, 385, 425);
    }
    else
    {
      image (crawl2, 450, 425, 250, 350);
    }

    pg4_counter++;

    fill (255, pg4_counter);
    rect (0, 0, width, height);


    if (pg4_counter >= 300)
    {
      page =17;
      reset();
    }
  }
  //door closes
  else if (page == 17)
  {
    background (227, 216, 192);
    stroke(0, 12);
    fill (175, 238, 255);
    rect (0, 0, width, 450);

    //door open 
    float xradius = 300;
    float yradius = 30;
    float zradius = 30;

    rect (300, 210, 300, 240);

    pg22_angle = map(pg22_counter, 0, 200, PI/2, 0);
    pg22_angle = constrain (pg22_angle, 0, PI/2);
    pg22_angle2 = map (pg22_counter, 0, 200, PI/2, 0);
    pg22_angle2 = constrain (pg22_angle2, 0, PI/2);
    pg22_colorred = map (pg22_counter, 0, 200, 37, 175);
    pg22_colorred = constrain (pg22_colorred, 37, 175);
    pg22_colorgreen = map (pg22_counter, 0, 200, 42, 238);
    pg22_colorgreen = constrain(pg22_colorgreen, 42, 238);
    pg22_colorblue = map (pg22_counter, 0, 200, 44, 255);
    pg22_colorblue = constrain(pg22_colorblue, 44, 255);

    fill(200);
    quad(600 - 15*sin(pg22_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg22_angle), 450);

    fill (0);
    rect (300, 210, 300, 240);
    fill(pg22_colorred, pg22_colorgreen, pg22_colorblue);
    stroke (0);

    quad (600 - xradius*cos(pg22_angle), 210 + yradius*sin(pg22_angle), 
    600 - 15*sin(pg22_angle), 210, 
    600- 15*sin(pg22_angle), 450, 
    600 - xradius*cos(pg22_angle), 450 - yradius*sin(pg22_angle) );

    fill(200);
    quad(600 - 15*sin(pg22_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg22_angle), 450);

    pg22_counter++;

    float fade = map (pg22_counter, 200, 400, 0, 255);
    fade = constrain (fade, 0, 255);

    fill (0, fade);
    rect(0, 0, width, height);

    if (fade == 255)
    {
      page = 18;
      reset();
    }
  }

  // next child's door
  else if (page == 18)
  {
    background (227, 216, 192);

    float darken = map (pg22_counter, 0, 200, 0, 255);
    darken = constrain (darken, 0, 255);
    stroke(0, darken);
    fill (255, 178, 215);
    rect (0, 0, width, 450);

    rect (300, 210, 300, 240);
    if (pg22_counter >= 200)
    {
      stroke (0);
      fill (219, 27, 20);
      rect (650, 500, 100, 50);
      
      textFont (font36);
      String clear= "CLEARED";
      text (clear, 100, 150);

      fill (0);
      textFont (font24);
      text ("replay?", 665, 530);
    }
    if ((mousePressed)&&(transition)&&
      mouseX<= 750 && mouseX>= 650 &&
      mouseY<= 550  && mouseY>=500 )
    {
      page = 1;
      reset();
      transition = false;
    }

    pg22_counter++;
  }
  else if (page == 19)
  {
    //forest cont.
    image (darkforest, width/2, height/2, width, height);
    image (boy5, width/2, 500, 200, 400);

    if ((mousePressed)&&(transition))
    {
      page = 20;
      transition = false;
    }
  }

  else if (page == 20)
  {
    background (0);
    image (boy2, width/2, 400, 200, 450);

    fill(255);
    textFont (font24);
    String pg20_text = "Where are you going?";
    text (pg20_text, 500, height/2);
    if ((mousePressed)&&(transition))
    {
      page = 21;
      transition = false;
      pg21_counter=0;
    }
  }
  else if (page == 21)
  {
    background (0);
    image (lady, width/2, height/2);
    noStroke();
    fill(219, 27, 20, pg21_counter);
    rect (0, 0, width, height);
    pg21_counter++;
    if (pg21_counter >= 255)
    {
      page = 22;
      pg22_counter = 0;
    }
  }
  else if (page == 22)
  {
    background (227, 216, 192);
    stroke(0, 12);
    fill (175, 238, 255);
    rect (0, 0, width, 450);

    //door open 
    float xradius = 300;
    float yradius = 30;
    float zradius = 30;

    rect (300, 210, 300, 240);

    pg22_angle = map(pg22_counter, 0, 200, PI/2, 0);
    pg22_angle = constrain (pg22_angle, 0, PI/2);
    pg22_angle2 = map (pg22_counter, 0, 200, PI/2, 0);
    pg22_angle2 = constrain (pg22_angle2, 0, PI/2);
    pg22_colorred = map (pg22_counter, 0, 200, 37, 175);
    pg22_colorred = constrain (pg22_colorred, 37, 175);
    pg22_colorgreen = map (pg22_counter, 0, 200, 42, 238);
    pg22_colorgreen = constrain(pg22_colorgreen, 42, 238);
    pg22_colorblue = map (pg22_counter, 0, 200, 44, 255);
    pg22_colorblue = constrain(pg22_colorblue, 44, 255);

    fill(200);
    quad(600 - 15*sin(pg22_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg22_angle), 450);

    if (pg22_counter >= 200)
    {
      fill(219, 27, 20);
      rect (650, 500, 100, 50);

      textFont (font36);
      String GO= "GAME OVER";
      text (GO, 100, 150);

      fill (0);
      textFont (font24);
      text ("retry?", 670, 530);
    }
    if ((mousePressed)&&(transition)&&
      mouseX<= 750 && mouseX>= 650 &&
      mouseY<= 550  && mouseY>=500 )
    {
      page = 1;
      reset();
      transition = false;
    }

    fill (0);
    rect (300, 210, 300, 240);
    fill(pg22_colorred, pg22_colorgreen, pg22_colorblue);
    stroke (0);

    quad (600 - xradius*cos(pg22_angle), 210 + yradius*sin(pg22_angle), 
    600 - 15*sin(pg22_angle), 210, 
    600- 15*sin(pg22_angle), 450, 
    600 - xradius*cos(pg22_angle), 450 - yradius*sin(pg22_angle) );

    fill(200);
    quad(600 - 15*sin(pg22_angle), 210, 600, 210, 600, 450, 600 - 15*sin(pg22_angle), 450);

    pg22_counter++;
  }

  else if (page == 23)
  {
    background (0);
    image (catking, width/2, height/2, 240, 320);

    fill(255);
    textFont(font36);
    String pg9_text = "Are you mocking me!?"; 
    text (pg9_text, 50, 100);
    String pg9_text2 = "Get out of my castle right now!";
    text (pg9_text2, 250, 500);

    if ((mousePressed)&&(transition))
    {
      page = 24;
      transition = false;
    }
  }
  else if (page == 24)
  {
    //forest cont.
    image (darkhallway, width/2, height/2, width, height);
    image (boy5, width/2, 500, 200, 400);

    if ((mousePressed)&&(transition))
    {
      page = 20;
      transition = false;
    }
  }
}
void mouseReleased()
{
  transition = true;
}
void keyPressed()
{
  if (key=='b') //press B 
  {
    if (page >=2)
    {
      page--;
      reset();
    }
  }
}


void fillgap(int x1, int y1, int x2, int y2)
{
  if (dist(x1, y1, x2, y2) > 5)
  {
    fill(color(255));
    ellipse((x1+x2)/2, (y1+y2)/2, 20, 20);
    fillgap((x1+x2)/2, (y1+y2)/2, x1, y1);
    fillgap((x1+x2)/2, (y1+y2)/2, x2, y2);
  }
}

void reset()
{
  pg2_angle = 0;
  pg2_angle2 = 0;
  pg2_colorred = 175;
  pg2_colorgreen = 238;
  pg2_colorblue = 255;
  pg22_angle = 0;
  pg22_angle2 = 0;
  pg22_colorred = 175;
  pg22_colorgreen = 238;
  pg22_colorblue = 255;
  pg3_counter = 0;
  pg4_counter = 0;
  pg10_state = 0;
  pg21_counter = 0;
  pg22_counter = 0;
}


