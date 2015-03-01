
PImage Diamond;
PImage Drop;

float y1 = -20;
float y2 = -20;
float y3 = -20;
float y4 = -20;
float y5 = -20;
float y6 = -20;
float y7 = -20;
float y8 = -20;
float y9 = -20;
float y10 = -20;
float y11 = -20;
float y12 = -20;
float y13 = -20;
float y14 = -20;
float y15 = -20;
float y16 = -20;
float y17 = -20;
float y18 = -20;
float y19 = -20;
float y20 = -20;
float y21 = -20;
float y22 = -20;
float y23 = -20;
float y24 = -20;
float y25 = -20;
float y26 = -20;
float y27 = -20;
float y28 = -20;
float y29 = -20;
float y30 = -20;
float y31 = -20;
float y32 = -20;
float y33 = -20;
float y34 = -20;
float y35 = -20;
float y36 = -20;
float y37 = -20;
float y38 = -20;
float y39 = -20;
float y40 = -20;
float y41 = -20;
float y42 = -20;
float y43 = -20;
float y44 = -20;
float y45 = -20;
float y46 = -20;
float y47 = -20;
float y48 = -20;
float y49 = -20;
float y50 = -20;
float y51 = -20;
float y52 = -20;
float y53 = -20;
float y54 = -20;
float y55 = -20;
float y56 = -20;
float y57 = -20;
float y58 = -20;
float y59 = -20;
float y60 = -20;
float y61 = -20;
float y62 = -20;
float y63 = -20;
float y64 = -20;
float y65 = -20;
float y66 = -20;
float y67 = -20;
float y68 = -20;

float speed1 = random(1,5);
float speed2 = random(1,5);
float speed3 = random(1,5);
float speed4 = random(1,5);
float speed5 = random(1,5);
float speed6 = random(1,5);
float speed7 = random(1,5);
float speed8 = random(1,5);
float speed9 = random(1,5);
float speed10 = random(1,5);
float speed11 = random(1,5);
float speed12 = random(1,5);
float speed13 = random(1,5);
float speed14 = random(1,5);
float speed15 = random(1,5);
float speed16 = random(1,5);
float speed17 = random(1,5);
float speed18 = random(1,5);
float speed19 = random(1,5);
float speed20 = random(1,5);
float speed21 = random(1,5);
float speed22 = random(1,5);
float speed23 = random(1,5);
float speed24 = random(1,5);
float speed25 = random(1,5);
float speed26 = random(1,5);
float speed27 = random(1,5);
float speed28 = random(1,5);
float speed29 = random(1,5);
float speed30 = random(1,5);
float speed31 = random(1,5);
float speed32 = random(1,5);
float speed33 = random(1,5);
float speed34 = random(1,5);
float speed35 = random(1,5);
float speed36 = random(1,5);
float speed37 = random(1,5);
float speed38 = random(1,5);
float speed39 = random(1,5);
float speed40 = random(1,5);
float speed41 = random(1,5);
float speed42 = random(1,5);
float speed43 = random(1,5);
float speed44 = random(1,5);
float speed45 = random(1,5);
float speed46 = random(1,5);
float speed47 = random(1,5);
float speed48 = random(1,5);
float speed49 = random(1,5);
float speed50 = random(1,5);
float speed51 = random(1,5);
float speed52 = random(1,5);
float speed53 = random(1,5);
float speed54 = random(1,5);
float speed55 = random(1,5);
float speed56 = random(1,5);
float speed57 = random(1,5);
float speed58 = random(1,5);
float speed59 = random(1,5);
float speed60 = random(1,5);
float speed61 = random(1,5);
float speed62 = random(1,5);
float speed63 = random(1,5);
float speed64 = random(1,5);
float speed65 = random(1,5);
float speed66 = random(1,5);
float speed67 = random(1,5);
float speed68 = random(1,5);

void setup (){
  size(500,500);
  background(0);
  noCursor();
  rectMode(CENTER);
  Diamond = loadImage ("http://www.clipartqueen.com/image-files/black-white-butterfly-silhouette.png");
  Drop = loadImage ("http://www.swillyfuels.ie/prodimages/oil-drop.png");
}

