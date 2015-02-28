
PImage coins;


void drawTabs(){
  int x = 900;
  int y = 0;
  int theYear = 2008;
  textFont(font, 25);
  
  for(int i = 0; i<10; i++){
    fill(0,255,255);
    rect(x, y, 100, 70);
    fill(0);
    text(theYear, x + 25, y + 42);
    y +=70;
    theYear += 1;
  }
}

void drawUnemployment()
{
  float degree = (float(unemployment[arrayNumber]) / 100 * 360);
  
  fill(0,125,255);
  ellipse(150, 170, 200, 200);
  fill(0,0,255);
  arc(150, 170, 200, 200, 0, radians(degree));
  fill(0);
  text("Unemployment Percentage", 30, 30);
  text("Of Total Population", 60, 60);
  text(unemployment[arrayNumber] + "%", 150,170);
}

void drawExpenditureCurrency()
{
  int y = 550;
  coins = loadImage("euro.png");
  for(int i = 0; i<int(expenditureCurrency[arrayNumber])/10; i++){
    image(coins, 580, y, 100, 25);
    y-=10;
  }
  text("Expenditure in Euros", 530, 600);
  text(expenditureCurrency[arrayNumber] + " billion", 560, 630);
}

void drawExpenditurePercentage(){
  float degree = (float(expenditurePercentage[arrayNumber]) / 100 * 360);
  
  fill(0,125,255);
  ellipse(470, 170, 200, 200);
  fill(0,0,255);
  arc(470, 170, 200, 200, 0, radians(degree));
  fill(0);
  text("Expenditure Percentage", 370, 30);
  text("Of GDP", 440, 60);
  text(expenditurePercentage[arrayNumber] +"%", 470, 170);
}

void drawDebtCurrency(){
  int y = 550;
  coins = loadImage("euro.png");
  for(int i = 0; i<int(debtCurrency[arrayNumber])/10; i++){
    image(coins, 260, y, 100, 25);
    y-=10;
  }
  text("Debt in Euros", 240, 600);
  text(debtCurrency[arrayNumber] + " billion", 235, 630);
}
  
void drawDebtPercentage(){
  int circleSize = int(debtPercentage[arrayNumber]);
  int y = 170;
  
  fill(0,0,255);
  ellipse(750, y, circleSize, circleSize);
  fill(0,125,255);
  ellipse(750, y, 100, 100);
  fill(0);
  text("100%", 725, y+7);
  text("Debt Percentage Of GDP", 620, 50);
  text(debtPercentage[arrayNumber] + "%", 700, y + circleSize - 30);
}

void drawFooter()
{
  text("Greek Economy Details", 350, 690);
  textFont(font, 12);
  text("Information Provided By The IMF Future Values Are Estimates", 20, 690);
  
}


