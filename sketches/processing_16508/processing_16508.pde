
float kay = 0;
float ki = 0;
float fay =0;
float fy =0;
float fyy = 0;
float ty = 0;
float tty = 0;
float tyy =0;
float bl=0;

int card = 0; 

int x = 21;
int y = 450;
int w = 190;
int h = 70;

int a, b,q ;
PImage p, d, j,k, l, zz, pp,ss,tt,ff,li,sc,back;
PFont fo;

void setup() {
size(600,600);
a= 190;
b= 210;
p =loadImage("think.png");
q=0;
d= loadImage("food_02.png");
j= loadImage("food_1.png");
k= loadImage("food_2.png");
l= loadImage("food_04.png");
zz=loadImage("zzang.png");
pp=loadImage("line_2.png");
ss=loadImage("04.png");
tt=loadImage("p_05.png");
ff=loadImage("line_3.png");
li=loadImage("line.png");
ss=loadImage("sci_1.png");
sc=loadImage("sci_2.png");
back=loadImage("back.png");
fo=loadFont("AgencyFB-Bold-48.vlw");
textFont(fo);

  }


void draw() {
 if (card == 0) {
 background(255);
smooth();
noFill();
stroke(0);
rect(21, 450, 190, 70);
text("Chopsticks",30, 500 );
ci(0,400, 0, 100,100,1,0,0,0,0,0,0,0);//original p_01
fill(0);


}

    

    /*
   
     code here to draw something for the first page,
     
     
     */

  else if (card == 1) {  
    background(255);
smooth();

fill(0);
rect(500,500,100,100);
stroke(255);
strokeWeight(5);
line(520, 520, 580,550);
line(580,550, 520,580);
 
 noStroke();
fill(187, 250, 229);
quad(0,430, 350, 430, 430, 600, 0, 600);//desk

 
 image(l, -250, 450);//_02 big dish
 
 cu(100);//moving

 //scene_02


}

    /* 
     
     code here to draw something for the 2nd page,
     
     
     */
  
  else if (card  == 2) {  
  background(255);
smooth();
ci(0,200, 150, 280, 50,1,0,0,0,0,0,0,0);//p_03

// scene_03
image(p, -250,100);//bul_03
ci(0,400, 0, 300, 630,int(1.2),1080+270+270+270+270+270+270+270+270+270,30,270, 8,0,0,0 );
//bul_03
// bulloon_2 _03
stroke(0);
strokeWeight(1);
fill(255);
ellipse(440, 130, 20,20);
ellipse(420, 150, 40,40);

noStroke();
fill(255,0,0);
ellipse(350,95, 90,90);
fill(255);
ellipse(350, 95, 70,70);//button



image(d, 20, 400);


 pushMatrix();
  translate(300,630);
noStroke();

scale(int(1.2));
rotate(1080+270+270+270+270+270+270+270+270+270);

fill(0);
quad(a, 0, a+4+8, 0, a+5+8, 400, a-1-8, 400);
popMatrix();

 //scene_03
  
    /* 
     
     code here to draw something for the 3rd page
     
     */
  }
  else if (card  == 3) { 
   background(255);
smooth();
fill(0);
ellipse(600,600, 200,200);//button
noFill();
stroke(255);
strokeWeight(5);
ellipse(600,600,150,150);//button_in

fill(255,0,0);
text("click!",410, 580); 

ci(0,400, 0, -40,100,1,0,0,0,0,0,0,0);// p_04
strokeWeight(3);

//scene_04

fill(0);
rect(270, 270, 10, 50);
rect(250, 292, 50, 10); 

fill(180);
quad(380, 150, 550, 150, 580, 200, 410, 200);
fill(0);
rect(410,200, 170, 5);
fill(50);
quad(380, 150, 410,200, 410, 205, 380, 155);// rect_1

fill(180);
quad(300, 120, 470, 120, 540, 170, 370, 170);
fill(0);
rect(370,170, 170, 5);
fill(50);
quad(300, 120, 370,170, 370, 175, 300, 125);// rect_2

//pushMatrix();
//translate(600,-250);
//rotate(PI/2-270);

fill(0);
ellipse(430, 460, 150, 50);
rect(355, 450, 10,10);
rect(495, 450, 10,10);

fill(200,200,200);
ellipse(430, 450, 150, 50);//down
noStroke();
ellipse(430, 443, 80, 30);

rect(390, 300, 80, 143);


fill(0);
ellipse(430, 310, 150, 50);
rect(355, 300, 10,10);
rect(495, 300, 10,10);



//line_01
noFill();
stroke(0);

beginShape();
vertex(470, 330);
bezierVertex(500, 380, 200, 505, 420, 300);
bezierVertex(640, 390, 100, 500, 510, 240); 
endShape();

beginShape();
vertex(390, 380);
bezierVertex(360, 385, 420, 405, 470, 400);

endShape();



noStroke();
fill(200,200,200);
ellipse(430, 300, 150, 50);//up


//lines_p04
  for (int i = 0; i < 12; i ++) {

    wave(q+10);
  }

//popMatrix();

fill(0);
ellipse(550,550, 100,100);

    /* 
     
     code here to draw something for the 4th page
     
     */
  }

      else if (card == 4) {  
 background(255);
smooth();
noStroke();


pushMatrix();
translate(425,1150);
rotate(PI/3-270-270-270*2-270-270*3-270*3-270*4);

popMatrix();


pushMatrix();

translate(80,-195);

rotate(PI/3+270);//p07+270+270
fill(180);
quad(400, 150, 570-8, 150, 580-10, 220, 405, 220);
fill(0);
quad(405,220, 570, 220, 565, 225, 399,225);
fill(80);
quad(400, 150, 405,220, 400, 225, 395, 155);

popMatrix();//second rect

//p_05
ci(0,400, 0, 570, 650,int(2.8),1080+270+270+270+270+270+270+270+270,10,270,0,0,0,0 );//big



pushMatrix();

translate(260,-200);

rotate(PI/3);//p07+270
fill(180);
quad(400, 150, 570-8, 150, 580-10, 220, 405, 220);
fill(0);
quad(405,220, 570, 220, 565, 225, 399,225);
fill(80);
quad(400, 150, 405,220, 400, 225, 395, 155);

popMatrix();//first rect

image(li, 0,0);


pushMatrix();
translate(600,-250);
rotate(PI/2-270);

fill(0);
ellipse(430, 460, 150, 50);
rect(355, 450, 10,10);
rect(495, 450, 10,10);

fill(200,200,200);
ellipse(430, 450, 150, 50);//down
noStroke();
ellipse(430, 443, 80, 30);

rect(390, 300, 80, 143);


fill(0);
ellipse(430, 310, 150, 50);
rect(355, 300, 10,10);
rect(495, 300, 10,10);




noStroke();
fill(200,200,200);
ellipse(430, 300, 150, 50);//up


//lines_p04

  for (int i = 0; i < 12; i ++) {

    wave(q+10);
  }

popMatrix();

img(100);//scissor


noStroke();
fill(10,252,153);
rect(540, 0, 60,300);//button _1
fill(255,0,0);
rect(540, 300, 60,300);//button_2
fill(255);
text("A",562, 170 );
text("B", 562, 470);

}
   
   else if (card  == 5) {  
     
   background(255);
smooth();

image(back, 0,0);//background_yellow
     
     noStroke();
     
 image(l, -280, 450,900,400);//big dish

 catt(100);//moving
 
 noStroke();
     fill(200);
     rect(0,0,100,100);//button_1
     fill(10);
     rect(500,500,100,100);//button_2
     stroke(255);
     strokeWeight(5);
     line(20, 50, 80, 20);
     line(20, 50, 80, 80);
     line(580, 550, 520, 520);//arrow_1
     line(580, 550, 520, 580);//arrow_2

   } 
   else if (card  == 6) {  
     background(255,0,0);
     smooth();

   
image(zz, 80, 90,600,450);

caat(100);

 noStroke();
     fill(255);
    rect(0, 0, 300,80);//button_1_5
   
fill(0);
rect(300,0,300,80);//_2_0

fill(0);
text("back", 110,55);
fill(255);
text("replay", 410, 55);

 strokeWeight(1);
}

}


