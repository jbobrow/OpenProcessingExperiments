
//Snjor
int[] xmengi = new int[100];
int[] ymengi = new int[100];
int haed = 0;


void setup() {
 size(600, 650);
 frameRate(30);
 for(int i=0; i<xmengi.length; i++) {
   xmengi[i] = int(random(width));
   ymengi[i] = int(random(height)) * -1;
 }
}
void draw() {
 background(25, 0, 255);
 fill(900,900,900);
 ellipse(300, 550, 250, 250);
 ellipse(320, 400, 180, 180);
ellipse(300, 300, 120, 120);

//Auga.
fill(10);
ellipse(280, 295, 15, 15);

//hattur
fill(211,11,111);
triangle(230, 280, 360, 260, 300, 100);

//Nef
stroke(400,100,20);
strokeWeight(6);
line(260, 320, 200, 340);


//hendi
stroke(10);
strokeWeight(2);
line(320, 380, 250, 430);
line(250, 430, 150, 350);
line(250, 430, 150, 350);
 for(int i=0; i<xmengi.length; i++) {
   ellipse(xmengi[i], ymengi[i], 3,3);
   xmengi[i] = xmengi[i] + int(random(3))-1;
   ymengi[i] = ymengi[i] + 1;
   if(ymengi[i] > height) {
     ymengi[i] = 4 * int(random(height)) * -1;
   }
 }

 for(int i=0; i<xmengi.length; i++) {
   if(distans(xmengi[i], ymengi[i], mouseX, mouseY) < 50) {
     xmengi[i] = xmengi[i] -2;
     ymengi[i] = ymengi[i] + int(random(9))-4;
   }
 }

fill(222, 0,0);
rect(xmengi[0], ymengi[0], 4,4);
noFill();

//println(distans(xmengi[0], ymengi[0], mouseX, mouseY));



}

//  a2 * b2 = c2
int distans(int x1, int y1, int x2, int y2) {
 int xbil, ybil, dis;
 xbil = x1 - x2;
 ybil = y1 - y2;

 xbil = xbil * xbil;
 ybil = ybil * ybil;

 dis = xbil + ybil;
 dis = int(sqrt(dis));

 return dis;
}


