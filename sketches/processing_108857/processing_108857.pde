
import processing.video.*;

import controlP5.*;
//====TO DO======
//poprawic mape
//napis year2 na tekst---DONE
//napisy pod kola ---- DONE
//animacja kol
// napisy miejc pod kropka i jako tutyl---DONE
// poprawic baze--DONe
// 
//==DO ANImacji

int country_size;
//==========
int ileLat;
ControlP5 cp5b;
ControlP5 cp5s;
int change=0;
ArrayList<OlympicGame> olympics= new ArrayList<OlympicGame>();
ArrayList<Country> countries = new ArrayList<Country>();
ArrayList<Mover> mover = new ArrayList<Mover>();
//Mover [] mover;
PImage img;
//DO SUWAKA
int selYear = 1;
int numCols = 21;
//DISPLAY VARAIBLES
int marginX = 50;
int firstYear = 2000;
int rok;
PFont font;
int slider_value2;

void setup() {

  size(1200, 720);
  frameRate(30);
  smooth();
  img = loadImage("mapav2.png");
  img.loadPixels();

  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  font = createFont("Arial", 36); 
  readXML();
  country_size= countries.size();
  println("country_size "+country_size);
  ileLat=olympics.size();
  println("ileLat"+ileLat);
  createButtoms(ileLat);
  //Mover [] mover = new Mover[100];
  //for(int i=0; i<99;i++)
}

void draw() {
  slider_value2=int(cp5s.getController("year2").getValue());
  drawBrightness();
  drawRef();
  switch(change)
  {
  case 0: 
    all();
    makedata();
    //drawMedalsAll();
   
    break;
  case 1: 
      makedata();
   //drawMedalsAll();
    break;
  case 2: 
   // drawMedalsGold();
     makedata();
    break;
  case 3: 
      makedata();
    //drawMedalsSilver();
    break;
  case 4: 
     makedata();
    //drawMedalsBrown();

    break;
  }

  drawOrganizator();
  //makedata();
}


void makedata() {
  //println("MOVER!:");
  for (int row=0; row<mover.size(); row++)
  {
    mover.get(row).update();
    mover.get(row).display(change);
  }
}
void drawMedalsBrown() {
  /*
  fill(173, 115, 61);
  int slider_value=int(cp5s.getController("year2").getValue());
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value==olympics.get(i).roczek)
    {
      //println(olympics.get(i).id);
      // ellipse(x, y, 5, 5);
      for (int j=0; j<countries.size();j++)
      {//println(countries.size());
      
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).braz;
          int x=countries.get(j).locX;
          int y=countries.get(j).locY;
         
          fill(173, 115, 61, 250);
      
          //ellipse(x, y, all/1.5, all/1.5);
          fill(173, 115, 61, 50);
         // ellipse(x, y, all/1.5+7, all/1.5+7);
          
          // println(countries.get(j).olympicId);
          if (dist(x, y, mouseX, mouseY)<(all/1.5))
          {
            fill(255);
            textAlign(CENTER);
            text(all+" medals, "+ countries.get(j).name, x, y-all/1.5-4);
          }
         
        }
      }
    }
   
}*/
}
void drawMedalsSilver() {
/*
  fill(208, 209, 202);
  int slider_value=int(cp5s.getController("year2").getValue());
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value==olympics.get(i).roczek)
    {
      //println(olympics.get(i).id);
      // ellipse(x, y, 5, 5);
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).srebro;
          int x=countries.get(j).locX;
          int y=countries.get(j).locY;
          fill(208, 209, 202, 250);
          ellipse(x, y, all/1.5, all/1.5);
          fill(208, 209, 202, 50);
          ellipse(x, y, all/1.5+7, all/1.5+7);
          // println(countries.get(j).olympicId);
          if (dist(x, y, mouseX, mouseY)<(all/1.5))
          {
            fill(255);
            textAlign(CENTER);
            text(all+" medals, "+ countries.get(j).name, x, y-all/1.5-4);
          }
        }
      }
    }
  }*/
}
void drawMedalsGold() {

  fill(221, 191, 75);
  int slider_value=int(cp5s.getController("year2").getValue());
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value==olympics.get(i).roczek)
    {
      //println(olympics.get(i).id);
      // ellipse(x, y, 5, 5);
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).zloto;
          int x=countries.get(j).locX;
          int y=countries.get(j).locY;
          fill(221, 191, 75, 250);
          ellipse(x, y, all/1.5, all/1.5);
          fill(221, 191, 75, 50);
          ellipse(x, y, all/1.5+7, all/1.5+7);
          if (dist(x, y, mouseX, mouseY)<(all/1.5))
          {
            fill(255);
            textAlign(CENTER);
            text(all+" medals, "+ countries.get(j).name, x, y-all/1.5-4);
          }
          // println(countries.get(j).olympicId);
        }
      }
    }
  }
}

