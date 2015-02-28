
//Sun Colour
//Written by James Frankis

void setup(){
  size(600,600);
  noStroke();

}

void draw(){
 
 
float h = hour();
float m = minute();
float s = second();
float s2;
float m2;
float s3;
float total;
float total2;
float opacity;
float redd;
float greeen;
float bluue;
float opacity2;
float boxheight;
float total3;
PImage walllight;
PImage walldark;
PImage bars;
int convert;

bars = loadImage("bars.png");
walllight = loadImage("walllight2.jpg");
walldark = loadImage("walldark2.jpg");

 background(walllight);
s2=(s/60)/60;
m2=m/60;

total =m2+s2+h;



opacity = 0;
opacity2= 50;
redd = 255;
greeen = 255;
bluue = 255;
boxheight = 400;

if (total<=3) {
  opacity = 255;
  
  opacity2=50;
}

if ((total<=6)&&(total>=3)){
total = total-3;
opacity = 255-((255/3)*(total));
opacity2 = 50;
}

if ((total>=6)&&(total<=7.5)){
  total = total-6;
  opacity = 0;
  opacity2 = ((50/1.5)*(total)+50);
  bluue = 50;
  redd=255;
  greeen=150;
  boxheight = ((400/1.5)*(total));
}

if ((total>=7.5)&&(total<=12)){
  total = total-7.5;
  opacity = 0;
  opacity2 = 100;
  bluue = 50;
  redd=255;
  greeen = (((105/4.5)*(total)))+150;
  boxheight = 400;
  
}

if ((total>=12)&&(total<=20)){
  total = total - 12;
  opacity = 0;
  opacity2= 100;
  bluue = 50;
  redd = 255;
  greeen= (105-((105/8)*(total)))+150;
  boxheight=400;
  
}

if ((total>=20)&&(total<=21.5)){
    total = total-20;
  opacity = 0;
  opacity2 = (50-(50/1.5)*(total))+50;
  bluue = 50;
  redd=255;
  greeen=150;
  boxheight = (400-(400/1.5)*(total));
}

if ((total>=21.5)&&(total<=22.5)){
  total = total-21.5;
opacity = ((255/3)*(total));
opacity2 = 50;

}

if (total>=22.5){
  opacity= 255;
  opacity2=50;
}


tint(255, (opacity));
image(walldark, 0, 0);
convert = int(boxheight);
tint(redd, greeen, bluue, opacity2-20);
bars.resize(400, convert);
image(bars,width/4, height/4);

println(total);
println(convert);
println(opacity);
println(opacity2);
println(greeen);
total3 =m2+s2+h;
if (total3 == 1 || total3 == 2 || total3 == 3 || total3 == 4 
|| total3 == 5
|| total3 == 6 || total3 == 7 || total3 == 8 || total3 == 9 
|| total3 == 10
 || total3 == 11 || total3 == 12 || total3 == 13 || total3 == 14 
 || total3 == 15
  || total3 == 16 || total3 == 17 || total3 == 18 
  || total3 == 19 || total3 == 20
   || total3 == 21 || total3 == 22 || total3 == 23 || total3 == 24){
     saveFrame();
   }

}

