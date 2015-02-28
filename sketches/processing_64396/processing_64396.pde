
int w;
String x, y;
float z;
float eposx, eposy, mposx, mposy, vposx, vposy, maposx, maposy, jposx, jposy, sposx, sposy, uposx, uposy, nposx, nposy;
float vdist =  41;
float madist = 78;
float mdist = 91;
float jdist = 624;
float sdist= 1250;
float udist = 2720;
float ndist = 4350;
float edist = 1;
float tdist;
String fact = "fact";

PFont font;
   float  tsize;
float  escale, mscale, vscale, mascale, jscale, sscale, uscale, nscale;
int mstroke ,jstroke, vstroke, mastroke, ustroke, nstroke, sstroke;
int mfill, vfill, efill, mafill, jfill, sfill, ufill, nfill;
int on;
int off;
float Pscale;
float Scale = 0;

  float button1x;
float buttonsize;
float button1y;
float  buttonx;
float  buttony;

float reset = 1;

boolean boo1 = false;
boolean boo2 = false;
boolean boo3 = false;
boolean boo4 = false;
boolean boo5 = false;
boolean boo6 = false;
boolean boo7 = false;
boolean boo8 = false;
boolean boo9 = false;
boolean pmousePressed = false;
boolean start = false;



void setup(){///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

background(255);
size(800, 800);
smooth();
  button1x = width/8;
 buttonsize = height/40;
 button1y = height/2-(buttonsize)*10;
  buttonx = width-width/8-buttonsize/2;
  buttony = height/8- buttonsize/2;
  
  font =loadFont("Helvetica-70.vlw");
  textFont(font);

textSize(width/100);
tsize = textDescent() - textAscent();

}///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw(){///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textSize(width/40);
background(0);

//////////////////////////////////////////////////////////////////////////////////
//butttonsdrawn//////////////////////////////////////


stroke(255);
fill(#838390);
rect(button1x, button1y , buttonsize ,buttonsize) ;
fill(#F3DB84);
rect(button1x , button1y + buttonsize*2 , buttonsize, buttonsize);
fill(#E80C05);
rect(button1x , button1y + buttonsize*4 , buttonsize, buttonsize);
fill(#FF7605);
rect(button1x , button1y + buttonsize*6 , buttonsize, buttonsize);
fill(#FFC800);
rect(button1x , button1y + buttonsize*8 , buttonsize, buttonsize);
fill(#83B3B7);
rect(button1x , button1y + buttonsize*10 , buttonsize, buttonsize);
fill(#19359B);
rect(button1x , button1y + buttonsize*12 , buttonsize, buttonsize);

textAlign(RIGHT);
fill(100);
text("Mercury", button1x - buttonsize, button1y + buttonsize/2 - tsize/2);
text("Venus", button1x - buttonsize, button1y + buttonsize*2 + buttonsize/2 - tsize/2);
text("Mars", button1x - buttonsize, button1y + buttonsize*4 + buttonsize/2 - tsize/2);
text("Jupiter", button1x - buttonsize, button1y + buttonsize*6 + buttonsize/2 - tsize/2);
text("Saturn", button1x - buttonsize, button1y + buttonsize*8 + buttonsize/2 - tsize/2);
text("Uranus", button1x - buttonsize, button1y + buttonsize*10 + buttonsize/2 - tsize/2);
text("Neptune", button1x - buttonsize, button1y + buttonsize*12 + buttonsize/2 - tsize/2);



//button press//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//button 1
  if  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize) && (mouseY >= button1y) && (mousePressed) && !pmousePressed) {
   Pscale = Scale; 
    boo1 = true;
    boo2 = false;
    boo3 = false;
    boo4 = false;
    boo5 = false;
    boo6 = false;
    boo7 = false;
  
}
  //button 2
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*2 + buttonsize) && (mouseY >= button1y + buttonsize*2) && (mousePressed) && !pmousePressed) {
    Pscale = Scale;
    boo1 = false;
    boo2 = true;
    boo3 = false;
    boo4 = false;
    boo5 = false;
    boo6 = false;
    boo7 = false;
    
}
  //button 3
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*4 + buttonsize) && (mouseY >= button1y + buttonsize*4) && (mousePressed) && !pmousePressed) {    
    Pscale = Scale;
        boo1 = false;
    boo2 = false;
    boo3 = true;
    boo4 = false;
    boo5 = false;
    boo6 = false;
    boo7 = false;
}

  //button 4
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*6 + buttonsize) && (mouseY >= button1y + buttonsize*6) && (mousePressed) && !pmousePressed) { 
   Pscale = Scale;
        boo1 = false;
    boo2 = false;
    boo3 = false;
    boo4 = true;
    boo5 = false;
    boo6 = false;
    boo7 = false;
}

