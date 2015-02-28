
float sunsize = 1392000;
float msize = 4879.4;
float vsize = 12103.6;
float esize = 12742;
float masize = 6792.4;
float jsize = 142984;
float ssize = 120536;
float usize = 51118;
float nsize = 49528;
float mearth = msize/esize;
float vearth = vsize/esize;
float eearth = esize/esize;
float maearth = masize/esize;
float jearth = jsize/esize;
float searth = ssize/esize;
float uearth = usize/esize;
float nearth = nsize/esize;
float suearth = sunsize/esize;

float Scale;
float rescale;
PFont font;


//slider///////////////////////////////////////////////////////////////////////
float buttonx;
float buttony;
float map_y;
float slidermax;
float slidermin;


//labels////////////////////////////////////////////////////////
float mcirclex;
float mcircley;
float mcirclex2;
float mcircley2;

float vcirclex;
float vcircley;
float vcirclex2;
float vcircley2;

float ecirclex;
float ecircley;
float ecirclex2;
float ecircley2;

float macirclex;
float macircley;
float macirclex2;
float macircley2;

float jcirclex;
float jcircley;
float jcirclex2;
float jcircley2;

float scirclex;
float scircley;
float scirclex2;
float scircley2;

float ucirclex;
float ucircley;
float ucirclex2;
float ucircley2;

float ncirclex2;
float ncircley2;
float ncirclex;
float ncircley;


//number of true booleans//////////////////////
int numarcs = 1;
boolean boo1 = true;
boolean boo2 = false;
boolean boo3 = false;
boolean boo4 = false;
boolean boo5 = false;
boolean boo6 = false;
boolean boo7 = false;
boolean boo8 = false;
boolean boo9 = false;

boolean pmousePressed = false;

float arc1s;
float arc2s;
float arc3s;
float arc4s;
float arc1f;
float arc2f;
float arc3f;
float arc4f;
float arc5s;
float arc6s;
float arc7s;
float arc8s;
float arc5f;
float arc6f;
float arc7f;
float arc8f;

float button1x;
float button1y;

float buttonsize;

boolean buttonyon = false;

void setup(){


  size (900 ,900);
Scale = (1000);

  slidermax = height/4;
  slidermin = height- height/4;
  button1x = width/4;
 buttonsize = height/40;
 button1y = height/2-(buttonsize)*10;
  buttonx = width-width/4-buttonsize/2;
  buttony = height/4- buttonsize/2+10;

}

void draw(){
  
  font = loadFont("LubalinGraphITC-Book-48.vlw");
  textFont(font, 14);
  textAlign(LEFT);
  float tsize = textDescent() - textAscent();
  smooth();
   background(0);
  stroke(0);
  fill(255);
  textSize(height/60);
  
  // sun //////////////////////////////////////////////////////////////////////
if (boo9 == true){
  noStroke();
  fill(#FFF80F);
  ellipse(width/2, height/2, sunsize/Scale, sunsize/Scale);
  fill(150);

  
}


  //roll over///////////////////////////
  if 
  (
  
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize) && (mouseY >= button1y)) ||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*2 + buttonsize) && (mouseY >= button1y + buttonsize*2))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*4 + buttonsize) && (mouseY >= button1y + buttonsize*4))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*6 + buttonsize) && (mouseY >= button1y + buttonsize*6))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*8 + buttonsize) && (mouseY >= button1y + buttonsize*8))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*10 + buttonsize) && (mouseY >= button1y + buttonsize*10))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*12 + buttonsize) && (mouseY >= button1y + buttonsize*12))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*14 + buttonsize) && (mouseY >= button1y + buttonsize*14))||
  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*16 + buttonsize) && (mouseY >= button1y + buttonsize*16))||
  ((mouseX>=buttonx)&&(mouseX<=buttonx+buttonsize)&&(mouseY>=buttony)&&(mouseY<= buttony+buttonsize))
  
  ) {
    
    cursor(HAND);
  }
  
  else{
    cursor(ARROW);
  }

//button press/////////////////////////////////////////////////////////

