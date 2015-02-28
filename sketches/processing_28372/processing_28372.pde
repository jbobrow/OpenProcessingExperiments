
size (800,800);

background(200);

smooth();
noStroke();
//
////Green elilipses with about a 50% transparency
//
//fill(51,164,87,125);
//ellipse (100, 100, 50, 50);

//fill(51,164,87,125);
//ellipse (120, 120, 50, 50);
//
//
////yellow ellipses with about 50% transparency
//
//
//fill(255,242,45,125);
//ellipse (200, 100, 50, 50);

//fill(255,242,45,125);
//ellipse (220, 120, 50, 50);
//
//
////blue ellipses with about 50% transparency
//
//fill(0, 172, 236, 125);
//ellipse(300, 100, 50, 50);

//fill(0, 172, 236, 125);
//ellipse(320, 120, 50, 50);
//
//// red ellipses with about 50% transparency
//
//fill (204, 34, 41, 125);
//ellipse (150, 200, 50, 50);

//fill (204, 34, 41, 125);
//ellipse (170, 220, 50, 50);
//
//// Orange ellipses with about 50% transparency
//
//fill (213, 101, 44, 125);
//ellipse (250, 200, 50, 50);

//fill (213, 101, 44, 125);
//ellipse(270, 220, 50, 50);


noStroke();
smooth();

//for (int radius=100; radius<101; radius=radius+40)
//{
//  for (int deg = 0; deg < 360; deg += 12 )
//  {
//    float angle = radians(deg);
//    float x = 400 + (cos(angle) * radius);
//    float y = 400 + (sin(angle) * radius);
//  
//   fill (213, 101, 44, 125);
//
//   ellipse (x, y, 6, 6);
//  }
//}

String[] lines;
String[] pieces;
int[] temp;

lines = loadStrings("farmer2test.txt");
int deg=0;

for(int i=0; i<lines.length; i++) {
float rand = random(0, lines.length);
  pieces = split(lines[i], '\t');
  temp=int(pieces);
  
  for (int j=0; j<5; j++) {
  
   float angle = radians(i*1);
   float x = 400 + (cos(angle) * (200 + j*30));
   float y = 400 + (sin(angle) * (200 + j*30));
   
   fill (700*j, 70*j, 60+20*j, 90);
//   fill ((255 * norm(rand, 0, lines.length)), (255 * norm(rand, 0, lines.length)), (255 * norm(rand, 0, lines.length)), 90);

   ellipse(x,y,temp[j],temp[j]);
  }
}


PFont font; 
font = loadFont ("ChaparralPro-Bold-48.vlw");
textFont (font);
fill(0);
text("70 Burr", 320, 275);
textSize (18);
text("This is the visual image of", 300, 300);
text("where farmers in Ethopia used their", 250, 325);
text("money when given 70 Burr.", 300, 350);
text("A", 575,500);
text("B", 600, 520);
text("C", 620, 540);
text("D", 640, 560);
text("E", 660, 580);
text("Circle A is very dry insurance", 300, 375);
text("Circle B is dry insurance", 325,400);
text("Circle C is money given to the community",240, 425);
text("Circle D is money that they put into savings", 230,450);
text("Circle E is the money that they kept", 240, 475);
textSize (12);
text("*the size of the circles are in proportion of the amount of money each farmer put into each of the choices",0,760);

