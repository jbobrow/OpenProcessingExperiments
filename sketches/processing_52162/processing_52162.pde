


/////
float r=1;
float g=1;
float b=1;


///włacznik zmienne
boolean wl=false;
boolean wyl=false;
boolean s1=false;
boolean s2=false;
boolean s3=false;
boolean s4=false;
boolean s5=false;
boolean s6=false;

boolean t_cut=false;
boolean behe=false;
boolean stab=false;
boolean n_s=false;
boolean shot=false;
boolean stra=false;
boolean poi=false;
boolean scul_c=false;
boolean beat=false;
boolean h_stop=false;
boolean drown=false;
boolean un=false;
boolean sm=false;

int[] n=new int [25];
int[] da=new int[13];



void setup() {
size(650,700);
frameRate(10);
}


void ozdoby(){
  
stroke(7,147,237);
 fill(7,147,237);
line(240,510,395,510);
line(240,510,229,496);
line(395,510,406, 496);
line(32,220,32, 300);
line(26,8,26, 65);

textSize(20);
  text ("VICTIMS", 280 ,530);
  textSize(30);
  text ("Dexter's kill history", 30 ,30);
  textSize(20);
   text ("TV series visualization ", 30 ,50);
   textSize(10);
   text ("(Cilck on Seasons or  Kill Method squares and/or point names of victims)", 30 ,65);
  strokeWeight(3);
  
textSize(10);
 
  text ("Heart_s - Heart stop", 30 ,645);
   text ("Neck_s - Neck snap", 30 ,655);
    text ("Scull_c - Skull crush", 30 ,665);
    text ("T.cut - Throat cut", 30 ,675); 
    textSize(16);
     text ("Made by R. BombA", 400 ,675); 

fill(7,147,237);
textSize(15);
translate(width/2,height/2);
  rotate(-PI/2);
  text ("Kill Method", 50 ,-300);
  textSize(15);

   text ("Episodes", -90 ,-317);
   
 rotate(PI);
    text ("Episodes", 25 ,-313);
    noStroke();
}





///miernik 
void mierz(){
  if (mouseButton == RIGHT && mousePressed == true){
text (0+(mouseX)+",", 342,40);
text (0+(mouseY), 362,40);
}
  strokeWeight(1);
line (40, 0, 40, 600);
line (0, 220, 600, 220);
for (int i=0; i<=600; i+=20)
{
  line (30, i, 200, i);
  line (i, 210, i, 250);
    textSize(6);
text (0+i, 15,i+5);
text (0+i,i,205);
}


}


///kolory
///stałe elementy
void linie(){

  
  ///color beat
 fill(81,7,85);
 rect (50, 240, 40, 40);
 ///
   fill(91,103,1);///color beheaded color
  rect (90, 240, 40, 40);
 
  ///color drown
 fill(7,147,237);
 rect (130, 240, 40, 40);
   ///color smash
 fill(242,196,7);
 rect (170, 240, 40, 40);
  ///heart stop color
 fill(34,46,46);
 rect (210, 240, 40, 40);
  
   ///neck color
 fill(13,255,152);
 rect (250, 240, 40, 40);
    ///poison color
 fill(206,123,40);
 rect (290, 240, 40, 40);
  
   ///shot color
 fill(116,48,65);
 rect (330, 240, 40, 40);
 
   ///scull color
 fill(52,28,4);
 rect (370, 240, 40, 40);
 

  ///stab solor
   fill (54,167,62);
   rect (410, 240, 40, 40);
   
   ///strangl

 fill(254,3,255);
 rect (450, 240, 40, 40);
   ///t cut
  fill(255,9,0);
   rect (490, 240, 40, 40);
   
   ///unknown 
     fill(149,160,211);
   rect (530, 240, 40, 40);
}

