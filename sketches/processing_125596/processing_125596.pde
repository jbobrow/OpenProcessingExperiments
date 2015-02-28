
PImage tur1;
PImage tur2;
PImage flur1;
PImage flur2;
PImage flur3;
PImage flur4;
PImage bad1;
PImage bad2;
PImage wohn1;
PImage wohn2;
PImage kuche1;
PImage kuche2;
PImage bath;
PImage entry;
PImage kitchen;
PImage lroom;
PImage home;
boolean tur = true;
boolean flur = false;
boolean bad = false;
boolean wohn = false;
boolean kuche = false;
boolean weiter = false;


void setup()
{
  size(500,400);
tur1 = loadImage("tur1.jpg");
tur2 = loadImage("tur2.jpg");
flur1 = loadImage("flur1.jpg");
flur2 = loadImage("flur2.jpg");
flur3 = loadImage("flur3.jpg");
flur4 = loadImage("flur4.jpg");
bad1 = loadImage("bad1.jpg");
bad2 = loadImage("bad2.jpg");
wohn1 = loadImage("wohn.jpg");
wohn2 = loadImage("wohn2.jpg");
kuche1 = loadImage("kuche1.jpg");
kuche2 = loadImage("kuche2.jpg");
bath = loadImage("bath.png");
entry = loadImage("Entry.png");
kitchen = loadImage("kitchen.png");
lroom = loadImage("livingroom.png");
home = loadImage("home.png");
}

void draw(){

  image(tur1,0,0);
  if(tur==true){
    if(mouseX>=180 && mouseX<= 320){
         image(tur2,0,0);
         tint(255, 200);
         image(entry,mouseX,mouseY);
         noTint();
        }
  }else if(flur==true){
    image(flur1,0,0);
    image(home,0,0);
    if(mouseX>=10 && mouseX<= 120 && mouseY>50){
         image(flur2,0,0);
         tint(255, 200);
         image(bath,mouseX,mouseY);
         noTint();
         image(home,0,0);
        }else if(mouseX>=260 && mouseX<= 335){
         image(flur3,0,0);
         tint(255, 200);
         image(lroom,mouseX,mouseY);
         noTint();
         image(home,0,0);
        }else if(mouseX>=365 && mouseX<= 385){
         image(flur4,0,0);
         tint(255, 200);
         image(kitchen,mouseX,mouseY);
         noTint();
         image(home,0,0);
        }
  }else if(bad==true){
    image(bad1,0,0);
    image(home,0,0);
    if(weiter==true){
      image(bad2,0,0);
      image(home,0,0);
    }
  }else if(wohn==true){
    image(wohn1,0,0);
    image(home,0,0);
    if(weiter==true){
      image(wohn2,0,0);
      image(home,0,0);
    }
  }else if(kuche==true){
    image(kuche1,0,0);
    image(home,0,0);
    if(weiter==true){
      image(kuche2,0,0);
      image(home,0,0);
    }
  }
  
  
}

void mouseClicked() {
  if (mouseX<=50&&mouseY<=50){
    tur=true;
    flur=false;
    bad=false;
    wohn=false;
    kuche=false;
    weiter=false;
  }
  else if (mouseX>=180 && mouseX<= 320 && tur==true) {
    tur=false;
    flur=true;
  } else if (flur==true){ 
      if (mouseX>=10 && mouseX<= 120 && mouseY>50 ){
      flur=false;
      bad=true;
      }else if(mouseX>=260 && mouseX<= 335){
      flur=false;
      wohn=true;
      }else if(mouseX>=365 && mouseX<= 385){
      flur=false;
      kuche=true;
      }
  }else if(bad==true||wohn==true||kuche==true){
    /*bad=false;
    wohn=false;
    kuche=false;*/
    weiter=true;
  }
else {
    println(1);
    tur=true;
    flur=false;
    bad=false;
    wohn=false;
    kuche=false;
    weiter=false;
  }
}


