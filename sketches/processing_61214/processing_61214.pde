
//PImage img;
PFont font, mainFont, countriesFont;
PShape europe;
PShape spain;
PShape UK;
PShape germany;
PShape france;
PShape ireland;
PShape netherlands;
PShape italy;
PShape belgium;
PShape switzerland;
PShape sweden;
PShape austria;
PShape norway;
PShape greece;
PShape portugal;
PShape poland;
PShape croatia;
PShape slovenia;
PShape albania;
PShape hungary;
PShape bosnia;
PShape czech; 
PShape serbia;
PShape macedonia;
PShape slovakia;
PShape denmark;
PShape finland;
boolean view;
int normalAlpha = 255;
int sortAlpha = 0;

int modX, modY;

void setup() {
  background(245);
  size(725, 500);
  europe = loadShape("europe_final.svg");
  spain = europe.getChild("ES");
  spain.disableStyle();
  UK = europe.getChild("UK");
  UK.disableStyle();
  germany = europe.getChild("GE");
  germany.disableStyle();
  france = europe.getChild("FR");
  france.disableStyle();
  ireland = europe.getChild("IR");
  ireland.disableStyle();
  netherlands = europe.getChild("NL");
  netherlands.disableStyle();
  italy = europe.getChild("IT");
  italy.disableStyle();
  belgium = europe.getChild("BE");
  belgium.disableStyle();
  switzerland = europe.getChild("SW");
  switzerland.disableStyle();
  sweden = europe.getChild("SWE");
  sweden.disableStyle();
  austria = europe.getChild("AU");
  austria.disableStyle();
  norway = europe.getChild("NWY");
  norway.disableStyle();
  denmark = europe.getChild("DNMK");
  denmark.disableStyle();
  greece = europe.getChild("GC");
  greece.disableStyle();
  portugal = europe.getChild("PG");
  portugal.disableStyle();
  poland = europe.getChild("PO");
  poland.disableStyle();
  croatia = europe.getChild("CRO");
  croatia.disableStyle();
  slovenia = europe.getChild("SLVN");
  slovenia.disableStyle();
  albania = europe.getChild("ALB");
  albania.disableStyle();
  hungary = europe.getChild("HUN");
  hungary.disableStyle();
  bosnia = europe.getChild("BOS");
  bosnia.disableStyle();
  czech = europe.getChild("CZ");
  czech.disableStyle();
  slovakia = europe.getChild("SLVK");
  slovakia.disableStyle();
  serbia = europe.getChild("SER");
  serbia.disableStyle();
  macedonia = europe.getChild("MAC");
  macedonia.disableStyle();
  denmark = europe.getChild("DNMK");
  denmark.disableStyle();
  belgium = europe.getChild("BE");
  belgium.disableStyle();
  finland = europe.getChild("FIN");
  finland.disableStyle();
  font = loadFont("KozMinPro-Medium-55.vlw");
  countriesFont = loadFont("KhmerMN-48.vlw");
  mainFont = loadFont("KozMinPro-Bold-48.vlw");
  view = false;
}

