
//Global Variables

//Ball balls;
PFont font;
float x=400;
float y=300;
float d=110;



// Source : http://en.wikipedia.org/wiki/Millionaire#Number_of_millionaires_by_country
int[] val = 
{
  3104000,
  1719000,
  924000,
  535000,
  454000,
  396000,
  282000,
  243000,
  193000,
  170000,
};

String[] name =
{
  " United States",
  " Japan",
  " Germany",
  " China",
  " United Kingdom",
  " France",
  " Canada",
  " Switzerland",
  " Australia",
  " Italy",
};

void setup()
{
  background(255);
  size(800,600);
  smooth();
  strokeWeight(18);
  colorMode(RGB, width);
  fill(97,31,222);
 // balls = new Ball(300,400,60);
  font = loadFont("AgencyFB-Reg-28.vlw");

  
}

void draw()
{
  background(255);
 // balls.dispBall();
  textFont(font,28);
  textAlign(CENTER);
  fill(97,31,222);
  text("Top 10 Countries With The Most Millionares " , 400,50);
   ellipse(x,y,d,d); // America filled in purple
 

  
  fill(0); // black line
  strokeWeight(12); // thickness of line
  strokeCap(ROUND); // line rounded
  
  line(x,y+60,x,y+150); // line facing downwards connecting to ellipse for japan
  fill(242,7,149); // pink color for Japan
  ellipse(x,y+170,d-10,d-10); //Ellipse to represent Japan
 
  
  line(x+53,y,x+140,y); //line to connect to Germany ellipse
  fill(7,166,242); //aqua blue color for Germany ellipse
  ellipse(x+160,y,d-20,d-20); //ellipse for Germany
  
  line(x-53,y,x-140,y); //line to connect for Japan
  fill(242,7,27); //red color for Japan ellipse
  ellipse(x-160,y,d-30,d-30); //Japan ellipse
  
  line(x,y-60,x,y-150);//line to connect upwards to the Uk
  fill(7,242,64); //Bright green for the uk
  ellipse(x,y-160,d-40,d-40); //ellipse for the uk
  
  //translate(x+50,y,d,d);
  line(x+43,y+35,x+120,y+150); //line to connect on the bottom right hand side to france ellipse
  fill(242,235,7); //yellow fill for France
  ellipse(x+130,y+160,d-50,d-50); //ellipse for France
  
  line(x-43,y-35,x-120,y-140); //line on the top left hand side to Canada's ellipse
  fill(242,86,7); //orange fill for Canada
  ellipse(x-130,y-150,d-60,d-60); //ellipse for Canada
  
  line(x-45,y+28,x-100,y+135); //line in bottom left hand side connecting to Switzerlands ellipse
  fill(247,87,181); //light pink fill
  ellipse(x-110,y+145,d-70,d-70); //ellipse for Switzerland
  
  line(x+45,y-30,x+90,y-145); // line in top right hand side connecting to Australias ellipse
  fill(108,237,173); //aqua green fill
  ellipse(x+100,y-155,d-80,d-80); //ellipse for australia
  
  fill(242,41,10); //orange fill for italys  ellipse
  ellipse(x+175,y+140,d-90,d-90); // italys ellipse
  

  
  
  
  
  
}






