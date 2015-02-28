
/* 
  @pjs font="data/Tw Cen MT Bold.ttf, data/Tw Cen Mt Italic.ttf"; 
       preload="01money.jpg,01money_thmb.jpg,02row.jpg,02row_thmb.jpg,03interior.jpg,03interior_thmb.jpg,04tower.jpg,04tower_thmb.jpg,05screen.jpg,05screen_thmb.jpg,06aerial.jpg,06aerial_thmb.jpg,07sitePlan.jpg,07sitePlan_thmb.jpg,08floorPlan01.jpg,08floorPlan01_thmb.jpg,09floorPlan02.jpg,09floorPlan02_thmb.jpg,10floorPlan03.jpg,10floorPlan03_thmb.jpg,11elevation.jpg,11elevation_thmb.jpg,12proximity.jpg,12proximity_thmb.jpg,13contextMap.jpg,13contextMap_thmb.jpg,14demoStudy.jpg,14demoStudy_thmb.jpg,15demoElevations.jpg,15demoElevations_thmb.jpg,16section.jpg,16section_thmb.jpg,17axo01.jpg,17axo01_thmb.jpg,18axo02.jpg,18axo02_thmb.jpg,19axo03.jpg,19axo03_thmb.jpg,arrow_bottom.png,arrow_top.png,DEMO.png,demo_icon.png,IMGS.png,imgs_icon.png,LIVE.png,LUX.png,lux_icon.jpg,PROX.png,prox_icon.jpg,SCRN.png";

*/


PFont bold;
PFont italic;

//general

PImage[] img = new PImage[19]; //actual
PImage[] thmb=  new PImage[19]; 
int numPic = 18; //-1 actual 
int sliderPOS_01 = 4;
int sliderPOS_02 = 5;
int sliderPOS_03 = 6;
int sliderPOS_04 = 7;
int fullsize = 3;
int thmb1_x1;
int thmb1_x2;
int thmb1_y1;
int thmb1_y2;
int thmb2_x1;
int thmb2_x2;
int thmb2_y1;
int thmb2_y2;
int thmb3_x1;
int thmb3_x2;
int thmb3_y1;
int thmb3_y2;
int thmb4_x1;
int thmb4_x2;
int thmb4_y1;
int thmb4_y2;
PImage title_live;
PImage title_prox;
PImage title_lux;
PImage title_scrn;
PImage title_demo;
PImage title_imgs;
PImage icon_prox;
PImage icon_lux;
PImage icon_scrn;
PImage icon_imgs;
PImage icon_demo;

//main menu
boolean main = true;
int fullsizeMain = 0;
int time;
int time02;
int[] cycleNum = {
  0, 1, 2, 3 , 4
}; //set images to cycle through
int cycleCounter = 0;

//imgs
boolean imgs = false;
int sliderPOS_05 = 4;
int sliderPOS_06 = 5;
int sliderPOS_07 = 6;
int sliderPOS_08 = 7;
int fullsize02 = 4;
int thmb5_x1;
int thmb5_x2;
int thmb5_y1;
int thmb5_y2;
int thmb6_x1;
int thmb6_x2;
int thmb6_y1;
int thmb6_y2;
int thmb7_x1;
int thmb7_x2;
int thmb7_y1;
int thmb7_y2;
int thmb8_x1;
int thmb8_x2;
int thmb8_y1;
int thmb8_y2; 

PImage arrow_bottom;
PImage arrow_top;

