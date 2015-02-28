

//Images Top.
PImage Food;
PImage Flower;
PImage Grid;
PImage Triangle;
PImage Poles;

//Images Center.
PImage Plant;
PImage Bacteria;
PImage Soil;
PImage Battery;

//Images Bottom.
PImage Photosynthesis;
PImage NH;
PImage MFC;
PImage Plug;


float xPlant, xBacteria, xSoil, xBattery, yCentral, yBottom, yTop, PARAMETERS, DIAGRAM, OUTPUT;


void setup () {
  Food = loadImage("food.png");
  Flower= loadImage("flower.png");
  Grid = loadImage("grid.png");
  Triangle = loadImage("triangle.png");
  Poles = loadImage("poles.png");
  
  Plant = loadImage("plant.png");
  Bacteria = loadImage("bacteria.png");
  Soil = loadImage("soil.png");
  Battery = loadImage("battery.png");
  
  Photosynthesis = loadImage("photosynthesis.png");
  NH = loadImage("NH.png");
  MFC = loadImage("mfc.png");
  Plug = loadImage("plug.png");
  
  PARAMETERS = 255;
  OUTPUT = 255;
  DIAGRAM = 255;
  
  
  
  
  size(1280,768);
  
  
  xPlant = 30;
  xBacteria = 370;
  xSoil = 710;
  xBattery = 1050;
  yCentral = 284;
  yBottom = 534;
  yTop = 134;
}

