
//----Buttons--------
private Button buttonChicken;
private Button buttonBeef;
private Button buttonPork;
private Button buttonFish;
private Button buttonPasta;
private Button buttonMostViewed;
private Button buttonHome;
private Button buttonBack;

private Button choiceC1;
private Button choiceC2;
private Button choiceC3;

private Button choiceB1;
private Button choiceB2;
private Button choiceB3;

private Button choiceP1;
private Button choiceP2;
private Button choiceP3;

private Button choiceF1;
private Button choiceF2;
private Button choiceF3;

private Button choicePA1;
private Button choicePA2;
private Button choicePA3;

private Button choiceMV1;
private Button choiceMV2;
private Button choiceMV3;


//----Images----
PImage hBackground;
PImage oBackground;


//---Fonts---
PFont font;


//----Scraped Data Top 3----
String [] chickenTop3 = new String [3];
String [] beefTop3 = new String[3];
String [] porkTop3 = new String [3];
String [] fishTop3 = new String [3];
String [] pastaTop3 = new String [3];
String [] mostViewedTop3 = new String [3];

//----Scraped Data: Top 3 URL's
String [] chickenTop3Url = new String [3];
String [] beefTop3Url = new String[3];
String [] porkTop3Url = new String[3];
String [] fishTop3Url = new String [3];
String [] pastaTop3Url = new String[3];
String [] mostViewedTop3Url = new String [3];

ArrayList listChickenI1 = new ArrayList();
ArrayList listChickenI2 = new ArrayList();
ArrayList listChickenI3 = new ArrayList();

ArrayList listBeefI1 = new ArrayList();
ArrayList listBeefI2 = new ArrayList();
ArrayList listBeefI3 = new ArrayList();

ArrayList listPorkI1 = new ArrayList();
ArrayList listPorkI2 = new ArrayList();
ArrayList listPorkI3 = new ArrayList();

ArrayList listFishI1 = new ArrayList();
ArrayList listFishI2 = new ArrayList();
ArrayList listFishI3 = new ArrayList();

ArrayList listPastaI1 = new ArrayList();
ArrayList listPastaI2 = new ArrayList();
ArrayList listPastaI3 = new ArrayList();

ArrayList listMostViewedI1 = new ArrayList();
ArrayList listMostViewedI2 = new ArrayList();
ArrayList listMostViewedI3 = new ArrayList();

String [] chickenI1;
String [] chickenI2;
String [] chickenI3;

String [] beefI1;
String [] beefI2;
String [] beefI3;

String [] porkI1;
String [] porkI2;
String [] porkI3;

String [] fishI1;
String [] fishI2;
String [] fishI3;

String [] pastaI1;
String [] pastaI2;
String [] pastaI3;

String [] mostViewedI1;
String [] mostViewedI2;
String [] mostViewedI3;




ArrayList listChickenR1 = new ArrayList();
ArrayList listChickenR2 = new ArrayList();
ArrayList listChickenR3 = new ArrayList();

String [] chickenR1;
String [] chickenR2;
String [] chickenR3;

ArrayList listBeefR1 = new ArrayList();
ArrayList listBeefR2 = new ArrayList();
ArrayList listBeefR3 = new ArrayList();

String [] beefR1;
String [] beefR2;
String [] beefR3;

ArrayList listPorkR1 = new ArrayList();
ArrayList listPorkR2 = new ArrayList();
ArrayList listPorkR3 = new ArrayList();

String [] porkR1;
String [] porkR2;
String [] porkR3;

ArrayList listPastaR1 = new ArrayList();
ArrayList listPastaR2 = new ArrayList();
ArrayList listPastaR3 = new ArrayList();

String [] pastaR1;
String [] pastaR2;
String [] pastaR3;

ArrayList listFishR1 = new ArrayList();
ArrayList listFishR2 = new ArrayList();
ArrayList listFishR3 = new ArrayList();

String [] fishR1;
String [] fishR2;
String [] fishR3;

ArrayList listMostViewedR1 = new ArrayList();
ArrayList listMostViewedR2 = new ArrayList();
ArrayList listMostViewedR3 = new ArrayList();

