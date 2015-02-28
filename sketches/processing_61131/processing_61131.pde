
void BigsmileyInc()
{
  image(BigsmileyInc, 0, 0);
}
void HangMan()
{
  image(HangMan, 0, 0); 
  noFill();
  if (dist(StartDist, ButtonLocation, mouseX, mouseY) < 80 && (mousePressed))
  {
    nextScreen = 2;
  }
  if (dist(InstructDist, ButtonLocation2, mouseX, mouseY) < 80 && (mousePressed))
  {
    image(gameScreen,0,0);
    nextScreen = 3;
  }
}
void Instructions()
{
  image(Instructions, 0, 0);
  if (dist(backDist, backButton, mouseX, mouseY) < 50 &&(mousePressed))
  {
    nextScreen = 1;
  }
}
void draw()
{
  println(savedTime);
  if (timer.isFinished())
  {
    nextScreen = 1;
    timer.start();
    timer = new Timer(999999999);
  }
  else if (nextScreen == 0)
  {
    BigsmileyInc();
  }
  else if (nextScreen == 1)
  {
    HangMan();
    lives = 6;
    words = int(random(20));
    a = b = c = d = e = f = g = h = i = j = k = l = m = n = o = p = q = r = s = t = u = v = w = x = y = z = 0;
    a2 = b2 = c2 = d2 = e2 = f2 = g2 = h2 = i2 = j2 = k2 = l2 = m2 = n2 = o2 = p2 = q2 = r2 = s2 = t2 = u2 = v2 = w2 = x2 = y2 = z2 = 0;
    a3 = b3 = c3 = d3 = e3 = f3 = g3 = h3 = i3 = j3 = k3 = l3 = m3 = n3 = o3 = p3 = q3 = r3 = s3 = t3 = u3 = v3 = w3 = x3 = y3 = z3 = 0;
    enterPressed = false;
  }
  else if (nextScreen == 2)
  {
    Instructions();
  }
  else if (nextScreen == 4)
  {
   if (keyPressed)
  {
   nextScreen = 1;
   delay(1000);
  } 
  }
  else if (nextScreen == 5)
  {
   if (keyPressed)
  {
   nextScreen = 1;
   delay(1000);
  } 
  }
  else if (nextScreen == 3)
  { 
    image(hangmanhanger, 465,13);
    if (lives == 5)
    {
      image(hangmanfull, 600, 80);
    }
    else if (lives == 4)
    {
      image(hangmanfull2, 600, 80);
    }
    else if (lives == 3)
    {
      image(hangmanfull3, 600, 80);
    }
    else if (lives == 2)
    {
      image(hangmanfull4, 600, 80);
    }
    else if (lives == 1)
    {
      image(hangmanfull5, 600, 80);
    }
    else if (lives == 0)
    {
      image(hangmanfull6, 600, 80);
    }
        if (words == 0)
    {    
      fill(255, 255, 255);
      text("_ _ _ _ _ _ _ _ _ _", 140, 120); //unfriendly
      fill(255, 255, 255);
      text("Definition: not friendly or kind", 0, 550);
      if (keyPressed) {
        if (key == 'U' || key == 'u'){u = 140; text("u", u, 110);}
        else if (key == 'N' || key == 'n'){n = 170; n2 = 315; text("n", n, 110); text("n", n2, 110);}
        else if (key == 'F' || key == 'f'){f = 200; text("f", f, 110);}
        else if (key == 'R' || key == 'r'){r = 225; text("r", r, 110);}
        else if (key == 'I' || key == 'i'){i = 255; text("i", i, 110);}
        else if (key == 'E' || key == 'e'){e = 285; text("e", e, 110);}
        else if (key == 'D' || key == 'd'){d = 345; text("d", d, 110);}
        else if (key == 'L' || key == 'l'){l = 380; text("l", l, 110);}
        else if (key == 'Y' || key == 'y'){y = 405; text("y", y, 110);}
        else if (key == ENTER){enterPressed = true;}
        else {lives -=1;}
        keyPressed = false;
        if (lives < 0)
        {
          lose();
          text("your word was: unfriendly", 200, 400);
        }
        if (u == 140 && n == 170 && f == 200 && r == 225 && i == 255 && e == 285 && n2 == 315 && d == 345 && l == 380 && y == 405)
        {
          win();
        }
      }
    }
if (words == 1)
{    
fill(255, 255, 255); 
text("_ _ _ _ _ _ _ _", 140, 120); //coauthor
fill(255, 255, 255); 
text("Definition: more then one author", 0, 550);
if (keyPressed) {
        if (key == 'C' || key == 'c'){c = 140; text("c", c, 110);}
        else if (key == 'O' || key == 'o'){o = 170; o2 = 320; text("o", o, 110);text("o", o2, 110);}
        else if (key == 'a' || key == 'A'){a = 200; text("a", a, 110);}
        else if (key == 'u' || key == 'U'){u2 = 225; text("u", u2, 110);}
        else if (key == 't' || key == 'T'){t = 255; text("t", t, 110);}
        else if (key == 'h' || key == 'H'){h = 285; text("h", h, 110);}
        else if (key == 'r' || key == 'R'){r2 = 350; text("r", r2, 110);}
        else {lives -=1;}
        keyPressed = false;
        if (lives < 0)
        {
          lose();
          text("your word was: coauthor", 200, 400);
        }
        if (c == 140 && o == 170 && a == 200 && u2 == 225 && t == 255 && h == 285 && r2 == 350 && o2 == 320)
        {
          win();
        }
      }
    }
        if (words == 2)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _ _", 140,120); //disagree
     text("Definition: to have a different opinion", 0, 550);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 225; text("a", a, 110);}
     else if (key == 'D' || key == 'd'){d = 140; text("d", d, 110);}
     else if (key == 'E' || key == 'e'){e = 315; e2 = 345; text("e", e,110); text("e", e2, 110);}
     else if (key == 'G' || key == 'g'){g = 255; text("g", g, 110);}
     else if (key == 'I' || key == 'i'){i = 175; text("i", i, 110);}
     else if (key == 'R' || key == 'r'){r = 285; text("r", r, 110);}
     else if (key == 'S' || key == 's'){s = 200; text("s", s, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: disagree", 200, 400);
        }
        if (a == 225 && d == 140 && e == 315 && e2 == 345 && g == 255 && i == 175 && r == 285 && s == 200)
        {
          win();
        }
     }
    }
    if (words == 3)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _",140,120); //extract
     text("Definition: to get, pull, or draw out,", 0, 550);
     text("usually with special effort, skill", 0, 600);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 255; text("a", a, 110);}
     else if (key == 'C' || key == 'c'){c = 285; text("c", c, 110);}
     else if (key == 'E' || key == 'e'){e = 140; text("e", e, 110);}
     else if (key == 'R' || key == 'r'){r = 225; text("r", r, 110);}
     else if (key == 'T' || key == 't'){t = 200; t2 = 315; text("t", t, 110); text("t", t2, 110);}
     else if (key == 'X' || key == 'x'){x = 170; text("x", x, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: extract", 200, 400);
        }
        if (e == 140 && x == 170 && t == 200 && r == 225 && a == 255 && c == 285 && t2 == 315)
        {
         win(); 
        }
      }
    }
    if (words == 4)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _",140,120); //illegal
     text("Definition: forbidden by law", 0, 550);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 285; text("a", a, 110);}
     else if (key == 'E' || key == 'e'){e = 225; text("e", e, 110);}
     else if (key == 'G' || key == 'g'){g = 255; text("g", g, 110);}
     else if (key == 'I' || key == 'i'){i = 140; text("i", i, 110);}
     else if (key == 'L' || key == 'l'){l = 170; l2 = 200; l3 = 320; text("l", l, 110); text("l", l2, 110); text("l", l3, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: illegal", 200, 400);
        }
        if (i == 140 && l == 170 && l2 == 200 && e == 225 && g == 255 && a == 285 && l3 == 320)
        {
         win(); 
        }
     }
  }
      if (words == 5)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _",140,120); //surbase
     text("Definition: a molding above a base", 0, 550);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 255; text("a", a, 110);}
     else if (key == 'B' || key == 'b'){b = 225; text("b", b, 110);}
     else if (key == 'E' || key == 'e'){e = 315; text("e", e, 110);}
     else if (key == 'R' || key == 'r'){r = 200; text("r", r, 110);}
     else if (key == 'S' || key == 's'){s = 140; s2 = 285; text("s", s, 110); text("s", s2, 110);}
     else if (key == 'U' || key == 'u'){u = 170; text("u", u, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: surbase", 200, 400);
        }
        if (s == 140 && u == 170 && r == 200 && b == 225 && a == 255 && s2 == 285 && e == 315)
        {
         win(); 
        }
     }
  }
        if (words == 6)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //entangle
     text("Definition: to make tangled",0, 550);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 225; text("a", a, 110);}
     else if (key == 'E' || key == 'e'){e = 140; e2 = 345; text("e", e, 110); text("e", e2, 110);}
     else if (key == 'G' || key == 'g'){g = 285; text("g", g, 110);}
     else if (key == 'L' || key == 'l'){l = 315; text("l", l, 110);}
     else if (key == 'N' || key == 'n'){n = 170; n2 = 255; text("n", n, 110); text("n", n2, 110);}
     else if (key == 'T' || key == 't'){t = 200; text("t", t, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: entangle", 200, 400);
        }
        if (e == 140 && n == 170 && t == 200 && a == 225 && n2 == 255 && g == 285 && l == 315 && e2 == 345)
        {
         win(); 
        }
      }
    }
            if (words == 7)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _ _",140,120); //impossible
     text("Defintion: not possible",0, 550);
     if (keyPressed) {
     if (key == 'B' || key == 'b'){b = 345; text("b", b, 110);}
     else if (key == 'E' || key == 'e'){e = 400; text("e", e, 110);}
     else if (key == 'I' || key == 'i'){i = 140; i2 = 315; text("i", i, 110); text("i", i2, 110);}
     else if (key == 'L' || key == 'l'){l = 375; text("l", l, 110);}
     else if (key == 'M' || key == 'm'){m = 165; text("m", m, 110);}
     else if (key == 'O' || key == 'o'){o = 225; text("o", o, 110);}
     else if (key == 'P' || key == 'p'){p = 200; text("p", p, 110);}
     else if (key == 'S' || key == 's'){s = 255; s2 = 285; text("s", s, 110); text("s",s2, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: impossible", 200, 400);
        }
        if (i == 140 && m == 165 && p == 200 && o == 225 && s == 255 && s2 == 285 && i2 == 315 && b == 345 && l == 375 && e == 400)
        {
         win(); 
        }
      }
    }
          if (words == 8)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _",140,120); //submarine
     text("Definition: A warship that goes", 0, 550);
     text(" under the sea", 0, 600);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 255; text("a", a, 110);}
     else if (key == 'B' || key == 'b'){b = 200; text("b", b, 110);}
     else if (key == 'E' || key == 'e'){e = 375; text("e", e, 110);}
     else if (key == 'I' || key == 'i'){i = 315; text("i", i, 110);}
     else if (key == 'M' || key == 'm'){m = 223; text("m", m, 110);}
     else if (key == 'N' || key == 'n'){n = 345; text("n", n, 110);}
     else if (key == 'R' || key == 'r'){r = 285; text("r", r, 110);}
     else if (key == 'S' || key == 's'){s = 140; text("s", s, 110);}
     else if (key == 'U' || key == 'u'){u = 170; text("u", u, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: submarine", 200, 400);
        }
        if (s == 140 && u == 170 && b == 200 && m == 223 && a == 255 && r == 285 && i == 315 && n == 345 && e == 375)
     {
      win(); 
     }
      }
    }
                    if (words == 9)
    {
     fill(255,255,255);
     text("_ _ _ _ _ _ _",140,120); //rebound
     text("Definition: to recover",0, 550);
     if (keyPressed) {
     if (key == 'B' || key == 'b'){b = 200; text("b", b, 110);}
     else if (key == 'D' || key == 'd'){d = 315; text("d", d, 110);}
     else if (key == 'E' || key == 'e'){e = 170; text("e", e, 110);}
     else if (key == 'N' || key == 'n'){n = 285; text("n", n, 110);}
     else if (key == 'O' || key == 'o'){o = 225; text("o", o, 110);}
     else if (key == 'R' || key == 'r'){r = 140; text("r", r, 110);}
     else if (key == 'U' || key == 'u'){u = 255; text("u", u, 110);}
     else {lives -= 1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: rebound", 200, 400);
        }
        if (r == 140 && e == 170 && b == 200 && o == 225 && u == 255 && n == 285 && d == 315)
        {
         win(); 
        }
      }
    }
    if (words == 10)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //cheerful
     text("Definition: full of cheer",0, 550);
     if (keyPressed) {
     if (key == 'C' || key == 'c'){c = 140; text("c", c, 110);}
     else if (key == 'H' || key == 'h'){h = 170; text("h", h, 110);}
     else if (key == 'E' || key == 'e'){e = 200; e2 = 225; text("e", e, 110); text("e", e2, 110);}
     else if (key == 'R' || key == 'r'){r = 255; text("r", r, 110);}
     else if (key == 'F' || key == 'f'){f = 285; text("f", f, 110);}
     else if (key == 'U' || key == 'u'){u = 315; text("u", u, 110);}
     else if (key == 'L' || key == 'l'){l = 345; text("l", l ,110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: cheerful", 200, 400);
        }
        if (c == 140 && h == 170 && e == 200 && e2 == 225 && r == 255 && f == 285 && u == 315 && l == 345)
        {
         win(); 
        }
      }
    }
        if (words == 11)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //fearless
     text("Definition: without fear", 0, 550);
     if (keyPressed) {
     if (key == 'F' || key == 'f'){f = 140; text("f", f, 110);}
     else if (key == 'E' || key == 'e'){e = 170; e2 = 285; text("e", e, 110); text("e", e2, 110);}
     else if (key == 'A' || key == 'a'){a = 200; text("a", a, 110);}
     else if (key == 'R' || key == 'r'){r = 225; text("r", r, 110);}
     else if (key == 'L' || key == 'l'){l = 255; text("l", l, 110);}
     else if (key == 'S' || key == 's'){s = 315; s2 = 345; text("s", s, 110); text("s", s2 ,110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: fearless", 200, 400);
        }
        if (f == 140 && e == 170 && a == 200 && r == 225 && l == 255 && e == 170 && s == 315 && s2 == 345)
        {
         win(); 
        }
      }
    }
            if (words == 12)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _ _",140,120); //attractive
     text("Definition: charming in appearance", 0, 550);
     text("or manner", 0, 600);
     if (keyPressed) {
     if (key == 'A' || key == 'a'){a = 140; a2 = 255; text("a", a, 110); text("a", a2, 110);}
     else if (key == 'T' || key == 't'){t = 170; t2 = 200; t3 = 315; text("t", t, 110); text("t", t2, 110); text("t", t3, 110);}
     else if (key == 'R' || key == 'r'){r = 225; text("r", r, 110);}
     else if (key == 'C' || key == 'c'){c = 285; text("c", c, 110);}
     else if (key == 'I' || key == 'i'){i = 345; text("i", i, 110);}
     else if (key == 'V' || key == 'v'){v = 375; text("v", v, 110);}
     else if (key == 'E' || key == 'e'){e = 405; text("e", e, 110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: attractive", 200, 400);
        }
        if (a == 140 && t == 170 && t2 == 200 && r == 225 && a2 == 255 && c == 285 && t3 == 315 && i == 345 && v == 375 && e == 405)
        {
         win(); 
        }
  }
}
            if (words == 13)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //movement
     text("Definition: result of moving", 0, 550);
     if (keyPressed) {
     if (key == 'M' || key == 'm'){m = 135; m2 = 250; text("m", m, 110); text("m", m2, 110);}
     else if (key == 'O' || key == 'o'){o = 170; text("o", o, 110);}
     else if (key == 'V' || key == 'v'){v = 200; text("v", v, 110);}
     else if (key == 'E' || key == 'e'){e = 225; e2 = 285; text("e", e, 110); text("e", e2, 110);}
     else if (key == 'N' || key == 'n'){n = 315; text("n", n, 110);}
     else if (key == 'T' || key == 't'){t = 345; text("t", t, 110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: movement", 200, 400);
        }
        if (m == 135 && o == 170 && v == 200 && e == 225 && m2 == 250 && e2 == 285 && n == 315 && t == 345)
        {
         win(); 
        }
  }
}
            if (words == 14)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //backward
     text("Definition: toward the back or rear", 0, 550);
     if (keyPressed) {
     if (key == 'B' || key == 'b'){b = 140; text("b", b, 110);}
     else if (key == 'A' || key == 'a'){a = 170; a2 = 285; text("a", a, 110); text("a", a2, 110);}
     else if (key == 'C' || key == 'c'){c = 200; text("c", c, 110);}
     else if (key == 'K' || key == 'k'){k = 225; text("k", k, 110);}
     else if (key == 'W' || key == 'w'){w = 255; text("w", w, 110);}
     else if (key == 'R' || key == 'r'){r = 315; text("r", r, 110);}
     else if (key == 'D' || key == 'd'){d = 345; text("d", d, 110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: backward", 200, 400);
        }
        if (b == 140 && a == 170 && c == 200 && k == 225 && w == 255 && a2 == 285 && r == 315 && d == 345)
        {
         win(); 
        }
  }
}
            if (words == 15)
    {
           fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _",140,120); //expensive
     text("Definition: very high-priced", 0, 550);
     if (keyPressed) {
     if (key == 'E' || key == 'e'){e = 140; e2 = 225; e3 = 375; text("e", e, 110); text("e", e2, 110); text("e", e3, 110);}
     else if (key == 'X' || key == 'x'){x = 170; text("x", x, 110);}
     else if (key == 'P' || key == 'p'){p = 200; text("p", p, 110);}
     else if (key == 'S' || key == 's'){s = 285; text("s", s, 110);}
     else if (key == 'N' || key == 'n'){n = 255; text("n", n, 110);}
     else if (key == 'I' || key == 'i'){i = 320; text("i", i, 110);}
     else if (key == 'V' || key == 'v'){v = 345; text("v", v, 110);}
     else {lives -=1;}
     keyPressed = false;
             if (lives < 0)
        {
          lose();
          text("your word was: expensive", 200, 400);
        }
        if (e == 140 && x == 170 && p == 200 && e2 == 225 && n == 255 && s == 285 && i == 320 && v == 345 && e3 == 375)
        {
         win(); 
        }
  }
    }
    if (words == 16)
    {
                 fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _",140,120); //disappear
     text("Definition: vanish from sight", 0, 550);
     if (keyPressed) {
     if (key == 'D' || key == 'd'){d = 140; text("d", d, 110);}
     else if (key == 'I' || key == 'i'){i = 175; text("i", i, 110);}
     else if (key == 'S' || key == 's'){s = 200; text("s", s, 110);}
     else if (key == 'A' || key == 'a'){a = 345; a2 = 225; text("a", a, 110); text("a", a2, 110);}
     else if (key == 'P' || key == 'p'){p = 255; p2 = 285; text("p", p, 110); text("p", p2, 110);}
     else if (key == 'E' || key == 'e'){e = 315; text("e", e, 110);}
     else if (key == 'R' || key == 'r'){r = 379; text("r", r, 110);}
     else {lives -=1;}
     keyPressed = false;
     if (lives < 0)
     {
       lose();
       text("your word was: disappear", 200, 400);
     }
     if (d == 140 && i == 175 && s == 200 && a2 == 225 && p == 255 && p2 == 285 && e == 315 && a == 345 && r == 379)
     {
      win(); 
     }
  }
}
if (words == 17)
{
                   fill(255,255,255);
     text("_ _ _ _ _ _ _",140,120); //transit
     text("Definition: passage from one place to another", 0, 550);
     if (keyPressed) {
     if (key == 'T' || key == 't'){t = 140; t2 = 315; text("t", t, 110); text("t", t2, 110);}
     else if (key == 'R' || key == 'r'){r = 170; text("r", r, 110);}
     else if (key == 'A' || key == 'a'){a = 200; text("a", a, 110);}
     else if (key == 'N' || key == 'n'){n = 225; text("n", n, 110);}
     else if (key == 'S' || key == 's'){s = 255; text("s", s, 110);}
     else if (key == 'I' || key == 'i'){i = 285; text("i", i, 110);}
     else {lives -=1;}
     keyPressed = false;
     if (lives < 0)
     {
       lose();
       text("your word was: transit", 200, 400);
     }
     if (t == 140 && r == 170 && a == 200 && n == 225 && s == 255 && i == 285 && t2 == 315)
     {
      win(); 
     }
  }
}
if (words == 18)
{
                     fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //misspell
     text("Definition: to spell  incorrectly", 0, 550);
     if (keyPressed) {
     if (key == 'M' || key == 'm'){m = 135; text("m", m, 110);}
     else if (key == 'I' || key == 'i'){i = 175; text("i", i, 110);}
     else if (key == 'S' || key == 's'){s = 200; s2 = 225; text("s", s, 110); text("s", s2, 110);}
     else if (key == 'P' || key == 'p'){p = 255; text("p", p, 110);}
     else if (key == 'E' || key == 'e'){e = 285; text("e", e, 110);}
     else if (key == 'L' || key == 'l'){l = 315; l2 = 345; text("l", l, 110); text("l", l2, 110);}
     else {lives -=1;}
     keyPressed = false;
     if (lives < 0)
     {
       lose();
       text("your word was: misspell", 200, 400);
     }
     if (m == 135 && i == 175 && s == 200 && s2 == 225 && p == 255 && e == 285 && l == 315 && l2 == 345)
     { 
       win();
     }
}
  }
  if (words == 19)
  {
                         fill(255,255,255);
     text("_ _ _ _ _ _ _ _",140,120); //nonsense
     text("Definition: something that has or makes no sense", 0, 550);
     if (keyPressed) {
     if (key == 'N' || key == 'n'){n = 140; n2 = 200; n3 = 285; text("n", n, 110); text("n", n2, 110); text("n", n3, 110);}
     else if (key == 'O' || key == 'o'){o = 170; text("o", o, 110);}
     else if (key == 'S' || key == 's'){s = 225; s2 = 315; text("s", s, 110); text("s", s2, 110);}
     else if (key == 'E' || key == 'e'){e = 255; e2 = 345; text("e", e, 110); text("e", e2, 110);}
     else {lives -=1;}
     keyPressed = false;
     if (lives < 0)
     {
       lose();
       text("your word was: nonsense", 200, 400);
     }
     if (n == 140 && o == 170 && n2 == 200 && s == 225 && e == 255 && n3 == 285 && s2 == 315 && e2 == 345)
     {
      win(); 
     }
  }
}
if (words == 20)
{
                           fill(255,255,255);
     text("_ _ _ _ _ _ _ _ _ _ _",140,120); //predictable
     text("Definition: Behaving or occurring in a way that is expected", 0, 550);
     if (keyPressed) {
     if (key == 'P' || key == 'p'){p = 140; text("p", p, 110);}
     else if (key == 'R' || key == 'r'){r = 170; text("r", r, 110);}
     else if (key == 'E' || key == 'e'){e = 200; e2 = 435; text("e", e, 110); text("e", e2, 110);}
     else if (key == 'D' || key == 'd'){d = 225; text("d", d, 110);}
     else if (key == 'I' || key == 'i'){i = 255; text("i", i, 110);}
     else if (key == 'C' || key == 'c'){c = 285; text("c", c, 110);}
     else if (key == 'T' || key == 't'){t = 315; text("t", t, 110);}
     else if (key == 'A' || key == 'a'){a = 345; text("a", a, 110);}
     else if (key == 'B' || key == 'b'){b = 375; text("b", b, 110);}
     else if (key == 'L' || key == 'l'){l = 405; text("l", l, 110);}
     else {lives -=1;}
     keyPressed = false;
     if (lives < 0)
     {
       lose();
       text("your word was: predictable", 200, 400);
     }
     if (p == 140 && r == 170 && e == 200 && d == 225 && i == 255 && c == 285 && t == 315 && a == 345 && b == 375 && l == 405 && e2 == 435)
     {
      win(); 
     }
}
}
}
}