void drawMedalsAll() {

  fill(250, 0, 0, 250);
  int slider_value=int(cp5s.getController("year2").getValue());
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value==olympics.get(i).roczek)
    {
      //println(olympics.get(i).id);
      // ellipse(x, y, 5, 5);
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).zloto+countries.get(j).srebro+countries.get(j).braz;
          int x=countries.get(j).locX;
          int y=countries.get(j).locY;
          fill(250, 0, 0, 230);
          ellipse(x, y, all/2.5, all/2.5);
          fill(250, 0, 0, 50);
          ellipse(x, y, all/2.5+7, all/2.5+7);
          // println(countries.get(j).olympicId);
          if (dist(x, y, mouseX, mouseY)<(all/2.5))
          {
            fill(255);
            textAlign(CENTER);
            text(all+" medals, "+ countries.get(j).name, x, y-all/2.5-4);
          }
        }
      }
    }
  }
}
void drawOrganizator() {

  fill(0, 220, 220, 225);
  int slider_value=int(cp5s.getController("year2").getValue());
  // println(cp5s.getController("year2").getValue());
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value==olympics.get(i).roczek)
    {
      //println(olympics.get(i).lokX);
      int x=olympics.get(i).lokX;
      int y=olympics.get(i).lokY;
      ellipse(x, y, 5, 5);
      fill(0, 220, 220, 150);
      ellipse(x, y, 10, 10);
      noStroke();
      textFont(font, 18);
      fill(170);
      textAlign(LEFT);
      int rok2=int(cp5s.getController("year2").getValue());
      //text("Medal Results for Olympic Games "+rok2, 20, 35);
      text("OLYMPIC GAMES  "+rok2, 25, 35);
      fill(130);
      text(olympics.get(i).miejscowa, 25, 60);
      if (dist(x, y, mouseX, mouseY)<(10))
      {
        textFont(font, 12);
        fill(255);
        textAlign(CENTER);
        text(olympics.get(i).miejscowa, x, y+17);
      }
      //text(rok2, 20,60);//height-35);
      //
    }
  }
}
void drawRef() {
  //write the references information
  noStroke();
  textFont(font, 12);
  fill(100);
  textAlign(LEFT);
  text("Medal Results for Olympic Games", 20, height-35);
  textFont(font, 10);
  text("by lacrima", 20, height-20);
  //
  fill(255);
  text( mouseX +", " + mouseY, 70, height-20);
  rok=int(cp5s.getController("year2").getValue());
  text(rok, 580.00, 670.00);

  text("YEAR", 117.00, 657.00);
}
//==================PRZETWARZANIE MAPY===============///
void drawBrightness() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r, g, b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 300;//dist(0,0,width,height);
      float d = dist(x, y, 600, 350);
      float adjustbrightness = 30*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      //color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}