void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    float d = dist(mouseX, mouseY,600,600 );
    if (d < 100) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {
 if((mouseX > x+289) && (mouseX < x+368) && (mouseY > x+34) && (mouseY < w-55)) {
      card = 3;
    } 
    else card = 2;
  }
  else if (card == 3) {

    float d = dist(mouseX, mouseY, 600, 600);
    if (d < 200) {
     
      card = 4;
    }
    else card = 3;
  }  
  else if (card == 4) {
     if((mouseX > y+90) && (mouseX < 600) && (mouseY < y-150) && (mouseY > 0)) {
      card = 5;
    } 
    else if((mouseX > y+90) && (mouseX < 600) && (mouseY > y-150) && (mouseY < 610)) {
      card = 6;
    }
    else card = 4;
  }
 
  else if (card == 5) {
 float pay = dist(mouseX, mouseY, 0,0);
if (pay <100) 
    {
   
    card = 4;
  }
    else if (card == 5) {
 float poy = dist(mouseX, mouseY, 600,600);
if (poy <100) 
    {
   
    card = 6;
  }

else card = 5;
  }
  }
  
  else if(card ==6){
      
     if((mouseY > 0) && (mouseY < h+10) && (mouseX < 300) && (mouseX > 0)) {
      card = 5;
    }   
  else if (card == 6) {
    if((mouseY > 0) && (mouseY < h+10) && (mouseX < 600) && (mouseX > 300)) {
      card = 0;
    }
    else card = 6;
  } 
    
 
}
}
//card

void cu(int r){
  
  
  if(kay <r-50){
    kay += 0.5;
  }
 image(k,0,3*kay);//down _food  
 ci(int(kay), 400, 0, 400, 500,int(1.5),1080+270+270+270+270+270+270+270+270+270,30,270, 0,0,0,0 );

 if(ki > r-176){
   ki -=0.9;
 }
 image(j,0,ki);//chapstick_food
}

 
//moving_p_card_1