void setup() {
  size(630, 945, JAVA2D);
  background(255);
  
  bold = createFont("Tw Cen MT Bold",16);
  italic = createFont("Tw Cen MT Italic",24);
 
  
  title_live = loadImage("LIVE.png");
  title_prox = loadImage("PROX.png");
  title_lux = loadImage("LUX.png");
  title_scrn = loadImage("SCRN.png");
  title_imgs = loadImage("IMGS.png");
  title_demo = loadImage("DEMO.png");
  icon_prox = loadImage("prox_icon.jpg");
  icon_lux = loadImage("lux_icon.jpg");
  icon_scrn = loadImage("scrn_icon.jpg");
  icon_imgs = loadImage("imgs_icon.png");
  icon_demo = loadImage("demo_icon.png");
  arrow_bottom = loadImage("arrow_bottom.png");
  arrow_top = loadImage("arrow_top.png");
  
  img[0] = loadImage("01money.jpg");
  img[1] = loadImage("02row.jpg");
  img[2] = loadImage("03interior.jpg");
  img[3] = loadImage("04tower.jpg");
  img[4] = loadImage("05screen.jpg");
  img[5] = loadImage("06aerial.jpg");
  img[6] = loadImage("07sitePlan.jpg");
  img[7] = loadImage("08floorPlan01.jpg");
  img[8] = loadImage("09floorPlan02.jpg");
  img[9] = loadImage("10floorPlan03.jpg");
  img[10] = loadImage("11elevation.jpg");
  img[11] = loadImage("12proximity.jpg");
  img[12] = loadImage("13contextMap.jpg");
  img[13] = loadImage("14demoStudy.jpg");
  img[14] = loadImage("15demoElevations.jpg");
  img[15] = loadImage("16section.jpg");
  img[16] = loadImage("17axo01.jpg");
  img[17] = loadImage("18axo02.jpg");
  img[18] = loadImage("19axo03.jpg");
  thmb[0] = loadImage("01money_thmb.jpg");
  thmb[1] = loadImage("02row_thmb.jpg");
  thmb[2] = loadImage("03interior_thmb.jpg");
  thmb[3] = loadImage("04tower_thmb.jpg");
  thmb[4] = loadImage("05screen_thmb.jpg");
  thmb[5] = loadImage("06aerial_thmb.jpg");
  thmb[6] = loadImage("07sitePlan_thmb.jpg");
  thmb[7] = loadImage("08floorPlan01_thmb.jpg");
  thmb[8] = loadImage("09floorPlan02_thmb.jpg");
  thmb[9] = loadImage("10floorPlan03_thmb.jpg");
  thmb[10] = loadImage("11elevation_thmb.jpg");
  thmb[11] = loadImage("12proximity_thmb.jpg");
  thmb[12] = loadImage("13contextMap_thmb.jpg");
  thmb[13] = loadImage("14demoStudy_thmb.jpg");
  thmb[14] = loadImage("15demoElevations_thmb.jpg");
  thmb[15] = loadImage("16section_thmb.jpg");
  thmb[16] = loadImage("17axo01_thmb.jpg");
  thmb[17] = loadImage("18axo02_thmb.jpg");
  thmb[18] = loadImage("19axo03_thmb.jpg");
  
}