//================ BUTTONS i SLIDER==================///
public void createButtoms(int _ileLat)
{
  noStroke();
  cp5b = new ControlP5(this);
  // create a new button with name 'buttonA'
  cp5b.addButton("all")
    .setValue(0)
      .setPosition(920, 20)//100,100
          .setSize(200, 19)
          ;
  cp5b.addButton("gold")
    .setValue(0)
      .setPosition(920, 40)//100,100
          .setSize(200, 19)
          ;

  // and add another 2 buttons
  cp5b.addButton("silver")
    .setValue(100)
      .setPosition(920, 60)
        .setSize(200, 19)
          ;

  cp5b.addButton("brown")
    .setPosition(920, 80)
      .setSize(200, 19)
        .setValue(0)
          ;
  //SLIDER
  cp5s = new ControlP5(this);
  cp5s.addSlider("year2")
    .setPosition(150, 650)
      .setSize(6, 6)
        .setWidth(900)
          .setRange(float(olympics.get(_ileLat-1).roczek), float(olympics.get(0).roczek))
            //(2000, 2012) // values can range from big to small as well

            .setValue(float(olympics.get(_ileLat-1).roczek))
              .setNumberOfTickMarks(_ileLat)
                .setSliderMode(Slider.FLEXIBLE)//FIX
                  ;
  cp5s.getController("year2").getValueLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(1000);
  cp5s.getController("year2").getCaptionLabel().align(ControlP5.LEFT, ControlP5.CENTER).setPaddingX(-500);
  //cp5s.getController("year").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingY(20);
slider_value2=int(cp5s.getController("year2").getValue());
}

//=============  METODY DO BUTTONS i SLIDER=========////
public void all()
{
  println("button all");
   mover.clear();
  
  
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value2==olympics.get(i).roczek)
    {
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          //println("MOVER!:");
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
           
          all=countries.get(j).zloto+countries.get(j).srebro+countries.get(j).braz;
          float xf=float(countries.get(j).locX);
         float yf=float(countries.get(j).locY);
         String nn= countries.get(j).name;
            mover.add(new Mover(random(0, 1200), random(0, 600), xf, yf,all,nn));
          
        }
      }
    }
  }
  
  change=1;
}
public void gold()
{
  println("button gold");
  mover.clear();
  
  
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value2==olympics.get(i).roczek)
    {
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          //println("MOVER!:");
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).zloto;
          float xf=float(countries.get(j).locX);
         float yf=float(countries.get(j).locY);
         String nn= countries.get(j).name;
            mover.add(new Mover(random(0, 1200), random(0, 600), xf, yf,all,nn));
          
        }
      }
    }
  }
  change=2;
}
public void silver()
{
  
   mover.clear();
  println("button silver");
  
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value2==olympics.get(i).roczek)
    {
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          //println("MOVER!:");
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).srebro;
          float xf=float(countries.get(j).locX);
         float yf=float(countries.get(j).locY);
         String nn= countries.get(j).name;
            mover.add(new Mover(random(0, 1200), random(0, 600), xf, yf,all,nn));
          
        }
      }
    }
  }
  change=3;
}

public void brown()

{
  mover.clear();
  println("button brown");
  
  for (int i=0; i<olympics.size();i++)
  {
    if (slider_value2==olympics.get(i).roczek)
    {
      for (int j=0; j<countries.size();j++)
      {
        if (olympics.get(i).id==countries.get(j).olympicId)
        {
          //println("MOVER!:");
          int all=0;
          //DODAC W ZALEZNOSCI OD PRZYCISKU NARAZIE ZLOTE WSZYSKTIE
          all=countries.get(j).braz;
          float xf=float(countries.get(j).locX);
         float yf=float(countries.get(j).locY);
         String nn= countries.get(j).name;
            mover.add(new Mover(random(0, 1200), random(0, 600), xf, yf,all,nn));
          
        }
      }
    }
  }
  change=4;
}
public void year2()
{
  //int value=int(cp5s.getController("year2").getValue());
  //println("rok"+value);
  //drawOrganizer(value);
  change=0;
}