void on_off(){
if (mouseY<=170 && mouseY>=100 && mouseX>60 &&  mouseX<120 && mousePressed 
)
  {
    wl=!wl;
  wyl=!wyl;
 s1=!s1;
 s2=false;
 s3=false;
 s4=false;
 s5=false;
 s6=false;
 
  }
 
   if (mouseY<=170 && mouseY>=100 && mouseX>140 &&  mouseX<210 && mousePressed) 
  {
 
  wl=false;
  wyl=false;
s1=false;
s2=!s2;
s3=false;
s4=false;
 s5=false;
 s6=false;
}
 
    if (mouseY<=170 && mouseY>=100 && mouseX>=210 &&  mouseX<=300 && mousePressed) 
  {
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=!s3;
s4=false;
 s5=false;
 s6=false;
}

if (mouseY<=170 && mouseY>=100 && mouseX>=320 &&  mouseX<=390 && mousePressed) 
  {
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=!s4;
 s5=false;
 s6=false;
}

if (mouseY<=170 && mouseY>=100 && mouseX>=410 &&  mouseX<=480 && mousePressed) 
  {
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=!s5;
 s6=false;
}

if (mouseY<=170 && mouseY>=100 && mouseX>500 &&  mouseX<570 && mousePressed 
)
  {
    wl=false;
  wyl=false;
 s1=false;
 s2=false;
 s3=false;
 s4=false;
 s5=false;
 s6=!s6;
 
  }

 if (mouseY<=280 && mouseY>=240 && mouseX>=290 &&  mouseX<=330 && mousePressed)
  {
poi=!poi;
wl=false;
wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;
  } 

 
  if (mouseY<=280 && mouseY>=240 && mouseX>=330 &&  mouseX<=370 && mousePressed)
  {
shot=!shot;
wl=false;
wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;
  } 

  
  if (mouseY<=280 && mouseY>=240 && mouseX>=450 &&  mouseX<=490 && mousePressed)
  {
stra=!stra;
wl=false;
wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;
  } 
  
  
  
 if (mouseY<=280 && mouseY>=240 && mouseX>=490 &&  mouseX<=530 && mousePressed)
  {
 t_cut=!t_cut;
wl=false;
  wyl=false;
  s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;
  } 
  
   if (mouseY<=280 && mouseY>=240 && mouseX>=90 &&  mouseX<=130 && mousePressed)
  {
 behe=!behe;

  wl=false;
  wyl=false;
  s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;
  } 
     if (mouseY<=280 && mouseY>=240 && mouseX>=410 &&  mouseX<=450 && mousePressed)
  {
 stab=!stab;

  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  } 
  
   if (mouseY<=280 && mouseY>=240 && mouseX>=250 &&  mouseX<=290 && mousePressed)
  {
 n_s=!n_s;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }  
  

   if (mouseY<=280 && mouseY>=240 && mouseX>370 &&  mouseX<=410 && mousePressed)
  {
 scul_c=!scul_c;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    
  
  
 if (mouseY<=280 && mouseY>=240 && mouseX>=50 &&  mouseX<=90 && mousePressed)
  {
 beat=!beat;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    

if (mouseY<=280 && mouseY>=240 && mouseX>=210 &&  mouseX<250 && mousePressed)
  {
 h_stop=!h_stop;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    

///
if (mouseY<=280 && mouseY>=240 && mouseX>=130 &&  mouseX<170 && mousePressed)
  {
drown=!drown;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    

if (mouseY<=280 && mouseY>=240 && mouseX>=531 &&  mouseX<570 && mousePressed)
  {
un=!un;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    
if (mouseY<=280 && mouseY>=240 && mouseX>=170 &&  mouseX<209 && mousePressed)
  {
sm=!sm;
 
  wl=false;
  wyl=false;
s1=false;
s2=false;
s3=false;
s4=false;
 s5=false;
 s6=false;

  }    

}



///tło
void tlo(){
background(255,255,255); }

///epizody

void epizody(){
for (int i=330; i<=500; i+=15)
{
  stroke(0);
  fill(255,9,0);
  ellipse(20, i, 20, 12 );
  ellipse(620, i, 20, 12 );
}
  for (int j=1; j<=12; j+=1)
{
   fill(255,255,255);
  textSize(10);
text ( -(j-13), 16,319+(j*15));
text ( -(j-13), 616,319+(j*15));
}
}

///nazwisko/ epizod
void lin (int e1,int e2, int e3, int e4, int k1, int k2, int g){
strokeWeight(g);
  ellipse(e3, e4, k1, k2 );
line (e1,e2,e3,e4);
}






///SEZONY


///
void kile (int q1,int q2, int q3, int q4, int u1, int s, 
int s1, int s2, float r1, float r2, int sz){
stroke(s,s1,s2);

line (q1,q2,q3,q4);

fill(s,s1,s2);
rect (r1,r2, sz, 7 );
stroke(0);
  ellipse(q1, q2, u1, u1);
  ellipse(q3, q4, u1, u1 );

}


void sezony(){
for (int j=1; j<7; j+=1)
{textSize(15);
text ( "Season" +j, 90*j-35,95);
}
    
for (int i=50; i<=540; i+=90){

  smooth();
strokeWeight(2);
fill(0);
  rect(i,100,70,70);
  fill(219,27,27);
  rect(i+15,115,40,40);

}



///Season1

if (wl||wyl==true){
 

  stroke(0);
  strokeWeight(2);
  smooth();
   ellipse(85, 170, 15, 15 );
 line(85, 175,510, 240);
 ellipse(510, 240, 8, 8 );
  line(85, 176,110, 240);
   ellipse(110, 240, 8, 8 );
 line(85, 176,430, 240);
   ellipse(430, 240, 8, 8 );
}
  
   
if (s1==true || t_cut==true){   
///t/c


stroke(255,9,0);
lin(30,495,230,498,8,8,2);
 lin(31,434,209,472,8,8,2);
 lin(31,434,201,465,8,8,2);
 lin(31,390,193,456,8,8,2);
  lin(31,330,184,447,8,8,2);
////////////I ofiara

 line ((-8.5*n[0])+316,(-8*n[0])+495 ,510, 280);
 fill(255,9,0);
  rect ((-8.5*n[0])+237,(-8*n[0])+493, 76, 8 );


////////////////II ofiara \
 line ((-8.5*n[3])+314,(-8*n[3])+497 ,510, 280);
 fill(255,9,0);

 rect ((-8.5*n[3])+237,(-8*n[3])+492, 76, 8 );

 ////////////////III ofiara \
 line ((-8.5*n[4])+318,(-8*n[4])+495 ,510, 280);
 fill(255,9,0);

 rect ((-8.5*n[4])+237,(-8*n[4])+491, 76, 8 );
  ////////////////IV ofiara \
  line ((-8.5*n[5])+327,(-8*n[5])+495 ,510, 280);
 fill(255,9,0);

 rect ((-8.5*n[5])+240,(-8*n[5])+491, 84, 8 );
  ////////////////V ofiara \
  line ((-8.5*n[6])+300,(-8*n[6])+500 ,510, 280);
 fill(255,9,0);
 rect ((-8.5*n[6])+240,(-8*n[6])+491, 70, 8 );
 
  fill(255,9,0);
stroke(0);
ellipse((-8.5*n[0])+316,(-8*n[0])+497, 8, 8 );
 ellipse(510, 280, 8, 8 );
 ellipse((-8.5*n[3])+314,(-8*n[3])+497, 8, 8 );
 ellipse((-8.5*n[4])+318,(-8*n[4])+497, 8, 8 );
 ellipse((-8.5*n[5])+327,(-8*n[5])+495, 8, 8 );
  ellipse((-8.5*n[6])+308,(-8*n[6])+496, 8, 8 );
 noStroke();
 
}

 if (s1==true||stab==true){

///stab

stroke(54,167,62);
lin(32,480,215,480,8,8,2);
 line ((-8.5*n[2])+320,(-8*n[2])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[2])+237,(-8*n[2])+491, 75, 8 );

stroke(0);
fill(216,255,0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[2])+320,(-8*n[2])+495, 8, 8 );

noStroke();
   }

if (s1==true|| behe==true){ 
 ///behead


stroke(91,103,1);
  lin(30,495,223,488,8,8,2);
 line ((-8.5*n[1])+320,(-8*n[1])+495, 110, 280 );
fill(91,103,1);
rect ((-8.5*n[1])+237,(-8*n[1])+492, 77, 7 );
fill(216,255,0);
stroke(0);
fill(91,103,1);
ellipse((-8.5*n[1])+322, (-8*n[1])+495, 8, 8 );
ellipse(110, 280, 8, 8 );
noStroke();
}
///Season2

if (s2==true){
  stroke(0);
  strokeWeight(2);
  smooth();
  ellipse(175, 170, 15, 15 );

 
 ellipse(110, 240, 8, 8 );
  line(175, 175,110, 238);

 line(175, 175,430, 240);
   ellipse(430, 240, 8, 8 );

line(175, 175,350, 240);
ellipse(350, 240, 8, 8 );

line(175, 175,270, 240);
ellipse(270, 240, 8, 8 );
   
}
   if (s2==true||stab==true){

///stab
stroke(54,167,62);
 lin(30,480,175,440,8,8,2);
 lin(30,465,165,432,8,8,2);
 lin(30,330,117,382,8,8,2);
///Iofiara
 line ((-8.5*n[7])+302,(-8*n[7])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[7])+237,(-8*n[7])+491, 70, 8 );
stroke(0);
fill(216,255,0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[7])+302,(-8*n[7])+495, 8, 8 );
noStroke();

///II ofiara
stroke(54,167,62);

 line ((-8.5*n[8])+302,(-8*n[8])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[8])+237,(-8*n[8])+491, 70, 8 );

fill(216,255,0);
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[8])+302,(-8*n[8])+495, 8, 8 );
noStroke();

