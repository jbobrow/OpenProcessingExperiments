
/*
Created by Sandy Chen, Tani Koulikov, & Michael Lin
 Group Name : Toasty Hats
 Credits to :
 David Yu - helped me with finding a method to randomize the tiles
 Albert Wu - taught me how to load sounds into the game
 */
import ddf.minim.*;
Minim minim;
AudioPlayer music;
AudioSample sndletter, sndright, sndwrong, sndnotime, sndwin;
boolean aPressed, bPressed, cPressed, dPressed, ePressed, fPressed, iPressed, nPressed, naPressed, oPressed, pPressed, rPressed, sPressed, tPressed, uPressed, vPressed, enterPressed, selectanswer, answerselected, wronganswer, returnPressed;
boolean dip, its, pit, put, sip, sit, tip, tup, dips, dust, pits, puts, spit, spud, stud, suit, tips, stupid;
boolean inn, ion, nun, Sin, son, sun, inns, ions, noun, nuns, nouns, union, unions, unison;
boolean con, cop, cue, cup, one, pen, pun, cone, nope, once, Open, upon, ounce, pounce;
boolean air, are, ear, era, sea, sir, ears, eras, rave, rise, Save, sire, visa, vase, arise, raise, raves, saver, varies;
boolean aid, and, ran, rid, sad, arid, darn, raid, rain, said, sand, drain, raids, rains, drains;
boolean den, die, end, Red, dine, dire, dive, nerd, rein, ride, vein, vend, vine, diner, diver, drive, driven;
boolean countdown;
boolean letter1, letter2, letter3, letter4, letter5, letter6, done1, done2, done3, done4, done5, done6;
int screenNumber;
int startTime, secondsRemaining;
int timeRemaining;
int timer, score, bonusscore;
PImage A, B, C, D, E, F, G, I, N, O, P, R, S, T, U, V, StartScreenBG, instructions, GameBG, endscreen;
PFont TimerFont, MenuFont, GameFont;
int Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, Ex, Ey, Fx, Fy, Ix, Iy, Nx, Ny, Nax, Nay, Ox, Oy, Px, Py, Rx, Ry, Sx, Sy, Tx, Ty, Ux, Uy, Vx, Vy;
int currentletterplace;
int combocount;
void setup()
{
  size(800,600);
  A = loadImage("A.gif");
  B = loadImage("B.gif");
  C = loadImage("C.gif");
  D = loadImage("D.gif");
  E = loadImage("E.gif");
  F = loadImage("F.gif");
  I = loadImage("I.gif");
  N = loadImage("N.gif");
  O = loadImage("O.gif");
  P = loadImage("P.gif");
  R = loadImage("R.gif");
  S = loadImage("S.gif");
  T = loadImage("T.gif");
  U = loadImage("U.gif");
  V = loadImage("V.gif");
  StartScreenBG = loadImage("background.gif");
  instructions = loadImage("Instructions.gif");
  TimerFont = loadFont("CourierNewPSMT-60.vlw");
  GameBG = loadImage("gamebg.gif");
  GameFont = loadFont("CourierNewPSMT-25.vlw");
  endscreen = loadImage("endscreen.gif");
  screenNumber = 0;
  currentletterplace = 1;
  score = 0;
  countdown = true;
  done1 = false;
  done2 = false;
  done3 = false;
  done4 = false;
  done5 = false;
  done6 = false;
  noStroke();
  minim = new Minim(this);
  int buffersize = 256;
  //noCursor();
  sndletter = minim.loadSample("typewriter_click.wav", buffersize);
  sndright = minim.loadSample("boxing_bell.wav", buffersize);
  sndwrong = minim.loadSample("buzzer_x.wav", buffersize);
  sndnotime = minim.loadSample("alarm_beep.wav", buffersize);
  //music = minim.loadSample("
  frameRate(200);
  combocount = 0;
}

