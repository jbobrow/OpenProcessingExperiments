
import fisica.*;

FWorld world;
int coinCount =0;
int coinSize = 15;


import controlP5.*;

ControlP5 controlP5;

String yourName = "";
Textfield nameField;
Textarea nameText;

Textfield avrField;
Textarea avrText;
String dailyAvr ;

Textfield todayField;
Textarea todayText;
Textarea hello;
String todayAmount;

PrintWriter output;

Textarea factText;
String[] randomFact = {"Write a list of the reasons why you want to stop, and keep them with you. Refer to them when tempted to light up. You may wish to read a separate leaflet in this series called 'Smoking - The Facts'. This gives the reasons why smoking is so harmful and lists the benefits of stopping.",
"Get rid of ashtrays, lighters, and all cigarettes.", 
"Set a date for stopping, and stop completely. (Some people prefer the idea of cutting down gradually. However, research has shown that if you smoke less cigarettes than usual, you are likely to smoke more of each cigarette, and nicotine levels remain nearly the same. Therefore, it is usually best to stop once and for all from a set date.)",
"Tell everyone that you are giving up smoking. Friends and family often give support and may help you. Smoking by others in the household makes giving up harder. If appropriate, try to get other household members who smoke, or friends who smoke, to stop smoking at the same time. A 'team' effort may be easier than going it alone.",
"Be prepared for some withdrawal symptoms. When you stop smoking, you are likely to get symptoms which may include: nausea (feeling sick), headaches, anxiety, irritability, craving, and just feeling awful. These symptoms are caused by the lack of nicotine that your body has been used to. They tend to peak after 12-24 hours, and then gradually ease over 2-4 weeks."};

float cigarettPrice = 0;
float packetPrice = 0;

String sOverall;
int overall;
Textarea healthText;
String[] healthFacts = {"Children who grow up in a home where one or both of their parents smoke have twice the risk of getting asthma and asthmatic bronchitis. They also have a higher risk of developing allergies.",
"tiredness and headaches can be linked to smoking.",
"For men in their 30s and 40s, smoking increases the risk of erectile dysfunction (ED) by about 50 per cent.",
"Smoking stains your teeth and gums.",
"Smoking accelerates the hardening and narrowing process in your arteries: it starts earlier and blood clots are two to four times more likely."};
Textarea money;
float pound = 0;

String[] lines;
int index = 0;

void setup(){
 size(700,700); 
 smooth();
 lines = loadStrings("name.txt");
 yourName = lines[0];
 lines = loadStrings("average.txt");
 dailyAvr = lines[0];
 lines = loadStrings("overall.txt");
 sOverall = lines[0];
 overall = int(sOverall);
 
 
 controlP5 = new ControlP5(this);
 
//TABS
  controlP5.tab("default").setLabel("Today");
  controlP5.tab("default").setId(2);
  controlP5.tab("You").setId(1);
  controlP5.tab("Savings").setId(3);

 //YOU TAB
 nameField = controlP5.addTextfield("name", ((width/2)-100), ((height/2)-200), 200, 20);
 nameField.moveTo("You");
 nameText = controlP5.addTextarea("yourName","Your name is: " + yourName, 100,100,200,60);
 nameText.moveTo("You");
 controlP5.addButton("submit",0,((width/2)+40),((height/2)-175),60,20).moveTo("You");

 
 avrField = controlP5.addTextfield("average",350, 300, 100, 20);
 avrField.moveTo("You");
 avrText = controlP5.addTextarea("yourAverage","You smoke an average of: "+ dailyAvr +" ciggarettes a day", 100, 300, 200, 60);
 avrText.moveTo("You");
 controlP5.addButton("submitAvr",0,((width/2)+40),((height/2)-175)+150,60,20).moveTo("You");
 
 //nameField = controlP5.addTextfield("name", ((width/2)-100), ((height/2)-10), 200, 20);
 //nameField.moveTo("You");

 //TODAY TAB
 todayField = controlP5.addTextfield("SmokedToday", ((width/2)-100),((height/2)-200), 200, 20);
 todayField.moveTo("default");
  controlP5.addButton("submitToday",0,((width/2)+40),((height/2)-300)+150,70,20).moveTo("default");
 todayText = controlP5.addTextarea("yourToday","You've had "+ "..." +" ciggarettes less then your average today.", 150, 200, 200, 60);
 todayText.moveTo("default");
 hello = controlP5.addTextarea("hello", "Hello "+ yourName +"!",100, 50, 100, 40);
  
  //RANDOM FACTS
  int randInt = int(random(0,4));
   factText = controlP5.addTextarea( "randomFact"," "+randomFact[randInt], 500, 300, 200, 100);
  factText.moveTo("global");
  
  //health facts
   
   healthText = controlP5.addTextarea( "healthFact"," "+healthFacts[randInt], 0, 300, 200, 100);
  healthText.moveTo("Savings");
  
 

//PRICING
String [] page = loadStrings("http://www.the-tma.org.uk/tma-publications-research/facts-figures/uk-tobacco-market-summary/");
String [] values = page[163].split(" ");

String price = values[34];
String[] finalprice = price.split("£");
//price per 20 in UK
println(finalprice[1]);
packetPrice = float(finalprice[1]);
cigarettPrice = (packetPrice/20);
println(cigarettPrice);
println(sOverall);

//SAVINGS TAB
  //COINS
  float temp = cigarettPrice*10;
  temp = temp*float(overall);
  println(temp);
  coinCount = int(temp);
  println(coinCount);
  Fisica.init(this);
 FCircle[] c = new FCircle[coinCount];
  
  //Fisica.init(this);
  
  
  
  world = new FWorld();
  world.setEdges(#000000);
  world.setEdgesRestitution(0.0);
  world.setGravity(0,300);
  
  for (int i=0; i < coinCount; i++){
    
    c[i] = new FCircle(coinSize);
    c[i].setPosition(random(30,570), 50);
    c[i].setFillColor(#CBCBCB);
    c[i].setNoStroke();
    world.add(c[i]);
  
  }
  pound = float(overall)*cigarettPrice;
     money = controlP5.addTextarea("money","You've saved: "+pound+ " pounds so far!", width/2, 200, 100, 100);
  money.moveTo("Savings");
  

}

void draw() {
 background(0);
 
 world.step();
 world.draw();
 
 
  
   
}

void submit(int theValue) {
  nameField.submit();
  nameText.setText("Your name is: " + yourName);
  hello.setText("Hello "+ yourName +"!");
  
}
void submitAvr(int theValue) {
  avrField.submit();
  avrText.setText("You smoke an average of: "+ dailyAvr +" ciggarettes a day");
}

void submitToday(int theValue) {
  todayField.submit();
  todayText.setText("You've had "+ todayAmount +" ciggarettes less than your average today.");
  pound = float(overall)*cigarettPrice;
  money.setText("You've saved: "+pound+ " pounds so far!");
  

}

void controlEvent(ControlEvent theEvent){
  
}

public void name(String theName) {
  output = createWriter("name.txt");
  yourName=theName;
  output.println(yourName);
  output.flush();
  output.close();
}

public void average(String theAvr) {
  output = createWriter("average.txt");
  dailyAvr=theAvr;
  output.println(theAvr);
  output.flush();
  output.close();
}
public void SmokedToday(String theAmount) {
  output = createWriter("amount.txt");
  
  todayAmount=str((int(dailyAvr))-(int(theAmount)));
  output.println(todayAmount);
  output.flush();
  output.close();
  output = createWriter("overall.txt");
  overall= (int(todayAmount))+overall;
  
  output.println(overall);
  output.flush();
  output.close();
  
}