///III ofiara
stroke(54,167,62);

 line ((-8.5*n[14])+292,(-8*n[14])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[14])+237,(-8*n[14])+491, 60, 8 );

fill(216,255,0);
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[14])+292,(-8*n[14])+495, 8, 8 );
noStroke();
   }
   



///neck_s

///ofiara I
if (s2==true|| n_s==true){ 
stroke(13,255,152);
  lin(30,360,138,409,8,8,2);
   lin(30,345,130,401,8,8,2);
 line ((-8.5*n[11])+300,(-8*n[11])+495, 270, 280 );
 fill(13,255,152);
rect ((-8.5*n[11])+237,(-8*n[11])+492, 70, 8 );
fill(216,255,0);
stroke(0);
fill(13,255,152);
ellipse((-8.5*n[11])+300, (-8*n[11])+495, 8, 8 );
ellipse(270, 280, 8, 8 );
noStroke();

///ofiara II
if (s2==true|| n_s==true){ 
stroke(13,255,152);
 line ((-8.5*n[12])+322,(-8*n[12])+495, 270, 280 );
 fill(13,255,152);
rect ((-8.5*n[12])+237,(-8*n[12])+492, 80, 8 );
fill(216,255,0);
stroke(0);
fill(13,255,152);
ellipse((-8.5*n[12])+322, (-8*n[12])+495, 8, 8 );
ellipse(270, 280, 8, 8 );
noStroke();
}
}
///shot 