///============= KEYBOARD=======================////
void keyPressed() {
  int displayYear = selYear + firstYear;
  if (key =='s') // if the s key is pressed
    save("olympic" + displayYear + ".jpg");

  if (keyCode == RIGHT) {
    if (selYear == numCols-2) selYear = 1;
    else if (selYear < numCols-2) selYear = selYear+1;  //when moving right don't go further than num years
  }
  else if (keyCode == LEFT) {                //when moving left don't go further than first year
    if (selYear == 1) selYear = numCols-2;
    else if (selYear > 1) selYear = selYear -1;
  }
}

//===============XML read =======================///
void readXML() {

  //XML xml = new XML("data.xml");
  XML xml = loadXML("data.xml");

  XML[] ids = xml.getChildren("root/igrzyska/id");//XMLElement xml.getChildren
  XML[] places = xml.getChildren("root/igrzyska/miejsce");
  XML[] years = xml.getChildren("root/igrzyska/rok");
  XML[] loksX = xml.getChildren("root/igrzyska/lokX");
  XML[] loksY = xml.getChildren("root/igrzyska/lokY");

  for (int i=0; i<ids.length;i++)
  {
    int tempID;
    String tempPlace;
    int tempYear;
    int tempLokX;
    int tempLokY;

    tempID=Integer.parseInt(ids[i].getContent());
    tempPlace= places[i].getContent();
    tempYear= Integer.parseInt(years[i].getContent());
    tempLokX= Integer.parseInt(loksX[i].getContent());
    tempLokY= Integer.parseInt(loksY[i].getContent());

    olympics.add(new OlympicGame(tempID, tempPlace, tempYear, tempLokX, tempLokY));
  }
  println("olympiady:");
  for (int i = 0; i < olympics.size(); i++)
    println(olympics.get(i).toString());


  XML[] names = xml.getChildren("root/panstwo/nazwa");
  XML[] locsX = xml.getChildren("root/panstwo/x");
  XML[] locsY = xml.getChildren("root/panstwo/y");
  XML[] golds = xml.getChildren("root/panstwo/zloto");
  XML[] silvers = xml.getChildren("root/panstwo/srebro");
  XML[] browns = xml.getChildren("root/panstwo/braz");
  XML[] igrzyskaIDs = xml.getChildren("root/panstwo/igrzyskaID");

  for (int i=0; i<names.length;i++)
  {
    String tempName;
    int templocX;
    int templocY;
    int tempGold;
    int tempSilver;
    int tempBrown;
    int tempigrzyskaID;

    tempName= names[i].getContent();
    templocX=Integer.parseInt(locsX[i].getContent());
    templocY = Integer.parseInt(locsY[i].getContent());
    tempGold= Integer.parseInt(golds[i].getContent());
    tempSilver= Integer.parseInt(silvers[i].getContent());
    tempBrown = Integer.parseInt(browns[i].getContent());
    tempigrzyskaID= Integer.parseInt(igrzyskaIDs[i].getContent()); 

    countries.add(new Country(tempigrzyskaID, tempName, templocX, templocY, tempGold, tempSilver, tempBrown));
  }
  println("kraje:");
  for (int i = 0; i < countries.size(); i++)
    println(countries.get(i).toString());
}

class Country {

 int olympicId;
 String name;
 int locX;
 int locY;
 int zloto,srebro,braz;
 
 
 Country(){

   this.olympicId = 33;
   this.name = "Lacrima_country";
   this.locX = 41;
   this.locY = 170;
   this.zloto=5;
   this.srebro=3;
   this.braz=1;
 }


 Country(int olympicId, String name, int locX, int locY, int zloto, int srebro, int braz){
   
  this.olympicId = olympicId;
  this.name = name;
  this.locX = locX;
  this.locY = locY;
  this.zloto= zloto;
  this.srebro= srebro;
  this.braz=braz;
  
 }
  String toString(){

   return "olympicId: " + olympicId+ " name: " + name + " locX: " + locX + " locY: " + locY +" zloto:"+ zloto +" srebro:"+ srebro +" braz"+ braz;
  }}

