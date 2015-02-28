

int posY;
int x = 350;
  int buttonWidth = 100;
  int buttonHeight = 50;
color blu;
color blk;
PFont font1;
//setup, everything runs once
void setup() {
  size(1000,500);
  background(255);
  posY = -50;
  smooth();
  font1 = loadFont("AdobeArabic-Bold-48.vlw"); //remember .vlw
  textFont (font1);
  blu = color (0,0,255);
  blk = color (0);
}

void draw() {
  if(posY>height+600){
  posY=-25;
  }
    background (255);
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(0);
text ("YOU", 500, 150); 
text ("I", 500, 250);
text ("WE", 500, 350);
 if (mouseX>450 && mouseX<550 && mouseY>100 && mouseY< 150){
    background(255);
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(posY);
    posY = posY + 1;
   //posX+=100; //+10, or ^ for faster movement
    text("You know who you are…",150, posY);
    fill (posY-50);
    text ("You are so smoking hot", 200, posY-50);
    fill (posY-100);
    text ("You are an amazing looking woman", 240, posY - 100);
    fill (posY-150);
    text ("You were eyeing us...", 500, posY-150);
    fill (posY-200);
    text ("You were one of the most stunning women there", 420, posY-200);
    fill (posY-250);
    text ("You were so sexy and that skirt looked amazing on you.", 320, posY-250);
    fill (posY-300);
    text ("You had the most amazing little smile", 400, posY - 300);
    fill (posY-400);
    text ("You wore no rings. Are you single?", 770, posY- 400);
    fill (posY-450);
    text ("Contact me if you're single", 500,posY-450);
    fill (posY-500);
    text ("I know you smiled at me.", width/2, posY-500);
    fill (posY-600);
    text ("What do you want? ", width/2, posY-600);
}

 if  (mouseX>450 && mouseX<550  && mouseY>225 && mouseY< 275){
    background(255);
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(posY);
    posY = posY + 1;
    text ("I can't tell you to your face, but I would give anything to ravage you.", 500, posY); 
    fill (posY-150);
    text ("I would have sucked your dick while you made my sandwich.", 600, posY-150); 
    fill (posY-200);
    text ("I would have asked you out, but you were working.", 600, posY-200);
    fill (posY-275);
    text ("What's the proper etiquette for that sort of thing?", 400, posY-275);
    fill (posY-350);
    text ("You must know who I am.", 300, posY-350);
    fill (posY-400); 
    text ("You showed me your tattoos", 300, posY-400);
    fill (posY-450); 
    text ("You called me Papi", 350, posY-450);
    fill (posY-550);
    text ("I was the only one who noticed... ", 500, posY-550);
    fill (posY-600);
    text ("You were much too elegant for the establishment ", 500, posY-600);
    fill (posY-650);
    text ("I loved what I saw", 500, posY-650);
}
if  (mouseX>450 && mouseX<550 && mouseY>300 && mouseY< 350){
    background(255);
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(posY);
    posY = posY + 1;
    text ("We just about collided rounding a corner near the produce.", 600, posY); 
    fill (posY-50);
    text ("Then again on the way back.", 600, posY-50); 
    fill (posY-100);
    text ("If you ran into me again I'd be obliged to blow you.", 450, posY-100);
    fill (posY-200);
    text ("We were there for fish and chips. I thought you were amazing.", 400, posY-250);
    fill (posY-300);
    text ("You got my coffee this morning and I couldn't take my eyes off of you.", 500, posY-300);
    fill (posY-400); 
    text ("We had a fun conversation about the Muppets and the Beatles.", 300, posY-400);
    fill (posY-450); 
    text ("We need to talk more, do you agree?", 350, posY-450);
    fill (posY-500);
    text ("Are you interested in meeting again?", 500, posY-500);
    fill (posY-600);
    text ("Why'd you leave?", 850, posY-600);
}
}