if (s2==true||shot==true){ 
stroke(116,48,65);
lin(30,345,124,391,8,8,2);
line ((-8.5*n[13])+322,(-8*n[13])+495, 350, 280 );
 fill(116,48,65);
rect ((-8.5*n[13])+237,(-8*n[13])+492, 77, 8 );
fill(116,48,65);
stroke(0);
fill(116,48,65);
ellipse((-8.5*n[13])+322, (-8*n[13])+495, 8, 8 );
ellipse(350, 280, 8, 8 );
noStroke();
}
if (s2==true|| behe==true){ 
 ///behead
///behead
///ofiara 1
stroke(91,103,1);
 lin(30,420,157,425,8,8,2);
  lin(30,390,150,417,8,8,2);
 line ((-8.5*n[9])+305,(-8*n[9])+495, 110, 280 );
fill(91,103,1);
rect ((-8.5*n[9])+237,(-8*n[9])+492, 70, 8 );
fill(216,255,0);
stroke(0);
fill(91,103,1);
ellipse((-8.5*n[9])+305, (-8*n[9])+495, 8, 8 );
ellipse(110, 280, 8, 8 );
noStroke();///

///ofiara II
stroke(91,103,1);
 line ((-8.5*n[10])+317,(-8*n[10])+495, 110, 280 );
fill(91,103,1);
rect ((-8.5*n[10])+237,(-8*n[10])+492, 74, 8 );
fill(216,255,0);
stroke(0);
fill(91,103,1);
ellipse((-8.5*n[10])+317, (-8*n[10])+495, 8, 8 );
ellipse(110, 280, 8, 8 );
noStroke();

}



///Season 3
if (s3==true){
  stroke(0);
  strokeWeight(2);
  smooth();
   ellipse(267, 170, 15, 15 );
line(267, 176,110, 240);
ellipse(110, 240, 8, 8 );
line(430, 240,267, 176);
ellipse(430, 240, 8, 8 );
line(470, 240,267, 176);
ellipse(470, 240, 8, 8 );
line(310, 240,267, 176);
ellipse(310, 240, 8, 8 );
line(270, 240,267, 176);
ellipse(270, 240, 8, 8 );
noStroke();
}
   

if (s3==true|| behe==true){ 
 ///behead
///ofiara 1
stroke(91,103,1);
lin(30,495,73,345,8,8,2);
 line ((-8.5*n[19])+323,(-8*n[19])+495, 110, 280 );
fill(91,103,1);
rect ((-8.5*n[19])+237,(-8*n[19])+492, 82, 8 );
fill(216,255,0);
stroke(0);
fill(91,103,1);
ellipse((-8.5*n[19])+323, (-8*n[19])+495, 8, 8 );
ellipse(110, 280, 8, 8 );
noStroke();///
   }
///stab

if (s3==true||stab==true){
stroke(0);
  lin(31,425,36,303,8,8,2);

///stab
stroke(54,167,62);
lin(30,495,65,336,8,8,2);
lin(30,480,58,327,8,8,2);
lin(31,435,43,311,8,8,2);
///Iofiara
 line ((-8.5*n[20])+304,(-8*n[20])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[20])+237,(-8*n[20])+491, 70, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[20])+304,(-8*n[20])+495, 8, 8 );


//ofiara 2
stroke(54,167,62);
line ((-8.5*n[21])+310,(-8*n[21])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[21])+237,(-8*n[21])+491, 70, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[21])+310,(-8*n[21])+495, 8, 8 );