void draw() {
  
  
  scale(0.5, 0.5);
  modX = 2*mouseX;
  modY = 2*mouseY;
  background(255);
  //shape(europe, -550, -500 );
  fill(0);
  
  //text
  textFont(mainFont);
  textSize(35);
  text("European Debt Per Capita", 160, 800);

  // Example button
  smooth();
  fill(170, 8, 252);
  noStroke();
  ellipse(705, 790, 35, 35);
  textSize(15);
  stroke(0);
  strokeWeight(2);
  line(50,750,1400,750);
  noStroke();
  

  if (view == true) {

   // stroke(0);
   // strokeWeight(2);
   // line(300,100,300,690);
   // noStroke();

    fill(0);
    text("Click the button to put the countries back on the map",800,800);
    fill(255);
    
   textFont(countriesFont);
      textSize(18);
    //0-10,000
    fill(80, 205, 52, sortAlpha);
    text("0-10,000 per capita debt", 65, 720);
    shape(poland, -1000, -500);
    shape(albania, -975, -500);
    shape(bosnia, -950, -400);
    shape(czech, -960, -700);
    shape(macedonia, -980, -560);
    shape(serbia, -1100, -480);


    //textpoland
    if (modX > 80 && modX < 280 && modY > 300 && modY < 475) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Poland 6,639", 200, 400);
    } 



    //textalbania
    if (modX > 180 && modX < 280 && modY > 550 && modY < 600) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Albania 882", 185, 550);
    } 

    //textbosnia
    if (modX > 180 && modX < 280 && modY > 620 && modY < 660) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Bosnia 2,052", 200, 680);
    } 

    //textmacedonia
    if (modX > 180 && modX < 300 && modY > 470 && modY < 540) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Macedonia 2,668", 170, 480);
    } 



    //textserbia
    if (modX > 40 && modX < 100 && modY > 450 && modY < 550) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Serbia 4,178", 120, 545);
    } 


    //czech republic
    if (modX > 100 && modX < 140 && modY > 150 && modY < 260) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Czech Republic 8,260", 120, 200);
    } 



    //10,000-26,000
    fill(44, 77, 80, sortAlpha);
    text("10,000-26,000 per capita debt", 350, 720);
    shape(croatia, -700, -560);
    shape(hungary, -710, -600);
    shape(slovakia, -680, -320);
    shape(slovenia, -650, -450);
    ellipse(705, 790,15,15);

    //textSlovenia
    if (modX > 420 && modX < 480 && modY > 510 && modY < 580) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Slovenia 25,555", 470, 540);
    } 


    //textCroatia
    if (modX > 400 && modX < 480 && modY > 420 && modY < 470) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Croatia 13,519", 470, 470);
    } 


    //textHungary
    if (modX > 400 && modX < 480 && modY > 350 && modY < 400) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Hungary 14,821", 400, 420);
    } 


    //textSlovakia
    if (modX > 420 && modX < 480 && modY > 600 && modY < 680) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Slovakia 10,926", 470, 580);
    } 


    //26,000-75,000
    fill(51, 58, 240,sortAlpha);
    shape(UK, -50, -550);
    shape(germany, -280, -500);
    shape(spain, -175, -505);
    shape(greece, -400, -585);
    shape(finland, -400, -550);
    shape(france, -250, -720);
    shape(portugal, -120, -680);
    shape(italy, -450, -970);
    text("25,000-75,000 per capita debt", 650, 720);

    //textItaly

    if (modX > 580 && modX < 650 && modY > 50 && modY < 150) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Italy,36,841", 400, 100);
    }

    //textFinland

    if (modX > 750 && modX < 800 && modY > 50 && modY < 150) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Finland 68,960", 850, 100);
    }


    //textGermany
    if (modX > 600 && modX < 750 && modY > 225 && modY < 325) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Germany 57,755", 500, 250);
    }

    //textUK
    if (modX > 850 && modX < 900 && modY > 200 && modY < 350) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("UK 47,568", 915, 280);
    }


    //textPortugal
    if (modX > 650 && modX < 700 && modY > 350 && modY < 450) { // sorted view
     textFont(countriesFont);
      textSize(18);
      text("Portugal 46,795", 525, 425);
    } 

    //textSpain
    if (modX > 650 && modX < 700 && modY > 550 && modY < 650) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("Spain, 47,069", 500, 570);
    } 

    //textFrance
    if (modX > 725 && modX < 800  && modY > 375 && modY < 450) { // sorted view
      textFont(countriesFont);
      textSize(18);
      text("France, 74,619", 840, 400);
    } 



    //textGreece
    if (modX > 775 && modX < 850  && modY > 500 && modY < 550) { // sorted view
     textFont(countriesFont);
      textSize(18);
      text("Greece 47,636", 900, 600);
    } 


    //75,000-100,000
    fill(247, 122, 160,sortAlpha);
    shape(sweden, -50, -280);
    shape(austria, -50, -350);
    text("75,000-100,000 per capita debt", 920, 720);



    //textSweden   
    if (modX > 1000 && modX < 1080  && modY > 410 && modY < 540) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Sweden 57,755", 875, 450);
    }




    //textAustria
    if (modX > 1000 && modX < 1080  && modY > 550 && modY < 650) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Austria,90,128", 1090, 560);
    }

    //100,000+

    fill(240, 0, 0,sortAlpha);
    shape(belgium, 350, -490);
    shape(netherlands, 330, -400);
    shape(switzerland, 250, -380);
    shape(ireland, 520, -520);
    shape(norway, 190, -300);
    shape(denmark, 180, -290);
    text("100,000+ per capita debt", 1200, 720);


    //textBelguim
    if (modX > 1290 && modX < 1330  && modY > 400 && modY < 440) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Belgium 113,603", 1259, 400);
    }

    //textNetherlands
    if (modX > 1290 && modX < 1330  && modY > 440 && modY < 490) { // sorted vie
     textFont(countriesFont);
      textSize(18);
      text("Netherlands 226,503", 1259, 550);
    }


    //textDenmark
    if (modX > 1220 && modX < 1300  && modY > 500 && modY < 590) { // sorted vie
     textFont(countriesFont);
      textSize(18);
      text("Denmark 101,084", 1259, 550);
    }


    //textSwitzerland
    if (modX > 1200 && modX < 1280  && modY > 600 && modY < 620) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Switzerland 154,063", 1200, 650);
    }


    //textNorway 
    if (modX > 1200 && modX < 1280  && modY > 360 && modY < 500) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Norway 131,220", 1065, 445);
    }
    
    
    if (modX > 1200 && modX < 1300  && modY > 100 && modY < 140) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Norway 131,220", 1065, 445 );
    }
   

    //textIreland
    if (modX > 1340 && modX < 1390  && modY > 300 && modY < 340) { // sorted vie
      textFont(countriesFont);
      textSize(18);
      text("Ireland 519,070", 1259, 400);
    }
    
  } 
  
  else { // normal map view    
    fill(0, 0, 0, normalAlpha);
    text("Click the button to rearrange the map according to debt per capita in USD", 800,800);
    shape(spain, -300, -500);
    shape(UK, -300, -500);
    shape(germany, -300, -500);
    shape(france, -300, -500);
    shape(ireland, -300, -500);
    shape(netherlands, -300, -500);
    shape(italy, -300, -500);
    shape(belgium, -300, -500);
    shape(switzerland, -300, -500);
    shape(sweden, -300, -500);
    shape(austria, -300, -500);
    shape(norway, -300, -500);
    shape(denmark, -300, -500);
    shape(greece, -300, -500);
    shape(portugal, -300, -500);
    shape(poland, -300, -500);
    shape(croatia, -300, -500);
    shape(slovenia, -300, -500);
    shape(albania, -300, -500);
    shape(hungary, -300, -500);
    shape(bosnia, -300, -500);
    shape(serbia, -300, -500);
    shape(macedonia, -300, -500);
    shape(slovakia, -300, -500);
    shape(denmark, -300, -500);
    shape(belgium, -300, -500);
    shape(slovenia, -300, -500);
    shape(bosnia, -300, -500);
    shape(czech, -300, -500);
    shape(finland, -300, -500);
  }
  
  if (view == true) { //sort view
    if (sortAlpha < 255) sortAlpha++;
    if (normalAlpha > 0) normalAlpha--;
  } else { // normal view
    if (normalAlpha < 255) normalAlpha++;
    if (sortAlpha > 0) sortAlpha--;
    
  }
}

void mousePressed() {
  if (modX > 700 && modX < 790 && modY > 770 && modY < 805) { // sorted view
    view = !view;
  }
}



