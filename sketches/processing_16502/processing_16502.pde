

int card = 0;
PFont font;
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;


void setup() {
  size (950, 500);
  font = loadFont ("ARCHRISTY-48.vlw");
  textFont(font);
  smooth();
}

void draw() {
  if (card == 0){
     background(255);
    img= loadImage("heart.jpg");
  smooth();
textSize(60);
text("There are CUP and MILK", 100,70);
textSize(75);
text("They loved each other", 160,150);
stroke(0);
cupmilk(100, 100);
}

else if (card == 1){
   background(255);
    img2 = loadImage("mm.png"); 
image(img2, 670,50,290,180);
textSize(60);
text("They hugged", 100,240);
textSize(30);
text("each other", 250,290);
textSize(50);
text("2 BECOME 1", 300,340);
  stroke(0);
cup(450, 110);
}

else if (card ==2){
  background(255);
  textSize(79);
  text("Jelous of you...", 150,100);
  choco(900,300);
}


else if (card == 3){
   background(255);
    img3 = loadImage("img3.jpg"); 
image(img3, 170,62,290,440);

   img4 = loadImage("img4.jpg");
   image(img4, 649, 50, 300,280);
    
    textSize(49);
  text("Decided it!", 40,80);
  
}

else if (card == 4){
  background(255);
  img5= loadImage("dd.png");
  image(img5, 109,125,179,54);
 textSize(80);
 text("????", 100,100);
 textSize(40);
 text("But the MILK was changed", 310,150);
 textSize(51);
 text("HER MIND!", 300,200);
 textSize(30);
 text("Turned  into", 300, 240);
 textSize(54);
 text("CHOCO MILK!!", 310, 300);
  chocomilk (100,400);

}

else if (card == 5){
   background(255);
    img6 = loadImage("1g.png"); 
image(img6, 350,145,170,170);
    img7 = loadImage("dd.png");
    image(img7, 490,140,178,60);
    
    moving(200,200);
}


else if( card == 6) {
  background(255);
  img8 = loadImage("ww.png");
  image( img8, 280,190, 150,130);
  img9 = loadImage("aj.png");
  image( img9, 445,165,285,120);
  
  
  textSize(45);
  text (" Go Away.." , 250,140);
  wat (200, 200);
  
}

}

  
  
void mousePressed() {
  
  if(card == 0) {
    card = 1;
  }
  
  else if (card == 1){
    card = 2;
  }
  
  else if (card == 2) {
    card = 3;
  }
  
  else if (card == 3 ){
    card = 4;
  }
  
  else if (card == 4 ){
    card = 5;
  }
  
  else if( card ==5 ){
    card= 6;
  }
  
  else if( card == 6 ){
    card = 7;
  }
}

  
void cupmilk(int x,int y){
  //cup
  pushMatrix();
  translate(400,100);

  noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);


fill(0);
ellipse(151,240,17,17);
ellipse(215,235,22,22);

noStroke();
fill(203,62,62);
quad(154,260,200,260,193,280,165,280);
popMatrix();

//milk
strokeWeight(1);
stroke(0);
fill(255);
pushMatrix();
translate(110,120);
scale(0.7);
beginShape();
vertex(88,60);
vertex(340,108);
vertex(340,152);
vertex(380,240);
vertex(140,200);
vertex(40,240);
vertex(40,220);
vertex(80,120);
endShape(CLOSE);
fill(211,211,211);



line(83,90,340,136);
line(82,108,340,152);

fill(211,211,211);
quad(40,240,140,200,140,440,40,380);

line(140,440,340,420);
line(340,420,380,240);

int t =360;
int f = 400;
int e = 380;
smooth();
strokeWeight(7);
line(t,340,e,348);
line(e,348,f,e);
line(e,f,f,380);
line(t,f,380,f);
line(320,t,t,f);
line(340,e,340,e);
line(320,e,340,e);
line(340,t,340,e);



strokeWeight(3);
line(160,180,172,140);// M
line(172,140,179,168);
line(179,168,190,140);
line(190,140,197,188);
line(211,145,211,189);// i
line(225,150,225,192);//L
line(225,192,252,197);
line(268,155,268,202);//k
line(290,160,270,176);
line(270,176,290,202);


fill(0);
ellipse(340,288,30,30);
ellipse(240,280,40,40);
fill(211,211,211);
strokeWeight(1);
triangle(80,120,140,180,40,220);



noStroke();
fill(209,72,72);
arc(290,320,50,80,0,PI);

fill(157,157,157);
popMatrix();

image(img, 408,160, 90,111);

}


void cup(int x, int y) {
smooth();  
  translate(x,y);

noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);


fill(0);
ellipse(151,240,17,17);
ellipse(215,235,22,22);


noStroke();
fill(252,110,193);
ellipse( 230, 255, 13, 13);


noStroke();
fill(203,62,62);
quad(154,260,200,260,193,280,165,280);


fill(248,250,207);
ellipse(200,159,160,40);


fill(0);
ellipse(165,155,10,10);
ellipse(205,155,12,12);
arc(180,163,20,5,0,PI);

}

void choco(int x, int y){
  
  translate(510,-45);
  //side
noStroke();
fill(67,48,37);
triangle(280,120,300,500,260,440);
// side
//bottom
fill(100,77,64);
triangle(260,440,300,500,200,540);
//bottom
//left
fill(52,47,44);
triangle(280,120,260,440,200,540);
//left
fill(118,65,30);
quad(140,120,280,120,200,540,92,480);


stroke(252,245,5);
line(140,120,280,120);



noStroke();
fill(134,75,51);
beginShape();
vertex(140,60);
vertex(180,80);
vertex(180,60);
vertex(220,80);
vertex(220,60);
vertex(280,88);
vertex(280,120);
vertex(140,120);
endShape(CLOSE);

stroke(255,255,255);
strokeWeight(2);
line(140,108,280,108);
stroke(0);
strokeWeight(4);
line(160,200,200,200);



noStroke();
fill(255);
arc(220,170,55,55,QUARTER_PI, PI+QUARTER_PI);
pushMatrix();
translate(155,170);
rotate(9.5);
arc(0,0,35,40,radians(135),radians(315));
popMatrix();


stroke(0);
point(208,182);
point(160, 182);

noStroke();
fill(118,82,67);
quad(280,120,240,380,200,540,232,372);


}

void chocomilk( int x, int y){

smooth();  

stroke(0);
strokeWeight(3);
noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);


fill(0);
ellipse(151,240,17,17);
ellipse(215,235,22,22);
ellipse(172,302,15,55);



stroke(0);
strokeWeight(3);
strokeCap(ROUND);
line(135,220,157,220);
line(193,208,199,218);
line(199,218,236,208);
}


void water( int x, int y ){
  
smooth();  
background(255);  

stroke(0);
strokeWeight(3);
noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);



}


void moving ( int x, int y){
  
  translate(380,20);
  smooth();   

stroke(0);
strokeWeight(3);
noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);
}
  
  
  void wat( int x, int y){
    
    
    translate(300,10);
    scale(1.3);
smooth();
stroke(0);
strokeWeight(3);
noFill();
beginShape();
vertex(30,20);

endShape();

ellipse(200,150,180,60);  

arc(200,300,100,50,0,PI);  

line(114,160,149,300);

line(285,159,249,307);


fill(0);
ellipse(151,240,17,17);
ellipse(215,235,22,22);
ellipse(172,302,15,55);




stroke(108,215,255);
strokeWeight(15);
strokeCap(ROUND);
line(151,254,151,306);
line(215,249,215,301);
  }