///ofiara III
stroke(54,167,62);
line ((-8.5*n[23])+308,(-8*n[23])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[23])+237,(-8*n[23])+491, 70, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[23])+308,(-8*n[23])+495, 8, 8 );


///ofiara IV
stroke(54,167,62);
line ((-8.5*n[24])+310,(-8*n[24])+495, 430, 280 );
 fill (54,167,62);
rect ((-8.5*n[24])+237,(-8*n[24])+491, 70, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[24])+310,(-8*n[24])+495, 8, 8 );
noStroke();
}

////strangl
if (s3==true||stra==true){


stroke(254,3,255);
lin(31,464,50,319,8,8,2);
lin(609,345,415,488,8,8,2);
///Iofiara
 line ((-8.5*n[22])+317,(-8*n[22])+495, 470, 280 );
fill(254,3,255);
rect ((-8.5*n[22])+237,(-8*n[22])+491, 80, 8 );
stroke(0);
ellipse(470, 280, 8, 8 );
ellipse((-8.5*n[22])+317,(-8*n[22])+495, 8, 8 );
noStroke();
///ofiara II
stroke(254,3,255);
line ((-8.5*n[1])+350,(-8*n[1])+495, 470, 280 );
fill(254,3,255);
rect ((-8.5*n[1])+350,(-8*n[1])+491, 75, 8 );
stroke(0);
ellipse(470, 280, 8, 8 );
ellipse((-8.5*n[1])+350,(-8*n[1])+495, 8, 8 );
noStroke();
}


///poison
if (s3==true||poi==true){


stroke(206,123,40);
lin(609,405,403,496,8,8,2);
line ((-8.5*n[0])+330,(-8*n[0])+495, 310, 280 );
fill(206,123,40);
rect ((-8.5*n[0])+330,(-8*n[0])+491, 75, 8 );
stroke(0);
ellipse(310, 280, 8, 8 );
ellipse((-8.5*n[0])+330,(-8*n[0])+495, 8, 8 );
noStroke();
}
///neck-s
if (s3==true|| n_s==true){ 
stroke(13,255,152);
lin(609,330,417,480,8,8,2);
line ((-8.5*n[2])+363,(-8*n[2])+495, 270, 280 );
fill(13,255,152);
rect ((-8.5*n[2])+370,(-8*n[2])+491, 70, 8 );
stroke(0);
ellipse(270, 280, 8, 8 );
ellipse((-8.5*n[2])+363,(-8*n[2])+495, 8, 8 );
noStroke();

}

///Season 4

if (s4==true){
  stroke(0);
  strokeWeight(2);
  smooth();
  ellipse(355, 170, 15, 15 ); 
  
line(430, 240,355, 176);///stab
ellipse(430, 240, 8, 8 );

line(355, 176,110, 240);///behed
ellipse(110, 240, 8, 8 );

line(355, 176,510, 240);////t.cut
 ellipse(510, 240, 8, 8 );
 
 line(355, 176,390, 240);////scull crash
 ellipse(390, 240, 8, 8 );
}
   
   
   ///stab
if (s4==true||stab==true){
  ///ofiara I
stroke(54,167,62);
lin(609,495,435,473,8,8,2);
lin(609,450,434,465,8,8,2);

line ((-8.5*n[3])+383,(-8*n[3])+495, 430, 280 );
fill(54,167,62);
rect ((-8.5*n[3])+383,(-8*n[3])+491, 74, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[3])+383,(-8*n[3])+495, 8, 8 );

///ofiara II
stroke(54,167,62);
line ((-8.5*n[4])+398,(-8*n[4])+495, 430, 280 );
fill(54,167,62);
rect ((-8.5*n[4])+397,(-8*n[4])+491, 70, 8 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[4])+398,(-8*n[4])+495, 8, 8 );
noStroke();
} 
 ///beheded

if (s4==true||behe==true){
  ///ofiara I
stroke(91,103,1);
lin(609,404,460,455,8,8,2);
line ((-8.5*n[5])+415,(-8*n[5])+495, 110, 280 );
fill(91,103,1);
rect ((-8.5*n[5])+415,(-8*n[5])+491, 83, 8 );
stroke(0);
ellipse(110, 280, 8, 8 );
ellipse((-8.5*n[5])+415,(-8*n[5])+495, 8, 8 );
noStroke();
}  


if (s4==true||sm==true){   
////smash

stroke(242,196,7);
lin(609,329,471,441,8,8,2);
////////////I ofiara
 line ((-8.5*n[7])+450,(-8.15*n[7])+495 ,190, 280);
 fill(242,196,7);
  rect ((-8.5*n[7])+450,(-8.2*n[7])+494, 77, 8 );
  stroke(0);
  ellipse((-8.5*n[7])+452,(-8.15*n[7])+495, 8, 8 );
 ellipse(190, 280, 8, 8 );
noStroke();
}