void draw()
{
  if(screenNumber == 0)
  {
    background(instructions);
    currentletterplace = 1;
    dip = false;
    its = false;
    pit = false;
    put = false;
    sip = false;
    sit = false;
    tip = false;
    tup = false;
    dust = false;
    pits = false;
    puts = false;
    spit = false;
    spud = false;
    stud = false;
    suit = false;
    tips = false;
    stupid = false;
    inn = false;
    ion = false;
    nun = false;
    Sin = false;
    son = false;     
    sun = false;
    inns = false;
    ions = false;
    noun = false;
    nuns = false;
    nouns = false;
    union = false;
    unions = false;
    unison = false;
    con = false;
    cop = false;
    cue = false;
    cup = false;
    one = false;
    pen = false;
    pun = false;
    cone = false;
    nope = false;
    once = false;
    Open = false;
    upon = false;
    ounce = false;
    pounce = false;
    air = false;
    are = false;
    ear = false;
    era = false;
    sea = false;
    sir = false;
    ears = false;
    eras = false;
    rave = false;
    rise = false;
    Save = false;
    sire = false;
    visa = false;
    vase = false;
    arise = false;
    raise = false;
    raves = false;
    saver = false;
    varies = false;
    aid = false;
    and = false;
    ran = false;
    rid = false;
    sad = false;
    arid = false;
    darn = false;
    raid = false;
    rain = false;
    said = false;
    sand = false;
    drain = false;
    raids = false;
    rains = false;
    drains = false;
    den = false;
    die = false;
    end = false;
    Red = false;
    dine = false;
    dire = false;
    dive = false;
    nerd = false;
    rein = false;
    ride = false;
    vein = false;
    vend = false;
    vine = false;
    diner = false;
    diver = false;
    drive = false;
    driven = false;
    letter1 = false;
    letter2 = false;
    letter3 = false;
    letter4 = false;
    letter5 = false;
    letter6 = false;
    returnPressed = false;
    if(done1 || done2 || done3 || done4 || done5 || done6)
    {
      ccccComboBreaker();
    }
    if(mousePressed)
    {
      screenNumber = (int)random(1,7);
    }
  }
  if(screenNumber == 1) screenNumber = 10;
  if(screenNumber == 2) screenNumber = 20;
  if(screenNumber == 3) screenNumber = 30;
  if(screenNumber == 4) screenNumber = 40;
  if(screenNumber == 5) screenNumber = 50;
  if(screenNumber == 6) screenNumber = 60;

  if(screenNumber == 10)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done1)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      screenNumber = 11;
      countdown = true;
      startTime = millis();
      mousePressed = false;
      Sy = Ty = Uy = Py = Iy = Dy = 400;
      Sx = ((int)random(1, 7)*100);
      Tx = ((int)random(1, 7)*100);
      Ux = ((int)random(1, 7)*100);
      Px = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Dx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }
  if(screenNumber == 20)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done2)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      noStroke();
      fill(255,0,0);
      rect( 502, 460, 145, 60);
      screenNumber = 21;
      countdown = true;
      startTime = millis();
      Uy = Ny = Iy = Sy = Oy = Nay = 400;
      Ux = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      Ox = ((int)random(1, 7)*100);
      Nax = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }
  if(screenNumber == 30)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done3)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      screenNumber = 31;
      countdown = true;
      startTime = millis();
      Py = Oy = Uy = Ny = Cy = Ey = 400;
      Px = ((int)random(1, 7)*100);
      Ox = ((int)random(1, 7)*100);
      Ux = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Cx = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }
  if(screenNumber == 40)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done4)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      screenNumber = 41;
      countdown = true;
      startTime = millis();
      Vy = Ay = Ry = Iy = Ey = Sy = 400;
      Vx = ((int)random(1, 7)*100);
      Ax = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }
  if(screenNumber == 50)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done5)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      screenNumber = 51;
      countdown = true;
      startTime = millis();
      Dy = Ry = Ay = Iy = Ny = Sy = 400;
      Dx = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ax = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }
  if(screenNumber == 60)
  {
    background(StartScreenBG);
    fill(255);
    if(mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(done6)
    {
      screenNumber = (int)random(1,5);
    }
    if(mousePressed == true && mouseX > 502 && mouseX < 647 && mouseY > 460 && mouseY < 520)
    {
      screenNumber = 61;
      countdown = true;
      startTime = millis();
      Dy = Ry = Iy = Vy = Ey = Ny = 400;
      Dx = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Vx = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
  }

  if(screenNumber == 11)
  {
    background(GameBG);
    SpeedandTimer();
    STUPID ();
    STUPIDANS();
    done1 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Sy == 400 && Ty == 400 && Uy == 400 && Py == 400 && Iy == 400 && Dy == 400)
    {
      Sx = ((int)random(1, 7)*100);
      Tx = ((int)random(1, 7)*100);
      Ux = ((int)random(1, 7)*100);
      Px = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Dx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 21)
  {
    background(GameBG);
    SpeedandTimer();
    UNISON();
    UNISONANS();
    done2 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Uy == 400 && Ny == 400 && Iy == 400 && Sy == 400 && Oy == 400 && Nay == 400)
    {
      Ux = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      Ox = ((int)random(1, 7)*100);
      Nax = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 31)
  {
    background(GameBG);
    SpeedandTimer();
    POUNCE();
    POUNCEANS();
    done3 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Py == 400 && Oy == 400 && Uy == 400 && Ny == 400 & Cy == 400 && Ey == 400)
    {
      Px = ((int)random(1, 7)*100);
      Ox = ((int)random(1, 7)*100);
      Ux = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Cx = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 41)
  {
    background(GameBG);
    SpeedandTimer();
    VARIES();
    VARIESANS();
    done4 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Vy == 400 && Ay == 400 && Ry == 400 && Iy == 400 && Ey == 400 && Sy == 400)
    {
      Vx = ((int)random(1, 7)*100);
      Ax = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 51)
  {
    background(GameBG);
    SpeedandTimer();
    DRAINS();
    DRAINSANS();
    done5 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Dy == 400 && Ry == 400 && Ay == 400 && Iy == 400 && Ny == 400 && Sy == 400)
    {
      Dx = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ax = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      Sx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 61)
  {
    background(GameBG);
    SpeedandTimer();
    DRIVEN();
    DRIVENANS();
    done6 = true;
    fill(0);
    rect(400, 560, 100, 40);
    fill(255, 0, 0);
    text("RESET", 413, 590);
    if(mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600)
    { 
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 400 && mouseX < 500 && mouseY > 560 && mouseY < 600 && Dy == 400 && Ry == 400 && Iy == 400 && Vy == 400 && Ey == 400 && Ny == 400)
    {
      Dx = ((int)random(1, 7)*100);
      Rx = ((int)random(1, 7)*100);
      Ix = ((int)random(1, 7)*100);
      Vx = ((int)random(1, 7)*100);
      Ex = ((int)random(1, 7)*100);
      Nx = ((int)random(1, 7)*100);
      mousePressed = false;
    }
    textFont(GameFont, 25);
    fill(0);
    text("Current", 645, 560);
    text("Score:", 655, 585);
    text(score, 750, 585);
  }
  if(screenNumber == 9)
  {
    background(endscreen);
    fill(0);
    textFont(GameFont, 25);
    text("Your Score:", 50, 70);
    text(score, 330, 65);
    text("Clear Bonus:", 50, 130);
    text(bonusscore, 330, 125);
    text("Time Bonus:", 50, 190);
    text(secondsRemaining, 330, 185);
    textFont(TimerFont, 45);
    text("TOTAL SCORE:", 250, 345);
    text(score+secondsRemaining+bonusscore, 325, 455);
    fill(255);
    text("Click to Start Again", 50, 550);
    if(mouseX > 50 && mouseX < 590 && mouseY > 515 && mouseY < 560)
    {
      cursor(HAND);
    } 
    else {
      cursor(ARROW);
    }
    if(mousePressed == true && mouseX > 50 && mouseX < 590 && mouseY > 515 && mouseY < 560)
    {
      score = 0;
      bonusscore = 0;
      screenNumber = 0;
      mousePressed = false;
    }
  }
}

void ccccComboBreaker()
{
  done1 = done2 = done3 = done4 = done5 = done6  = false;
}

void keyPressed()
{
  if(keyCode == 65) aPressed = true;
  if(keyCode == 66) bPressed = true;
  if(keyCode == 67) cPressed = true;
  if(keyCode == 68) dPressed = true;
  if(keyCode == 69) ePressed = true;
  if(keyCode == 70) fPressed = true;
  if(keyCode == 73) iPressed = true;
  if(keyCode == 78) nPressed = true;
  if(keyCode == 79) oPressed = true;
  if(keyCode == 80) pPressed = true;
  if(keyCode == 82) rPressed = true;
  if(keyCode == 83) sPressed = true;
  if(keyCode == 84) tPressed = true;
  if(keyCode == 85) uPressed = true;
  if(keyCode == 86) vPressed = true;
  if(keyCode == ENTER) enterPressed = true;
  if(keyCode == BACKSPACE) returnPressed = true;
}

void stop() { // automatically called when program exits. here we'll stop and unload sounds.
  sndletter.close();
  sndright.close();
  sndwrong.close();
  sndnotime.close();
  //music.close();
  minim.stop();

  super.stop(); // tells program to continue doing its normal ending activity
}