class Mover
{
  float x;
  float y;
  float targetX;
  float targetY;
  float easing;
  int radi;
  float pct;
  float step;
  String nname;
  Mover()
  {
    x = 20.0;
    y = 10.0;
    targetX = 70.0;
    targetY = 80.0;
    easing = 0.2;
    pct=0.0;
    step=0.01;
  }
  Mover(float a, float b, float i, float j, int r, String n)
  {
    x = a;
    y = b ;
    targetX = i;
    targetY = j;
    easing = 0.07;
    radi=r;
    pct=0.0;
    step=0.01;
    nname=n;
  }
  void update()
  {
    //float d = dist(x,y,targetX,targetY);
    pct+=step;
    if (pct< 1.0) {
      x+=(targetX-x)*pct;
      y+=(targetY-y)*pow(pct, 0.5);
    }
  }
  void display(int change)
  { 
    if (change==2||change==3||change==4)
    {
      if (dist(targetX, targetY, mouseX, mouseY)<(radi/1.5))
      {
        fill(255);
        textAlign(CENTER);
        text(radi+" medals, "+ nname, targetX, targetY-radi/1.5-4);
      }
    }
    else
    {
      if (dist(targetX, targetY, mouseX, mouseY)<(radi/2.5))
      {
        fill(255);
        textAlign(CENTER);
        text(radi+" medals, "+ nname, targetX, targetY-radi/2.5-4);
      }
    }
    //fill(0);
   //ellipse(x,y,radi,radi);
    switch(change)
    {
    case 0: 

      fill(250, 0, 0, 230);
      ellipse(x, y, radi/2.5, radi/2.5);
      fill(250, 0, 0, 50);
      ellipse(x, y, radi/2.5+7, radi/2.5+7);
      break;
    case 1: 
      fill(250, 0, 0, 230);
      ellipse(x, y, radi/2.5, radi/2.5);
      fill(250, 0, 0, 50);
      ellipse(x, y, radi/2.5+7, radi/2.5+7);
      break;
    case 2: 
      fill(221, 191, 75, 250);
      ellipse(x, y, radi/1.5, radi/1.5);  
      fill(221, 191, 75, 50);
      ellipse(x, y, radi/1.5+7, radi/1.5+7);
      break;
    case 3: 
      fill(208, 209, 202, 250);
      ellipse(x, y, radi/1.5, radi/1.5);
      fill(208, 209, 202, 50);
      ellipse(x, y, radi/1.5+7, radi/1.5+7);
      break;
    case 4: 
      fill(173, 115, 61, 250);
      ellipse(x, y, radi/1.5, radi/1.5);       
      fill(173, 115, 61, 50);
      ellipse(x, y, radi/1.5+7, radi/1.5+7);
      break;
    }
    
    //ellipse(x, y, k, k);
  }

  String toString() {

    return "x" + x+ "y" + y + " targetX " + targetX + " targetY " + targetY +" easing"+ easing +" radi"+ radi +" pct"+ pct;
  }
}

class OlympicGame {

 int id;
 String miejscowa;
 int roczek;
 int lokX;
 int lokY;
 
 
 OlympicGame(){

   this.id = 33;
   this.miejscowa = "Lacrima";
   this.roczek= 1988;
   this.lokX = 41;
   this.lokY = 170;
 }


 OlympicGame(int id, String miejscowa, int roczek, int lokX, int lokY){
   
  this.id = id;
  this.miejscowa = miejscowa;
  this.roczek=roczek;
  this.lokX = lokX;
  this.lokY = lokY;
 }
 
 int getLokX()
 {return lokX;}
 int getLokY()
 {return lokY;}
 
 
String toString(){

   return "ID: " + id + " miejscowa: " + miejscowa + " roczek"+roczek +" lokX: " + lokX + " lokY: " + lokY; 

 }
}


