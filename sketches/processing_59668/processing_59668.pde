
size(500,500);
smooth();
background(#99CCFF);

//gelb: #FFFF00; Hellblau: #99CCFF; rosa: #FF7F7F; dunkelrosa: #CC3300; rot: #FF0000; dunkelgelb: #E5CC00
//width bezieht sich auf Bildbreite, width/2 ist genau mittig auf der Breite. Ebenso bei height.


//Kopf
noStroke();
fill(#FFFF00);

//Stirn
ellipse(width/2,height*0.6,400,320);

//Wangenknochen
ellipse(155,360,220,220);
ellipse(500-155,360,220,220);

//Körper
ellipse(width/2,1000,600,1200);

//Kinnschatten
fill(#E5CC00);
ellipse(width/2,470,100,80);
fill(#FFFF00);
ellipse(width/2,430,200,100);

//Ohren
fill(0);
  //links
  ellipse(width*0.2,150,60,250);

  //rechts
  ellipse(width*0.95,220,200,60);

fill(#FFFF00);

  //links
  ellipse(width*0.2,175,60,250);

  //rechts
  ellipse(width*0.9,220,200,60);

//Mund unten Füllung
noStroke();
fill(#FF7F7F);
ellipse(width/2,350,50,120);

//Mund Schatten
fill(#CC3300);
ellipse(260,330,80,80);

//Mund unten, dicker gelber Rahmen
stroke(#FFFF00);
noFill();
strokeWeight(50);
ellipse(width/2,350,2*50,205);

//Mund unten dünner schwarzer Rahmen
stroke(0);
noFill();
strokeWeight(2);
ellipse(width/2,350,50,120);


//Mund oben
fill(#FFFF00);
stroke(0);
strokeWeight(2);
ellipse(width/2-15,height*0.6,55,100);
ellipse(width/2+15,height*0.6,55,100);

noStroke();
fill(#FFFF00);
ellipse(width/2,height*0.5,200,100);
ellipse(width/2,height*0.6,150,85);


//Augen
fill(0);
ellipse(width*0.3,height*0.55,55,55);
ellipse(width*0.7,height*0.55,55,55);
fill(255);
ellipse(width*0.28,height*0.525,20,20);
ellipse(width*0.68,height*0.525,20,20);

//Wangen rot
fill(#FF0000,220);
ellipse(width*0.22,height*0.75,75,75);
ellipse(width*0.78,height*0.75,75,75);

//Nase
fill(0);
ellipse(width/2,height*0.6,25,20);