void catt(int r){
  

     
     if(fy >r-117){
       fy -= 0.5;
     }
     noStroke();
     

pushMatrix();

translate(80+fy,-195+fy);

rotate(PI/3+270);//p07+270+270
fill(180);
quad(400+fy, 150+fy, 570-8+fy, 150+fy, 580-10+fy, 220+fy, 405+fy, 220+fy);
fill(0);
quad(405+fy,220+fy, 570+fy, 220+fy, 565+fy, 225+fy, 399+fy,225+fy);
fill(80);
quad(400+fy, 150+fy, 405+fy,220+fy, 400+fy, 225+fy, 395+fy, 155+fy);

popMatrix();//second rect
  
  if(fay <r-80){
    fay += 0.6;
  }

  
ci(int(fay),400, 0, 540, 640,int(2.8),1080+270+270+270+270+270+270+270+270,10,270,0,0,0,0 );//big


if (fyy>r-117){
  fyy -=0.5;
}

image(d, 170, 230+fyy-25);//p_06

pushMatrix();

translate(260+fyy,-200+fyy);

rotate(PI/3);//p07+270
fill(180);
quad(400+fyy, 150+fyy, 570-8+fyy, 150+fyy, 580-10+fyy, 220+fyy, 405+fyy, 220+fyy);
fill(0);
quad(405+fyy,220+fyy, 570+fyy, 220+fyy, 565+fyy, 225+fyy, 399+fyy,225+fyy);
fill(80);
quad(400+fyy, 150+fyy, 405+fyy,220+fyy, 400+fyy, 225+fyy, 395+fyy, 155+fyy);

popMatrix();//first rect

image(ff, 0,1.2*fyy);
}
//moving_p_card_5

   
void caat(int r){
  

     
     if(ty <r-80){
       ty += 0.7;
     }
     ci(int(ty),400, 0, 610, 650,int(2.8),1080+270+270+270+270+270+270+270+270,30,270,0,10,0,0 );//broken head
     

  if(tty >r-117){
    tty -= 0.8;
   
  }
  ci(int(tty),400, 0, 550, 700,int(2.8),1080+270+270+270+270+270+270+270+270+270+270,10,270,0,0,300,10 ); //broken end

  if (tyy<r-80){
  tyy +=0.85;
}
pushMatrix();

translate(-150+tyy,75+tyy);

rotate(PI/3+270+270+270);//p07+270+270
fill(180);
quad(400+tyy, 150+tyy, 570-8+tyy, 150+tyy, 580-10+tyy, 220+tyy, 405+tyy, 220+tyy);
fill(0);
quad(405+tyy,220+tyy, 570+tyy, 220+tyy, 565+tyy, 225+tyy, 399+tyy,225+tyy);
fill(80);
quad(400+tyy, 150+tyy, 405+tyy,220+tyy, 400+tyy, 225+tyy, 395+tyy, 155+tyy);

popMatrix();//second rect

image(d, 30, 450+tyy);//p_07


pushMatrix();

translate(58+tyy,-8+tyy);

rotate(PI/3+270);//p07
fill(180);
quad(400+tyy, 150+tyy, 570-8+tyy, 150+tyy, 580-10+tyy, 220+tyy, 405+tyy, 220+tyy);
fill(0);
quad(405+tyy,220+tyy, 570+tyy, 220+tyy, 565+tyy, 225+tyy, 399+tyy,225+tyy);
fill(80);
quad(400+tyy, 150+tyy, 405+tyy,220+tyy, 400+tyy, 225+tyy, 395+tyy, 155+tyy);

popMatrix();//first rect


image(pp, tyy*1.2,tyy*2.8);


}
//moving



void img(int al){
  stroke(255);
  strokeWeight(0);
  line(0, 0, bl, 0);
  if(bl<2*al){
   
    image(ss,0,0);
  }
    
    else 
        image(sc,0,0);
    }
  



void ci(int kay, int c, int v, int g, int s, int t, int f , int w, int e, int m, int n, int r, int h){

  pushMatrix();
  translate(g,s);
noStroke();

scale(t);
rotate(f);

fill(v);
quad(a+kay, 0+kay+2*n, a+4+m+kay, 0+kay+4*n, a+5+m+kay, c-r-3*h+kay, a-1-m+kay, c-r-h+kay);

rotate(e);
quad(b+w+kay, 0+kay+3*n, b+4+w+m+kay, 0+n+kay, b+5+w+m+kay, c-r-2*h+kay, b-1+w-m+kay, c-r-4*h+kay);
popMatrix();//first

}

void wave(int yy) {
  



  noFill();
  stroke(0);
  strokeWeight(4);
  translate(0,yy);

  beginShape();

  curveVertex(390,330);

  curveVertex(390,330);

  curveVertex(406,334);

  curveVertex(422,335);

  curveVertex(438,335);

  curveVertex(454,334);

  curveVertex(470,330);
  
  curveVertex(470,330);

  endShape();


}









