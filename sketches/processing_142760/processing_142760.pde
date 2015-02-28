
import netscape.javascript.*;

size(600,600);
background(60);
//introducció de variables propies. 
//no afegeixo variables ja que el dibuix està tantejat i els punts i vectors no son múltimples senzills per fracciónar.
//int a;
//int d;
//a=;
//d=;

//panxa 
fill(255,100,5);
arc(width/2,400,width/2 ,width/2 ,-PI,0);

//cap
stroke(255,100,5);
fill(255,100,3);
ellipse(width/2,170,width/2,width/2);

//cames
stroke(255,100,5);
fill(255,100,3);
rect(205,400,200,45);

//peus 
stroke(126,50,5);
fill(126,49,1);
rect(170,445,265,10);

//Cremallera 
stroke(0);
line(width/2,400,width/2,350);
 
//cara marró 
stroke(126,50,5);
strokeWeight(2);
fill(126,49,1);
ellipse(width/2,162,160,135);

//elipse carn cara 
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(width/2,162,105,135);

//ull blanc esquerre
stroke(255);
strokeWeight(2);
fill(255);
ellipse(274,162,51,65);

//ullblanc dret
stroke(255);
strokeWeight(2);
fill(255);
ellipse(325,162,51,65); 

//pupila esuqerra
stroke(0);
strokeWeight(1);
fill(0);
ellipse(279,160,10,10);
 
//pupila dreta 
stroke(0);
strokeWeight(1);
fill(0);
ellipse(320,160,10,10);

//ma dreta 
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(435,400,50,50);

//ma esquerra 
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(170,400,50,50);
 

//polze dret 
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(410,395,30,30);

//polze esuquerra 
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(190,395,30,30);





