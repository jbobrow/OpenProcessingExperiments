
  float xposfrau1 = 0;
  float luft = 100;
  boolean schnaufen = false;
  PImage bildfrau1right;
  PImage bildfrau1left;
  PImage streifen;
  PImage luft1;
  PImage luft2;
  PImage carleft;
  PImage carright;
  PImage deadimg;
  PImage bg1;
  int gamepoints = 0;
  int gamepointsprov = 0;
  boolean dead=false;
  boolean play=false;
  int backgroundcolor=255; 
  float kreisgroesse9=0;
  int time1 = 0;
  int time2 = 0;
  boolean startgame = false;


void setup() {
  size(800,400);
  background(255);
}

void draw() {
  smooth();
  if (play==false){intro();}
  else {
   
    
            PFont font;
            font = loadFont("Aharoni-Bold-48.vlw"); 

    
    if (startgame==false) {fill(0); textAlign(CENTER); textFont(font, (width/40)); text("click any mouse button to start", (width/2), (height/8)+(width/25));}
  cursor(ARROW);
  fill(255, 230);
  noStroke();
  rect(0,0,width,height);
  fussgaengerstreifen();
  
              textAlign(RIGHT);
            fill(0);
            textFont(font, (width/30)); 
            text(gamepoints, width-(width/30), (height/8));
  
  carleft();
  carright();
  print(mouseX + " - ");
  time1++;
  time2++;
  if (time1==1) {newcarleft();} else if (time1>random(100,1200)) {time1=0;}
  if (time2==80) {newcarright();} else if (time2>random(100,1800)) {time2=0;}
      frau1luft();   

      
      if (schnaufen==false && luft>0) {
        frau1();
      }
      if (schnaufen==false && luft<=0) {
        schnaufen=true;
        frau1();
        luft=luft=luft+0.001;
      }
      if (schnaufen==true && luft<=20) {
        frau1();
        luft=luft=luft+0.001;
      }
      if (schnaufen==true && luft>20) {
        frau1();
        schnaufen=false;
      }
      if (luft<100) {
      luft++;}
      


  }
      if (xposfrau1>=680) {
        gamepoints=gamepointsprov+1;
      }
      
      if (xposfrau1>=width) {
        xposfrau1=0; play=false; startgame=false; return; 
      }
 }

void frau1luft() {
  PImage leiste1;
  leiste1 = loadImage ("leiste1.gif");
  image (leiste1, 20, 20, 200, 50); 
  fill(0, 50);
  rect(20, 20, luft*2,50);

}

void fussgaengerstreifen() {
  streifen = loadImage("fussgaengerstreifen.gif");
  image(streifen, 50, 300, 650, 75);
}


float[] carleftprozent;
int carleftanzahl = 0;
  
void newcarleft() {
  carleftprozent = new float[carleftanzahl+1];
  carleftprozent[carleftanzahl] = 1;
  carleftanzahl++; 
}  
  
void carleft() {
 if (carleftanzahl>0) {
  for (int m=0; m < carleftanzahl; m++) {
        if (carleftprozent[m]<300) {
          carleft = loadImage("auto1.gif");
          image(carleft, 400-((101/100)*carleftprozent[m]), 220, (((230/100)*carleftprozent[m])/2), ((100/100)*carleftprozent[m])/2);
          
         
        }
        
        if (carleftprozent[m]>=300) {
          carleftprozent[m]=0;   
          if (xposfrau1>30 && xposfrau1<350) {
          image(deadimg, xposfrau1, 350, 70, 70); dead=true; gamepoints--; play=false; startgame=false; return;
        }              
      }
        
        carleftprozent[m] = carleftprozent[m]*1.2;
  }
 }
}


float[] carrightprozent;
int carrightanzahl = 0;
  
void newcarright() {
  carrightprozent = new float[carrightanzahl+1];
  carrightprozent[carrightanzahl] = 1;
  carrightanzahl++; 
}  
  
void carright() {
 if (carrightanzahl>0) {
  for (int q=0; q < carrightanzahl; q++) {
        if (carrightprozent[q]<300) {
          carright = loadImage("auto1.gif");
          image(carright, 400-((51/100)*carrightprozent[q]), 220, (((230/100)*carrightprozent[q])/2), ((100/100)*carrightprozent[q])/2);
          
         
        }
        
        if (carrightprozent[q]>=300) {
          carrightprozent[q]=0; 
          if (xposfrau1>330 && xposfrau1<660) {
          image(deadimg, xposfrau1, 350, 70, 70); dead=true; play=false; gamepoints--; startgame=false; return;
          }
       }
       
        
        carrightprozent[q] = carrightprozent[q]*1.2;
  }
 }
}


