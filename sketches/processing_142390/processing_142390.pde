

//definició variables zona dibuix general
int a;
int b;

size(800,800); //width és 1600 i height és 1400

a=(width/2);
b=(height/2);



//definició valor fons
background(255);


//orella esquerra
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(a-140,height/2.3,180,200);

//orella interior esquerra
stroke(0);
strokeWeight(width/500);
fill(251,253,128);
ellipse(a-150,height/2.3,130,150);

//orella dreta
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(a+140,height/2.3,180,200);

//orella interior dreta
stroke(0);
strokeWeight(width/500);
fill(251,253,128);
ellipse(a+150,height/2.3,130,150);

//cara
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(a,b,width/2.8,height/3);

//boca 
stroke(0);
strokeWeight(width/500);
fill(255,113,128);
ellipse(width/2,height/2+10,12,45);
noStroke();
fill(251,199,1);
rect(width/2,height/2+17,12,-45);
rect(width/2,height/2+17,-12,-45);

//ull esquerre
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(a-120,height/2,14,7);
noStroke();
rect(a-130,height/2,20,7);

//ull dret
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(a+120,height/2,14,7);
noStroke();
rect(a+110,height/2,20,7);

//nas
stroke(0);
strokeWeight(width/500);
fill(0);
triangle(width/2-3,height/2+5,width/2+3,height/2+5,width/2,height/2+7);

//llavi esquerre
stroke(0);
strokeWeight(width/500);
noFill();
ellipse(width/2+4,height/2+15,8,5);
fill(251,199,1);
noStroke();
rect(width/2,height/2+15,20,-4.5);

//llavi dret
stroke(0);
strokeWeight(width/500);
noFill();
ellipse(width/2-4,height/2+15,8,5);
fill(251,199,1);
noStroke();
rect(width/2,height/2+15,-20,-4.5);

//galta esquerra
stroke(0);
strokeWeight(width/500);
fill(194,28,42);
ellipse(a-120,height/2+25,25,10);

//galta dreta
stroke(0);
strokeWeight(width/500);
fill(194,28,42);
ellipse(a+120,height/2+25,25,10);






