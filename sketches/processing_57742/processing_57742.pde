
//HW 12  copyright 2012 mdanver
//Melanie Danver 

//top 50 soda brands in the world
int counter = 1;
String [] top50 = {
  "Coca-Cola", "Pepsi", "Diet Coke", "Moutain Dew", "Diet Pepsi", "Dr. Pepper", "Sprite", "Fanta", "Caffeine-Free Diet Coke", "Diet Moutain Dew", 
  "Apla", "Bidu", "Chani", "Chinchibirra", "Cunnington", "Goliat", "Neuss", "Pastore", "Pindy", "Pritty", 
  "Rocket Fuel", "Secco", "Ser", "Spring Up", "Torasso", "Tradicional de Secco Secco", "Tubito", "Villa del Sur Levite", "Vitacrem Mandarina", "Back o'Bourke Cordials", 
  "Bickford's", "Bundaberg", "Cascade", "Cottee's Count Cola", "Farmers Union Iced Coffee", "Golden Circle", "Kirks", "Gest LA Ice Cola", "Leed", "Lido", 
  "McSars", "McMahons", "Passiona PipeLime", "Pub Squash", "Saxby's", "Solo", "Schweppes", "Frutonic", "Whisky cola", "Wodka Redbull"
};

void setup()
{

  size(600, 600);
  smooth();
  //background(0);
}

void draw()
{
  background(0);
  circle();
counts();
}

void circle()
{
  noStroke();
  for (int i = 0; i<top50.length; i++)
  {
    float value = 5;
    float m = map(value, 0, width, 0, 10);
    
    pushMatrix();
    translate(width*.5, height*.5);
    rotate(radians(180+(i*7.2)));
    textSize(26-(i*.5));
    fill(8*(i+1), 3*(i+25), 1*(i+1));
    ellipseMode(CENTER);

    textAlign(LEFT);
    translate(-width*.25, 0);
    rotate(radians(180));
    ellipse(-30+(m*mouseX), -5+(m*mouseY), top50[i].length(), top50[i].length());
    fill(255, 255, 255);
    if (counter-1 == i)
    {fill(111,160,255);
      text(top50[counter-1],m*mouseX,m*mouseY);
    }
    text(top50[i], m*mouseX, m*mouseY);
    popMatrix();
  }
}

void mouseClicked()
{ 
  counter++;
  if (counter > 50){
  counter =1;}
}

void counts()
{
  textAlign (CENTER);
textSize(40);
fill(111,160,255);
  text(counter, width/2, height/2); 
}