//button 1
  if  ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize) && (mouseY >= button1y) && (mousePressed) && !pmousePressed) {
    
    boo1 = !boo1;
        if (boo1 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo1 == false){
    
    numarcs = numarcs -1;
  }

}
  //button 2
 
  
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*2 + buttonsize) && (mouseY >= button1y + buttonsize*2) && (mousePressed) && !pmousePressed) {
    
    boo2 = !boo2;
    if (boo2 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo2 == false){
    
    numarcs = numarcs -1;
  }
}



  //button 3
 
  
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*4 + buttonsize) && (mouseY >= button1y + buttonsize*4) && (mousePressed) && !pmousePressed) {
    
    boo3 = !boo3;
        if (boo3 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo3 == false){
    
    numarcs = numarcs -1;
  }

}

  //button 4
 
  
  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*6 + buttonsize) && (mouseY >= button1y + buttonsize*6) && (mousePressed) && !pmousePressed) {
    
    boo4 = !boo4;
    
    if (boo4 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo4 == false){
    
    numarcs = numarcs -1;
  }

}

//button5

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*8 + buttonsize) && (mouseY >= button1y + buttonsize*8) && (mousePressed) && !pmousePressed) {
    
    boo5 = !boo5;
    
    if (boo5 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo5 == false){
    
    numarcs = numarcs -1;
  }

}

//button 6

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*10 + buttonsize) && (mouseY >= button1y + buttonsize*10) && (mousePressed) && !pmousePressed) {
    
    boo6 = !boo6;
    
    if (boo6 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo6 == false){
    
    numarcs = numarcs -1;
  }

}

//button 7 

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*12 + buttonsize) && (mouseY >= button1y + buttonsize*12) && (mousePressed) && !pmousePressed) {
    
    boo7 = !boo7;
    
    if (boo7 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo7 == false){
    
    numarcs = numarcs -1;
  }

}

//button 8

  if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*14 + buttonsize) && (mouseY >= button1y + buttonsize*14) && (mousePressed) && !pmousePressed) {
    
    boo8 = !boo8;
    
    if (boo8 == true) {
    numarcs = numarcs +1;
    }
    
    if (boo8 == false){
    
    numarcs = numarcs -1;
  }

}
//button 9
 if ((mouseX <= button1x + buttonsize) && (mouseX >= button1x) && (mouseY <= button1y + buttonsize*16 + buttonsize) && (mouseY >= button1y + buttonsize*16)&& (mousePressed) && !pmousePressed) {
  
   boo9 = !boo9;
 }
 
 
/////////ARCS drawn & crosses///////////////////////////////////

stroke(255);


//mercury//////////////////////////////////////////////////////////////////////

if (boo1 == true) {
  
    noStroke();
 fill(#838390); 

arc(width/ 2, height/2, msize/Scale, msize/Scale, radians(arc1s), radians(arc1f));


mcirclex = int((width/2) + 0.5 * (msize/Scale) * cos(radians(arc1s+360/numarcs/2)));
mcircley = int((height/2) + 0.5 * (msize/Scale) * sin(radians(arc1s+360/numarcs/2)));

mcirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc1s+360/numarcs/2)));
mcircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc1s+360/numarcs/2)));

stroke(200);
fill(200);
line(mcirclex2, mcircley2 , mcirclex, mcircley);
if (arc1f >= 180) {
  textAlign(RIGHT);
  
  
}
else{
  textAlign(LEFT);
}

text("Mercury", mcirclex2, mcircley2);

}

///////////////////////////////////venus///////////////////////////////////

if (boo2 == true) {
 fill(#F2DB84);
   noStroke();
arc(width/ 2, height/2, vsize/Scale, vsize/Scale, radians(arc2s), radians(arc2f));


vcirclex = int((width/2) + 0.5 * (vsize/Scale) * cos(radians(arc2s+360/numarcs/2)));
vcircley = int((height/2) + 0.5 * (vsize/Scale) * sin(radians(arc2s+360/numarcs/2)));

vcirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc2s+360/numarcs/2)));
vcircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc2s+360/numarcs/2)));