void draw () {
  background(255);
  
  stroke(0);
  //Top Main Lines.
  line(xPlant+100, yCentral+10, xPlant+50, yTop+80);
  line(xPlant+100, yCentral+10, xPlant+150, yTop+80);
  line(xBacteria+100, yCentral+10, xBacteria+100, yTop+80);
  line(xSoil+100, yCentral+10, xSoil+100, yTop+80);
  line(xBattery+100, yCentral+10, xBattery+100, yTop+80);
  //Top Text Lines.
  //Plant.
  line(xPlant-8, yTop+50, xPlant-8, yTop-150);
  line(xPlant-8, yTop-106, xPlant+3, yTop-106);
  line(xPlant-8, yTop-76, xPlant+3, yTop-76);
  line(xPlant-8, yTop-46, xPlant+3, yTop-46);
  line(xPlant-8, yTop-16, xPlant+3, yTop-16);
  line(xPlant+102, yTop+50, xPlant+102, yTop-150);
  line(xPlant+102, yTop-106, xPlant+115, yTop-106);
  line(xPlant+102, yTop-76, xPlant+115, yTop-76);
  line(xPlant+102, yTop-46, xPlant+115, yTop-46);
  line(xPlant+102, yTop-16, xPlant+115, yTop-16);
  
  //Bacteria
  line(xBacteria+53, yTop+53, xBacteria+53, yTop-150);
  line(xBacteria+53, yTop-75, xBacteria+59, yTop-75);
  line(xBacteria+53, yTop-45, xBacteria+59, yTop-45);
  line(xBacteria+53, yTop-15, xBacteria+59, yTop-15);
  
  //Soil.
  line(xSoil+53, yTop+53, xSoil+53, yTop-150);
  line(xSoil+53, yTop-75, xSoil+59, yTop-75);
  line(xSoil+53, yTop-45, xSoil+59, yTop-45);
  line(xSoil+53, yTop-15, xSoil+59, yTop-15);
  
  //Battery.
  line(xBattery+53, yTop+53, xBattery+53, yTop-150);
  line(xBattery+53, yTop-75, xBattery+59, yTop-75);
  line(xBattery+53, yTop-45, xBattery+59, yTop-45);
  line(xBattery+53, yTop-15, xBattery+59, yTop-15);
  
  //Bottom Main Lines.
  line(xPlant+100, yCentral+10, xPlant+100, yBottom);          //Bottom plant line.
  line(xBacteria+100, yCentral+10, xBacteria+100, yBottom);    //Bottom bacteria line.
  line(xSoil+100, yCentral+10, xSoil+100, yBottom);            //Bottom soil line.
  line(xBattery+100, yCentral+10, xBattery+100, yBottom);      //Bottom battery line.
  //Bottom Text Lines.
  //Plant.
  line(xPlant+100, yBottom+50, xPlant+35, yBottom);
  line(xPlant+100, yBottom+50, xPlant+35, yBottom+43);
  line(xPlant+100, yBottom+50, xPlant+35, yBottom+93);
  line(xPlant+100, yBottom+50, xPlant+235, yBottom);
  line(xPlant+100, yBottom+50, xPlant+170, yBottom+43);
  line(xPlant+100, yBottom+50, xPlant+170, yBottom+93);
  //Bacteria.
  line(xBacteria+100, yBottom+50, xBacteria-20, yBottom);
  line(xBacteria+100, yBottom+50, xBacteria+35, yBottom+43);
  line(xBacteria+100, yBottom+50, xBacteria+35, yBottom+93);
  line(xBacteria+100, yBottom+50, xBacteria+235, yBottom);
  line(xBacteria+100, yBottom+50, xBacteria+167, yBottom+43);
  line(xBacteria+100, yBottom+50, xBacteria+167, yBottom+93);
  //Soil.
  line(xSoil+100, yBottom+50, xSoil-15, yBottom);
  line(xSoil+100, yBottom+50, xSoil+35, yBottom+43);
  line(xSoil+100, yBottom+50, xSoil+35, yBottom+93);
  line(xSoil+100, yBottom+50, xSoil+235, yBottom);
  line(xSoil+100, yBottom+50, xSoil+167, yBottom+43);
  line(xSoil+100, yBottom+50, xSoil+167, yBottom+93);
  //Battery.
  line(xBattery+100, yBottom+50, xBattery-30, yBottom);
  line(xBattery+100, yBottom+50, xBattery+100,yBottom+135);
  line(xBattery+100, yBottom+155, xBattery+100,yBottom+185);
  
  image(Food, xPlant-10, yTop);
  image(Flower, xPlant+100, yTop);
  image(Grid, xBacteria+50, yTop);
  image(Triangle, xSoil+50, yTop);
  image(Poles, xBattery+50, yTop);
  
  
  
  image(Photosynthesis, xPlant+50, yBottom);
  image(NH, xBacteria+50, yBottom);
  image(MFC, xSoil+50, yBottom);
  image(Plug, xBattery+50, yBottom);
  
  
    //Text.
  textSize(15);      //Set text size.
  fill(0);
  //Plant.
  //Bottom.
  text("SUN", xPlant, yBottom);              //Plant bottom.
  text("H2O", xPlant, yBottom+50);           //Plant bottom.
  text("CO2", xPlant, yBottom+100);          //Plant bottom.
  text("NUTRIENTS", xPlant+240, yBottom);    //Plant bottom.
  text("O2", xPlant+170, yBottom+50);        //Plant bottom.
  text("CH0", xPlant+170, yBottom+100);      //Plant bottom.
  //Top.
  textSize(13);
  fill(0);
  text("HERBS", xPlant+3, yTop-100);
  text("LETTUCE", xPlant+3, yTop-70);
  text("TEA", xPlant+3, yTop-40);
  text("BEANS", xPlant+3, yTop-10);
  text("CACTI", xPlant+115, yTop-100);
  text("GRASS", xPlant+115, yTop-70);
  text("FERNS", xPlant+115, yTop-40);
  text("MOSS", xPlant+115, yTop-10);
  
  //Bacteria.
  //Bottom.
  textSize(15);
  fill(0);
  text("CO2", xBacteria, yBottom+50);          //Bacteria bottom.
  text("N", xBacteria+10, yBottom+100);        //Bacteria bottom.
  text("ELECTRONS", xBacteria+240, yBottom);   //Bacteria bottom.
  text("H-", xBacteria+170, yBottom+50);       //Bacteria bottom.
  text("H+", xBacteria+170, yBottom+100);      //Bacteria bottom.
  //Top.
  textSize(13);
  fill(0);
  text("PH", xBacteria+63, yTop-70);
  text("O2", xBacteria+63, yTop-40);
  text("H2O", xBacteria+63, yTop-10);
  
  //Soil.
  //Bottom.
  textSize(15);
  fill(0);
  text("H2O", xSoil, yBottom+50);              //Soil bottom.
  text("H-", xSoil+10, yBottom+100);           //Soil bottom.
  text("CURRENT", xSoil+240, yBottom);         //Soil bottom.
  text("VOLTS", xSoil+170, yBottom+50);        //Soil bottom.
  text("AMPS", xSoil+170, yBottom+100);        //Soil bottom.
  //Top.
  textSize(13);
  fill(0);
  text("CLAY", xSoil+63, yTop-70);
  text("LOAM", xSoil+63, yTop-40);
  text("PEAT", xSoil+63, yTop-10);
  
  //Battery.
  //Bottom.
  textSize(15);
  fill(0);
  text("STEP-DOWN CONVERTER", xBattery, yBottom+150);      //Battery bottom.
  text("APPLIANCE", xBattery+50, yBottom+200);             //Battery bottom.
  //Top.
  textSize(13);
  fill(0);
  text("+COPPER", xBattery+63, yTop-70);
  text("-ZINC", xBattery+63, yTop-40);
  text("H20", xBattery+63, yTop-10);
  

  image(Plant, xPlant, yCentral);
  image(Bacteria, xBacteria, yCentral);
  image(Soil, xSoil, yCentral);
  image(Battery, xBattery, yCentral);



