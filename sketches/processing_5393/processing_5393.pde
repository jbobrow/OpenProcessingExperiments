

int size = 100;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 5.8;  // Speed of the shape
float yspeed = 8.1;  // Speed of the shape

float xdirection = -1;  // Left or Right
float ydirection = -.5;  // Top to Bottom

float speed = 0.0;

//first part of mochi animation

float easing = 0.05;

float x = 305.0;
float y = 257.0;
float targetX = 250.0;
float targetY = 160.0;

float c = 365.0;
float e = 285.0;
float targetC = 298.0;
float targetE = 239.0;

float f = 373.0;
float g = 284.0;
float targetF = 292.0;
float targetG = 261.0;

float h = 340.0;
float i = 278.0;
float targetH = 249.0;
float targetI = 211.2;

float A = 343.0;
float B = 284.0;
float targetA = 255.0;
float targetB = 175.0;

float j = 352.0;
float k = 295.0;
float targetJ = 250.0;
float targetK = 219.0;

float m = 354.0;
float n = 293.0;
float targetM = 282.0;
float targetN = 215.0;

float o = 378.0;
float q = 290.0;
float targetO = 250.0;
float targetQ = 172.0;

float MN = 389.0;
float NM = 290.0;
float targetMN = 269.0;
float targetNM = 180.0;

float CP = 395.0;
float PC = 295.0;
float targetCP = 255.0;
float targetPC = 232.0;

float QR = 383.0;
float RQ = 270.0;
float targetQR = 261.0;
float targetRQ = 239.0;

float JK = 379.0;
float KJ = 290.0;
float targetJK = 261.0;
float targetKJ = 249.0;

float GH = 388.0;
float HG = 290.0;
float targetGH = 268.0;
float targetHG = 258.0;

float SO = 388.0;
float OS = 290.0;
float targetSO = 264.0;
float targetOS = 254.0;

float IF = 388.0;
float FI = 290.0;
float targetIF = 279.0;
float targetFI = 270.0;

float a = 0.0;
PImage mochi;
PImage junk1;
PImage junk2;
PImage junk3;
PImage junk4;
PImage junk5;
PImage junk6;
PImage junk7;
PImage head;
PImage arm;
PImage hand;
PImage body1;
PImage body2;
PImage body3;
PImage visor;
PImage cell;
PImage cam;
PImage redbutton;
PImage greenbutton;
PImage yellowswitch;
PImage maroonbutton;



void setup() { 
  
  frameRate(30);
  
xpos = 350;
ypos = 200;
 
  
  mochi = loadImage("fakemochianim.png");
  //junk images
  junk1 = loadImage("junk_1.png");
  junk2 = loadImage("junk_2.png");
  junk3 = loadImage("junk_3.png");
  junk4 = loadImage("junk_4.png");
  junk5 = loadImage("junk_5.png");
  junk6 = loadImage("junk_6.png");
  junk7 = loadImage("junk_7.png");
  
  //mochi's body parts (separate)
  
  head = loadImage("marble_head.png");
  arm = loadImage("pipe_arm.png");
  hand = loadImage("magnet_hand.png");
  body1 = loadImage("body_1.png");
  body2 = loadImage("body_2.png");
  body3 = loadImage("body_3.png");
  visor = loadImage("visor_eyes.png");
  cell =  loadImage("cell_eye.png");
  cam = loadImage("camera_eye.png");
  redbutton = loadImage("red_button.png");
  greenbutton = loadImage("green_button.png");
  yellowswitch = loadImage("yellow_switch.png");
  maroonbutton = loadImage("maroon_button.png");
  
  
  
  
  size (480, 320);
  

  
  
}

