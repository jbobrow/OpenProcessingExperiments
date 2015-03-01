
float sharkxPos =  - 100;
float boatxPos= 400;
float passxPos = 300;
float whalexPos = -300;
float swimmerxPos = 300;
float swimmeryPos = 275;

float paddlexPos = 470;
float paddleyPos = 340;

float littlefishxPos = 377;

void setup ()
{
 size (600,450);
frameRate (10);
}

void draw ()
{
   //SKY
background (#0FAAF5);

//sun
  fill (#D5F50F);
  ellipse (50,50,100,100);
  
  //boat
fill (#F00A0A); 
ellipse (boatxPos +20,290,150,50);
noStroke();
fill (#0FAAF5);
rect (boatxPos +20,240,200,80);

//sail 
strokeWeight (4);
fill(0);
line (boatxPos +20,290,boatxPos +20,200);

fill (255);
//rect (boatxPos -10 , 200,80,70);

//swimmer
fill (#F0980A);
ellipse (swimmerxPos, swimmeryPos + (random (2,5)),20,20);
ellipse (swimmerxPos ,swimmeryPos + (random (20,25)),30,30);

//sea
noStroke ();
rectMode (CENTER);
fill (#0FF578);
ellipse (100,300,250,25);
ellipse (300,300,250,25);
ellipse (400,300,250,25);
rect (300,400,600,195);

//littlefish
fill(#6A4346);
ellipse (littlefishxPos,390,45,15);
triangle (littlefishxPos +6,390,littlefishxPos +18,399,littlefishxPos +18,380);
fill (#C92731);
ellipse (littlefishxPos -7,389,5,5);

//paddle
fill (#ED9B30);
strokeWeight (3);
stroke (#ED9B30);
line    (paddlexPos, paddleyPos,paddlexPos + 30, paddleyPos + 30);
ellipse (paddlexPos, paddleyPos,20,15);

//fins
noStroke ();
fill (0);
triangle(sharkxPos,300,sharkxPos +30, 300, sharkxPos, 280);
triangle(sharkxPos +35,320,sharkxPos +65, 320, sharkxPos  +35, 300);
triangle(sharkxPos +70,300,sharkxPos +95, 300, sharkxPos +70, 280);
triangle(sharkxPos +105,320,sharkxPos +130, 320, sharkxPos +105, 300);

//whale
fill (0);
ellipse (whalexPos, 300,300,100);
strokeWeight (2);
stroke (#F00A1D);
line (whalexPos +150,300, whalexPos + 30,300);
line (whalexPos +135, 280 ,whalexPos + 30,300);
noStroke();
fill (#F00A1D);
ellipse (whalexPos + 75 , 275, 10,random (8));
triangle (whalexPos  -190,350,whalexPos - 125, 300,whalexPos - 190,250);

//spout
stroke (255);
strokeWeight (4);
noFill();
 arc(whalexPos, (random (190,200)), 50, 50, -PI, 0);  
 arc(whalexPos +50, (random (190,200)), 50, 50, -PI, 0); 
 line (whalexPos + 25,(random (240,250)),whalexPos +25, 200);

//textbox
fill (255);
rect (300,420,600,30);
//text
fill (#2529D8);
text ("Go solo, Stay low, Move fast, Travel light, little fishes!",5,425);

if (littlefishxPos < -100)
{
littlefishxPos = 600;
}

boatxPos = boatxPos +2;
paddlexPos = paddlexPos - 1;
paddleyPos = paddleyPos + 1;
swimmerxPos = swimmerxPos + 1.5;
//swimmeryPos = swimmeryPos + 1;
sharkxPos = sharkxPos +1;
whalexPos = whalexPos + 0.6;
littlefishxPos = littlefishxPos - 2.5;

}
