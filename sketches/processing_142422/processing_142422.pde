
size(800,800);

int a;
int b;

a=(width/2);
b=(height/2);

background(55,200,255);

//cap TOAD//
stroke(255);
fill(255);
ellipse(a,b/2,300,300);

//cos TOAD//
stroke(252,198,130);
fill(252,198,130);
ellipse(a,b,60,150);

//cara TOAD//
rectMode(CENTER);
rect(a,b-90,160,160,90,90,60,60);

//sabates RADERE_ESQ//
stroke(85,55,9);
fill(85,55,9);
ellipse(a+80,b+200,100,100);

//sabates RADERE_DRETA//
ellipse(a-80,b+200,100,100);

//panxa gran TOAD//
stroke(255);
fill(255);
ellipse(a,b+145,250,150);

//sabates FRONTAL_ESQ//
stroke(85,55,9);
fill(85,55,9);
ellipse(a+100,b+210,100,100);

//sabates FRONTAL_DRETA//
ellipse(a-100,b+210,100,100);

//chaleco TOAD blau//
strokeWeight(10);
stroke(237,201,17);
fill(17,36,237);
rect(a-55,b+40,90,110,50,30,60,20);

rect(a+55,b+40,90,110,30,50,20,60);

strokeWeight(0);

//punt VERMELL gran//
stroke(255,0,0);
fill(255,0,0);
ellipse(a,b/2-80,130,130);

//punt esquerra TOAD//
ellipse((a/2)+80,b/2,60,110);

//punt dret TOAD//
ellipse(a+119,b/2,60,110);

//ull dret TOAD//
stroke(0);
fill(0);
ellipse(a-25,b-100,20,40);

//ull esquerre TOAD//
ellipse(a+25,b-100,20,40);

//boca negre TOAD//
rect(a,b-55,60,60,60,60,60,60);

stroke(252,198,130);
fill(252,198,130);
rect(a,b-70,80,40,50,50,40,40);

//brillo ojos ESQUERRA//
stroke(255);
fill(255);
ellipse(a-25,b-110,5,5);

//brillo ojos DRETA//
ellipse(a+25,b-110,5,5);

//sabates amagades//
stroke(55,200,255);
fill(55,200,255);
rect(a,b+270,300,50);

//braços//
stroke(252,198,130);
fill(252,198,130);
ellipse(a-80,b+30,40,90);
ellipse(a+80,b+30,40,90);

//dit OK//
stroke(0);
ellipse(a-85,b+50,10,30);
ellipse(a+85,b+50,10,30);

//mans//
ellipse(a-80,b+70,40,40);
ellipse(a+80,b+70,40,40);

//punta sabates//
stroke(85,55,9);
fill(85,55,9);
ellipse(a+97,b+231,98,50);
ellipse(a-97,b+231,98,50);




