stroke(200);
fill(200);
line(vcirclex2, vcircley2 , vcirclex, vcircley);
if ((arc2f-360/numarcs/2 >= 90) && (arc2f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Venus", vcirclex2, vcircley2);

}



///////////////////////////////////earth///////////////////////////////////

if (boo3 == true) {
 fill(#1A8625);
   noStroke();
  arc(width/ 2, height/2, esize/Scale, esize/Scale, radians(arc3s), radians(arc3f));
  
 
 ecirclex = int((width/2) + 0.5 * (esize/Scale) * cos(radians(arc3s+360/numarcs/2)));
 ecircley = int((height/2) + 0.5 * (esize/Scale) * sin(radians(arc3s+360/numarcs/2)));

 ecirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc3s+360/numarcs/2)));
 ecircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc3s+360/numarcs/2)));

stroke(200);
fill(200);
line(ecirclex2, ecircley2 , ecirclex, ecircley);
if ((arc3f-360/numarcs/2 >= 90) && (arc3f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Earth", ecirclex2, ecircley2);
  
}

///////////////////////////////////mars///////////////////////////////////

if (boo4 == true) {
 fill(#E80C05);
    noStroke();
  arc(width/ 2, height/2, masize/Scale, masize/Scale, radians(arc4s), radians(arc4f));

  
  macirclex = int((width/2) + 0.5 * (masize/Scale) * cos(radians(arc4s+360/numarcs/2)));
macircley = int((height/2) + 0.5 * (masize/Scale) * sin(radians(arc4s+360/numarcs/2)));

macirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc4s+360/numarcs/2)));
macircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc4s+360/numarcs/2)));

stroke(200);
fill(200);
line(macirclex2, macircley2 , macirclex, macircley);
if ((arc4f-360/numarcs/2 >= 90) && (arc4f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Mars", macirclex2, macircley2);
  
}

///////////////////////////////////jupiter///////////////////////////////////

if (boo5 == true) {
fill(#FF7605);
  noStroke();
arc(width/ 2, height/2, jsize/Scale, jsize/Scale, radians(arc5s), radians(arc5f));


jcirclex = int((width/2) + 0.5 * (jsize/Scale) * cos(radians(arc5s+360/numarcs/2)));
jcircley = int((height/2) + 0.5 * (jsize/Scale) * sin(radians(arc5s+360/numarcs/2)));

jcirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc5s+360/numarcs/2)));
jcircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc5s+360/numarcs/2)));

stroke(200);
fill(200);
line(jcirclex2, jcircley2 , jcirclex, jcircley);
if ((arc5f-360/numarcs/2 >= 90) && (arc5f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Jupiter", jcirclex2, jcircley2);

}

/////////////////////////////////// saturn ///////////////////////////////////
if (boo6 == true) {
fill(#FFC800);
  noStroke();
arc(width/ 2, height/2, ssize/Scale, ssize/Scale, radians(arc6s), radians(arc6f));


scirclex = int((width/2) + 0.5 * (ssize/Scale) * cos(radians(arc6s+360/numarcs/2)));
scircley = int((height/2) + 0.5 * (ssize/Scale) * sin(radians(arc6s+360/numarcs/2)));

scirclex2 = int((width/2) + 0.5 * (rescale+20) * cos(radians(arc6s+360/numarcs/2)));
scircley2 = int((height/2) + 0.5 * (rescale+20) * sin(radians(arc6s+360/numarcs/2)));

stroke(200);
fill(200);
line(scirclex2, scircley2 , scirclex, scircley);
if ((arc6f-360/numarcs/2 >= 90) && (arc6f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Saturn", scirclex2, scircley2);

}

/////////////////////////////////// uranus ///////////////////////////////////

if (boo7 == true) {
 fill(#83B3B7);
   noStroke();
  arc(width/ 2, height/2, usize/Scale, usize/Scale, radians(arc7s), radians(arc7f));
  

ucirclex = int((width/2) + 0.5 * (usize/Scale) * cos(radians(arc7s+360/numarcs/2)));
ucircley = int((height/2) + 0.5 * (usize/Scale) * sin(radians(arc7s+360/numarcs/2)));

ucirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc7s+360/numarcs/2)));
ucircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc7s+360/numarcs/2)));

