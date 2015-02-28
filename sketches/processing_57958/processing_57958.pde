

int posY;
int hohoho;
int x = 350;
float i;
float n;
float p;
float t;
float b;
float c;
float j;
float g;
float z;
float h;
float backback;
float drift;
float ti;
float back;
float yo;
float l;
float change;
float changer;
float no;
float ill;
float dope;
float ole;
float xoxo;
float yell;


boolean button1 = false;

  int buttonWidth = 100;
  int buttonHeight = 50;
color blu;
color blk;
PFont font1;
float random;

//setup, everything runs once
void setup() {
  size(1000,500);
 
  frameRate = 1000;
  background(255);
  posY = -50;
  smooth();
  font1 = loadFont("AdobeArabic-Bold-48.vlw"); //remember .vlw
  textFont (font1);
  blu = color (0,0,255);
  blk = color (0);
  b=random (50,200);
  c=random (50,400);
  j=random (50,250);
  g=random (600,900);
  p=random(900,1020);
  z=random(50,200);
  h= random (50,400);
  drift=random(50,200);
  ti=random(50,200);
  back=random(900,1000);
  yo=random(50,350);
  n=random(900,1000);
  l= random(50,150);
  backback=random(1000,1010);
  no=(random(10,200));
  ill=(random(500,700));
  dope=(random(0,100));
  change=(random(500,800));
  changer=(random(200,500));
  ole=-200;
  xoxo=(random(200,500));
  yell=1;

}

void draw() {
  println("frameCount: " + frameCount);
  if(posY>height+700){
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
    smooth();
    textFont (font1,30);
    textAlign (LEFT);
    fill(posY);
    x=50;
    posY = posY + 1;
   //posX+=100; //+10, or ^ for faster movement
    text("You know who you are…",c, posY);
    c++;
    fill (random+i);
    i++;
    if (frameCount>5000){
      c= h++;
      fill (random+i);
    i++;
    }
    text ("You are so smoking hot", x+10, posY-x);
    fill (posY-2*x);
    text ("You are an amazing looking woman",b, posY-2*x);
    b=b+2;
    if (frameCount>1000&&frameCount<5000){
      b=50;
      b++;
    }
    fill (posY-3*x);
    text ("You were eyeing us...", x+100, posY-3*x);
    fill (posY-4*x);
    text ("You were one of the most stunning women there", g, posY-4*x);
    g--;
    if (frameCount>2700){
      g++;
    }
    if(frameCount>3000){
      g--;
    }
    fill (posY-5*x);
    text ("You were so sexy and that skirt looked amazing on you.", x+120, posY-5*x);
    fill (random);
    text ("You had the most amazing little smile", j, posY - 6*x);
    j++;
    if (frameCount>2600){
      text ("I asked you for a cigarette, but I was too nervous to follow up. ", j , posY);
      text ("I wanted to talk, but I was with friends and you were reading.", j+10, posY-100); 
      j--;
    }
    fill (posY-7*x);
    text ("You wore no rings. Are you single?", x+120, posY- 7*x);
    fill (posY-8*x);
    text ("Contact me if you're single", x+width/2,posY-8*x);
    fill (posY-9*x);
    text ("I know you smiled at me.",p, posY-9*x);
    p=p-1;
    fill (20);
    text ("What do you want? ", width/2, posY-10*x);
    if (frameCount>3000){
    fill(posY-11*x);
    text ("I'm afraid of you");
    }

}

 if  (mouseX>450 && mouseX<550  && mouseY>225 && mouseY< 275){
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(posY);
    posY = posY + 1;
    text ("I can't tell you to your face, but I would give anything to ravage you.", 500, posY); 
    fill (random+n);
    n++;
    text ("I would have sucked your dick while you made my sandwich.", 600, posY-150); 
    fill (posY-200);
    text ("I would have asked you out, but you were working.", drift, posY-200);
    drift++;
    text ("I would let you smoke in bed. ", 300, posY-225);
    fill (25);
    text ("What's the proper etiquette for that sort of thing?", 400, posY-325);
    fill (posY-350);
    text ("You must know who I am.", 300, posY-350);
    fill (posY-400); 
    text ("You showed me your tattoos", ti, posY-400);
    ti=ti+2;
    if(frameCount>2500){
      fill (60);
    text ("It took everything I had not to fuck you tonight", 500, posY-400);
    } 
    fill (posY-450); 
    text ("You called me Papi", yo, posY-450);
    yo++;
    text ("5.62, 1.8, 7.8  Circumference, Diameter, Length. Call me.",300,posY-500); 
    fill (posY-550);
    text ("I was the only one who noticed... ", back, posY-550);
    back--;
    fill (posY-600);
    text ("You were much too elegant for the establishment ", 500, posY-600);
    text ("You're a total dick, but so hot.", 550, posY-650);
    fill (random+1);
    text ("I haven't seen you in weeks.",xoxo,posY-475);
    xoxo++;
    text ("You're being evasive, again.", dope, posY-650);
    dope++;
    text ("I loved what I saw", 500, posY-700);
    if (frameCount>3300){
      textAlign(LEFT); 
      fill (posY);
      text ("I wanted to be the one to break it off. " , 50,posY);
      text ("It would have been better if I had broken it off", 250,posY-75);
    }
}
if  (mouseX>450 && mouseX<550 && mouseY>300 && mouseY< 350){
    smooth();
    textFont (font1,30);
    textAlign (CENTER);
    fill(posY);
    posY = posY + 1;
    text ("We just about collided rounding a corner near the produce.", l, posY); 
    l++;
    fill (posY-50);
    text ("Then again on the way back.", n, posY-50); 
    n--;
    fill (posY-100);
    text ("If you ran into me again I'd be obliged to blow you.", 450, posY-100);
    fill (random+p);
    p++;
    if (frameCount>2500&&frameCount<4000){
      p--;
    }
    if (frameCount>4000){
      p++;
    }
    text ("We were there for fish and chips. I thought you were amazing.", 400+p, posY-250);
    p=0+1;
    fill (posY-300);
    text ("You got my coffee this morning and I couldn't take my eyes off of you.", no, posY-300);
    no++;
    fill (posY-400); 
    text ("We had a fun conversation about the Muppets and the Beatles.", backback, posY-400);
    backback--;
    if(frameCount>2000&&frameCount<3000){
      backback++;
    }
    if (frameCount>3000){
      backback--;
    }
    fill (posY-450); 
    text ("We need to talk more, do you agree?", 350, posY-450);
    fill (posY-200);
    text ("We fight all the time.", ill, posY-200);
    ill--;
    fill (posY-700);
    text ("We're both so quiet. We would end up hating each other.", ole-50, posY-700);
    ole=ole+1;
    fill(50);
    text ("Are you interested in meeting again?", 500, posY-500);
    fill (posY-500);
    text ("Why'd you leave?",yell, posY-525);
    yell++;
    if(frameCount>2000){
    fill (20);
    text ("We've never spoken, but I see you everyday. ", change, posY);
    text ("Are you bored of me?", change, posY);
    change--;
    posY++;
}
}
    if (frameCount>2000){
      fill(hohoho);
      text ("your husband can watch", width/2, hohoho);
      hohoho++;
    }
}