///t_c
if (s4==true || t_cut==true){   
///t/c
stroke(255,9,0);
lin(609,345,453,447,8,8,2);
////////////I ofiara
 line ((-8.5*n[6])+430,(-8.15*n[6])+495 ,510, 280);
 fill(255,9,0);
  rect ((-8.5*n[6])+430,(-8.2*n[6])+495, 74, 5 );
  stroke(0);
  ellipse((-8.5*n[6])+430,(-8.15*n[6])+495, 8, 8 );
 ellipse(510, 280, 8, 8 );
noStroke();
}
////SEAZON 5

if (s5==true){
  stroke(0);
  strokeWeight(2);
  smooth();
  ellipse(450, 170, 15, 15 ); 
  
line(430, 240,450, 176);///stab
ellipse(430, 240, 8, 8 );

line(70, 240,450, 176);///beaten 
ellipse(70, 240, 8, 8 );

line(270, 240,450, 176);///neck_s 
ellipse(270, 240, 8, 8 );

line(470, 240,450, 176);///strangle
ellipse(470, 240, 8, 8 );
}
///BEAT
if (s5==true || beat==true){   

stroke(81,7,85);
lin(609,496,443,431,8,8,2);
////////////I ofiara
 line ((-8.5*n[8])+465,(-8.15*n[8])+495 ,70, 280);
 fill(81,7,85);
  rect ((-8.5*n[8])+465,(-8.2*n[8])+493, 40, 8 );
  stroke(0);
  ellipse((-8.5*n[8])+465,(-8.15*n[8])+497, 8, 8 );
 ellipse(70, 280, 8, 8 );
noStroke();
}

////Beat
if (s5==true || beat==true){   

stroke(81,7,85);
////////////I ofiara
 line ((-8.5*n[8])+465,(-8.15*n[8])+495 ,70, 280);
 fill(81,7,85);
  rect ((-8.5*n[8])+465,(-8.2*n[8])+495, 50, 6 );
  stroke(0);
  ellipse((-8.5*n[8])+465,(-8.15*n[8])+497, 8, 8 );
 ellipse(70, 280, 8, 8 );
noStroke();
}

///neck s
if (s5==true|| n_s==true){ 
stroke(13,255,152);
lin(609,420,487,414,8,8,2);
line ((-8.5*n[10])+500,(-8.15*n[10])+495 ,270, 280);
 fill(13,255,152);
  rect ((-8.5*n[10])+500,(-8.2*n[10])+495, 70, 7);
  stroke(0);
  ellipse((-8.5*n[10])+500,(-8.15*n[10])+497, 8, 8 );
 ellipse(270, 280, 8, 8 );
noStroke();
}


////strangle

if (s5==true||stra==true){
stroke(254,3,255);
lin(609,420,510,408,8,8,2);
line ((-8.5*n[11])+518,(-8.15*n[11])+495 ,470, 280);
 fill(254,3,255);
  rect ((-8.5*n[11])+518,(-8.2*n[11])+495, 80, 6 );
  stroke(0);
  ellipse((-8.5*n[11])+518,(-8.15*n[11])+497, 8, 8 );
 ellipse(470, 280, 8, 8 );
noStroke();

}


///stab
if (s5==true||stab==true){
  ///ofiara I
stroke(54,167,62);
lin(609,464,471,424,8,8,2);
lin(609,390,506,400,8,8,2);
lin(609,345,500,393,8,8,2);
line ((-8.5*n[9])+484,(-8*n[9])+495, 430, 280 );
fill(54,167,62);
rect ((-8.5*n[9])+484,(-8*n[9])+491, 70, 7 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[9])+484,(-8*n[9])+495, 8, 8 );


////ofiara II
stroke(54,167,62);
line ((-8.5*n[12])+535,(-8*n[12])+495, 430, 280 );
fill(54,167,62);
rect ((-8.5*n[12])+535,(-8*n[12])+493, 70, 6 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[12])+535,(-8*n[12])+495, 8, 8 );

///ofiara III
stroke(54,167,62);
line ((-8.5*n[13])+550,(-8*n[13])+495, 430, 280 );
fill(54,167,62);
rect ((-8.5*n[13])+550,(-8*n[13])+493, 65, 6 );
stroke(0);
ellipse(430, 280, 8, 8 );
ellipse((-8.5*n[13])+550,(-8*n[13])+495, 8, 8 );
noStroke();
}

