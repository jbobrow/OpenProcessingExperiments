
//Making a map of the Netherlands with Data
//Created by Jesse Groen

PImage mapImage;
PFont font;

boolean people = false;
boolean verkeer = false;
boolean money = false;

//menu 1
int x = 10;
int y = 10;
int w = 50;
int h = 50;

//menu 2
int y2 = 80;

//menu 3
int y3 = 150;

void setup() {
  size(600, 700);
  mapImage = loadImage("Nederland.png");
  font = loadFont("MyriadWebPro-12.vlw");
  textFont(font);
}

void draw() {
  smooth();
  background(255);
  image(mapImage, 50, 50);
  
  //text
  fill(0);
  text("Gemiddeld inwoners per procincie",70,40);
  text("Aantal verkeersdoden per jaar",70,110);
  text("Gemiddeld inkomen van personen",70,180);




  if (people == true) {
    
    //draw Legenda
    fill(0);
    text("Legenda:", 10,270);
    text(">1500", 50,315);
    text("1000-1500", 50,360);
    text("500-1000", 50,395);
    text("0-500", 50,420);
    fill(255,0,0);
    rect(10,290,20,40);
    fill(255,100,0);
    rect(10,340,15,30);
    fill(255,200,0);
    rect(10,380,10,20);
    fill(255,255,0);
    rect(10,410,5,10);
              
    fill(255,0,0); 
    //Noord-Holland
    rect(230,220,20,40);
    //Zuid-Holland
    rect(200,350,20,40); 
    //Noord Brabant
    rect(290,460,20,40); 
    //Zeeland
    rect(110,480,20,40); 
       
    fill(255,100,0);
    //Gelderland
    rect(400,350,15,30);  
    
    fill(255,200,0);     
    //Utrecht
    rect(280,350,10,20);  
    //Limburg
    rect(390,550,10,20); 
    //Overijssel
    rect(450,270,10,20);             
    
    fill(255,255,0);   
    //Friesland
    rect(370,150,5,15); 
    //Groningen
    rect(470,90,5,15); 
    //Drenthe
    rect(470,200,5,15);
    //Flevoland
    rect(330,280,5,15); 
  }
  
   //when pressed on the traffic accidents button
  if (verkeer == true) {
     
    //draw Legenda
    fill(0);
    text("Legenda:", 10,270);
    text(">90", 60,315);
    text("61-90", 60,365);
    text("31-60", 60,405);
    text("0-30", 60,435);
    fill(255,0,0);
    ellipse(30,310,40,40);
    fill(255,100,0);
    ellipse(30,360,30,30);
    fill(255,200,0);
    ellipse(30,400,20,20);
    fill(255,255,0);
    ellipse(30,430,15,15);
         
    fill(255,0,0);  
    //Zuid-Holland
    ellipse(210,380,40,40);
    //Noord-Brabant
    ellipse(300,470,40,40); 
           
    fill(255,100,0);  
    //Noord Holland
    ellipse(245,230,30,30); 
    //Gelderland
    ellipse(390,370,30,30); 
            
    fill(255,200,0);  
    //Utrecht
    ellipse(290,360,20,20); 
    //Limburg
    ellipse(385,575,20,20); 
    //Overijssel
    ellipse(440,280,20,20); 
       
    fill(255,255,0);
       
    //Zeeland
    ellipse(100,500,15,15); 
    //Groningen
    ellipse(480,110,15,15); 
    //Drenthe
    ellipse(470,200,15,15); 
    //Friesland
    ellipse(370,160,15,15); 
    //Flevoland
    ellipse(340,280,15,15);   

  }
  
  //when pressed on the money income button
  if (money == true) {
      
  //draw Legenda
    fill(0);
    text("Legenda:", 10,275);
    text(">32k", 60,310);
    text("30k-32k", 60,360);
    text("28k-30k", 60,395);
    text("26k-28k", 60,425);
    fill(255,0,0);
    rect(10,290,40,40);
    fill(255,100,0);
    rect(10,340,30,30);
    fill(255,200,0);
    rect(10,380,20,20);
    fill(255,255,0);
    rect(10,410,15,15);
                   
    //draw squares
       
    fill(255,100,0);    
    //Noord-Holland
    rect(230,220,30,30);
    //Zuid-Holland
    rect(190,360,30,30); 
    //Utrecht
    rect(280,350,30,30); 
    //Zeeland
    rect(110,480,30,30); 
       
    fill(255,200,0);   
    //Flevoland
    rect(320,280,20,20); 
    //Overijssel
    rect(450,270,20,20); 
    //Gelderland
    rect(400,350,20,20); 
    //Brabant
    rect(280,470,20,20); 
    //Limburg
    rect(380,550,20,20); 
       
    fill(255,255,0);       
    //Friesland
    rect(350,150,15,15); 
    //Groningen
    rect(470,90,15,15); 
    //Drenthe
    rect(470,200,15,15); 
  }
  
  //meubuttons
  if(people == false){
    fill(175);
    rect(x,y,w,h);
  }
  if(people == true) {
    fill(255,0,0);
    rect(x,y,w,h); 
  } 
  if(verkeer == false){
    fill(175);
    rect(x,y2,w,h);
  }
  if(verkeer == true) {
    fill(255,0,0);
    rect(x,y2,w,h); 
  }
  
  if(money == false){
    fill(175);
    rect(x,y3,w,h);
  }
  if(money == true) {
    fill(255,0,0);
    rect(x,y3,w,h); 
  }
}

void mousePressed() {
  
  //people
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    if (people == false) {
      people = true;
      money = false;
      verkeer = false;
    }
    else {
      people = false; 
    }
  } 
 
  if (mouseX > x && mouseX < x+w && mouseY > y2 && mouseY < y2+h) {
    if (verkeer == false) {
      verkeer = true;
      money = false;
      people = false;
    }
    else {
      verkeer = false; 
    }
  } 
  
  if (mouseX > x && mouseX < x+w && mouseY > y3 && mouseY < y3+h) {
    if (money == false) {
      money = true;
      verkeer = false;
      people = false;
    }
    else {
      money = false; 
    }
  }  
}







