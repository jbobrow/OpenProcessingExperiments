
int card =0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;


void setup() {
  size(900, 900);

  img1 = loadImage("chicken salad.png");
  img2 = loadImage("chilli recipe.png");
  img3 = loadImage("cookies.png");
  img4 = loadImage("cupcake.png");
  img5 = loadImage("curry.png");
  img6 = loadImage("mozza chicken.png");
  img7 = loadImage("potoatoe skins.png");
  img8 = loadImage("flapjack.png");
  img9 = loadImage("garlic bread.png");

  PFont font;
  font = loadFont("AmericanTypewriter-40.vlw");
  textFont(font, 40);
}

void draw() {
  background(0);


  if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=150 & mouseY<=190) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=150 & mouseY<=190)  {card=1;}
   
   
   
   text ("Garlic Bread", 70, 150);}
     
     
     
 
 
 else if (card==1) {
  cursor();


 }


  if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=200 & mouseY<=240) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=200 & mouseY<=240)  {card=1;}
   
   
   
   text ("Potato Skins", 70, 200);}
     
     
     
 
 
 else if (card==1) {
  cursor();

 }
    
 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=300 & mouseY<=340) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=300 & mouseY<=340)  {card=1;}
   
   
   
   text ("Chicken Salad", 70, 300);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  

   
}

 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=350 & mouseY<=390) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=350 & mouseY<=390)  {card=1;}
   
   
   
   text ("Chilli Con-Carne", 70, 350);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  

}


 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=400 & mouseY<=440) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=400 & mouseY<=440)  {card=1;}
   
   
   
   text ("Mozzerella Chicken", 70, 400);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  image (img6, 0, 0,width,height);
}

 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=450 & mouseY<=490) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=450 & mouseY<=490)  {card=1;}
   
   
   
   text ("Curry", 70, 450);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  image (img5, 0, 0,width,height);
}

 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=550 & mouseY<=590) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=550 & mouseY<=590)  {card=1;}
   
   
   
   text ("Cupcakes", 70, 550);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  image (img4, 0, 0,width,height);
}

 if (card==0) {
    
    
     
   if (mouseX>= 70 & mouseX<=150 & mouseY>=600 & mouseY<=640) { fill(129,12,12);} else {
  fill (255);}
   
   if ((mousePressed) & mouseX>= 70 & mouseX<=150 & mouseY>=600 & mouseY<=640)  {card=1;}
   
   
   
   text ("Flapjacks", 70, 600);}
     
     
     
 
 
 else if (card==1) {
  cursor();

  image (img8, 0, 0,width,height);
}

text ("Menu",400,50);
}