if (s5==true||un==true){

stroke(149,160,211) ; 
lin(30,495,111,376,8,8,2); 
lin(30,495,102,369,8,8,2);
lin(30,495,90,360,8,8,2);
lin(30,495,83,353,8,8,2);
kile(550,280, 174,377,8,149,160,211,110,373,60);
kile(550,280, 171,368,8,149,160,211,106,365,63);
kile(550,280, 159,360,8,149,160,211,95,357,63);
kile(550,280, 155,351,8,149,160,211,85,349,63);
}



///SEZON6
if (s6==true){
  stroke(0);
  strokeWeight(2);
  smooth();
  ellipse(535, 170, 15, 15 ); 
  
line(430, 240,535, 176);///stab
ellipse(430, 240, 8, 8 );

line(148, 240,535, 176);///drown
ellipse(148, 240, 8, 8 );

line(229, 240,535, 176);///heart stop
ellipse(229, 240, 8, 8 );

line(308, 240,535, 176);///poison
ellipse(308, 240, 8, 8 );

line(469, 240,535, 176);///strangle
ellipse(469, 240, 8, 8 );

line(508, 240,535, 176);///t.cut
ellipse(508, 240, 8, 8 );


line(389, 240,535, 176);///scull c.
ellipse(389, 240, 8, 8 );
}



if (s6==true|| h_stop==true){

 ///h_stop
 lin(610,495,478,384,8,8,2);
 lin(610,495,495,377,8,8,2);
kile(230,280, 448,382,8,34,46,46,453,380,20);
kile(230,280, 458,374,8,34,46,46,462,372,30);

}


///poison
if (s6==true||poi==true){

kile(310,280, 516,319,8,206,123,40,518,315,70);
stroke(206,123,40);
 lin(610,344,585,320,8,8,2);
}



 ///stabb i scull_c
if (s6==true|| stab==true||scul_c==true){

kile(390,280, 465,367,8,52,28,4,469,365,60);

}



if (s6==true|| stab==true){
  
 ///stabb 
kile(430,280, 465,367,8,54,167,62,469,365,60);
kile(430,280, 500,335,8,54,167,62,503,332,40);
kile(430,280, 508,327,8,54,167,62,510,324,70);
kile(430,280, 526,311,8,54,167,62,526,309,44);
kile(430,280, 533,303,8,54,167,62,535,301,75);
stroke(54,167,62);
 lin(610,495,530,368,8,8,2);
  lin(610,405,537,335,8,8,2);
 lin(610,360,580,327,8,8,2);
  lin(610,330,571,312,8,8,2);
    lin(610,330,614,304,8,8,2);
}


///t_cut
if (s6==true|| t_cut==true){


kile(510,280, 475,359,8,255,9,0,477,356,60);
stroke(255,9,0);
 lin(610,479,541,360,8,8,2);


}


///strangle
if (s6==true|| stra==true){

kile(470,280, 483,351,8,254,3,255,488,347,70);
stroke(254,3,255);
 lin(610,466,563,351,8,8,2);
}

///drowned
if (s6==true||drown==true){
kile(150,280, 492,343,8,7,147,237,494,340,40);
stroke(7,147,237);
 lin(610,420,532,341,8,8,2);
}


}
///nazwiska i metody

void kill(){
    String[] dane = loadStrings( "dexter metody zbrodni Zeszyt1.csv" );
//wczytuje dane
for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] nazwa = dane[i].split(";");

 
strokeWeight(2);
fill(255,255,255);

textSize(9);
text ( nazwa[0], (40*i)+54,263);
}
  }

void nazwiska(){
    String[] dane = loadStrings( "nazwiska.csv" );
//wczytuje dane
for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] nazwa = dane[i].split(";");
 
  n[i]= int(i);
strokeWeight(2);
fill(0,0,0);
textSize(10);
text ( nazwa[0], (-8.5*i)+240,(-8*i)+500);
text ( nazwa[1], (8.5*i)+335,(-8*i)+500);
}

}


////powody mordów

void powody() {

String[] dane = loadStrings( "adexter kills.csv" );
for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
///dane[2].split( ";" )[1]
}

