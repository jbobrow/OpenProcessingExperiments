
// initialisierung  Grafiken
PImage angelbar;
PImage boy_sad_left;
PImage boy_sad_right;
PImage boy_happy_left;
PImage boy_happy_right;
PImage bottle_brown;
PImage bottle_red;
PImage bottle_green;
PImage bottle_blue;
PImage wow;
PImage gut;
PImage naja;
PImage stufe_1;
PImage stufe_2;
PImage stufe_3;
PImage stufe_4;

// initialisierung Punktestand
int punktestand = 0;

// initialisierung Promille
int promille = 0;

// initialisierung hoehen (y-achse), breiten (zufallswert x-achse) und geschwindigkeiten (zufallswert) für die flaschen
//braune flasche
int hoehe = 180;
int zufall = int(random(0,580));
int speed = int(random(2,8));

//rote flasche
int hoehe2 = 180;
int zufall2 = int(random(0,580));
int speed2 = int(random(2,8));

//grüne flasche
int hoehe3 = 180;
int zufall3 = int(random(0,580));
int speed3 = int(random(2,8));

//blaue flasche
int hoehe4 = 180;
int zufall4 = int(random(0,580));
int speed4 = int(random(2,8));


//beginn setup
void setup() {
  size(506,580); //fenstergrösse
  
  
  //bilder
  angelbar = loadImage("angel_bar.jpg");
  boy_happy_left = loadImage("boy_happy_left.gif");
  boy_happy_right = loadImage("boy_happy_right.gif");
  boy_sad_left = loadImage("boy_sad_left.gif");
  boy_sad_right = loadImage("boy_sad_right.gif");
  bottle_brown = loadImage("bottle_brown.gif");
  bottle_red = loadImage("bottle_red_2.gif");
  bottle_green = loadImage("bottle_green_2.gif");
  bottle_blue = loadImage("bottle_blue_2.gif");
  wow = loadImage("wow.gif");
  gut = loadImage("gut.gif");
  naja = loadImage("naja.gif");
  stufe_1 = loadImage("stufe_1.gif");
  stufe_2 = loadImage("stufe_2.gif");
  stufe_3 = loadImage("stufe_3.gif");
  stufe_4 = loadImage("stufe_4.gif");
  

 noCursor(); //kein cursor
 smooth(); //weiche rundungen
 imageMode(CENTER); //zentrierung bilder
  
}


boolean sad = false; //trauriger mann, falls nicht braune flasche berührt wird