stroke(200);
fill(200);
line(ucirclex2, ucircley2 , ucirclex, ucircley);
if ((arc7f-360/numarcs/2 >= 90) && (arc7f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Uranus", ucirclex2, ucircley2);


}

/////////////////////////////////// neptune ///////////////////////////////////

if (boo8 == true) {
fill(#19259B);
  noStroke();
  arc(width/ 2, height/2, nsize/Scale, nsize/Scale, radians(arc8s), radians(arc8f));
  

ncirclex = int((width/2) + 0.5 * (nsize/Scale) * cos(radians(arc8s+360/numarcs/2)));
ncircley = int((height/2) + 0.5 * (nsize/Scale) * sin(radians(arc8s+360/numarcs/2)));

ncirclex2 = int((width/2) + 0.5 * (rescale + 20) * cos(radians(arc8s+360/numarcs/2)));
ncircley2 = int((height/2) + 0.5 * (rescale + 20) * sin(radians(arc8s+360/numarcs/2)));

stroke(200);
fill(200);
line(ncirclex2, ncircley2 , ncirclex, ncircley);
if ((arc8f-360/numarcs/2 >= 90) && (arc8f-360/numarcs/2 <= 270)) {
  
  textAlign(RIGHT);
}

else {
  
  textAlign(LEFT);
  
}

text("Neptune", ncirclex2, ncircley2);
  
}



ellipseMode(CORNER);
fill(255);
noStroke();

////mercury/////////
if (boo1 == true){
  
  arc1s = 0;
  arc1f = arc1s + 360/numarcs;
    rescale = msize/Scale;
  
  fill(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10, buttonsize*1.2 ,buttonsize*1.2) ;



}

else{
  
  arc1s = 0;
  arc1f = 0;
  
}

//////////////mars/////////

if (boo4 == true){
  
  arc4s = arc3f;
  arc4f = arc4s + 360/numarcs;
  rescale = masize/Scale;

  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*6, buttonsize*1.2 ,buttonsize*1.2) ;

}

else{
  
  arc4s = arc3f;
  arc4f = arc3f;
}

//venus////////

if (boo2 == true){
  
  arc2s = arc1f;
  arc2f = arc2s + 360/numarcs;
    rescale = vsize/Scale;

  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*2, buttonsize*1.2 ,buttonsize*1.2) ;

}

else{
  
  arc2s = arc1f;
  arc2f = arc1f;
  
}

//earth///////////

if (boo3 == true){
  
  arc3s = arc2f;
  arc3f = arc3s + 360/numarcs;
  rescale = esize/Scale;
  stroke(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*4, buttonsize*1.2 ,buttonsize*1.2) ;

}


else{
  
  arc3s = arc2f;
  arc3f = arc2f;
  
}
//neptune///
if (boo8 == true){
  
  arc8s = arc7f;
  arc8f = 360;
  rescale = nsize/Scale;
  stroke(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*14, buttonsize*1.2 ,buttonsize*1.2) ;

  
}

//uranus
if (boo7 == true){
  
  arc7s = arc6f;
  arc7f = arc7s + 360/numarcs;
  rescale = usize/Scale;
  stroke(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*12, buttonsize*1.2 ,buttonsize*1.2) ;

}

else{
  
  arc7s = arc6f;
  arc7f = arc6f;
  
}

//saturn///////////

if (boo6 == true){
  
  arc6s = arc5f;
  arc6f = arc6s + 360/numarcs;
  rescale = ssize/Scale;
  stroke(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*10, buttonsize*1.2 ,buttonsize*1.2) ;

}

else{
  
  arc6s = arc5f;
  arc6f = arc5f;

}


  ///jupiter//////////////
  
  
if (boo5 == true){
  
  arc5s = arc4f;
  arc5f = arc5s + 360/numarcs;
  rescale = jsize/Scale;
  stroke(255);
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*8, buttonsize*1.2 ,buttonsize*1.2) ;

}

