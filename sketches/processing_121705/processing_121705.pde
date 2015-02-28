
PFont myFont;

String[] domain;
String[] type;
String[] subtype;
String[] language;
String[] keyword1;
String[] keyword2;
String[] keyword3;

int r=0;
int rx=0;
int ry=0;
int zoom=0;

color corporate=color(255, 255, 0);
color news=color(255, 156, 0);
color emptydomain=color(255, 0, 0);
color porn=color(255, 83, 217);
color vpn=color(191, 39, 255);
color blog=color(0, 126, 255);
color social=color(96, 223, 255);
color commercial=color(185, 255, 221);
color entertainment=color(0, 255, 162);
color information=color(216, 255, 0);
color filehosting=color(255, 238, 146);
color searchengine=color(255, 153, 108);
color government=color(255, 102, 160);
color bar=color(50, 50, 50);

void setup() {
  size(1024, 768, P3D);
  myFont = loadFont("Helvetica-14.vlw");
  textFont(myFont);
  //smooth();
  String[] all = loadStrings("data.txt");
  domain = new String[all.length];
  type = new String[all.length];
  subtype = new String[all.length];
  language = new String[all.length];
  
  String[] keywords = loadStrings("keywords.txt");
  keyword1 = new String[keywords.length];
  keyword2 = new String[keywords.length];
  keyword3 = new String[keywords.length];

  for(int i=0; i<all.length; i++) {
    String[] list = split(all[i], ";");
    domain[i] = list[0];
    type[i] = list[1];
    subtype[i] = list[2];
    language[i] = list[3];
    String[] keywordslist = split(keywords[i], ";");
    keyword1[i] = keywordslist[0];
    keyword2[i] = keywordslist[1];
    keyword3[i] = keywordslist[2];
  }
}