if (mouseX<320 && mouseY>492 && mouseY<500){ 
riz(0);
text (dane[1].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>484 && mouseY<492){ 
riz(1);
text (dane[2].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>476 && mouseY<484){ 
riz(2);
text (dane[3].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>468 && mouseY<476){ 
riz(3);
text (dane[4].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>460 && mouseY<468){ 
riz(4);
text (dane[5].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>452 && mouseY<460){ 
riz(5);
text (dane[6].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>444 && mouseY<452){ 
riz(6);
text (dane[7].split( ";" )[1], 180 ,610);
}


if (mouseX<320 && mouseY>436 && mouseY<444){ 
riz(7);
text (dane[8].split( ";" )[1], 180 ,610);
}



if (mouseX<320 && mouseY>428 && mouseY<436){ 
riz(8);
text (dane[9].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>420 && mouseY<428){ 
riz(9);
text (dane[10].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>412 && mouseY<420){ 
riz(10);
text (dane[11].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>404 && mouseY<412){ 
riz(11);
text (dane[12].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>396 && mouseY<404){ 
riz(12);
text (dane[13].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>388 && mouseY<396){ 
riz(13);
text (dane[14].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>380 && mouseY<388){ 
riz(14);
text (dane[15].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>372 && mouseY<380){ 
riz(15);
text (dane[16].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>364 && mouseY<372){ 
riz(16);
text (dane[17].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>356 && mouseY<364){ 
riz(17);
text (dane[18].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>348 && mouseY<356){ 
riz(18);
text (dane[19].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>340 && mouseY<348){ 
riz(19);
text (dane[20].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>332 && mouseY<340){ 
riz(20);
text (dane[21].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>324 && mouseY<332){ 
riz(21);
text (dane[22].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>316 && mouseY<324){ 
riz(22);
text (dane[23].split( ";" )[1], 180 ,610);
}

if (mouseX<320 && mouseY>308 && mouseY<316){ 
riz(23);
text (dane[24].split( ";" )[1], 180 ,610);
}


if (mouseX<320 && mouseY>300 && mouseY<308){ 
riz(24);
text (dane[25].split( ";" )[1], 180 ,610);
}

///////////////strona prawa

if (mouseX>320 && mouseY>492 && mouseY<500){ 
riz2(0);
text (dane[26].split( ";" )[1], 180 ,610);
}


if (mouseX>320 && mouseY>484 && mouseY<492){ 
riz2(1);
text (dane[27].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>476 && mouseY<484){ 
riz2(2);
text (dane[28].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>468 && mouseY<476){ 
riz2(3);
text (dane[29].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>460 && mouseY<468){ 
riz2(4);
text (dane[30].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>452 && mouseY<460){ 
riz2(5);
text (dane[31].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>444 && mouseY<452){ 
riz2(6);
text (dane[32].split( ";" )[1], 180 ,610);
}


if (mouseX>320 && mouseY>436 && mouseY<444){ 
riz2(7);
text (dane[33].split( ";" )[1], 180 ,610);
}



if (mouseX>320 && mouseY>428 && mouseY<436){ 
riz2(8);
text (dane[34].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>420 && mouseY<428){ 
riz2(9);
text (dane[35].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>412 && mouseY<420){ 
riz2(10);
text (dane[36].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>404 && mouseY<412){ 
riz2(11);
text (dane[37].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>396 && mouseY<404){ 
riz2(12);
text (dane[38].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>388 && mouseY<396){ 
riz2(13);
text (dane[39].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>380 && mouseY<388){ 
riz2(14);
text (dane[40].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>372 && mouseY<380){ 
riz2(15);
text (dane[41].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>364 && mouseY<372){ 
riz2(16);
text (dane[42].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>356 && mouseY<364){ 
riz2(17);
text (dane[43].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>348 && mouseY<356){ 
riz2(18);
text (dane[44].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>340 && mouseY<348){ 
riz2(19);
text (dane[45].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>332 && mouseY<340){ 
riz2(20);
text (dane[46].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>324 && mouseY<332){ 
riz2(21);
text (dane[47].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>316 && mouseY<324){ 
riz2(22);
text (dane[48].split( ";" )[1], 180 ,610);
}

if (mouseX>320 && mouseY>308 && mouseY<316){ 
riz2(23);
text (dane[49].split( ";" )[1], 180 ,610);
}


if (mouseX>320 && mouseY>300 && mouseY<308){ 
riz2(24);
text (dane[50].split( ";" )[1], 180 ,610);
}


}
////do ram i przyczyn sztafarz

void riz(int naz){
stroke(0);
fill(255);
rect ((-8.5*n[naz])+237,(-8*n[naz])+493, 83, 8 );
fill(7,147,237);
textSize(15); 
text ("REASON:", 100 ,610);
fill(0);
stroke(7,147,237);
line(100,612,600,612);
noStroke();

}

void riz2(int naz){
stroke(0);
fill(255);
rect ((8.5*n[naz])+330,(-8*n[naz])+491, 74, 8 );

textSize(15); 
fill(7,147,237);
text ("REASON:", 100 ,610);
fill(0);
stroke(7,147,237);
line(100,612,600,612);
noStroke();
}


void draw(){
       

 
  tlo();
   epizody();
  on_off();
 

 
  
  linie();
  


 sezony();

  powody();
  kill();
  nazwiska();
 ozdoby();


}