void draw() {
  
  fill(250,70);
  rect(250,250,width,height);
  
  int DiamondWidth = Diamond.width;
  int DiamondHeight = Diamond.height;
  int DropWidth = Drop.width;
  int DropHeight = Drop.height;
  
  println(DiamondWidth + "x" + DiamondHeight + " " + DropWidth + "x" + DropHeight);
  
  image(Drop,mouseX-22,y1,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-35,y2,DropWidth/8,DropHeight/8); 
  image(Drop,mouseX-15,y3,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-10,y4,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-5,y5,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+5,y6,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+15,y7,DropWidth/9,DropHeight/9);
  image(Drop,mouseX+22,y8,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+27,y9,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+32,y10,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+34,y11,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+45,y12,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+50,y13,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+56,y14,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+59,y15,DropWidth/9,DropHeight/9);
  image(Drop,mouseX+66,y16,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+76,y17,DropWidth/3,DropHeight/3);
  image(Drop,mouseX+84,y18,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+97,y19,DropWidth/9,DropHeight/9);
  image(Drop,mouseX+109,y20,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+115,y21,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+126,y22,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+138,y23,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+147,y24,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+156,y25,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+166,y26,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+174,y27,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+177,y28,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+188,y29,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+192,y30,DropWidth/5,DropHeight/5);
  image(Drop,mouseX+209,y31,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+216,y32,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+222,y33,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+235,y34,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+245,y35,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+256,y36,DropWidth/5,DropHeight/5);
  image(Drop,mouseX+261,y37,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+270,y38,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+277,y39,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+289,y40,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+298,y41,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+301,y42,DropWidth/4,DropHeight/5);
  image(Drop,mouseX+309,y43,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+312,y44,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+328,y45,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+337,y46,DropWidth/5,DropHeight/5);
  image(Drop,mouseX+345,y47,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+356,y48,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+366,y49,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+375,y50,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+382,y51,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+388,y52,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+393,y53,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+401,y54,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+409,y55,DropWidth/9,DropHeight/9);
  image(Drop,mouseX+417,y56,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+428,y57,DropWidth/5,DropHeight/5);
  image(Drop,mouseX+435,y58,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+444,y59,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+456,y60,DropWidth/5,DropHeight/5);
  image(Drop,mouseX+467,y61,DropWidth/6,DropHeight/6);
  image(Drop,mouseX+478,y62,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+483,y63,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+489,y64,DropWidth/4,DropHeight/4);
  image(Drop,mouseX+497,y65,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+502,y66,DropWidth/8,DropHeight/8);
  image(Drop,mouseX+507,y67,DropWidth/7,DropHeight/7);
  image(Drop,mouseX+516,y68,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-22,y1,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-35,y2,DropWidth/8,DropHeight/8); 
  image(Drop,mouseX-15,y3,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-10,y4,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-5,y5,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-5,y6,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-15,y7,DropWidth/9,DropHeight/9);
  image(Drop,mouseX-22,y8,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-27,y9,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-32,y10,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-34,y11,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-45,y12,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-50,y13,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-56,y14,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-59,y15,DropWidth/9,DropHeight/9);
  image(Drop,mouseX-66,y16,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-76,y17,DropWidth/3,DropHeight/3);
  image(Drop,mouseX-84,y18,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-97,y19,DropWidth/9,DropHeight/9);
  image(Drop,mouseX-109,y20,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-115,y21,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-126,y22,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-138,y23,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-147,y24,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-156,y25,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-166,y26,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-174,y27,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-177,y28,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-188,y29,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-192,y30,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-209,y31,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-216,y32,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-222,y33,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-235,y34,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-245,y35,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-256,y36,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-261,y37,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-270,y38,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-277,y39,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-289,y40,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-298,y41,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-301,y42,DropWidth/4,DropHeight/5);
  image(Drop,mouseX-309,y43,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-312,y44,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-328,y45,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-337,y46,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-345,y47,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-356,y48,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-366,y49,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-375,y50,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-382,y51,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-388,y52,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-393,y53,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-401,y54,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-409,y55,DropWidth/9,DropHeight/9);
  image(Drop,mouseX-417,y56,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-428,y57,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-435,y58,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-444,y59,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-456,y60,DropWidth/5,DropHeight/5);
  image(Drop,mouseX-467,y61,DropWidth/6,DropHeight/6);
  image(Drop,mouseX-478,y62,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-483,y63,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-489,y64,DropWidth/4,DropHeight/4);
  image(Drop,mouseX-497,y65,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-502,y66,DropWidth/8,DropHeight/8);
  image(Drop,mouseX-507,y67,DropWidth/7,DropHeight/7);
  image(Drop,mouseX-516,y68,DropWidth/5,DropHeight/5);
  y1 = y1 + speed1;
  y2 = y2 + speed2;
  y3 = y3 + speed3;
  y4 = y4 + speed4;
  y5 = y5 + speed5;
  y6 = y6 + speed6;
  y7 = y7 + speed7;
  y8 = y8 + speed8;
  y9 = y9 + speed9;
  y10 = y10 + speed10;
  y11 = y11 + speed11;
  y12 = y12 + speed12;
  y13 = y13 + speed13;
  y14 = y14 + speed14;
  y15 = y15 + speed15;
  y16 = y16 + speed16;
  y17 = y17 + speed17;
  y18 = y18 + speed18;
  y19 = y19 + speed19;
  y20 = y20 + speed20;
  y21 = y21 + speed21;
  y22 = y22 + speed22;
  y23 = y23 + speed23;
  y24 = y24 + speed24;
  y25 = y25 + speed25;
  y26 = y26 + speed26;
  y27 = y27 + speed27;
  y28 = y28 + speed28;
  y29 = y29 + speed29;
  y30 = y30 + speed30;
  y31 = y31 + speed31;
  y32 = y32 + speed32;
  y33 = y33 + speed33;
  y34 = y34 + speed34;
  y35 = y35 + speed35;
  y36 = y36 + speed36;
  y37 = y37 + speed37;
  y38 = y38 + speed38;
  y39 = y39 + speed39;
  y40 = y40 + speed40;
  y41 = y41 + speed41;
  y42 = y42 + speed42;
  y43 = y43 + speed43;
  y44 = y44 + speed44;
  y45 = y45 + speed45;
  y46 = y46 + speed46;
  y47 = y47 + speed47;
  y48 = y48 + speed48;
  y49 = y49 + speed49;
  y50 = y50 + speed50;
  y51 = y51 + speed51;
  y52 = y52 + speed52;
  y53 = y53 + speed53;
  y54 = y54 + speed54;
  y55 = y55 + speed55;
  y56 = y56 + speed56;
  y57 = y57 + speed57;
  y58 = y58 + speed58;
  y59 = y59 + speed59;
  y60 = y60 + speed60;
  y61 = y61 + speed61;
  y62 = y62 + speed62;
  y63 = y63 + speed63;
  y64 = y64 + speed64;
  y65 = y65 + speed65;
  y66 = y66 + speed66;
  y67 = y67 + speed67;
  y68 = y68 + speed68;
  
    if(y1>height+20||y1<-20){
  speed1=speed1*-1;
  }    if(y2>height+20||y2<-20){
  speed2=speed2*-1;
  }    if(y3>height+20||y3<-20){
  speed3=speed3*-1;
  }    if(y4>height+20||y4<-20){
  speed4=speed4*-1;
  }    if(y5>height+20||y5<-20){
  speed5=speed5*-1;
  }    if(y6>height+20||y6<-20){
  speed6=speed6*-1;
  }    if(y7>height+20||y7<-20){
  speed7=speed7*-1;
  }    if(y8>height+20||y8<-20){
  speed8=speed8*-1;
  }    if(y9>height+20||y9<-20){
  speed9=speed9*-1;
  }    if(y10>height+20||y10<-20){
  speed10=speed10*-1;
  }    if(y11>height+20||y11<-20){
  speed11=speed11*-1;
  }    if(y12>height+20||y12<-20){
  speed12=speed12*-1;
  }    if(y13>height+20||y13<-20){
  speed13=speed13*-1;
  }    if(y14>height+20||y14<-20){
  speed14=speed14*-1;
  }    if(y15>height+20||y15<-20){
  speed15=speed15*-1;
  }    if(y16>height+20||y16<-20){
  speed16=speed16*-1;
  }    if(y17>height+20||y17<-20){
  speed17=speed17*-1;
  }    if(y18>height+20||y18<-20){
  speed18=speed18*-1;
  }    if(y19>height+20||y19<-20){
  speed19=speed19*-1;
  }    if(y20>height+20||y20<-20){
  speed20=speed20*-1;
  }    if(y21>height+20||y21<-20){
  speed21=speed21*-1;
  }    if(y22>height+20||y22<-20){
  speed22=speed22*-1;
  }    if(y23>height+20||y23<-20){
  speed23=speed23*-1;
  }    if(y24>height+20||y24<-20){
  speed24=speed24*-1;
  }    if(y25>height+20||y25<-20){
  speed25=speed25*-1;
  }    if(y26>height+20||y26<-20){
  speed26=speed26*-1;
  }    if(y27>height+20||y27<-20){
  speed27=speed27*-1;
  }    if(y28>height+20||y28<-20){
  speed28=speed28*-1;
  }    if(y29>height+20||y29<-20){
  speed29=speed29*-1;
  }    if(y30>height+20||y30<-20){
  speed30=speed30*-1;
  }    if(y31>height+20||y31<-20){
  speed31=speed31*-1;
  }    if(y32>height+20||y32<-20){
  speed32=speed32*-1;
  }    if(y33>height+20||y33<-20){
  speed33=speed33*-1;
  }    if(y34>height+20||y34<-20){
  speed34=speed34*-1;
  }    if(y35>height+20||y35<-20){
  speed35=speed35*-1;
  }    if(y36>height+20||y36<-20){
  speed36=speed36*-1;
  }    if(y37>height+20||y37<-20){
  speed37=speed37*-1;
  }    if(y38>height+20||y38<-20){
  speed38=speed38*-1;
  }    if(y39>height+20||y39<-20){
  speed39=speed39*-1;
  }    if(y40>height+20||y40<-20){
  speed40=speed40*-1;
  }    if(y41>height+20||y41<-20){
  speed41=speed41*-1;
  }    if(y42>height+20||y42<-20){
  speed42=speed42*-1;
  }    if(y43>height+20||y43<-20){
  speed43=speed43*-1;
  }    if(y44>height+20||y44<-20){
  speed44=speed44*-1;
  }    if(y45>height+20||y45<-20){
  speed45=speed45*-1;
  }    if(y46>height+20||y46<-20){
  speed46=speed46*-1;
  }    if(y47>height+20||y47<-20){
  speed47=speed47*-1;
  }    if(y48>height+20||y48<-20){
  speed48=speed48*-1;
  }    if(y49>height+20||y49<-20){
  speed49=speed49*-1;
  }    if(y50>height+20||y50<-20){
  speed50=speed50*-1;
  }    if(y51>height+20||y51<-20){
  speed51=speed51*-1;
  }    if(y52>height+20||y52<-20){
  speed52=speed52*-1;
  }    if(y53>height+20||y53<-20){
  speed53=speed53*-1;
  }    if(y54>height+20||y54<-20){
  speed54=speed54*-1;
  }    if(y55>height+20||y55<-20){
  speed55=speed55*-1;
  }    if(y56>height+20||y56<-20){
  speed56=speed56*-1;
  }    if(y57>height+20||y57<-20){
  speed57=speed57*-1;
  }    if(y58>height+20||y58<-20){
  speed58=speed58*-1;
  }    if(y59>height+20||y59<-20){
  speed59=speed59*-1;
  }    if(y60>height+20||y60<-20){
  speed60=speed60*-1;
  }    if(y61>height+20||y61<-20){
  speed61=speed61*-1;
  }    if(y62>height+20||y62<-20){
  speed62=speed62*-1;
  }    if(y63>height+20||y63<-20){
  speed63=speed63*-1;
  }    if(y64>height+20||y64<-20){
  speed64=speed64*-1;
  }    if(y65>height+20||y65<-20){
  speed65=speed65*-1;
  }    if(y66>height+20||y66<-20){
  speed66=speed66*-1;
  }    if(y67>height+20||y67<-20){
  speed67=speed67*-1;
  }    if(y68>height+20||y68<-20){
  speed68=speed68*-1;
  }
  imageMode(CENTER);
  tint(0);
  image(Diamond,mouseX,mouseY,DiamondWidth/3,DiamondHeight/3);
  
  if(mousePressed){
    image(Diamond,-22,y1,DropWidth/4,DropHeight/4);
  image(Diamond,-35,y2,DropWidth/8,DropHeight/8); 
  image(Diamond,-15,y3,DropWidth/7,DropHeight/7);
  image(Diamond,-10,y4,DropWidth/5,DropHeight/5);
  image(Diamond,-5,y5,DropWidth/4,DropHeight/4);
  image(Diamond,5,y6,DropWidth/7,DropHeight/7);
  image(Diamond,15,y7,DropWidth/9,DropHeight/9);
  image(Diamond,22,y8,DropWidth/7,DropHeight/7);
  image(Diamond,27,y9,DropWidth/6,DropHeight/6);
  image(Diamond,32,y10,DropWidth/7,DropHeight/7);
  image(Diamond,34,y11,DropWidth/8,DropHeight/8);
  image(Diamond,45,y12,DropWidth/4,DropHeight/4);
  image(Diamond,50,y13,DropWidth/6,DropHeight/6);
  image(Diamond,56,y14,DropWidth/7,DropHeight/7);
  image(Diamond,59,y15,DropWidth/9,DropHeight/9);
  image(Diamond,66,y16,DropWidth/7,DropHeight/7);
  image(Diamond,76,y17,DropWidth/3,DropHeight/3);
  image(Diamond,84,y18,DropWidth/7,DropHeight/7);
  image(Diamond,97,y19,DropWidth/9,DropHeight/9);
  image(Diamond,109,y20,DropWidth/4,DropHeight/4);
  image(Diamond,115,y21,DropWidth/6,DropHeight/6);
  image(Diamond,126,y22,DropWidth/7,DropHeight/7);
  image(Diamond,138,y23,DropWidth/8,DropHeight/8);
  image(Diamond,147,y24,DropWidth/4,DropHeight/4);
  image(Diamond,156,y25,DropWidth/7,DropHeight/7);
  image(Diamond,166,y26,DropWidth/6,DropHeight/6);
  image(Diamond,174,y27,DropWidth/6,DropHeight/6);
  image(Diamond,177,y28,DropWidth/8,DropHeight/8);
  image(Diamond,188,y29,DropWidth/7,DropHeight/7);
  image(Diamond,192,y30,DropWidth/5,DropHeight/5);
  image(Diamond,209,y31,DropWidth/6,DropHeight/6);
  image(Diamond,216,y32,DropWidth/7,DropHeight/7);
  image(Diamond,222,y33,DropWidth/7,DropHeight/7);
  image(Diamond,235,y34,DropWidth/7,DropHeight/7);
  image(Diamond,245,y35,DropWidth/4,DropHeight/4);
  image(Diamond,256,y36,DropWidth/5,DropHeight/5);
  image(Diamond,261,y37,DropWidth/7,DropHeight/7);
  image(Diamond,270,y38,DropWidth/7,DropHeight/7);
  image(Diamond,277,y39,DropWidth/6,DropHeight/6);
  image(Diamond,289,y40,DropWidth/6,DropHeight/6);
  image(Diamond,298,y41,DropWidth/7,DropHeight/7);
  image(Diamond,301,y42,DropWidth/4,DropHeight/5);
  image(Diamond,309,y43,DropWidth/7,DropHeight/7);
  image(Diamond,312,y44,DropWidth/6,DropHeight/6);
  image(Diamond,328,y45,DropWidth/8,DropHeight/8);
  image(Diamond,337,y46,DropWidth/5,DropHeight/5);
  image(Diamond,345,y47,DropWidth/7,DropHeight/7);
  image(Diamond,356,y48,DropWidth/6,DropHeight/6);
  image(Diamond,366,y49,DropWidth/4,DropHeight/4);
  image(Diamond,375,y50,DropWidth/8,DropHeight/8);
  image(Diamond,382,y51,DropWidth/7,DropHeight/7);
  image(Diamond,388,y52,DropWidth/7,DropHeight/7);
  image(Diamond,393,y53,DropWidth/6,DropHeight/6);
  image(Diamond,401,y54,DropWidth/4,DropHeight/4);
  image(Diamond,409,y55,DropWidth/9,DropHeight/9);
  image(Diamond,417,y56,DropWidth/7,DropHeight/7);
  image(Diamond,428,y57,DropWidth/5,DropHeight/5);
  image(Diamond,435,y58,DropWidth/4,DropHeight/4);
  image(Diamond,444,y59,DropWidth/7,DropHeight/7);
  image(Diamond,456,y60,DropWidth/5,DropHeight/5);
  image(Diamond,467,y61,DropWidth/6,DropHeight/6);
  image(Diamond,478,y62,DropWidth/7,DropHeight/7);
  image(Diamond,483,y63,DropWidth/8,DropHeight/8);
  image(Diamond,489,y64,DropWidth/4,DropHeight/4);
  image(Diamond,497,y65,DropWidth/7,DropHeight/7);
  image(Diamond,502,y66,DropWidth/8,DropHeight/8);
  image(Diamond,507,y67,DropWidth/7,DropHeight/7);
  image(Diamond,516,y68,DropWidth/5,DropHeight/5);
  y1 = y1 + speed1;
  y2 = y2 + speed2;
  y3 = y3 + speed3;
  y4 = y4 + speed4;
  y5 = y5 + speed5;
  y6 = y6 + speed6;
  y7 = y7 + speed7;
  y8 = y8 + speed8;
  y9 = y9 + speed9;
  y10 = y10 + speed10;
  y11 = y11 + speed11;
  y12 = y12 + speed12;
  y13 = y13 + speed13;
  y14 = y14 + speed14;
  y15 = y15 + speed15;
  y16 = y16 + speed16;
  y17 = y17 + speed17;
  y18 = y18 + speed18;
  y19 = y19 + speed19;
  y20 = y20 + speed20;
  y21 = y21 + speed21;
  y22 = y22 + speed22;
  y23 = y23 + speed23;
  y24 = y24 + speed24;
  y25 = y25 + speed25;
  y26 = y26 + speed26;
  y27 = y27 + speed27;
  y28 = y28 + speed28;
  y29 = y29 + speed29;
  y30 = y30 + speed30;
  y31 = y31 + speed31;
  y32 = y32 + speed32;
  y33 = y33 + speed33;
  y34 = y34 + speed34;
  y35 = y35 + speed35;
  y36 = y36 + speed36;
  y37 = y37 + speed37;
  y38 = y38 + speed38;
  y39 = y39 + speed39;
  y40 = y40 + speed40;
  y41 = y41 + speed41;
  y42 = y42 + speed42;
  y43 = y43 + speed43;
  y44 = y44 + speed44;
  y45 = y45 + speed45;
  y46 = y46 + speed46;
  y47 = y47 + speed47;
  y48 = y48 + speed48;
  y49 = y49 + speed49;
  y50 = y50 + speed50;
  y51 = y51 + speed51;
  y52 = y52 + speed52;
  y53 = y53 + speed53;
  y54 = y54 + speed54;
  y55 = y55 + speed55;
  y56 = y56 + speed56;
  y57 = y57 + speed57;
  y58 = y58 + speed58;
  y59 = y59 + speed59;
  y60 = y60 + speed60;
  y61 = y61 + speed61;
  y62 = y62 + speed62;
  y63 = y63 + speed63;
  y64 = y64 + speed64;
  y65 = y65 + speed65;
  y66 = y66 + speed66;
  y67 = y67 + speed67;
  y68 = y68 + speed68;
  
    if(y1>height+20||y1<-20){
  speed1=speed1*-1;
  }    if(y2>height+20||y2<-20){
  speed2=speed2*-1;
  }    if(y3>height+20||y3<-20){
  speed3=speed3*-1;
  }    if(y4>height+20||y4<-20){
  speed4=speed4*-1;
  }    if(y5>height+20||y5<-20){
  speed5=speed5*-1;
  }    if(y6>height+20||y6<-20){
  speed6=speed6*-1;
  }    if(y7>height+20||y7<-20){
  speed7=speed7*-1;
  }    if(y8>height+20||y8<-20){
  speed8=speed8*-1;
  }    if(y9>height+20||y9<-20){
  speed9=speed9*-1;
  }    if(y10>height+20||y10<-20){
  speed10=speed10*-1;
  }    if(y11>height+20||y11<-20){
  speed11=speed11*-1;
  }    if(y12>height+20||y12<-20){
  speed12=speed12*-1;
  }    if(y13>height+20||y13<-20){
  speed13=speed13*-1;
  }    if(y14>height+20||y14<-20){
  speed14=speed14*-1;
  }    if(y15>height+20||y15<-20){
  speed15=speed15*-1;
  }    if(y16>height+20||y16<-20){
  speed16=speed16*-1;
  }    if(y17>height+20||y17<-20){
  speed17=speed17*-1;
  }    if(y18>height+20||y18<-20){
  speed18=speed18*-1;
  }    if(y19>height+20||y19<-20){
  speed19=speed19*-1;
  }    if(y20>height+20||y20<-20){
  speed20=speed20*-1;
  }    if(y21>height+20||y21<-20){
  speed21=speed21*-1;
  }    if(y22>height+20||y22<-20){
  speed22=speed22*-1;
  }    if(y23>height+20||y23<-20){
  speed23=speed23*-1;
  }    if(y24>height+20||y24<-20){
  speed24=speed24*-1;
  }    if(y25>height+20||y25<-20){
  speed25=speed25*-1;
  }    if(y26>height+20||y26<-20){
  speed26=speed26*-1;
  }    if(y27>height+20||y27<-20){
  speed27=speed27*-1;
  }    if(y28>height+20||y28<-20){
  speed28=speed28*-1;
  }    if(y29>height+20||y29<-20){
  speed29=speed29*-1;
  }    if(y30>height+20||y30<-20){
  speed30=speed30*-1;
  }    if(y31>height+20||y31<-20){
  speed31=speed31*-1;
  }    if(y32>height+20||y32<-20){
  speed32=speed32*-1;
  }    if(y33>height+20||y33<-20){
  speed33=speed33*-1;
  }    if(y34>height+20||y34<-20){
  speed34=speed34*-1;
  }    if(y35>height+20||y35<-20){
  speed35=speed35*-1;
  }    if(y36>height+20||y36<-20){
  speed36=speed36*-1;
  }    if(y37>height+20||y37<-20){
  speed37=speed37*-1;
  }    if(y38>height+20||y38<-20){
  speed38=speed38*-1;
  }    if(y39>height+20||y39<-20){
  speed39=speed39*-1;
  }    if(y40>height+20||y40<-20){
  speed40=speed40*-1;
  }    if(y41>height+20||y41<-20){
  speed41=speed41*-1;
  }    if(y42>height+20||y42<-20){
  speed42=speed42*-1;
  }    if(y43>height+20||y43<-20){
  speed43=speed43*-1;
  }    if(y44>height+20||y44<-20){
  speed44=speed44*-1;
  }    if(y45>height+20||y45<-20){
  speed45=speed45*-1;
  }    if(y46>height+20||y46<-20){
  speed46=speed46*-1;
  }    if(y47>height+20||y47<-20){
  speed47=speed47*-1;
  }    if(y48>height+20||y48<-20){
  speed48=speed48*-1;
  }    if(y49>height+20||y49<-20){
  speed49=speed49*-1;
  }    if(y50>height+20||y50<-20){
  speed50=speed50*-1;
  }    if(y51>height+20||y51<-20){
  speed51=speed51*-1;
  }    if(y52>height+20||y52<-20){
  speed52=speed52*-1;
  }    if(y53>height+20||y53<-20){
  speed53=speed53*-1;
  }    if(y54>height+20||y54<-20){
  speed54=speed54*-1;
  }    if(y55>height+20||y55<-20){
  speed55=speed55*-1;
  }    if(y56>height+20||y56<-20){
  speed56=speed56*-1;
  }    if(y57>height+20||y57<-20){
  speed57=speed57*-1;
  }    if(y58>height+20||y58<-20){
  speed58=speed58*-1;
  }    if(y59>height+20||y59<-20){
  speed59=speed59*-1;
  }    if(y60>height+20||y60<-20){
  speed60=speed60*-1;
  }    if(y61>height+20||y61<-20){
  speed61=speed61*-1;
  }    if(y62>height+20||y62<-20){
  speed62=speed62*-1;
  }    if(y63>height+20||y63<-20){
  speed63=speed63*-1;
  }    if(y64>height+20||y64<-20){
  speed64=speed64*-1;
  }    if(y65>height+20||y65<-20){
  speed65=speed65*-1;
  }    if(y66>height+20||y66<-20){
  speed66=speed66*-1;
  }    if(y67>height+20||y67<-20){
  speed67=speed67*-1;
  }    if(y68>height+20||y68<-20){
  speed68=speed68*-1;
  }
  imageMode(CENTER);
  tint(0);
  image(Drop,mouseX,mouseY,DiamondWidth/2,DiamondHeight/2);
  
  }
    
}