//beginn draw
void draw() {
  background(angelbar); //hintergrund
  
  //hintergrund-beleuchtung für punkte- und zeit-anzeige (pixel eines bildes bearbeiten und in for-schlaufe verwenden)
  for (int x = 280; x < 380; x = x + 1){
    for (int y = 260; y < 280; y = y + 1){
      color farbe = get(x,y);
      float rt = red(farbe);
      float gn = green(farbe);
      float bl = blue(farbe);
      stroke(rt, 0.9*gn,bl);
      point(x, y-10); //rechte beleuchtung punkte
      point(x-155, y-10); //linke beleuchtung zeit
    }
  }
 
  
  
  //frau an der bar
  if(promille < 135){
     image(stufe_1,445,420,115,243);
   }
  else{
    if(promille <= 200){
      image(stufe_2,445,420,115,243);
    }
    else{
      if(promille <= 260){
        image(stufe_3,445,420,115,243);
      }
      else{
        if(promille >= 260){
          image(stufe_4,445,420,115,243);
        }
  }
  }
  }
  
   //promille-anzeige
   fill(255,255,0);
   stroke(1);
   line(486,500,486,190);
   line(486,190,506,190);
   rect(486,500,20,-promille);
   
   //2 promille text
   textSize(20);
   fill(0);
   text("2‰",470,200);
   
   //1.5 promille text
   fill(0);
   text("1.5‰",450,300);
   
  /* fill(255);
   text("1‰",470,390);
   */
   

   int sek = millis() / 1000; //initialisierung (mili-)sekunden
   int zeit = 60 - sek; //zeit-limite
   
   //countdown fertig bei 0
   if(zeit <= 0){
     zeit = 0;
   }

//anzeige zeit
  fill(0);
  textSize(20);
   text("Zeit",155,265);
   text(zeit,155,290);
   
   // anzeige zeit, letzte 10 sekunden rot
   if(zeit <= 10){
  textSize(20);
   text("Zeit",155,265);
   fill(250,0,0);
   text(zeit,155,290);
   }
   
  //anzeige punkte
   fill(0);
  textSize(20);
   text("Punkte",305,265);
   
    fill(0);
  textSize(20);
   text(punktestand,305,290);
   
   //solange countdown läuft
   if(zeit != 0){
  
     //braune flasche
image(bottle_brown, zufall, hoehe, 21, 64);
hoehe = hoehe + speed;
if(hoehe > height){
  speed = int(random(2,8));
  hoehe = 180 + speed;
  zufall = int(random(0,580));
}

//wenn braune flasche mann berührt
if(hoehe >= 350 && zufall >= mouseX - 54 && zufall <= mouseX + 54){
  punktestand = punktestand + 1;
  hoehe = 180;
  speed = int(random(2,8));
  hoehe = 180 + speed;
  zufall = int(random(0,580));
  sad = false;
  promille = promille + 6;
}

//rote flasche
image(bottle_red, zufall2, hoehe2, 21, 64);
hoehe2 = hoehe2 + speed2;
if(hoehe2 > height){
  speed2 = int(random(2,8));
  hoehe2 = 180 + speed;
  zufall2 = int(random(0,580));
}

//wenn rote flasche mann berührt
if(hoehe2 >= 350 && zufall2 >= mouseX - 54 && zufall2 <= mouseX + 54){
  punktestand = punktestand - 1;
  hoehe2 = 180;
  speed2 = int(random(2,8));
  hoehe2 = 180 + speed;
  zufall2 = int(random(0,580));
  sad = true;
  promille = promille + 3;
}

//grüne flasche
image(bottle_green, zufall3, hoehe3, 21, 64);
hoehe3 = hoehe3 + speed3;
if(hoehe3 > height){
  speed3 = int(random(2,8));
  hoehe3 = 180 + speed3;
  zufall3 = int(random(0,580));
}

//wenn grüne flasche mann berührt
if(hoehe3 >= 350 && zufall3 >= mouseX - 54 && zufall3 <= mouseX + 54){
  punktestand = punktestand - 1;
  hoehe3 = 180;
  speed3 = int(random(2,8));
  hoehe3 = 180 + speed3;
  zufall3 = int(random(0,580));
  sad = true;
  promille = promille + 3;
}

//blaue flasche
image(bottle_blue, zufall4, hoehe4, 21, 64);
hoehe4 = hoehe4 + speed4;
if(hoehe4 > height){
  speed4 = int(random(2,8));
  hoehe4 = 180 + speed4;
  zufall4 = int(random(0,580));
}

//wenn blaue flasche mann berührt
if(hoehe4 >= 350 && zufall4 >= mouseX - 54 && zufall4 <= mouseX + 54){
  punktestand = punktestand - 1;
  hoehe4 = 180;
  speed4 = int(random(2,8));
  hoehe4 = 180 + speed4;
  zufall4 = int(random(0,580));
  sad = true;
  promille = promille + 3;
}

//maximalwert promille-anzeige
if(promille >= 310){
  promille = 310;
}

//mann froh, links
   if(mouseX <= pmouseX && !sad){
    image(boy_happy_left, mouseX, 480, 108, 192);
  }
  
  //mann traurig links
  else{
    if(mouseX <= pmouseX){
  image(boy_sad_left, mouseX, 480, 108, 192);
  }
  }
  //mann froh rechts
   if(mouseX > pmouseX && !sad){
    image(boy_happy_right, mouseX, 480, 108, 192);
  }
  
  //mann traurig rechts
  else{
    if(mouseX > pmouseX){
  image(boy_sad_right, mouseX, 480, 108, 192);
  }
  }
   
   }
   
   
   
   
   
   //sobald zeitlimite erreicht ist
   
   else{
     
     if(zeit == 0){
    
    //wenn punktestand kleiner als 10: naja
    if(punktestand < 10){
      textSize(22);
      fill(255,0,0);
      image(naja, 255, 300, 371, 158);
      text(punktestand,333,300);
    }
    //wenn punktestand kleiner als 20: gut
    else{
      if(punktestand >= 10 && punktestand < 20){
        textSize(22);
      fill(255,0,0);
      image(gut, 255, 300, 371, 158);
      text(punktestand,320,300);
      }
      //wenn punktestand kleiner ab 20: wow
      else{
      if(punktestand >= 20){
        textSize(22);
      fill(255,0,0);
      image(wow, 255, 300, 371, 158);
      text(punktestand,330,299);
      }
    }
    }
    //wenn promille weniger als 135: kaum besoffen
    if(promille < 135){
      fill(255);
      noStroke();
      rect(160,305,190,20);   
      fill(0);
      textSize(16);
      text("und bist kaum besoffen!",162,320);  
      fill(255,0,0);
      /*
      textSize(26);
      text("Restart",420,580); 
      */
    }
    //wenn promille weniger grösser gleich 135: recht besoffen
    else{
      if(promille >= 135){
        fill(255);
      noStroke();
      rect(160,305,190,20);   
      fill(0);
      textSize(16);
      text("und bist recht besoffen!",162,320); 
      
      }
    }
    //wenn promille weniger ab 260: total besoffen
    if(promille >=260){
      fill(255);
      noStroke();
      rect(160,305,190,20);   
      fill(0);
      textSize(16);
      text("und bist total besoffen!",162,320); 
     
    }
    
     }
     
     
     
   }
   
   

}