void draw() {
  background(255);
  fill(0);
  time = millis();
  time02 = millis() - 50000*cycleCounter;//change values here for scrolling speed
  
  scale(.61523438);
  
  if (main) {
    
    textFont(bold);
    fill(0);
    tint(255, 255);
    
    textFont(italic, 20); //title text
    text("parametric interaction tool", 225, 85);
    
    image(title_live, 25, 25, 200, 100); //names
    image(title_prox, (1024/6)-75, (1024/2)-50, 150, 75);
    image(title_lux, (2*1024/6)-75, (1024/2)-50, 150, 75);
    image(title_scrn, (4*1024/6)-75, (1024/2)-50, 150, 75);
    image(title_demo, (3*1024/6)-75, (1024/2)-50, 150, 75);
    image(title_imgs, (5*1024/6)-75, (1024/2)-50, 150, 75);
    
    image(icon_prox, (1024/6) -75, 384-75, 150, 150); //icons
    image(icon_lux, (2*1024/6) -75, 384-75, 150, 150);
    image(icon_demo, (3*1024/6) -75, 384-75, 150, 150);
    image(icon_scrn, (4*1024/6) -75, 384-75, 150, 150);
    image(icon_imgs, (5*1024/6) -75, 384-75, 150, 150);
    
    fill(255, 31, 135); //text
    textFont(bold, 20);
    text("SELECT A TOOL TO EXPLORE", 4*1024/6, 85);
    fill(0);
    textFont(italic, 16);
    text("parametric site tool",(1024/6)-61,(1024/2)+50);
    text("parametric section tool",(2*1024/6)-70,(1024/2)+50);
    text("parametric program tool",(3*1024/6)-76,(1024/2)+50);
    text("parametric facade tool",(4*1024/6)-70,(1024/2)+50);
    text("project images",(5*1024/6)-45,(1024/2)+50);
    
    fill(255,200); //transparency masks for unused tools
    noStroke();
    rect((1024/6) -75, 384-75, 150, 300);
    rect((2*1024/6) -75, 384-75, 150, 300);
    rect((4*1024/6) -75, 384-75, 150, 300);
    rect((3*1024/6) -75, 384-75, 150, 300);
    
    if (mouseX>((5*1024/6)-75)*(.615) && mouseX<((5*1024/6)+75)*(.615) && mouseY>309*(.615) && mouseY<537*(.615)) {
      fill(255, 100); //mouseover for selctors
      noStroke();
      rect((5*1024/6) -75, 384-75, 150, 300);
    }
   
    if (time02 > 50000) { //slideshow below
      cycleCounter = cycleCounter +1;
      time02 = 0;
    }
    if (time02 < 2000) {
      tint(255, (time02)*.1275);
      image(img[cycleNum[0]], 0, 768, 1024, 768);
    }
    if (time02 >2000 & time02 < 8000) {
      tint(255, 255);
      image(img[cycleNum[0]], 0, 768, 1024, 768);
    }
    if (time02 > 8000 & time02 < 10000 ) {
      tint(255, 255 -(time02-8000)*.1275);
      image(img[cycleNum[0]], 0, 768, 1024, 768);
    }
    if (time02 > 10000 & time02 < 12000 ) {
      tint(255, (time02-10000)*.1275);
      image(img[cycleNum[1]], 0, 768, 1024, 768);
    }
    if (time02 > 12000 & time02 < 18000) {
      tint(255, 255);
      image(img[cycleNum[1]], 0, 768, 1024, 768);
    }
    if (time02 > 18000 & time02 < 20000 ) {
      tint(255, 255 -(time02-18000)*.1275);
      image(img[cycleNum[1]], 0, 768, 1024, 768);
    }
    if (time02 > 20000 & time02 < 22000 ) {
      tint(255, (time02-20000)*.1275);
      image(img[cycleNum[2]], 0, 768, 1024, 768);
    }
    if (time02 > 22000 & time02 < 28000) {
      tint(255, 255);
      image(img[cycleNum[2]], 0, 768, 1024, 768);
    }
    if (time02 > 28000 & time02 < 30000 ) {
      tint(255, 255 -(time02-28000)*.1275);
      image(img[cycleNum[2]], 0, 768, 1024, 768);
    }
    if (time02 > 30000 & time02 < 32000 ) {
      tint(255, (time02-30000)*.1275);
      image(img[cycleNum[3]], 0, 768, 1024, 768);
    }
    if (time02 > 32000 & time02 < 38000) {
      tint(255, 255);
      image(img[cycleNum[3]], 0, 768, 1024, 768);
    }
    if (time02 > 38000 & time02 < 40000 ) {
      tint(255, 255 -(time02-38000)*.1275);
      image(img[cycleNum[3]], 0, 768, 1024, 768);
    }
    if (time02 > 40000 & time02 < 42000 ) {
      tint(255, (time02-40000)*.1275);
      image(img[cycleNum[4]], 0, 768, 1024, 768);
    }
    if (time02 > 42000 & time02 < 48000) {
      tint(255, 255);
      image(img[cycleNum[4]], 0, 768, 1024, 768);
    }
    if (time02 > 48000 & time02 < 50000 ) {
      tint(255, 255 -(time02-48000)*.1275);
      image(img[cycleNum[4]], 0, 768, 1024, 768);
    }
  }
  
  
  //imgs
  if (imgs) {
    //top imgs
    
    image(img[fullsize02], 512-(1024/2), 385 -(768/2), 1024, 768);
    
    if(mouseY>300*(.615)){
      tint(255, 150);
      image(arrow_top, 954, 13.333, 2*arrow_top.width/3, 2*arrow_top.height/3);
      tint(255,255);
    }
    if(mouseY>150*(.615) && mouseY<300*(.615)){
      fill(0, 150);
      noStroke();
      rect(0, 150-mouseY*(1.625), 1024, 150);
      fill(0);
      tint(255, 150);
      image(arrow_top, 954, 300-mouseY*(1.625)+13.333, 2*arrow_top.width/3, 2*arrow_top.height/3);
      image(thmb[sliderPOS_05], 1024/5-(thmb[sliderPOS_05].width/2), -mouseY*(1.625)+150+((150-(thmb[sliderPOS_05].height))/2), thmb[sliderPOS_05].width, thmb[sliderPOS_05].height);
      image(thmb[sliderPOS_06], 2*1024/5-(thmb[sliderPOS_06].width/2), -mouseY*(1.625)+150+((150-(thmb[sliderPOS_06].height))/2), thmb[sliderPOS_06].width, thmb[sliderPOS_06].height);
      image(thmb[sliderPOS_07], 3*1024/5-(thmb[sliderPOS_07].width/2), -mouseY*(1.625)+150+((150-(thmb[sliderPOS_07].height))/2), thmb[sliderPOS_07].width, thmb[sliderPOS_07].height);
      image(thmb[sliderPOS_08], 4*1024/5-(thmb[sliderPOS_08].width/2), -mouseY*(1.625)+150+((150-(thmb[sliderPOS_08].height))/2), thmb[sliderPOS_08].width, thmb[sliderPOS_08].height);
      tint(255, 255);
      fill(200);
      rect(40,150-mouseY*(1.625)+60, 60,30);
      rect(934,150-mouseY*(1.625)+60, 60,30);
    }
    if(mouseY<150*(.615)){
      fill(0, 150);
      noStroke();
      rect(0, 0, 1024, 150);
      fill(0);
      image(arrow_top, 954, 150+13.333, 2*arrow_top.width/3, 2*arrow_top.height/3);
      image(thmb[sliderPOS_05], 1024/5-(thmb[sliderPOS_05].width/2), 75-(thmb[sliderPOS_05].height/2), thmb[sliderPOS_05].width, thmb[sliderPOS_05].height);
      image(thmb[sliderPOS_06], 2*1024/5-(thmb[sliderPOS_06].width/2), 75-(thmb[sliderPOS_06].height/2), thmb[sliderPOS_06].width, thmb[sliderPOS_06].height);
      image(thmb[sliderPOS_07], 3*1024/5-(thmb[sliderPOS_07].width/2), 75-(thmb[sliderPOS_07].height/2), thmb[sliderPOS_07].width, thmb[sliderPOS_07].height);
      image(thmb[sliderPOS_08], 4*1024/5-(thmb[sliderPOS_08].width/2), 75-(thmb[sliderPOS_08].height/2), thmb[sliderPOS_08].width, thmb[sliderPOS_08].height);
      
      if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {
        fill(255,31,135);
        rect(40,60,60,30);
        fill(255);
        text("PREV",52,80);
      } else {
        fill(200);
        rect(40,60,60,30);
        fill(0);
        text("PREV",52,80);
      }
      if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {
        fill(255,31,135);
        rect(934,60,60,30);
        fill(255);
        text("NEXT",945,80);
      } else {
        fill(200);
        rect(934,60,60,30);
        fill(0);
        text("NEXT",945,80);
      }
     
    }
    
    //top thumbnail mouseovers
     textFont(bold);
    stroke(0);
    fill(0);
    thmb5_x1 = 1024/5-(thmb[sliderPOS_05].width/2);
    thmb5_x2 = 1024/5-(thmb[sliderPOS_05].width/2) + thmb[sliderPOS_05].width;
    thmb5_y1 = 75-(thmb[sliderPOS_05].height/2);
    thmb5_y2 = 75-(thmb[sliderPOS_05].height/2) + thmb[sliderPOS_05].height;
    thmb6_x1 = 2*1024/5-(thmb[sliderPOS_06].width/2);
    thmb6_x2 = 2*1024/5-(thmb[sliderPOS_06].width/2) + thmb[sliderPOS_06].width;
    thmb6_y1 = 75-(thmb[sliderPOS_06].height/2);
    thmb6_y2 = 75-(thmb[sliderPOS_06].height/2) + thmb[sliderPOS_06].height;
    thmb7_x1 = 3*1024/5-(thmb[sliderPOS_07].width/2);
    thmb7_x2 = 3*1024/5-(thmb[sliderPOS_07].width/2) + thmb[sliderPOS_07].width;
    thmb7_y1 = 75-(thmb[sliderPOS_07].height/2);
    thmb7_y2 = 75-(thmb[sliderPOS_07].height/2) + thmb[sliderPOS_07].height;
    thmb8_x1 = 4*1024/5-(thmb[sliderPOS_08].width/2);
    thmb8_x2 = 4*1024/5-(thmb[sliderPOS_08].width/2) + thmb[sliderPOS_08].width;
    thmb8_y1 = 75-(thmb[sliderPOS_08].height/2);
    thmb8_y2 = 75-(thmb[sliderPOS_08].height/2) + thmb[sliderPOS_04].height;
    if (mouseX> thmb5_x1*(.615) && mouseX< thmb5_x2*(.615) && mouseY> thmb5_y1*(.615) && mouseY< thmb5_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb5_x1, thmb5_y1, thmb[sliderPOS_05].width, thmb[sliderPOS_05].height);
    }
    if (mouseX> thmb6_x1*(.615) && mouseX< thmb6_x2*(.615) && mouseY> thmb6_y1*(.615) && mouseY< thmb6_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb6_x1, thmb6_y1, thmb[sliderPOS_06].width, thmb[sliderPOS_06].height);
    }
    if (mouseX> thmb7_x1*(.615) && mouseX< thmb7_x2*(.615) && mouseY> thmb7_y1*(.615) && mouseY< thmb7_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb7_x1, thmb7_y1, thmb[sliderPOS_07].width, thmb[sliderPOS_07].height);
    }
    if (mouseX> thmb8_x1*(.615) && mouseX< thmb8_x2*(.615) && mouseY> thmb8_y1*(.615) && mouseY< thmb8_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb8_x1, thmb8_y1, thmb[sliderPOS_08].width, thmb[sliderPOS_08].height);
    }
    
 
    //bottom imgs
    
    image(img[fullsize], 512-(1024/2), 1152-(768/2), 1024, 768);
    
    if(mouseY<1246*(.615)){
      tint(255,150);
      image(arrow_bottom, 20, 1536-40, 2*arrow_bottom.width/3, 2*arrow_bottom.height/3);
      tint(255,255);
    }
    if(mouseY>1246*(.615) && mouseY<1386*(.615)){
      fill(0, 150);
      noStroke();
      rect(0,1536-((mouseY*1.625)-1246)-10, 1024, 150);
      fill(0);
      tint(255, 150);
      image(arrow_bottom, 20, (1536-40)-((mouseY*1.625)-1246)-10, 2*arrow_bottom.width/3, 2*arrow_bottom.height/3);
      image(thmb[sliderPOS_01], 1024/5-(thmb[sliderPOS_01].width/2), 1536-((mouseY*1.625)-(1386-((thmb[sliderPOS_01].height)+((150-(thmb[sliderPOS_01].height))/2)))), thmb[sliderPOS_01].width, thmb[sliderPOS_01].height);
      image(thmb[sliderPOS_02], 2*1024/5-(thmb[sliderPOS_02].width/2), 1536-((mouseY*1.625)-(1386-((thmb[sliderPOS_02].height)+((150-(thmb[sliderPOS_02].height))/2)))), thmb[sliderPOS_02].width, thmb[sliderPOS_02].height);
      image(thmb[sliderPOS_03], 3*1024/5-(thmb[sliderPOS_03].width/2), 1536-((mouseY*1.625)-(1386-((thmb[sliderPOS_03].height)+((150-(thmb[sliderPOS_03].height))/2)))), thmb[sliderPOS_03].width, thmb[sliderPOS_03].height);
      image(thmb[sliderPOS_04], 4*1024/5-(thmb[sliderPOS_04].width/2), 1536-((mouseY*1.625)-(1386-((thmb[sliderPOS_04].height)+((150-(thmb[sliderPOS_04].height))/2)))), thmb[sliderPOS_04].width, thmb[sliderPOS_04].height);
      tint(255, 255);
      fill(200);
      rect(40, 1536-((mouseY*1.625)-1246)+50,60,30);
      rect(934, 1536-((mouseY*1.625)-1246)+50,60,30);
    }
    if(mouseY>1386*(.615)){
      fill(0, 150);
      noStroke();
      rect(0, 1386, 1024, 150);
      fill(0);
      image(arrow_bottom, 20, 1536-190, 2*arrow_bottom.width/3, 2*arrow_bottom.height/3);
      image(thmb[sliderPOS_01], 1024/5-(thmb[sliderPOS_01].width/2), 1461-(thmb[sliderPOS_01].height/2), thmb[sliderPOS_01].width, thmb[sliderPOS_01].height);
      image(thmb[sliderPOS_02], 2*1024/5-(thmb[sliderPOS_02].width/2), 1461-(thmb[sliderPOS_02].height/2), thmb[sliderPOS_02].width, thmb[sliderPOS_02].height);
      image(thmb[sliderPOS_03], 3*1024/5-(thmb[sliderPOS_03].width/2), 1461-(thmb[sliderPOS_03].height/2), thmb[sliderPOS_03].width, thmb[sliderPOS_03].height);
      image(thmb[sliderPOS_04], 4*1024/5-(thmb[sliderPOS_04].width/2), 1461-(thmb[sliderPOS_04].height/2), thmb[sliderPOS_04].width, thmb[sliderPOS_04].height);
      
      if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) {
        fill(255,31,135);
        rect(40,1446,60,30);
        fill(255);
        text("PREV",52,1466);
      } else {
        fill(200);
        rect(40,1446,60,30);
        fill(0);
        text("PREV",52,1466);
      }
      if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) {
        fill(255,31,135);
        rect(934,1446,60,30);
        fill(255);
        text("NEXT",945,1466);
      } else {
        fill(200);
        rect(934,1446,60,30);
        fill(0);
        text("NEXT",945,1466);
      }
    }
    
    //bottom thumbnail mouseovers
    stroke(0);
    fill(0);
    thmb1_x1 = 1024/5-(thmb[sliderPOS_01].width/2);
    thmb1_x2 = 1024/5-(thmb[sliderPOS_01].width/2) + thmb[sliderPOS_01].width;
    thmb1_y1 = 1461-(thmb[sliderPOS_01].height/2);
    thmb1_y2 = 1461-(thmb[sliderPOS_01].height/2) + thmb[sliderPOS_01].height;
    thmb2_x1 = 2*1024/5-(thmb[sliderPOS_02].width/2);
    thmb2_x2 = 2*1024/5-(thmb[sliderPOS_02].width/2) + thmb[sliderPOS_02].width;
    thmb2_y1 = 1461-(thmb[sliderPOS_02].height/2);
    thmb2_y2 = 1461-(thmb[sliderPOS_02].height/2) + thmb[sliderPOS_02].height;
    thmb3_x1 = 3*1024/5-(thmb[sliderPOS_03].width/2);
    thmb3_x2 = 3*1024/5-(thmb[sliderPOS_03].width/2) + thmb[sliderPOS_03].width;
    thmb3_y1 = 1461-(thmb[sliderPOS_03].height/2);
    thmb3_y2 = 1461-(thmb[sliderPOS_03].height/2) + thmb[sliderPOS_03].height;
    thmb4_x1 = 4*1024/5-(thmb[sliderPOS_04].width/2);
    thmb4_x2 = 4*1024/5-(thmb[sliderPOS_04].width/2) + thmb[sliderPOS_04].width;
    thmb4_y1 = 1461-(thmb[sliderPOS_04].height/2);
    thmb4_y2 = 1461-(thmb[sliderPOS_04].height/2) + thmb[sliderPOS_04].height;
    if (mouseX> thmb1_x1*(.615) && mouseX< thmb1_x2*(.615) && mouseY> thmb1_y1*(.615) && mouseY< thmb1_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb1_x1, thmb1_y1, thmb[sliderPOS_01].width, thmb[sliderPOS_01].height);
    }
    if (mouseX> thmb2_x1*(.615) && mouseX< thmb2_x2*(.615) && mouseY> thmb2_y1*(.615) && mouseY< thmb2_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb2_x1, thmb2_y1, thmb[sliderPOS_02].width, thmb[sliderPOS_02].height);
    }
    if (mouseX> thmb3_x1*(.615) && mouseX< thmb3_x2*(.615) && mouseY> thmb3_y1*(.615) && mouseY< thmb3_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb3_x1, thmb3_y1, thmb[sliderPOS_03].width, thmb[sliderPOS_03].height);
    }
    if (mouseX> thmb4_x1*(.615) && mouseX< thmb4_x2*(.615) && mouseY> thmb4_y1*(.615) && mouseY< thmb4_y2*(.615)) {
      fill(255, 100);
      noStroke();
      rect(thmb4_x1, thmb4_y1, thmb[sliderPOS_04].width, thmb[sliderPOS_04].height);
    }
    
    
    
    
    if (mouseX>20*(.615) && mouseX<80*(.615) && mouseY>718*(.615) && mouseY<748*(.615)){
      fill(255,31,135);
      noStroke();
      rect(20,718,60,30);
      fill(255);
      text("MAIN",30,738);
    } else{
      textFont(bold);
      fill(200);
      noStroke();
      rect(20,718,60,30);
      fill(0);
      text("MAIN",30,738);
    }
  }
    
  
  
}
void mouseClicked() {
  if (main ==true) {
    if (mouseX>((5*1024/6)-75)*(.615) && mouseX<((5*1024/6)+75)*(.615) && mouseY>309*(.615) && mouseY<537*(.615)) {
      main = false;
      imgs = true;
      tint(255, 255);
      fullsize = 0; //select starting image w/ tool
      sliderPOS_01 = 1;
      sliderPOS_02 = 2;
      sliderPOS_03 = 3;
      sliderPOS_04 = 4;
      fullsize02 = 7;
      sliderPOS_05 = 8;
      sliderPOS_06 = 9;
      sliderPOS_07 = 10;
      sliderPOS_08 = 11;
    }
  }
  if (imgs ==true) {
    if (mouseX>20*(.615) && mouseX<80*(.615) && mouseY>718*(.615) && mouseY<748*(.615)){
      main = true;
      imgs = false;
      tint(255, 255);
    }
    if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) {//lower left
      sliderPOS_01 = sliderPOS_01 - 1;
      sliderPOS_02 = sliderPOS_02 - 1;
      sliderPOS_03 = sliderPOS_03 - 1;
      sliderPOS_04 = sliderPOS_04 - 1;
      if (sliderPOS_01 < 0) {
        sliderPOS_01 = numPic;
      }
      if (sliderPOS_02 < 0) {
        sliderPOS_02 = numPic;
      }
      if (sliderPOS_03 < 0) {
        sliderPOS_03 = numPic;
      }
      if (sliderPOS_03 < 0) {
        sliderPOS_03 = numPic;
      }
      if (sliderPOS_04 < 0) {
        sliderPOS_04 = numPic;
      }
    }
    if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) { //lower right
      sliderPOS_01 = sliderPOS_01 + 1;
      sliderPOS_02 = sliderPOS_02 + 1;
      sliderPOS_03 = sliderPOS_03 + 1;
      sliderPOS_04 = sliderPOS_04 + 1;
      if (sliderPOS_01 > numPic) {
        sliderPOS_01 = 0;
      }
      if (sliderPOS_02 > numPic) {
        sliderPOS_02 = 0;
      }
      if (sliderPOS_03 > numPic) {
        sliderPOS_03 = 0;
      }
      if (sliderPOS_04 > numPic) {
        sliderPOS_04 = 0;
      }
    }
    
    if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {//upper left
      sliderPOS_05 = sliderPOS_05 - 1;
      sliderPOS_06 = sliderPOS_06 - 1;
      sliderPOS_07 = sliderPOS_07 - 1;
      sliderPOS_08 = sliderPOS_08 - 1;
      if (sliderPOS_05 < 0) {
        sliderPOS_05 = numPic;
      }
      if (sliderPOS_06 < 0) {
        sliderPOS_06 = numPic;
      }
      if (sliderPOS_07 < 0) {
        sliderPOS_07 = numPic;
      }
      if (sliderPOS_08 < 0) {
        sliderPOS_08 = numPic;
      }
    }
    if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {//upper right
      sliderPOS_05 = sliderPOS_05 + 1;
      sliderPOS_06 = sliderPOS_06 + 1;
      sliderPOS_07 = sliderPOS_07 + 1;
      sliderPOS_08 = sliderPOS_08 + 1;
      if (sliderPOS_05 > numPic) {
        sliderPOS_05 = 0;
      }
      if (sliderPOS_06 > numPic) {
        sliderPOS_06 = 0;
      }
      if (sliderPOS_07 > numPic) {
        sliderPOS_07 = 0;
      }
      if (sliderPOS_08 > numPic) {
        sliderPOS_08 = 0;
      }
    }
  }

    
}
void mouseDragged() {
  if (main ==true) {
    if (mouseX>((5*1024/6)-75)*(.615) && mouseX<((5*1024/6)+75)*(.615) && mouseY>309*(.615) && mouseY<537*(.615)) {
      main = false;
      imgs = true;
      tint(255, 255);
      fullsize = 0; //select starting image w/ tool
      sliderPOS_01 = 1;
      sliderPOS_02 = 2;
      sliderPOS_03 = 3;
      sliderPOS_04 = 4;
      fullsize02 = 7;
      sliderPOS_05 = 8;
      sliderPOS_06 = 9;
      sliderPOS_07 = 10;
      sliderPOS_08 = 11;
    }
  }
  if (imgs ==true) {
    if (mouseX>20*(.615) && mouseX<80*(.615) && mouseY>718*(.615) && mouseY<748*(.615)){
      main = true;
      imgs = false;
      tint(255, 255);
    }
    if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) {//lower left
      sliderPOS_01 = sliderPOS_01 - 1;
      sliderPOS_02 = sliderPOS_02 - 1;
      sliderPOS_03 = sliderPOS_03 - 1;
      sliderPOS_04 = sliderPOS_04 - 1;
      if (sliderPOS_01 < 0) {
        sliderPOS_01 = numPic;
      }
      if (sliderPOS_02 < 0) {
        sliderPOS_02 = numPic;
      }
      if (sliderPOS_03 < 0) {
        sliderPOS_03 = numPic;
      }
      if (sliderPOS_03 < 0) {
        sliderPOS_03 = numPic;
      }
      if (sliderPOS_04 < 0) {
        sliderPOS_04 = numPic;
      }
    }
    if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>1446*(.615) && mouseY<1476*(.615)) { //lower right
      sliderPOS_01 = sliderPOS_01 + 1;
      sliderPOS_02 = sliderPOS_02 + 1;
      sliderPOS_03 = sliderPOS_03 + 1;
      sliderPOS_04 = sliderPOS_04 + 1;
      if (sliderPOS_01 > numPic) {
        sliderPOS_01 = 0;
      }
      if (sliderPOS_02 > numPic) {
        sliderPOS_02 = 0;
      }
      if (sliderPOS_03 > numPic) {
        sliderPOS_03 = 0;
      }
      if (sliderPOS_04 > numPic) {
        sliderPOS_04 = 0;
      }
    }
    
    if (mouseX>40*(.615) && mouseX<100*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {//upper left
      sliderPOS_05 = sliderPOS_05 - 1;
      sliderPOS_06 = sliderPOS_06 - 1;
      sliderPOS_07 = sliderPOS_07 - 1;
      sliderPOS_08 = sliderPOS_08 - 1;
      if (sliderPOS_05 < 0) {
        sliderPOS_05 = numPic;
      }
      if (sliderPOS_06 < 0) {
        sliderPOS_06 = numPic;
      }
      if (sliderPOS_07 < 0) {
        sliderPOS_07 = numPic;
      }
      if (sliderPOS_08 < 0) {
        sliderPOS_08 = numPic;
      }
    }
    if (mouseX>934*(.615) && mouseX<994*(.615) && mouseY>60*(.615) && mouseY<90*(.615)) {//upper right
      sliderPOS_05 = sliderPOS_05 + 1;
      sliderPOS_06 = sliderPOS_06 + 1;
      sliderPOS_07 = sliderPOS_07 + 1;
      sliderPOS_08 = sliderPOS_08 + 1;
      if (sliderPOS_05 > numPic) {
        sliderPOS_05 = 0;
      }
      if (sliderPOS_06 > numPic) {
        sliderPOS_06 = 0;
      }
      if (sliderPOS_07 > numPic) {
        sliderPOS_07 = 0;
      }
      if (sliderPOS_08 > numPic) {
        sliderPOS_08 = 0;
      }
    }
  }
}