else{
  
  arc5s = arc4f;
  arc5f = arc4f;
  
}

if (boo9 == true){
  
  
  ellipse(button1x-buttonsize/10, button1y-buttonsize/10+buttonsize*16, buttonsize*1.2 ,buttonsize*1.2) ;

}


//////////////////////////////////////////////////////////////////////////////////
//butttonsdrawn//////////////////////////////////////

ellipseMode(CORNER);
noStroke();
fill(#838390);
ellipse(button1x, button1y , buttonsize ,buttonsize) ;
fill(#F3DB84);
ellipse(button1x , button1y + buttonsize*2 , buttonsize, buttonsize);
fill(#1A8635);
ellipse(button1x , button1y + buttonsize*4 , buttonsize, buttonsize);
fill(#E80C05);
ellipse(button1x , button1y + buttonsize*6 , buttonsize, buttonsize);
fill(#FF7605);
ellipse(button1x , button1y + buttonsize*8 , buttonsize, buttonsize);
fill(#FFC800);
ellipse(button1x , button1y + buttonsize*10 , buttonsize, buttonsize);
fill(#83B3B7);
ellipse(button1x , button1y + buttonsize*12 , buttonsize, buttonsize);
fill(#19359B);
ellipse(button1x , button1y + buttonsize*14 , buttonsize, buttonsize);
fill(#FFF80F);
ellipse(button1x, button1y + buttonsize*16 , buttonsize, buttonsize);
textAlign(LEFT);
fill(150);

ellipseMode(CENTER);





//text/////////////////////////////////////

textAlign(RIGHT);
fill(100);

text("Mercury", button1x - buttonsize, button1y + buttonsize/2 - tsize/2);
text("Venus", button1x - buttonsize, button1y + buttonsize*2 + buttonsize/2 - tsize/2);
text("Earth", button1x - buttonsize, button1y + buttonsize*4 + buttonsize/2 - tsize/2);
text("Mars", button1x - buttonsize, button1y + buttonsize*6 + buttonsize/2 - tsize/2);
text("Jupiter", button1x - buttonsize, button1y + buttonsize*8 + buttonsize/2 - tsize/2);
text("Saturn", button1x - buttonsize, button1y + buttonsize*10 + buttonsize/2 - tsize/2);
text("Uranus", button1x - buttonsize, button1y + buttonsize*12 + buttonsize/2 - tsize/2);
text("Neptune", button1x - buttonsize, button1y + buttonsize*14 + buttonsize/2 - tsize/2);
text("The Sun", button1x - buttonsize, button1y + buttonsize*16 + buttonsize/2 - tsize/2);


  // slider //////////////////////////////////////////////////////////////////////
 

if ((mousePressed)&&(mouseX>=buttonx)&&(mouseX<=buttonx+buttonsize)&&(mouseY>=buttony)&&(mouseY<= buttony+buttonsize)){
  
   buttonyon = true;
}

if (buttonyon==true){
  
  buttony = mouseY;
}

if (buttony < slidermax-buttonsize/2){
  
  buttony = slidermax-buttonsize/2;
}

if (buttony >slidermin - buttonsize/2){
  
  buttony = slidermin- buttonsize/2;
}



map_y = (map(buttony, slidermax- buttonsize/2, slidermin - buttonsize/2, 10, 3000));

Scale = map_y;


  


  fill(255);
  stroke(255);
    line(width-width/4, slidermax, width-width/4, slidermin);
  rect(buttonx, buttony, buttonsize , buttonsize);
  fill(200);
  textAlign(RIGHT);
  
  textSize(height/80);
  text("Click the buttons below\nto display differnet planets", button1x+buttonsize,  button1y - buttonsize*2) ;
//  text("Scale", width-width/4, slidermax - buttonsize*2);
textAlign(CENTER);
text("Zoom",width-width/4, slidermax - buttonsize);
println(buttony);
pmousePressed = mousePressed;

}

void mouseReleased(){
  
  buttonyon = false;
  
}

