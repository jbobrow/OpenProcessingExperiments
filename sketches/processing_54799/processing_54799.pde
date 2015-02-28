

float x = 1;
int y=0;
PFont myfont;


void setup(){
 size(790,450); 
 background(255,255,255);
 myfont= loadFont("AvantGardeLT-Medium-48.vlw");
}

void draw(){
  textFont(myfont);
  
stroke(213,5,255);
strokeWeight(1);
line(790,450,0,0);

stroke(213,5,255);
strokeWeight(1);
line(790,360,0,0);

stroke(213,5,255);
strokeWeight(1);
line(790,260,0,0);

stroke(213,5,255);
line(790,170,0,0);

stroke(213,5,255);
line(790,80,0,0);

stroke(213,5,255);
line(600,450,0,0);

stroke(213,5,255);
line(450,450,0,0);

stroke(213,5,255);
line(300,450,0,0);

stroke(213,5,255);
line(190,450,0,0);

stroke(213,5,255);
line(90,450,0,0);


 //textFont(myFont);
 textSize(48);
 fill(142,135,106);
 text("Nutella",60+x,80+x);
 
  textSize(48);
 fill(77,56,1);
 text("Nutella",64+x,84+x);
 
  textSize(48);
 fill(44,35,1);
 text("Nutella",68+x,88+x);
 


 textSize(57);
 fill(247,230,232);
text("cupcakes",140+x,150+x);

textSize(57);
 fill(245,190,197);
text("cupcakes",144+x,154+x);

textSize(57);
 fill(247,135,148);
text("cupcakes",147+x,157+x);

textSize(60);
fill(196,196,196);
text("are",373+x,214+x);

textSize(60);
fill(103,102,102);
text("are",377+x,218+x);

textSize(60);
fill(0);
text("are",381+x,222+x);
  
textSize(90);
fill(255,243,3);
text("Baking",390+x,320+x);

textSize(90);
fill(255,205,3);
text("Baking",394+x,327+x);


textSize(90);
fill(255,167,3);
text("Baking",399+x,335+x);



}

void mousePressed(){
  // x+=5; 
 if ( y%5 != 0){
   x = x+20;
 } else {x=2;}
 y++;
 
 
}