void mousePressed() {

  if (imgs ==true) {
    if (mouseX> thmb1_x1*(.615) && mouseX< thmb1_x2*(.615) && mouseY> thmb1_y1*(.615) && mouseY< thmb1_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize = sliderPOS_01;
      }
    }
    if (mouseX> thmb2_x1*(.615) && mouseX< thmb2_x2*(.615) && mouseY> thmb2_y1*(.615) && mouseY< thmb2_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize = sliderPOS_02;
      }
    }
    if (mouseX> thmb3_x1*(.615) && mouseX< thmb3_x2*(.615) && mouseY> thmb3_y1*(.615) && mouseY< thmb3_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize = sliderPOS_03;
      }
    }
    if (mouseX> thmb4_x1*(.615) && mouseX< thmb4_x2*(.615) && mouseY> thmb4_y1*(.615) && mouseY< thmb4_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize = sliderPOS_04;
      }
    }
    if (mouseX> thmb5_x1*(.615) && mouseX< thmb5_x2*(.615) && mouseY> thmb5_y1*(.615) && mouseY< thmb5_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize02 = sliderPOS_05;
      }
    }
    if (mouseX> thmb6_x1*(.615) && mouseX< thmb6_x2*(.615) && mouseY> thmb6_y1*(.615) && mouseY< thmb6_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize02 = sliderPOS_06;
      }
    }
    if (mouseX> thmb7_x1*(.615) && mouseX< thmb7_x2*(.615) && mouseY> thmb7_y1*(.615) && mouseY< thmb7_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize02 = sliderPOS_07;
      }
    }
    if (mouseX> thmb8_x1*(.615) && mouseX< thmb8_x2*(.615) && mouseY> thmb8_y1*(.615) && mouseY< thmb8_y2*(.615)) {
      if (mouseButton== LEFT) {
        fullsize02 = sliderPOS_08;
      }
    }
  }
}
    


