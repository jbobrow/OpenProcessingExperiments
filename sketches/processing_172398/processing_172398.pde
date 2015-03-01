
/* @pjs preload="berlins.jpg"; */

PImage berlins;
berlins = loadImage("berlins.jpg");
size(800,520);
image(berlins,0,0);
PImage crop1=berlins.get(90,120,70,70);
image(crop1,0,50);
PImage crop2=berlins.get(200,400,90,120);
image(crop2,150,250);
PImage crop3=berlins.get(300,300,150,80);
image(crop3,250,150);
PImage crop4=berlins.get(500,400,180,100);
image(crop4,350,430);
PImage crop5=berlins.get(600,200,80,80);
image(crop5,500,250);
PImage crop6=berlins.get(700,150,130,180);
image(crop6,660,320);


