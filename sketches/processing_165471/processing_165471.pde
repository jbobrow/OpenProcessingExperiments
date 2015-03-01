
void setup () {
size(400,400);

Balken = loadImage("https://wellsfargoworks.com/Views/WFWorks/images/video-player/volumeSliderProgress.png");
Ball = loadImage("http://de.goobix.com/onlinespiele/x-ball/ball3.gif");
Wasser = loadImage("http://www.peppauf.de/WebRoot/Store2/Shops/62361801/4F1F/D330/2423/DD32/1D0A/C0A8/29BB/E577/Welle_truekis.jpg"); 

x = 200;
y = 20;
B = 0; // links und Rechts
R = 0; // Oben und Unten
}
//----------------------------------------------Spielfeld
void draw () {

background (255); // hintergrundfarbe
image (Wasser,0,200); // Wasser

fill (100); // Rahmen
stroke (100);
 LinksRand = rect (0,0,50,400);
 RechtsRand = rect (350,0,50,400);
 ObenRand = rect (0,0,400,50);

fill (255); // Loch oben
stroke (255)
Loch = rect (152,0,98,50);
//--------------------------------------------Lebensanzeige
 Leben1 = image (Balken,260,20);  
 Leben2 = image (Balken,300,20);
 Leben3 = image (Balken,340,20);
 //--------------------------------------------------Maus

image(Balken,mouseX,300); // ist 40 P breit

//-------------------------------------Ball Bewegung nach unten
y = y + 1;
if (y > 352) { // geh wieder hoch
x = 200;
y = 20;
}

//--------------------------------------Ballbewegung Links Rechts

if (x < 50) //LRand
B = 0;

if (x > 322) //RRand
B = 1;


if (B == 0) // wen am LRand beweg nach rechts
x = x + 1;
else
x = x - 1; // wen wo anders beweg nach links


//----------------------------------------------------Ball
image(Ball,x,y);  // ist 38 P breit


}
