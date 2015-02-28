
int monsterX;
int monsterY;

void setup (){
size (200,200);
monsterX= 80;
monsterY= 140;
}

void draw () { 
background (255);

fill (90,45,7); //oorschelp links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-40,monsterY-45,35,35);

fill (209,150,0); // oor links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-40,monsterY-45,25,25);

fill (90,45,7); //oorschelp rechts
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+40,monsterY-45,35,35);

fill (209,150,0); // oor rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX+40,monsterY-45,25,25);

fill (116,56,7);//body
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX,monsterY,100,100); //x80 y140

fill (90,45,7); //arm links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-50,monsterY-10,20,20);

fill (90,45,7); //arm rechts
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+50,monsterY-10,20,20);

fill (0); //neus
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX,monsterY,20,10);

fill (255); //neusgat links
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX-5,monsterY+1,3,3);

fill (255); //neusgat rechts
ellipseMode(CENTER); 
stroke(0);
ellipse( mouseX+5,monsterY+1,3,3);

line (mouseX-15,monsterY+12,mouseX+15,monsterY+12); //mond
triangle(mouseX-10, monsterY+12, mouseX-4, monsterY+18, mouseX+2, monsterY+12); //tand


fill (90,45,7); // voet links 
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX-30,monsterY+35,40,40);

fill (90,45,7); // voet rechts
ellipseMode(CENTER);
stroke(0);
ellipse( mouseX+30,monsterY+35,40,40);

line (mouseX-25,monsterY-35,mouseX-5,monsterY-30); //wenkbrauw links

fill(0); // oog links
stroke(0);
rect( mouseX-10,monsterY-25,2,15,2); 

line (mouseX+5,monsterY-30,mouseX+25,monsterY-35); //wenkbrauw rechts

fill (0); // oog rechts
stroke(0);
rect( mouseX+10,monsterY-25,2,15,2); 

line(mouseX+50,monsterY-20,mouseX+50,monsterY-80); //touw ballon

fill (255,0,0);// ballon
ellipseMode(CENTER);
ellipse( mouseX+50,monsterY-100,60,60);

triangle(mouseX+45, monsterY-60, mouseX+50, monsterY-70, mouseX+55, monsterY-60);

fill (255); // bite
ellipseMode(CENTER); 
noStroke();
ellipse( mouseX-50,monsterY-56,10,10);
fill (255); 
ellipseMode(CENTER); 
noStroke();
ellipse( mouseX-44,monsterY-61,10,10);

monsterY --;
}