void draw()  {
  
   smooth();
   noFill();
   
   

  background(255);
    float currentTime = millis() / 1000.0;
  println(currentTime);

  
  //pile of junk
  


 
  image(junk1, 333, 255);
  image(junk2, 353, 264);
  image(junk3, 376, 276);
  image(junk4, 323, 282);
  image(junk5, 337, 265);
  image(junk6, 347, 265);
  image(junk7, 324, 267);
  
     ellipse(SO, OS, 25, 5);
   ellipse(SO, OS+3, 25, 5);
   ellipse(SO, OS+6, 25, 5);
   ellipse(SO, OS+9, 25, 5);
   ellipse(SO, OS+12, 25, 5);
  float P = dist(SO, OS, targetSO, targetOS);
  if (P > 1.0) {
    SO += (targetSO - SO) * easing;
    OS += (targetOS - OS) * easing;
  }
  
   ellipse(IF, FI, 25, 5);
   ellipse(IF, FI+3, 25, 5);
   ellipse(IF, FI+6, 25, 5);
   ellipse(IF, FI+9, 25, 5);
   ellipse(IF, FI+12, 25, 5);
  float Q = dist(IF, FI, targetIF, targetFI);
  if (Q > 1.0) {
    IF += (targetIF - IF) * easing;
    FI += (targetFI - FI) * easing;
  }
  
  image(head, x, y);
  float d = dist(x, y, targetX, targetY);
  if (d > 1.0) {
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
  }
  
  if (currentTime < 0.456) {
    easing = 0.0;
  } else if (currentTime > 0.456) {
    easing = 0.05;
  } 
  
  image(body1, h, i);
  float F = dist(h, i, targetH, targetI);
  if (F > 1.0) {
    h += (targetH - h) * easing;
    i += (targetI - i) * easing;
  }
  
  if (currentTime < 0.654) {
    easing = 0.0;
  } else if (currentTime > 0.654) {
    easing = 0.05;
  } 
  
  image(body2, j, k);
  float G = dist(j, k, targetJ, targetK);
  if (G > 1.0) {
    j += (targetJ - j) * easing;
    k += (targetK - k) * easing;
  }
  
  if (currentTime < 0.836) {
    easing = 0.0;
  } else if (currentTime > 0.863) {
    easing = 0.05;
  } 
  
  image(body3, m, n);
  float H = dist(m, n, targetM, targetN);
  if (H > 1.0) {
    m += (targetM - m) * easing;
    n += (targetN - n) * easing;
  }
  
  if (currentTime < 0.872) {
    easing = 0.0;
  } else if (currentTime > 0.872) {
    easing = 0.05;
  } 
  
    image(arm, c, e);
  float D = dist(c, e, targetC, targetE);
  if (D > 1.0) {
    c += (targetC - c) * easing;
    e += (targetE - e) * easing;
  }
  
  if (currentTime < 0.153) {
    easing = 0.0;
  } else if (currentTime > 0.153) {
    easing = 0.05;
  } 
  
  image(hand, f, g);
  float E = dist(f, g, targetF, targetG);
  if (E > 1.0) {
    f += (targetF - f) * easing;
    g += (targetG - g) * easing;
  }
  
  if (currentTime < 0.523) {
    easing = 0.0;
  } else if (currentTime > 0.523) {
    easing = 0.05;
  } 
  
  image(visor, o, q);
  float I = dist(o, q, targetO, targetQ);
  if (I > 1.0) {
    o += (targetO - o) * easing;
    q += (targetQ - q) * easing;
  }
  
  if (currentTime < 0.736) {
    easing = 0.0;
  } else if (currentTime > 0.736) {
    easing = 0.05;
  } 
  
  image(cell, A, B);
  float O = dist(A, B, targetA, targetB);
  if (O > 1.0) {
    A += (targetA - A) * easing;
    B += (targetB - B) * easing;
  }
  
  if (currentTime < 0.7483) {
    easing = 0.0;
  } else { if (currentTime > 0.7483)
    easing = 0.05;
  } 
  
  
  image(cam, MN, NM);
  float J = dist(MN, NM, targetMN, targetNM);
  if (d > 1.0) {
    MN += (targetMN - MN) * easing;
    NM += (targetNM - NM) * easing;
  }
  
  if (currentTime < 0.3627) {
    easing = 0.0;
  } else { if (currentTime > 0.3627) {
    easing = 0.05;
  } 
  
  image(redbutton, CP, PC);
  float K = dist(CP, PC, targetCP, targetPC);
  if (K > 1.0) {
    CP += (targetCP - CP) * easing;
    PC += (targetPC - PC) * easing;
  }
  
  if (currentTime < 0.5483) {
    easing = 0.0;
  } else if (currentTime > 0.5483) {
    easing = 0.05;
  } 
  
  image(greenbutton, QR, RQ);
  float L = dist(QR, RQ, targetQR, targetRQ);
  if (L > 1.0) {
    QR += (targetQR - QR) * easing;
    RQ += (targetRQ - RQ) * easing;
  }
  
  if (currentTime < 0.4369) {
    easing = 0.0;
  } else if (currentTime > 0.4369) {
    easing = 0.05;
  } 
  
  image(yellowswitch, JK, KJ);
  float M = dist(JK, KJ, targetJK, targetKJ);
  if (M > 1.0) {
    JK += (targetJK - JK) * easing;
    KJ += (targetKJ - KJ) * easing;
  }
  
  if (currentTime < 0.7654) {
    easing = 0.0;
  } else if (currentTime > 0.7654) {
    easing = 0.05;
  } 
  
  image(maroonbutton, GH, HG);
  float N = dist(GH, HG, targetGH, targetHG);
  if (N > 1.0) {
    GH += (targetGH - GH) * easing;
    HG += (targetHG - HG) * easing;
  }
  
  
  if (currentTime < 0.3829) {
    easing = 0.0;
  } else if (currentTime > 0.3829) {
    easing = 0.05;
  } 

  
    
  }
  
  
 if (mousePressed == true) {
  
  //part 2
  
  background(255);
 xpos = xpos + ( xspeed * xdirection );
ypos = ypos + ( yspeed * ydirection );

  
  if (xpos > width-size || xpos < 0) {
  xdirection *= -1;
}
if (ypos > height-size || ypos < 170) {
  ydirection *= -1;
}

xpos = xpos + speed;

{

   //LEG #1
   
   noFill();
  
  ellipse(xpos-62, (ypos+80), 25, 10);
  
 float s = sin(a) * 5;

ellipse(xpos-62, (ypos+80) + s, 25, 10);

 float p = sin(a) * 8;

ellipse(xpos-62, (ypos+80) + p, 25, 10);

float r = sin(a) * 11;

ellipse(xpos-62, (ypos+80) + r, 25, 10);

float t = sin(a) * 13;

ellipse(xpos-62, (ypos+80) + r, 25, 10);

float V = sin(a) * 15;

ellipse(xpos-62, (ypos+80) + d, 25, 10);


//LEG #2

 noFill();
  
  ellipse(xpos-80, (ypos+65), 25, 10);
  
 float b = sin(a) * 5;

ellipse(xpos-80, (ypos+65) + b, 25, 10);
a = a + PI/10.0; 

 float l = sin(a) * 8;

ellipse(xpos-80, (ypos+65) + l, 25, 10);

float v = sin(a) * 11;

ellipse(xpos-80, (ypos+65) + v, 25, 10);

float w = sin(a) * 13;

ellipse(xpos-80, (ypos+65) + w, 25, 10);

float z = sin(a) * 15;

ellipse(xpos-80, (ypos+65) + z, 25, 10);

image(mochi, xpos-95, ypos-34, 75, 135);

}

    if (currentTime < 5.0) {
   xspeed = 0;
   yspeed = 0;
  } else if (currentTime > 8.5) {
   xspeed = 0.0;  
   yspeed = 0.0;
  } else {
   xspeed = 5.8;  
   yspeed = 8.1;
  }
  }
 
  } 

  