void frau1() {
  
  bildfrau1right = loadImage("alte_frau_rechts.gif");
  bildfrau1left = loadImage("alte_frau_links.gif");
  deadimg = loadImage("dead.gif");
  luft1 = loadImage("luft1.gif");
  luft2 = loadImage("luft2.gif");
  deadimg = loadImage("dead.gif");
  if (dead==false && startgame==true) {
    if (xposfrau1>680) {  
    xposfrau1=xposfrau1+1;
    image(bildfrau1right, xposfrau1, 250, 70, 100);
    }
    if (xposfrau1>710) {  
    xposfrau1=xposfrau1+5;
    image(bildfrau1right, xposfrau1, 250, 70, 100);
    }
    
    else if (xposfrau1<mouseX) {
        if (schnaufen==false) {
          xposfrau1=xposfrau1+((mouseX-xposfrau1)/40);
          luft = luft - ((mouseX-xposfrau1)/100)*1;
        }
        image(bildfrau1right, xposfrau1, 250, 70, 100);
        if (schnaufen==true) {
          {image(luft1, xposfrau1+50, 272, 15, 15);}
           {image(luft2, xposfrau1+60, 266, 10, 10);}
        }
      }

      else if (xposfrau1>mouseX) {
        if (schnaufen==false) {
          if (xposfrau1<60) {xposfrau1=xposfrau1-5;}
          else{xposfrau1=xposfrau1-((xposfrau1-mouseX)/40);}
          luft = luft - ((xposfrau1-mouseX)/100)*2;
        }
        image(bildfrau1left, xposfrau1, 250, 70, 100);
      }
      
  if (xposfrau1==mouseX) {
        image(bildfrau1right, xposfrau1, 250, 70, 100);
  }
  }
  
  else {image(bildfrau1right, xposfrau1, 250, 70, 100);
}
}






void intro() {
  gamepointsprov=gamepoints;
  dead=false;
  luft=100;
  xposfrau1=0;
  fill(255);
  noStroke();
  rect(0,0,width,height);
              smooth();
            fill(0);
            PFont font;
            font = loadFont("Aharoni-Bold-48.vlw"); 
            textAlign(CENTER);
            textFont(font, (width/15)); 
            text("elderly people", (width/2), (height/8));
            textFont(font, (width/40)); 
            text("beware of the cardboard car", (width/2), (height/8)+(width/25));
            textFont(font, (width/35)); 
                fill(50);
            text("mmp.chris-saner.net", (width/2), (height/20)*19);
            
    int buttoncolor = 0;
    if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
    cursor(HAND);}
    else {cursor(ARROW);}
    
  noStroke();
    float kreisgroesse9 = width/5; 

  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(255, 230, 30, 100);
  }
  else {fill(255);}
  ellipse((width/2), (height/2), kreisgroesse9, kreisgroesse9);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(240, 170, 80, 80);
  }
  else {fill(200);}
  ellipse((width/2), (height/2), kreisgroesse9+10, kreisgroesse9+10);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(220, 140, 30, 50);
  }
  else {fill(210);}
  ellipse((width/2), (height/2), kreisgroesse9+20, kreisgroesse9+20);
  fill(backgroundcolor);
  ellipse((width/2), (height/2), kreisgroesse9/1.2, kreisgroesse9/1.2);
   
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(150);
  }
  else {fill(50, 50);}
  triangle((width/2)-(kreisgroesse9/4), (height/2)-(kreisgroesse9/3), (width/2)+(kreisgroesse9/2.5), (height/2), (width/2)-(kreisgroesse9/4), (height/2)+(kreisgroesse9/3));
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(100);
  }
  else {fill(50, 30);}
  triangle((width/2)-(kreisgroesse9/4)+2, (height/2)-(kreisgroesse9/3)+10, (width/2)+(kreisgroesse9/2.5)-10, (height/2), (width/2)-(kreisgroesse9/4)+2, (height/2)+(kreisgroesse9/3)-10);
  if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {
  fill(50);
  }
  else {fill(50, 20);}
  triangle((width/2)-(kreisgroesse9/4)+5, (height/2)-(kreisgroesse9/3)+15, (width/2)+(kreisgroesse9/2.5)-15, (height/2), (width/2)-(kreisgroesse9/4)+5, (height/2)+(kreisgroesse9/3)-15);
  
}

void mouseClicked() {if (play==false) {if (mouseX>=width/3 && mouseX<=(width/3)*2 && mouseY>=height/3 && mouseY<=(height/3)*2) {play=true; mouseX=10; mouseY=height-20; return;} } else {startgame=true;}}