//button5

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*8 + buttonsize) && (mouseY >= button1y + buttonsize*8) && (mousePressed) && !pmousePressed) {
   Pscale = Scale; 
        boo1 = false;
    boo2 = false;
    boo3 = false;
    boo4 = false;
    boo5 = true;
    boo6 = false;
    boo7 = false;
}

//button 6

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*10 + buttonsize) && (mouseY >= button1y + buttonsize*10) && (mousePressed) && !pmousePressed) {
   Pscale = Scale; 
            boo1 = false;
    boo2 = false;
    boo3 = false;
    boo4 = false;
    boo5 = false;
    boo6 = true;
    boo7 = false;
}

//button 7 

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*12 + buttonsize) && (mouseY >= button1y + buttonsize*12) && (mousePressed) && !pmousePressed) {
    Pscale = Scale;
            boo1 = false;
    boo2 = false;
    boo3 = false;
    boo4 = false;
    boo5 = false;
    boo6 = false;
    boo7 = true;
}

if ((Pscale> width/2/edist)&&(boo1 == false)&&(boo2 == false)&&(boo3 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/2/edist){
    Scale = width/2/edist;
}}
if ((Pscale<width/2/edist)&&(boo1 == false)&&(boo2 == false)&&(boo3 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= 40){
    Scale = 40;
}}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//set Scale////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//venus boo2
if (boo2 == true){


if ((Pscale> width/vdist)&&(boo1 == false)&&(boo3 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/vdist){
    Scale = width/vdist;
}}
if ((Pscale<width/vdist)&&(boo1 == false)&&(boo3 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/vdist){
    Scale = width/vdist;
}}
}
//mars boo3
if (boo3 == true){

  if ((Pscale> width/madist)&&(boo1 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/madist){
    Scale = width/madist;
}}
if ((Pscale<width/madist)&&(boo1 == false)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/madist){
    Scale = width/madist;
}}
}
//mercury boo1
if (boo1 == true){
  
  if ((Pscale> width/mdist)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/mdist){
    Scale = width/mdist;
}}
if ((Pscale<width/mdist)&&(boo4 == false)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/mdist){
    Scale = width/mdist;
}}

}
//jupiter boo4
if (boo4 == true){
  
  if ((Pscale> width/jdist)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/jdist){
    Scale = width/jdist;
}}
if ((Pscale<width/jdist)&&(boo5 == false)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/jdist){
    Scale = width/jdist;
}}
}
//saturn boo5
if (boo5 == true){

  if ((Pscale> width/sdist)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/sdist){
    Scale = width/sdist;
}}
if ((Pscale<width/sdist)&&(boo6 == false)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/sdist){
    Scale = width/sdist;
}}
}
//Uranus boo6
if (boo6 == true){
  
  if ((Pscale> width/udist)&&(boo7 == false)){
  Scale = Scale-0.1;
  if (Scale<= width/udist){
    Scale = width/udist;
}}
if ((Pscale<width/udist)&&(boo7 == false)){
  Scale = Scale+0.1;
    if (Scale>= width/udist){
    Scale = width/udist;
}}
}
//Neptune boo7
if (boo7 == true){
    
  if (Pscale> width/ndist){
  Scale = Scale-0.1;
  if (Scale<= width/ndist){
    Scale = width/ndist;
}}
if (Pscale<width/ndist){
  Scale = Scale+0.1;
    if (Scale>= width/ndist){
    Scale = width/ndist;
}}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//update scale////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//venus boo2
 noStroke();
      vscale = Scale*vdist;
if(vscale/4<=width){
      vstroke =  on;

      vfill = #F3DB84;
      textAlign(RIGHT);
      textSize(vscale/15);
      if(boo2==true){
      fill(vfill);
      }
      else{
        fill(vfill,50);
      }
      text("Venus", vposx - vscale/4/2 , vposy);
      noStroke();
//line(vposx, vposy, width/2, height/2);
ellipse(vposx, vposy , vscale/4, vscale/4);

}

//mars boo3
      mascale = Scale*madist;
if(mascale/4<=width){
      mastroke =  on;

      mafill = #E80C05;
      textAlign(LEFT);
      textSize(mascale/15);
      if(boo3==true){
      fill(mafill);
      }
      else{
        fill(mafill,50);
      }
      text("Mars", maposx + mascale/4/2 , maposy);
      noStroke();
//line(maposx, maposy, width/2, height/2);
ellipse(maposx, maposy , mascale/4, mascale/4);
}

//mercury boo1
      mscale = Scale * mdist;
if(mscale/4<=width){
      mstroke =  on;

      mfill = #838390;
      textAlign(LEFT);
      textSize(mscale/15);
      if(boo1==true){
      fill(mfill);
      }
      else{
        fill(mfill,50);
      }
      text("Mercury", mposx + mscale/4/2 , mposy);
      noStroke();
//line(mposx, mposy, width/2, height/2);
ellipse(mposx, mposy , mscale/4, mscale/4);
}

//jupiter boo4  
     jscale = Scale*jdist;
 if(jscale/4<=width){
      jstroke =  on;
 
      jfill = #FF7605;
      textAlign(LEFT);
      textSize(jscale/15);
      if(boo4==true){
      fill(jfill);
      }
      else{
        fill(jfill,50);
      }
      text("Jupiter", jposx + jscale/4/2 , jposy);
      noStroke();
//line(jposx, jposy, width/2, height/2);
ellipse(jposx, jposy , jscale/4, jscale/4);
 }
//saturn boo5
     sscale = Scale*sdist;
if(sscale/4<=width){
      sstroke =  on;
 
      sfill = #FFC800;
      textAlign(LEFT);
      textSize(sscale/15);
      if(boo5==true){
      fill(sfill);
      }
      else{
        fill(sfill,50);
      }
      text("Saturn", sposx + sscale/4/2 , sposy);
      noStroke();
//line(sposx, sposy, width/2, height/2);
ellipse(sposx, sposy , sscale/4, sscale/4);
}
 
//uranus boo6
uscale = Scale*udist;
if(uscale/4<=width){
      ustroke =  on;
      
      ufill = #83B3B7;

      textAlign(RIGHT);
      textSize(uscale/15);
      if(boo6==true){
      fill(ufill);
      }
      else{
        fill(ufill,50);
      }
      text("Uranus", uposx - uscale/4/2 , uposy);
  noStroke();
      ellipse(uposx, uposy , uscale/4, uscale/4);
 
}
     println(uscale/4);
  
  
//neptune boo7
      nscale = Scale*ndist;
if(nscale/4<=width){
      nstroke =  on;

      nfill = #19359B;

      textAlign(RIGHT);
      textSize(nscale/15);
      if(boo7==true){
      fill(nfill);
      }
      else{
        fill(nfill,50);
      }
      text("Neptune", nposx - nscale/4/2 , nposy);
      
     noStroke();
//line(nposx, nposy, width/2, height/2);
ellipse(nposx, nposy , nscale/4, nscale/4);
}
  
 
textSize(width/100); 

  
//update poisition////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
//venus
vposx = (width/2);
vposy = (height/2);

//mars
maposx = (width/2);
maposy = (height/2);

//mercury
mposx = (width/2);
mposy = (height/2);

//jupter
jposx = (width/2);
jposy = (height/2);

//saturn
sposx = (width/2);
sposy = (height/2);

//uranus
uposx = (width/2);
uposy = (height/2);

//neptune
nposx = (width/2);
nposy = (height/2);

//render planets////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ellipseMode(CENTER);

//earth


fill(#1A8635);
escale = Scale*edist;
noStroke();
ellipse(width/2, height/2, escale/4, escale/4);
fill(100);
textSize(escale);
textAlign(RIGHT);
text("Earth", width/2-escale/6/2, height/2);

//

on = 255;
off = 0;

//venus



//mars



//mercury



//jupiter



//saturn



//uranus



//neptune


tdist = 1/Scale*1000-(1/Scale*1000)*0.04;

x = "000000";
textSize(width/50);
textAlign(RIGHT);
fill(255);
text("Miles from earth:", width - width/8, height/8);
text(x,width- width/8,height/8+buttonsize*2);
z = textWidth(x);
text(int(tdist), width- width/8 - z,height/8+buttonsize*2);
text("Years to walk:", width- width/8,height/8+buttonsize*6);
text(int(tdist/3/24/365*1000000), width- width/8,height/8+buttonsize*8);
text("Years to drive:", width- width/8,height/8+buttonsize*12);
text(int(tdist/70/24/365*1000000), width- width/8,height/8+buttonsize*14);
text("Years by space ship", width- width/8,height/8+buttonsize*18);
text(tdist/35970/24/365*1000000, width- width/8,height/8+buttonsize*20);


if (2010-tdist/3/24/365*1000000 < 0){
  
 w = int(tdist/3/24/365*1000000-2010);
 y = "BC";
}
else{
  w = int(2010-tdist/3/24/365*1000000);
y= "AD";
}
textAlign(LEFT);
String w2 = Integer.toString(w);
float ww = textWidth(w2);

text(w, width/8, height-height/6);
text(y, width/8+ww+buttonsize, height - height/6);
float yw = textWidth(y);
text("If you wanted to walk and\narrive today you should have\nset off in:", width/8,height/8+buttonsize*24);
if ((w < 1100) && (w > 1000)&&(y =="AD")){
 fact = "The battle of hastings";
}
if ((w < 1000) && (w > 500)&&(y =="AD")){
 fact = "Britain under the Roman Empire";
}

if ((w < 500) && (w > 0)&&(y =="AD")){
 fact = "Birth of Christ";
}

if ((w > 0) && (w < 1000)&&(y =="BC")){
 fact = "David becomes king of the Israelites";
}

if ((w > 1000) && (w < 2000)&&(y =="BC")){
 fact = "Bronze age in China";
}

if ((w > 2000) && (w < 3000)&&(y =="BC")){
 fact = "Ancient Egypt";
}

if ((w > 4000) && (w < 5000)&&(y =="BC")){
 fact = "Domestication of Horses";
}

if ((w > 5000) && (w < 6000)&&(y =="BC")){
 fact = "Farming reches Europe";
}  

if ((w > 6000) && (w < 7000)&&(y =="BC")){
 fact = "Early Pottery use in Greece";
}  

if ((w > 7000) && (w < 8000)&&(y =="BC")){
 fact = "Last glacial period ends";
}  

if ((w > 8000) && (w < 9000)&&(y =="BC")){
 fact = "Fishing begins";
}  


if ((w > 9000) && (w < 10000)&&(y =="BC")){
 fact = "Fishing begins";
} 

if ((w > 10000) && (w < 11000)&&(y =="BC")){
 fact = "Wooly Mammoths become extinct";
}  

if ((w > 11000) && (w < 12000)&&(y =="BC")){
 fact = "First people in Argentina";
}  

if ((w > 12000) && (w < 22000)&&(y =="BC")){
 fact = "Humans began to show an interest\n in Culture and symbolic thought";
}  

if ((w > 22000) && (w < 46000)&&(y =="BC")){
 fact = "The Stone age";
}  

if ((w > 46000) && (w < 102000)&&(y =="BC")){
 fact = "Neandertals well established in Europe";
}  

if ((w > 102000) && (w < 170000)&&(y =="BC")){
 fact = "Before Homosapiens existed";
} 
text(fact, width/8+ww+yw+buttonsize*2, height - height/6);





////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
pmousePressed = mousePressed;

}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