void draw() {
  background(0);
  
  //CORPORATE
  if(mouseX>7 && mouseY>23 && mouseX<65 && mouseY<=46) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawCorporate();
    pushMatrix();
    rotate(radians(180+r));
    translate(-40, -40, 0);
    textSize(11);
    text("Total: 85/500", 0, 0);
    rect(0, 0, 17, 5);
    fill(bar);
    rect(17, 0, 83, 5);
    fill(corporate);
    text("Company: 16/85", 0, 20);
    rect(0, 20, 19, 5);
    fill(bar);
    rect(19, 20, 81, 5);
    fill(corporate);
    text("Organization: 26/85", 0, 40);
    rect(0, 40, 31, 5);
    fill(bar);
    rect(31, 40, 69, 5);
    fill(corporate);
    text("Service: 35/85", 0, 60);
    rect(0, 60, 41, 5);
    fill(bar);
    rect(41, 60, 59, 5);
    fill(corporate);
    text("Google Service: 8/85", 0, 80);
    rect(0, 80, 9, 5);
    fill(bar);
    rect(9, 80, 91, 5);
    fill(corporate);
    popMatrix(); 
  popMatrix();
  
  }
  
  //NEWS
  else if(mouseX>7 && mouseY>46 && mouseX<38 && mouseY<=56) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawNews(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(-45, -30, 0);
    textSize(11);
    text("Total: 69/500", 0, 0);
    rect(0, 0, 17, 5);
    fill(bar);
    rect(17, 0, 83, 5);
    fill(news);
    text("News: 46/69", 0, 20);
    rect(0, 20, 67, 5);
    fill(bar);
    rect(67, 20, 33, 5);
    fill(news);
    text("Social News: 23/69", 0, 40);
    rect(0, 40, 33, 5);
    fill(bar);
    rect(33, 40, 67, 5);
    fill(news);
    popMatrix(); 
  popMatrix();
  }
  
  //EMPTY DOMAIN/ERROR
  else if(mouseX>7 && mouseY>56 && mouseX<110 && mouseY<=76) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r));
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawEmptyDomain();
    pushMatrix();
    rotate(radians(180+r));
    translate(-45, -30, 0);
    textSize(11);
    text("Total: 55/500", 0, 0);
    rect(0, 0, 11, 5);
    fill(bar);
    rect(11, 0, 100, 5);
    fill(emptydomain);
    text("Empty Domain: 36/55", 0, 20);
    rect(0, 20, 66, 5);
    fill(bar);
    rect(66, 20, 44, 5);
    fill(emptydomain);
    text("Error: 19/55", 0, 40);
    rect(0, 40, 44, 5);
    fill(bar);
    rect(44, 40, 66, 5);
    fill(emptydomain);
    popMatrix();  
  popMatrix();
  }
  
  //PORN
  else if(mouseX>7 && mouseY>76 && mouseX<35 && mouseY<=86) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawPorn();
    pushMatrix();
    rotate(radians(180+r));
    translate(-45, -5, 0);
    textSize(11);
    text("Total: 54/500", 0, 0);
    rect(0, 0, 11, 5);
    fill(bar);
    rect(11, 0, 89, 5);
    fill(porn);
    popMatrix(); 
  popMatrix();
  }
  
  //VPN
  else if(mouseX>7 && mouseY>86 && mouseX<35 && mouseY<=106) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r));
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale); 
    drawVPN(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(-45, -5, 0);
    textSize(11);
    text("Total: 47/500", 0, 0);
    rect(0, 0, 10, 5);
    fill(bar);
    rect(10, 0, 90, 5);
    fill(vpn);
    popMatrix(); 
  popMatrix();
  }
  
  //BLOG
  else if(mouseX>7 && mouseY>106 && mouseX<32 && mouseY<=123) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawBlog(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(-45, -5, 0);
    textSize(11);
    text("Total: 44/500", 0, 0);
    rect(0, 0, 9, 5);
    fill(bar);
    rect(9, 0, 90, 5);
    fill(vpn);
    popMatrix(); 
  popMatrix();
  }
  
  //SOCIAL
  else if(mouseX>7 && mouseY>123 && mouseX<40 && mouseY<=136) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawSocial();
    pushMatrix();
    rotate(radians(180+r));
    translate(-48, -30, 0);
    textSize(11);
    text("Total: 37/500", 0, 0);
    rect(0, 0, 7, 5);
    fill(bar);
    rect(7, 0, 93, 5);
    fill(social);
    text("Dating: 3/37", 0, 20);
    rect(0, 20, 8, 5);
    fill(bar);
    rect(8, 20, 92, 5);
    fill(social);
    text("Forum: 18/37", 0, 40);
    rect(0, 40, 49, 5);
    fill(bar);
    rect(49, 40, 51, 5);
    fill(social);
    text("Social: 16/37", 0, 60);
    rect(0, 60, 43, 5);
    fill(bar);
    rect(43, 60, 57, 5);
    fill(social);
    popMatrix();  
  popMatrix();
  }
  
  //COMMERCIAL
  else if(mouseX>7 && mouseY>136 && mouseX<73 && mouseY<=146) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r));  
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawCommercial(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(-48, -55, 0);
    textSize(11);
    text("Total: 36/500", 0, 0);
    rect(0, 0, 7, 5);
    fill(bar);
    rect(7, 0, 93, 5);
    fill(commercial);
    text("Classified Ads: 3/36", 0, 20);
    rect(0, 20, 8, 5);
    fill(bar);
    rect(8, 20, 92, 5);
    fill(commercial);
    text("Mobile App: 6/36", 0, 40);
    rect(0, 40, 17, 5);
    fill(bar);
    rect(17, 40, 83, 5);
    fill(commercial);
    text("Product: 1/36", 0, 60);
    rect(0, 60, 3, 5);
    fill(bar);
    rect(3, 60, 97, 5);
    fill(commercial);
    text("Script: 8/36", 0, 80);
    rect(0, 80, 9, 5);
    fill(bar);
    rect(9, 80, 91, 5);
    fill(commercial);
    text("Software: 12/36", 0, 100);
    rect(0, 100, 33, 5);
    fill(bar);
    rect(33, 100, 67, 5);
    fill(commercial);
    text("Store: 12/36", 0, 120);
    rect(0, 120, 33, 5);
    fill(bar);
    rect(33, 120, 67, 5);
    fill(commercial);
    popMatrix();
  popMatrix();
  }
  
  //ENTERTAINMENT
  else if(mouseX>7 && mouseY>146 && mouseX<80 && mouseY<=163) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r));
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawEntertainment(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(160, -55, 0);
    textSize(11);
    text("Total: 26/500", 0, 0);
    rect(0, 0, 5, 5);
    fill(bar);
    rect(5, 0, 95, 5);
    fill(entertainment);
    text("Gambling: 5/26", 0, 20);
    rect(0, 20, 19, 5);
    fill(bar);
    rect(19, 20, 81, 5);
    fill(entertainment);
    text("Gaming: 4/26", 0, 40);
    rect(0, 40, 15, 5);
    fill(bar);
    rect(15, 40, 85, 5);
    fill(entertainment);
    text("Images: 1/26", 0, 60);
    rect(0, 60, 4, 5);
    fill(bar);
    rect(4, 60, 96, 5);
    fill(entertainment);
    text("Music: 2/26", 0, 80);
    rect(0, 80, 8, 5);
    fill(bar);
    rect(8, 80, 92, 5);
    fill(entertainment);
    text("Story: 1/26", 0, 100);
    rect(0, 100, 4, 5);
    fill(bar);
    rect(4, 100, 96, 5);
    fill(entertainment);
    text("Video: 13/26", 0, 120);
    rect(0, 120, 50, 5);
    fill(bar);
    rect(50, 120, 50, 5);
    fill(entertainment);
    popMatrix();
  popMatrix();
  }
  
  //INFORMATION
  else if(mouseX>7 && mouseY>163 && mouseX<70 && mouseY<=182) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawInformation(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(160, -33, 0);
    textSize(11);
    text("Total: 22/500", 0, 0);
    rect(0, 0, 4, 5);
    fill(bar);
    rect(4, 0, 96, 5);
    fill(information);
    text("Celebrity: 2/22", 0, 20);
    rect(0, 20, 9, 5);
    fill(bar);
    rect(9, 20, 91, 5);
    fill(information);
    text("Information: 6/22", 0, 40);
    rect(0, 40, 27, 5);
    fill(bar);
    rect(27, 40, 73, 5);
    fill(information);
    text("Portfolio: 6/22", 0, 60);
    rect(0, 60, 27, 5);
    fill(bar);
    rect(27, 60, 73, 5);
    fill(information);
    text("Personal: 2/22", 0, 80);
    rect(0, 80, 9, 5);
    fill(bar);
    rect(9, 80, 91, 5);
    fill(information);
    popMatrix();
  popMatrix();
  }
  
  //FILE HOSTING/SHARING
  else if(mouseX>7 && mouseY>182 && mouseX<115 && mouseY<=196) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r));
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawFileHosting(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(160, -33, 0);
    textSize(11);
    text("Total: 12/500", 0, 0);
    rect(0, 0, 4, 5);
    fill(bar);
    rect(4, 0, 96, 5);
    fill(filehosting);
    text("File Hosting: 6/12", 0, 20);
    rect(0, 20, 50, 5);
    fill(bar);
    rect(50, 20, 50, 5);
    fill(filehosting);
    text("P2P/Torrents: 6/12", 0, 40);
    rect(0, 40, 50, 5);
    fill(bar);
    rect(50, 40, 50, 5);
    fill(filehosting);
    popMatrix();
  popMatrix();
  }
  
  //SEARCH ENGINE/WEB PORTAL
  else if(mouseX>7 && mouseY>196 && mouseX<138 && mouseY<=208) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawSearchEngine(); 
    pushMatrix();
    rotate(radians(180+r));
    translate(160, -33, 0);
    textSize(11);
    text("Total: 8/500", 0, 0);
    rect(0, 0, 2, 5);
    fill(bar);
    rect(2, 0, 98, 5);
    fill(searchengine);
    text("Search Engine: 4/8", 0, 20);
    rect(0, 20, 50, 5);
    fill(bar);
    rect(50, 20, 83, 5);
    fill(searchengine);
    text("Web Portal: 4/8", 0, 40);
    rect(0, 40, 50, 5);
    fill(bar);
    rect(50, 40, 50, 5);
    fill(searchengine);
    popMatrix();
  popMatrix();
  }
  
  //GOVERNMENT/POLITICAL
  else if(mouseX>7 && mouseY>208 && mouseX<120 && mouseY<=222) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawGovernment();
   pushMatrix();
    rotate(radians(180+r));
    translate(160, -18, 0);
    textSize(11);
    text("Total: 5/500", 0, 0);
    rect(0, 0, 1, 5);
    fill(bar);
    rect(1, 0, 99, 5);
    fill(government);
    text("Government: 1/5", 0, 20);
    rect(0, 20, 20, 5);
    fill(bar);
    rect(20, 20, 80, 5);
    fill(government);
    text("Political: 4/5", 0, 40);
    rect(0, 40, 80, 5);
    fill(bar);
    rect(80, 40, 20, 5);
    fill(government);
    popMatrix(); 
  popMatrix();
  }
  
  //ENGLISH
  else if(mouseX>7 && mouseY>258 && mouseX<50 && mouseY<=273) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawEnglish();
  popMatrix();
  }
  
  //FRENCH
  else if(mouseX>7 && mouseY>273 && mouseX<45 && mouseY<=288) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawFrench();
  popMatrix();
  }
  
  //GERMAN
  else if(mouseX>7 && mouseY>288 && mouseX<50 && mouseY<=303) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawGerman();
  popMatrix();
  }
  
  //ITALIAN
  else if(mouseX>7 && mouseY>303 && mouseX<45 && mouseY<=318) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawItalian();
  popMatrix();
  }
  
  //JAPANESE
  else if(mouseX>7 && mouseY>318 && mouseX<55 && mouseY<=333) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawJapanese();
  popMatrix();
  }
  
  //KOREAN
  else if(mouseX>7 && mouseY>333 && mouseX<49 && mouseY<=348) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKorean();
  popMatrix();
  }
  
  //NORWEGIAN
  else if(mouseX>7 && mouseY>348 && mouseX<65 && mouseY<=363) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawNorwegian();
  popMatrix();
  }
  
  //ROMANIAN
  else if(mouseX>7 && mouseY>363 && mouseX<60 && mouseY<=378) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawRomanian();
  popMatrix();
  }
  
  //RUSSIAN
  else if(mouseX>7 && mouseY>378 && mouseX<48 && mouseY<=393) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawRussian();
  popMatrix();
  }
  
  //SPANISH
  else if(mouseX>7 && mouseY>393 && mouseX<48 && mouseY<=408) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawSpanish();
  popMatrix();
  }
  
  //SIMPLIFIED CHINESE
  else if(mouseX>7 && mouseY>408 && mouseX<102 && mouseY<=423) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawSimplified();
  popMatrix();
  }
  
  //TRADITIONAL CHINESE
  else if(mouseX>7 && mouseY>423 && mouseX<107 && mouseY<=438) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawTraditional();
  popMatrix();
  }
  
  //NOT AVAILABLE
  else if(mouseX>7 && mouseY>438 && mouseX<75 && mouseY<=453) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawNA();
  popMatrix();
  }
  
  //KEYWORD NEWS
  else if(mouseX>7 && mouseY>480 && mouseX<38 && mouseY<=495) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordNews();
  popMatrix();
  }
  
  //KEYWORD PORN
  else if(mouseX>7 && mouseY>495 && mouseX<36 && mouseY<=510) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordPorn();
  popMatrix();
  }
  
  //KEYWORD VPN
  else if(mouseX>7 && mouseY>510 && mouseX<33 && mouseY<=525) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordVPN();
  popMatrix();
  }
  
  //KEYWORD GENERAL
  else if(mouseX>7 && mouseY>525 && mouseX<50 && mouseY<=540) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordGeneral();
  popMatrix();
  }
  
  //KEYWORD EMPTY DOMAIN
  else if(mouseX>7 && mouseY>540 && mouseX<81 && mouseY<=555) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordEmptyDomain();
  popMatrix();
  }
  
  //KEYWORD CLASSIFED ADS
  else if(mouseX>7 && mouseY>555 && mouseX<81 && mouseY<=570) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordClassifiedAds();
  popMatrix();
  }
  
  //KEYWORD SOCIAL
  else if(mouseX>7 && mouseY>570 && mouseX<40 && mouseY<=585) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordSocial();
  popMatrix();
  }
  
  //KEYWORD VIDEO
  else if(mouseX>7 && mouseY>585 && mouseX<40 && mouseY<=600) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordVideo();
  popMatrix();
  }
  
  //KEYWORD POLITICS
  else if(mouseX>7 && mouseY>600 && mouseX<45 && mouseY<=615) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordPolitics();
  popMatrix();
  }
  
  //KEYWORD SOFTWARE
  else if(mouseX>7 && mouseY>615 && mouseX<55 && mouseY<=630) { 
  pushMatrix();
  translate(width/2+115, height/2, 0);
  rotateZ(-radians(r)); 
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawKeywordSoftware();
  popMatrix();
  }
  
  else {
  pushMatrix();
  translate(width/2+115, height/2, zoom);
  rotateZ(-radians(r));
  rotateX(-radians(rx));
  rotateY(-radians(ry));
  float scale = map(zoom, 210, width, 0.1, 4.5);
  scale(scale);
    drawCorporate();
    drawNews();
    drawEmptyDomain();
    drawPorn();
    drawVPN();
    drawCommercial();
    drawSocial();
    drawBlog();
    drawEntertainment();
    drawInformation();
    drawFileHosting();
    drawSearchEngine();
    drawGovernment();
  popMatrix();
  }
  
  drawLegend();
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      r=r+10; } 
    else if(keyCode == RIGHT) {
      r=r-10; } 
    else if(keyCode == DOWN) {
      zoom=zoom+10; }
    else if(keyCode == UP) {
      zoom=zoom-10; }
  } 
    else if(key == 's') {
      rx=rx+10; }
    else if(key == 'a') {
      rx=rx-10; } 
    else if(key == 'z') {
      ry=ry-10; }
    else if(key == 'x') {
      ry=ry+10; }
    else {
    r=0;
    rx=0;
    ry=0;
    zoom=0; }
}

