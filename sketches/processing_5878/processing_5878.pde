
PShape arm, body1, body2, body3, cautionbutton, circlebuttons, eye1;
PShape eye2, hand, head, visor, yellowswitch;

float xpos, ypos;
float a = 0.0;
float d, s, p, r, t, V, b, l, w, z;

float h, g;

float easing = 0.5;

PFont sans;



void setup() {
  size(320, 480);
  
  //load images
  arm = loadShape("arm.svg");
  body1 = loadShape("body1.svg");
  body2 = loadShape("body2.svg");
  body3 = loadShape("body3.svg");
  cautionbutton = loadShape("cautionbutton.svg");
  circlebuttons = loadShape("circlebuttons.svg");
  eye1 = loadShape("eye1.svg");
  eye2 = loadShape("eye2.svg");
  hand = loadShape("hand.svg");
  head = loadShape("head.svg");
  visor = loadShape("visor.svg");
  yellowswitch = loadShape("yellowswitch.svg");
  
  sans = loadFont("SansSerif-15.vlw");
 

  
  smooth();
  
}

void draw() {
  background(255);
 

 
mochilegs();
mochibody();

if (mousePressed == true) {
  background(255);
 mochibodyfull(); 
}
  
}


void mochilegs() { 
  



 //LEG #1
   
 noFill();
ellipse(115, 285, 35, 15);
float s = sin(a) * 7;
ellipse(115, 288 + s, 35, 15);
a = a + PI/100.0; 
float p = sin(a) * 9;
ellipse(115, 291 + p, 35, 15);
a = a + PI/200.0;
float r = sin(a) * 11;
ellipse(115, 294 + r, 35, 15);
a = a + PI/300.0;
float t = sin(a) * 13;
ellipse(115, 297 + r, 35, 15);
a = a + PI/400.0;
float d = sin(a) * 15;
ellipse(115, 300 + d, 35, 15);
a = a + PI/500.0;
 
 
 //LEG #2
  noFill();
ellipse(145, 315, 35, 15);
float m = sin(a) * 7;
ellipse(145, 318 + s, 35, 15);
a = a + PI/100.0; 
float l = sin(a) * 9;
ellipse(145, 321 + p, 35, 15);
a = a + PI/200.0;
float n = sin(a) * 11;
ellipse(145, 324 + r, 35, 15);
a = a + PI/300.0;
float o = sin(a) * 13;
ellipse(145, 327 + r, 35, 15);
a = a + PI/400.0;
float q = sin(a) * 15;
ellipse(145, 330 + d, 35, 15);
a = a + PI/500.0;

 
}

void mochibody() {
 
 
  textFont(sans);
  
  
  text("Mochi has fallen apart!", 20, 400); 
  text("Help fix him and then click your mouse", 20, 420); 
  text("to play with him.", 20, 440);


  
  
    if(mouseX < height/2) { 
  body1(310, 23);
  } else { 
     shape(body1, 98, 225);
  } 
  
   if(mouseX < height/2) { 
   body2(54, 121);
  } else { 
      shape(body2, 98, 239);
  } 
  
    if(mouseX < height/2) { 
  body3(231, 434);
  } else { 
    shape(body3, 147, 230);
  } 

  if(mouseX < height/2) { 
   head(10, 20);
  } else { 
    shape(head, 100, 150);
  }
  
    if(mouseX < height/2) { 
  cautionbutton(32, 34);
  } else { 
    shape(cautionbutton, 127, 292);
  } 
  
  
    if(mouseX < height/2) { 
  buttons(43, 21);
  } else { 
     shape(circlebuttons, 105, 255);
  } 
  
  
    if(mouseX < height/2) { 
    visor(43, 32);
  } else { 
   shape(visor, 100, 170);
  } 
  
   if(mouseX < height/2) { 
  eye2(213, 324);
  } else { 
    shape(eye2, 140, 185);
  } 
     
      if(mouseX < height/2) { 
  eye1(432, 32);
  } else { 
     shape(eye1, 115, 175);
  } 

 
      if(mouseX < height/2) { 
  hand(321, 67);
  } else { 
     shape(hand, 168, 292);
  }
 
      if(mouseX < height/2) { 
  yellowswitch(65, 123);
  } else { 
    shape(yellowswitch, 125, 277);
  } 
 

}

void mochibodyfull() {
  
  
   //LEG #1
   
 noFill();
ellipse(mouseX+20, mouseY+130, 35, 15);
float s = sin(a) * 7;
ellipse(mouseX+20, mouseY+130 + s, 35, 15);
a = a + PI/100.0; 
float p = sin(a) * 10;
ellipse(mouseX+20, mouseY+130 + p, 35, 15);
a = a + PI/300.0;
float r = sin(a) * 13;
ellipse(mouseX+20, mouseY+130 + r, 35, 15);
a = a + PI/500.0;
float t = sin(a) * 16;
ellipse(mouseX+20, mouseY+130 + t, 35, 15);
a = a + PI/700.0;
float d = sin(a) * 19;
ellipse(mouseX+20, mouseY+130 + d, 35, 15);
a = a + PI/900.0;
 

 
 //LEG #2
  noFill();
ellipse(mouseX+48, mouseY+155, 35, 15);
float V = sin(a) * 7;
ellipse(mouseX+48, mouseY+155 + V, 35, 15);
a = a + PI/100.0; 
float b = sin(a) * 10;
ellipse(mouseX+48, mouseY+155 + b, 35, 15);
a = a + PI/300.0;
float l = sin(a) * 13;
ellipse(mouseX+48, mouseY+155 + l, 35, 15);
a = a + PI/500.0;
float w = sin(a) * 16;
ellipse(mouseX+48, mouseY+155 + w, 35, 15);
a = a + PI/700.0;
float z = sin(a) * 19;
ellipse(mouseX+48, mouseY+155 + z, 35, 15);
a = a + PI/900.0;


  shape(body1, mouseX, mouseY+70);
  shape(body2, mouseX, mouseY+84);
  shape(body3, mouseX+49, mouseY+75);
  shape(head, mouseX, mouseY);
  shape(cautionbutton, mouseX+32, mouseY+140);
  shape(circlebuttons, mouseX+5, mouseY+100);
  shape(visor, mouseX, mouseY+20);
  shape(eye2, mouseX+37, mouseY+33);
  shape(eye1, mouseX+12, mouseY+25); 
  shape(arm, mouseX+75, mouseY+115); 
  shape(hand, mouseX+68, mouseY+140);
  shape(yellowswitch, mouseX+30, mouseY+125);

}


void head(int x, int y){
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(173, 157); 
  scale(h); 
  shape(head, 0, 0); 
  popMatrix();

}

void visor(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(172, 57); 
  scale(h); 
  shape(visor, 0, 0); 
  popMatrix(); 
} 

void buttons(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(210, 56); 
  scale(h); 
  shape(circlebuttons, 0, 0); 
  popMatrix(); 
} 



void eye1(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(32, 85); 
  scale(h); 
  shape(eye1, 0, 0); 
  popMatrix(); 
} 



void eye2(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(17, 237); 
  scale(h); 
  shape(eye2, 0, 0); 
  popMatrix(); 
} 



void arm(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 

void body1(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 
void body2(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 

void body3(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 

void cautionbutton(int x, int y) { 
    float h = map(mouseY, 5, 302, 130, 2) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 

void hand(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 

void yellowswitch(int x, int y) { 
    float h = map(mouseY, 20, 300, 100, 20) * easing; 
  pushMatrix(); 
  translate(76, 157); 
  scale(h); 
  shape(arm, 0, 0); 
  popMatrix(); 
} 




