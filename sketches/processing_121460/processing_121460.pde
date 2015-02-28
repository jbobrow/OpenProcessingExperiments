
PFont font;
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;





void setup(){
    size(500,500);
    minim = new Minim(this);
    player = minim.loadFile("knight.mp3"); 
    player.play();
}

void draw(){
     img = loadImage ("coche.jpg");
     image (img,0,0);
     fill(51,51,153);
     stroke (51,51,153);
     rect(5,5,80,62); 
     triangle (85,67,5,67,5,138);
     triangle (85,67,250,58,85,61);
     rect (85,5,332,56);
     triangle (250,58,417,58,417,67);
     rect (417,5,78,62);
     triangle(417,67,495,67,495,138);
     fill (115,86,105);
     stroke (115,86,105);
     triangle(5,440,256,473,5,473);
     triangle(495,440,256,473,495,473);
     rect(5,473,490,22);
     stroke(0,0,0);
     int i=132;
     while (i<=370){
       int distanceX=abs(mouseX-i);
       fill (distanceX,0,0);
       rect (i,300,2,25);
       i=i+2; 
     }


     if (mousePressed && (mouseButton == LEFT)){
       background (0,0,0);
       textSize(32);
       fill (0,255,0);
       font = loadFont("letra.vlw");
       text("LET'S GO MICHAEL!!!",16,450);
       img = loadImage ("kitt.jpg");
       image (img,16,88);
       int j=145;
       while(j<=266){
        int distanceX1=abs(mouseY-j);
        fill(distanceX1,0,0);
        rect(215,j,16,12);
        j=j+10;
       } 
       int k=145;
       while(k<=266){
        int distanceX2=abs(mouseY-k);
        fill(distanceX2,0,0);
        rect(242,k,16,12);
        k=k+10;
       } 
       int l=145;
       while(l<=266){
        int distanceX3=abs(mouseY-l);
        fill(distanceX3,0,0);
        rect(270,l,16,12);
        l=l+10;
       }
     }
    
    if (mousePressed && (mouseButton == RIGHT)){
        background (0,0,0);
        int x1=80;
        while(x1<=160){
        int distanceX4=abs(mouseX-x1);
        
        fill(distanceX4,random(0,255),random(0,255));
        triangle(x1,10,160,90,40,200);
        x1=x1+10;
       }
       int x2=120;
        while(x2<=200){
        int distanceX5=abs(mouseX-x2);
        
        fill(distanceX5,random(0,255),random(0,255));
        triangle(x2,10,200,90,80,200);
        x2=x2+10;
       }
       int x3=160;
        while(x3<=240){
        int distanceX6=abs(mouseX-x3);
        
        fill(distanceX6,random(0,255),random(0,255));
        triangle(x3,10,240,90,120,200);
        x3=x3+10;
       }
       int x4=200;
        while(x4<=280){
        int distanceX7=abs(mouseX-x4);
        
        fill(distanceX7,random(0,255),random(0,255));
        triangle(x4,10,280,90,160,200);
        x4=x4+10;
       }
       int x5=240;
        while(x5<=320){
        int distanceX8=abs(mouseX-x5);
        
        fill(distanceX8,random(0,255),random(0,255));
        triangle(x5,10,320,90,200,200);
        x5=x5+10;
       }
       font = loadFont("letra.vlw");
       textFont(font, 250);
       text("I", 375, 175);
       textFont(font,100);
       text("was made",30,260);
       text("in the",130,340);
       textFont(font,180);
       text("80",150,490);
       textFont(font,100);
       text("'s",350,420);



     }
     
 }
 void stop(){

    player.close();
    minim.stop();
    super.stop();
}