String [] mostViewedR1;
String [] mostViewedR2;
String [] mostViewedR3;



//---URL----
String URL = "http://www.studentrecipes.com/recipes/";


//----Used to detect if you're at the main menu----
private boolean start;
//private boolean chicken;



void setup()
{

  size(500, 650);
  //------font---  
  font = loadFont("ComicSansMS-20.vlw");
  //----images-----
  hBackground = loadImage("background.jpg");
  
  oBackground = loadImage("nullBackground.jpg");


  //--Buttons--
  buttonChicken = new Button (50, 125, 100, 100, "cookedChicken.jpg");
  buttonBeef = new Button (200, 125, 100, 100, "cookedBeef.jpg");
  buttonPork = new Button (350, 125, 100, 100, "cookedPork.jpg");
  buttonFish= new Button (50, 425, 100, 100, "cookedFishjpg.jpg");
  buttonPasta = new Button (200, 425, 100, 100, "pasta.jpg");
  buttonMostViewed = new Button (350, 425, 100, 100, "star.jpg");
  buttonHome = new Button(10, 10, 80, 50, "Home.jpg");
  buttonBack = new Button(350, 100, 100, 50, "back.jpg");

  choiceC1 = new Button(25, 150, 100, 100, "1.jpg");
  choiceC2 = new Button(25, 300, 100, 100, "2.jpg");
  choiceC3 = new Button(25, 460, 100, 100, "3.jpg");

  choiceB1 = new Button(25, 150, 100, 100, "1.jpg");
  choiceB2 = new Button(25, 300, 100, 100, "2.jpg");
  choiceB3 = new Button(25, 450, 100, 100, "3.jpg");

  choiceP1 = new Button(25, 150, 100, 100, "1.jpg");
  choiceP2 = new Button(25, 300, 100, 100, "2.jpg");
  choiceP3 = new Button(25, 450, 100, 100, "3.jpg");

  choiceF1 = new Button(25, 150, 100, 100, "1.jpg");
  choiceF2 = new Button(25, 300, 100, 100, "2.jpg");
  choiceF3 = new Button(25, 450, 100, 100, "3.jpg");

  choicePA1 = new Button(25, 150, 100, 100, "1.jpg");
  choicePA2 = new Button(25, 300, 100, 100, "2.jpg");
  choicePA3 = new Button(25, 450, 100, 100, "3.jpg");

  choiceMV1 = new Button(25, 150, 100, 100, "1.jpg");
  choiceMV2 = new Button(25, 300, 100, 100, "2.jpg");
  choiceMV3 = new Button(25, 450, 100, 100, "3.jpg");

  /*choiceC1 = new Button(25, 100, 100, 100, "1.jpg");
  choiceC2 = new Button(25, 225, 100, 100, "2.jpg");
  choiceC3 = new Button(25, 350, 100, 100, "3.jpg");*/


  //----Scrapes the data for the top 3 most viewed and get's the url's to be used
  chickenTop3 = scrape("http://www.studentrecipes.com/recipes/chicken/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='/recipes/", "</a>", "'>");
  beefTop3 = scrape("http://www.studentrecipes.com/recipes/beef/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='/recipes/", "</a>", "'>");
  porkTop3 = scrape("http://www.studentrecipes.com/recipes/pork/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='/recipes/", "</a>", "'>");
  fishTop3 = scrape("http://www.studentrecipes.com/recipes/fish/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='/recipes/", "</a>", "'>");
  pastaTop3 = scrape("http://www.studentrecipes.com/recipes/pasta/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='/recipes/", "</a>", "'>");
  mostViewedTop3 = scrape("http://www.studentrecipes.com", "<h2>Most Viewed</h2>", "<ul class=\"week accordion\">", "<h3><a href='/recipes/", "</a>", "'>");

  chickenTop3Url = scrape("http://www.studentrecipes.com/recipes/chicken/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='", "'>", "/recipes/");
  beefTop3Url = scrape("http://www.studentrecipes.com/recipes/beef/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='", "'>", "/recipes/");
  porkTop3Url = scrape("http://www.studentrecipes.com/recipes/pork/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='", "'>", "/recipes/");
  fishTop3Url = scrape("http://www.studentrecipes.com/recipes/fish/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='", "'>", "/recipes/");
  pastaTop3Url = scrape("http://www.studentrecipes.com/recipes/pasta/order/views/", "<b>Rating</b><em>&nbsp;</em>", "<div class=\"rightRail\">", "<a class='name' href='", "'>", "/recipes/");
  mostViewedTop3Url = scrape("http://www.studentrecipes.com", "<h2>Most Viewed</h2>", "<ul class=\"week accordion\">", "<h3><a href='", "'>", "/recipes/");



  //---adds two halfs of url together---
  refineURL(chickenTop3Url);
  refineURL(beefTop3Url);
  refineURL(porkTop3Url);
  refineURL(fishTop3Url);
  refineURL(pastaTop3Url);
  refineURL(mostViewedTop3Url);


  //---Scrapes ingridients,sets size or array, converts list to regular array---
  listChickenI1 = scrape2(chickenTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  chickenI1 = new String[listChickenI1.size()];
  chickenI1 = convert(listChickenI1);

  listChickenI2 = scrape2(chickenTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  chickenI2 = new String[listChickenI2.size()];
  chickenI2 = convert(listChickenI2);

  listChickenI3 = scrape2(chickenTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  chickenI3 = new String[listChickenI3.size()];
  chickenI3 = convert(listChickenI3);




  listBeefI1 = scrape2(beefTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  beefI1 = new String[listBeefI1.size()];
  beefI1 = convert(listBeefI1);

  listBeefI2 = scrape2(beefTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  beefI2 = new String[listBeefI2.size()];
  beefI2 = convert(listBeefI2);

  listBeefI3 = scrape2(beefTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  beefI3 = new String[listBeefI3.size()];
  beefI3 = convert(listBeefI3);




  listPorkI1 = scrape2(porkTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  porkI1 = new String[listPorkI1.size()];
  porkI1 = convert(listPorkI1);

  listPorkI2 = scrape2(porkTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  porkI2 = new String[listPorkI2.size()];
  porkI2 = convert(listPorkI2);

  listPorkI3 = scrape2(porkTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  porkI3 = new String[listPorkI3.size()];
  porkI3 = convert(listPorkI3);




  listFishI1 = scrape2(fishTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  fishI1 = new String[listFishI1.size()];
  fishI1 = convert(listFishI1);

  listFishI2 = scrape2(fishTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  fishI2 = new String[listFishI2.size()];
  fishI2 = convert(listFishI2);

  listFishI3 = scrape2(fishTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  fishI3 = new String[listFishI3.size()];
  fishI3 = convert(listFishI3);




  listPastaI1 = scrape2(pastaTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  pastaI1 = new String[listPastaI1.size()];
  pastaI1 = convert(listPastaI1);

  listPastaI2 = scrape2(pastaTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  pastaI2 = new String[listPastaI2.size()];
  pastaI2 = convert(listPastaI2);

  listPastaI3 = scrape2(pastaTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  pastaI3 = new String[listPastaI3.size()];
  pastaI3 = convert(listPastaI3);




  listMostViewedI1 = scrape2(mostViewedTop3Url[0], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  mostViewedI1 = new String[listMostViewedI1.size()];
  mostViewedI1 = convert(listMostViewedI1);

  listMostViewedI2 = scrape2(mostViewedTop3Url[1], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  mostViewedI2 = new String[listMostViewedI2.size()];
  mostViewedI2 = convert(listMostViewedI2);

  listMostViewedI3 = scrape2(mostViewedTop3Url[2], "<h2 class=\"ingredients\">Ingredients</h2>", "<h2 class=\"method\">Method</h2>", "<li itemprop=\"ingredi", "</li>", "ents\">");
  mostViewedI3 = new String[listMostViewedI3.size()];
  mostViewedI3 = convert(listMostViewedI3);





  listChickenR1 = scrape3(chickenTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  chickenR1 = new String[listChickenR1.size()];
  chickenR1 = convert(listChickenR1);

  listChickenR2 = scrape3(chickenTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  chickenR2 = new String[listChickenR2.size()];
  chickenR2 = convert(listChickenR2);

  listChickenR3 = scrape3(chickenTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  chickenR3 = new String[listChickenR3.size()];
  chickenR3 = convert(listChickenR3);


  listBeefR1 = scrape3(beefTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  beefR1 = new String[listBeefR1.size()];
  beefR1 = convert(listBeefR1);

  listBeefR2 = scrape3(beefTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  beefR2 = new String[listBeefR2.size()];
  beefR2 = convert(listBeefR2);

  listBeefR3 = scrape3(beefTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  beefR3 = new String[listBeefR3.size()];
  beefR3 = convert(listBeefR3);


  listPorkR1 = scrape3(porkTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  porkR1 = new String[listPorkR1.size()];
  porkR1 = convert(listPorkR1);

  listPorkR2 = scrape3(porkTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  porkR2 = new String[listPorkR2.size()];
  porkR2 = convert(listPorkR2);

  listPorkR3 = scrape3(porkTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  porkR3 = new String[listPorkR3.size()];
  porkR3 = convert(listPorkR3);


  listFishR1 = scrape3(fishTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  fishR1 = new String[listFishR1.size()];
  fishR1 = convert(listFishR1);

  listFishR2 = scrape3(fishTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  fishR2 = new String[listFishR2.size()];
  fishR2 = convert(listFishR2);

  listFishR3 = scrape3(fishTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  fishR3 = new String[listFishR3.size()];
  fishR3 = convert(listFishR3);

  listPastaR1 = scrape3(pastaTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  pastaR1 = new String[listPastaR1.size()];
  pastaR1 = convert(listPastaR1);

  listPastaR2 = scrape3(pastaTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  pastaR2 = new String[listPastaR2.size()];
  pastaR2 = convert(listPastaR2);

  listPastaR3 = scrape3(pastaTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  pastaR3 = new String[listPastaR3.size()];
  pastaR3 = convert(listPastaR3);

  listMostViewedR1 = scrape3(mostViewedTop3Url[0], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  mostViewedR1 = new String[listMostViewedR1.size()];
  mostViewedR1 = convert(listMostViewedR1);

  listMostViewedR2 = scrape3(mostViewedTop3Url[1], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  mostViewedR2 = new String[listMostViewedR2.size()];
  mostViewedR2 = convert(listMostViewedR2);

  listMostViewedR3 = scrape3(mostViewedTop3Url[2], "<h2 class=\"method\">Method</h2>", "<a href=\"/report/?id=5275&&abuseType=recipe\" class=\"fancyBox recipeReport\">Report</a>", "recipeInstructions\">", "</p>", "<br /><br />");
  mostViewedR3 = new String[listMostViewedR3.size()];
  mostViewedR3 = convert(listMostViewedR3);



  //starts the main menu
  start = true;
}

void draw()
{

  // main menu
  if (start == true) {

    //background(255);


    image(hBackground, 0, 0);
    //hBackground.resize(500,500);

    buttonChicken.update();
    buttonChicken.render();

    buttonBeef.update();
    buttonBeef.render();

    buttonPork.update();
    buttonPork.render();

    buttonFish.update();
    buttonFish.render();

    buttonPasta.update();
    buttonPasta.render();

    buttonMostViewed.update();
    buttonMostViewed.render();
  }

  //********************************************************

  //chicken menu
  if (buttonChicken.getClicked() == true) {


    start = false;

    
    image(oBackground, 0, 0);
    



    buttonHome.render();
    buttonHome.update();

    choiceC1.render();
    choiceC1.update();

    choiceC2.render();
    choiceC2.update();

    choiceC3.render();
    choiceC3.update();

    fill(0);
    textSize(30);
    text("Chicken Recipies", 150, 50);
    strokeWeight(2);
    line(150, 55, 400, 55);

    wrap(chickenTop3);


    if (buttonHome.getClicked() == true) {
      start = true;
      buttonChicken.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  //chicken choice 1
  if (choiceC1.getClicked()== true) {



    buttonChicken.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(chickenTop3[0]);

    wrap3(chickenI1);

    wrap4(chickenR1);


    if (buttonHome.getClicked() == true) {
      start = true;
      choiceC1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  //chicken choice2
  if (choiceC2.getClicked()== true) {


    buttonChicken.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(chickenTop3[1]);

    wrap3(chickenI2);

    wrap4(chickenR2);


    if (buttonHome.getClicked() == true) {
      start = true;
      choiceC2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  //chicken choice 3
  if (choiceC3.getClicked()== true) {

    buttonChicken.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(chickenTop3[2]);

    wrap3(chickenI3);

    wrap4(chickenR3);


    if (buttonHome.getClicked() == true) {
      start = true;
      choiceC3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  //***********************************************************



  if (buttonBeef.getClicked() == true) {
    start = false;

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    choiceB1.render();
    choiceB1.update();

    choiceB2.render();
    choiceB2.update();

    choiceB3.render();
    choiceB3.update();

    wrap(beefTop3);


    fill(0);
    textSize(30);
    text("Beef Recipies", 150, 50);
    strokeWeight(2);
    line(150, 55, 330, 55);


    if (buttonHome.getClicked() == true) {

      start = true;

      buttonBeef.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choiceB1.getClicked()== true) {

    buttonBeef.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(beefTop3[0]);

    wrap3(beefI1);

    wrap4(beefR1);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceB1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choiceB2.getClicked()== true) {

    buttonBeef.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(beefTop3[1]);

    wrap3(beefI2);

    wrap4(beefR2);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceB2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choiceB3.getClicked()== true) {

    buttonBeef.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(beefTop3[2]);

    wrap3(beefI3);

    wrap4(beefR3);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceB3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  //************************************************************  


  if (buttonPork.getClicked() == true) {

    start = false;

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    choiceP1.render();
    choiceP1.update();

    choiceP2.render();
    choiceP2.update();

    choiceP3.render();
    choiceP3.update();

    wrap(porkTop3);

    fill(0);
    textSize(30);
    text("Pork Recipies", 150, 50);
    strokeWeight(2);
    line(150, 55, 345, 55);

    if (buttonHome.getClicked() == true) {

      start = true;

      buttonPork.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceP1.getClicked()== true) {

    buttonPork.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(porkTop3[0]);

    wrap3(porkI1);

    wrap4(porkR1);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceP1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choiceP2.getClicked()== true) {

    buttonPork.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(porkTop3[1]);

    wrap3(porkI2);

    wrap4(porkR2);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceP2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choiceP3.getClicked()== true) {

    buttonPork.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(porkTop3[2]);

    wrap3(porkI3);

    wrap4(porkR3);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceP3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  //************************************************************
  if (buttonFish.getClicked() == true) {

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    choiceF1.render();
    choiceF1.update();

    choiceF2.render();
    choiceF2.update();

    choiceF3.render();
    choiceF3.update();

    wrap(fishTop3);


    fill(0);
    textSize(30);
    text("Fish Recipies", 150, 50);    
    strokeWeight(2);
    line(150, 55, 345, 55);


    if (buttonHome.getClicked() == true) {

      start = true;
      buttonFish.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceF1.getClicked()== true) {

    buttonFish.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(fishTop3[0]);

    wrap3(fishI1);
    
    wrap4(fishR1);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceF1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceF2.getClicked()== true) {

    buttonFish.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(fishTop3[1]);

    wrap3(fishI2);
    
    wrap4(fishR2);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceF2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceF3.getClicked()== true) {

    buttonFish.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(fishTop3[2]);

    wrap3(fishI3);
    
    wrap4(fishR3);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceF3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  //******************************************************
  if (buttonPasta.getClicked() == true) {

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    choicePA1.render();
    choicePA1.update();

    choicePA2.render();
    choicePA2.update();

    choicePA3.render();
    choicePA3.update();


    wrap(pastaTop3);

    fill(0);
    textSize(30);
    text("Pasta recipies", 150, 50);
    strokeWeight(2);
    line(150, 55, 355, 55);

    if (buttonHome.getClicked() == true) {
      start = true;
      buttonPasta.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choicePA1.getClicked()== true) {

    buttonPasta.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(pastaTop3[0]);

    wrap3(pastaI1);
    
    wrap4(pastaR1);

    if (buttonHome.getClicked() == true) {
      start = true;
      choicePA1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choicePA2.getClicked()== true) {

    buttonPasta.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(pastaTop3[1]);

    wrap3(pastaI2);
    
    wrap4(pastaR2);

    if (buttonHome.getClicked() == true) {
      start = true;
      choicePA2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }


  if (choicePA3.getClicked()== true) {

    buttonPasta.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(pastaTop3[2]);

    wrap3(pastaI3);
    
    wrap4(pastaR3);

    if (buttonHome.getClicked() == true) {
      start = true;
      choicePA3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }
  //******************************************************
  if (buttonMostViewed.getClicked() == true) {

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    choiceMV1.render();
    choiceMV1.update();

    choiceMV2.render();
    choiceMV2.update();

    choiceMV3.render();
    choiceMV3.update();

    wrap(mostViewedTop3);

    fill(0);
    textSize(30);
    text("Most Viewed Recipies", 150, 50);

    strokeWeight(2);
    line(150, 55, 460, 55);


    if (buttonHome.getClicked() == true) {
      start = true;
      buttonMostViewed.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceMV1.getClicked()== true) {

    buttonMostViewed.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(mostViewedTop3[0]);

    wrap3(mostViewedI1);
    
    wrap4(mostViewedR1);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceMV1.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceMV2.getClicked()== true) {

    buttonMostViewed.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(mostViewedTop3[1]);

    wrap3(mostViewedI2);
    
    wrap4(mostViewedR2);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceMV2.setClicked(false);
      buttonHome.setClicked(false);
    }
  }

  if (choiceMV3.getClicked()== true) {

    buttonMostViewed.setClicked(false);

    image(oBackground, 0, 0);

    buttonHome.render();
    buttonHome.update();

    wrap2(mostViewedTop3[2]);

    wrap3(mostViewedI3);
    
    wrap4(mostViewedR3);

    if (buttonHome.getClicked() == true) {
      start = true;
      choiceMV3.setClicked(false);
      buttonHome.setClicked(false);
    }
  }
  //**************************************************
}




//*******************************************************************
//Used to scrape the title of the top 3 viewed
//pass in the url, where to cut the page from the top, where to cut the page from the bottom, how to section it, where to cut the peice of data from the left, where to cut from right
//returns an array of 3 since we only want to display 3

private String [] scrape(String url, String topCut, String bottomCut, String sections, String cLine, String tidy)
{
  String[] ln = loadStrings(url);

  String wholePage = "";

  for (int i=0; i<ln.length;i++)
  {
    wholePage = wholePage +ln[i];
  }


  String[] halfPage = split(wholePage, topCut);

  String[] halfPage2 = split(halfPage[1], bottomCut);

  String[] sections1 = split(halfPage2[0], sections);

  String [] sections2 = new String[(sections1.length-1)];

  for (int i=1; i<sections1.length;i++)
  {
    sections2[i-1] = sections1[i];
  }

  String [] relevant = new String[sections2.length];

  for (int i = 0; i<sections2.length;i++)
  {
    String bitTemp [] = split(sections2[i], cLine);

    relevant[i] = bitTemp[0];
    //println(relevant[i]);
  }

  for (int i = 0; i<sections2.length;i++)
  {
    String bitTemp [] = split(relevant[i], tidy);

    relevant[i] = bitTemp[1];
  }

  String [] only3 = new String [3];

  for (int i=0; i<only3.length;i++)
  {
    only3[i] = relevant[i];
  }

  return only3;
}
//*************************************************
//Used to scrape the ingridients from the page's
//pass in the url, where to cut the page from the top, where to cut the page from the bottom, how to section it, where to cut the peice of data from the left, where to cut from right
//returns an array list as we don't know how many lines there are
private ArrayList scrape2(String url, String topCut, String bottomCut, String sections, String cLine, String tidy)
{
  String[] ln = loadStrings(url);

  String wholePage = "";

  for (int i=0; i<ln.length;i++)
  {
    wholePage = wholePage +ln[i];
  }


  String[] halfPage = split(wholePage, topCut);

  String[] halfPage2 = split(halfPage[1], bottomCut);

  String[] sections1 = split(halfPage2[0], sections);

  String [] sections2 = new String[(sections1.length-1)];

  for (int i=1; i<sections1.length;i++)
  {
    sections2[i-1] = sections1[i];
  }

  String [] relevant = new String[sections2.length];

  for (int i = 0; i<sections2.length;i++)
  {
    String bitTemp [] = split(sections2[i], cLine);

    relevant[i] = bitTemp[0];
    //println(relevant[i]);
  }

  for (int i = 0; i<sections2.length;i++)
  {
    String bitTemp [] = split(relevant[i], tidy);

    relevant[i] = bitTemp[1];
  }

  ArrayList temp = new ArrayList();

  for (int i=0; i<relevant.length;i++)
  {
    temp.add(relevant[i]);
  }


  return temp;
}

//***********************************************
private ArrayList scrape3(String url, String topCut, String bottomCut, String topRemove, String bottomRemove, String section)
{
  String [] ln = loadStrings(url);

  String wholePage = "";

  for (int i=0; i<ln.length;i++)
  {
    wholePage = wholePage +ln[i];
  }

  String[]  halfPage = split(wholePage, topCut);

  String[] halfPage2 = split(halfPage[1], bottomCut);

  String[] removeTop = split(halfPage2[0], topRemove);

  String[] removeBottom = split(removeTop[1], bottomRemove);

  String [] sections1 = split(removeBottom[0], section);

  /*for (int i=0; i<sections1.length;i++){
   println(sections1[i]);
   }*/

  ArrayList temp = new ArrayList();

  for (int i=0; i<sections1.length;i++)
  {
    temp.add(sections1[i]);
  }

  return temp;
}

//*************************************************
//wraps the ingridients and prints them
//pass in the array of ingridients that's been converted from a list to a regular array
private void wrap3(String[] newArray)
{

  fill(0);
  textSize(18);
  text("Ingredients", 20, 80);
  strokeWeight(2);
  line(18, 90, 150, 90);

  int heightTemp = 110;


  for (int i=0; i<newArray.length;i++) {

    String temp = newArray[i];


    String[] wrapped = wrapText(temp, 50);


    for (int i2=0; i2<wrapped.length; i2++)
    {
      if (wrapped[i2].equals("")) {
        heightTemp =heightTemp - 20;
      }

      fill(0);
      textSize(12);
      text(wrapped[i2], 30, heightTemp);
      heightTemp = heightTemp + 15;
    }

    heightTemp = heightTemp + 5;
  }

  for (int i3=0; i3<newArray.length;i3++) {
    println(newArray[i3]);
  }
}

//****************************************************
private void wrap4(String[] newArray)
{

  fill(0);
  textSize(18);
  text("Recepie", 20, 380);
  strokeWeight(2);
  line(18, 385, 150, 385);

  int heightTemp = 400;


  for (int i=0; i<newArray.length;i++) {

    String temp = newArray[i];


    String[] wrapped = wrapText(temp, 75);


    for (int i2=0; i2<wrapped.length; i2++)
    {
      if (wrapped[i2].equals("")) {
        heightTemp = heightTemp - 20;
      }
      
      

      fill(0);
      textSize(12);
      text(wrapped[i2], 30, heightTemp);
      heightTemp = heightTemp + 15;
    }

    heightTemp = heightTemp + 5;
  }

  for (int i3=0; i3<newArray.length;i3++) {
    println(newArray[i3]);
  }
}

//*************************************************
//wraps the title of the second sub menus and prints them
//pass in the title
public void wrap2(String newTemp)
{
  int heightTemp = 40;

  String temp = newTemp;

  String[] wrapped = wrapText(temp, 30);

  for (int i=0; i<wrapped.length; i++)
  {
    fill(0);
    textSize(20);
    text(wrapped[i], 120, heightTemp);
    heightTemp = heightTemp + 20;
  }
}
//**************************************************

//wraps the  3 options in the first sub menu and prints them
//pass in the array of options
private void wrap(String[] newArray)
{

  int heightTemp = 180;


  for (int i=0; i<3;i++) {

    String temp = newArray[i];

    String[] wrapped = wrapText(temp, 30);


    for (int i2=0; i2<wrapped.length; i2++)
    {
      fill(0);
      textSize(18);
      text( wrapped[i2], 140, heightTemp);
      heightTemp = heightTemp + 18;
    }

    heightTemp = heightTemp + 130;
  }
}

//**********************************

//add's both half of the url together
//pass in array of url's
public void refineURL(String [] tempArray)
{

  for (int i=0; i<3;i++)
  {
    String temp = tempArray[i];
    tempArray[i] = URL+temp;
  }
}
//************************************


//word wrap method from    http://progcookbook.blogspot.co.uk/2006/02/text-wrapping-function-for-java.html
static String [] wrapText (String text, int len)
{
  // return empty array for null text
  if (text == null)
  return new String [] {
  };

  // return text if len is zero or less
  if (len <= 0)
  return new String [] {
    text
  };

  // return text if less than length
  if (text.length() <= len)
  return new String [] {
    text
  };

  char [] chars = text.toCharArray();
  Vector lines = new Vector();
  StringBuffer line = new StringBuffer();
  StringBuffer word = new StringBuffer();

  for (int i = 0; i < chars.length; i++) {
    word.append(chars[i]);

    if (chars[i] == ' ') {
      if ((line.length() + word.length()) > len) {
        lines.add(line.toString());
        line.delete(0, line.length());
      }

      line.append(word);
      word.delete(0, word.length());
    }
  }

  // handle any extra chars in current word
  if (word.length() > 0) {
    if ((line.length() + word.length()) > len) {
      lines.add(line.toString());
      line.delete(0, line.length());
    }
    line.append(word);
  }

  // handle extra line
  if (line.length() > 0) {
    lines.add(line.toString());
  }

  String [] ret = new String[lines.size()];
  int c = 0; // counter
  for (Enumeration e = lines.elements(); e.hasMoreElements(); c++) {
    ret[c] = (String) e.nextElement();
  }

  return ret;
}
//************************************************

//converts an array list to an regular array
// pass in an array list
// returns a regular array
private String [] convert (ArrayList newArray)
{

  String [] convertedArray = new String[newArray.size()];

  newArray.toArray(convertedArray);

  return convertedArray;
}
//***********************************

//button class
class Button { 

  PImage bImage;
  boolean clicked;
  float x;
  float y;
  int bWidth;
  int bHeight;
  int bRed;
  int bGreen;
  int bBlue;
  int sRed;
  int sGreen;
  int sBlue;
  int sWeight;



  //button (x point, y point,width,height,picture)
  public Button(float newX, float newY, int newBWidth, int newBHeight, String newLoc) {

    x = newX;
    y = newY;
    bWidth = newBWidth;
    bHeight = newBHeight;
    clicked = false;
    bRed = 200;
    bGreen = 0;
    bBlue = 0;
    sRed = 191;
    sGreen =177;
    sBlue = 131;
    sWeight = 0;
    bImage = loadImage(newLoc);
    bImage.resize(bWidth-10, bHeight-10);
  }

  //redners it
  void render() {

    fill(bRed, bGreen, bBlue);
    //noFill();
    stroke(sRed, sGreen, sBlue);
    strokeWeight(sWeight);
    rect(x, y, bWidth, bHeight);

    image(bImage, x+5, y+5);
  }

  //updates, checks if it's been clicked
  void update() {

    if (mouseX > x && mouseX < (x+bWidth) && mouseY > y && mouseY < (y+bHeight)) {



      sWeight = 5;

      bRed = 240;
      bGreen = 221;
      bBlue = 157;

      if (mousePressed == true) {
        clicked = true;
      }
    } 
    else {

      sWeight = 0;
      bRed = 240;
      bGreen = 221;
      bBlue = 157;
    }
  }


  //returns if it's been clicked
  public boolean getClicked() {
    return clicked;
  }

  //set's if it's clicked
  public void setClicked(boolean newClicked) 
  {
    clicked = newClicked;
  }
}


