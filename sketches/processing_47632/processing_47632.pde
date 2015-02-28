
//dana gloria
// final project 
//7 December 2011 
//works cited
//http://whatscookingamerica.net/History/CookieHistory.htm
//http://www.foodchannel.com/articles/article/top-10-dessert-trends-for-2010-pro/
//http://www.willjogforfood.com/2011/07/food-fact-friday-cheesecake.html
//http://www.foodmuseum.com/excake2.html
//http://leitesculinaria.com/10348/writings-dining-through-the-decades-american-food-history.html#ixzz1d4bWYigU
//http://www.foodtimeline.org/fooddecades.html#
//http://blogs.laweekly.com/squidink/2010/03/20th_century_desserts.php
//http://leitesculinaria.com/10348/writings-dining-through-the-decades-american-food-history.html#ixzz1d4b2MVE7
//http://recipes.howstuffworks.com/food-facts/5-most-popular-desserts-in-america.htm




OverRect r = new OverRect (100,300,30);
OverRect r2 = new OverRect (200,300,30);
OverRect r3 = new OverRect (300,300,30);
OverRect r4 = new OverRect (550,300,30); 
OverRect r5 = new OverRect (730,300,30);
OverRect r6 = new OverRect (850,300,30);
OverRect r7 = new OverRect (950,300,30);
OverRect r8 = new OverRect (1030,300,30);
OverRect r9 = new OverRect (1100,300,30);
OverRect r10 = new OverRect (1200,300,30);
OverRect r11 = new OverRect (1350,300,30);
OverRect r12 = new OverRect (1480,300,30);
OverRect r13 = new OverRect (1580,300,30); 
OverRect r14 = new OverRect (1680,300,30);
OverRect r15 = new OverRect (1780,300,30);

 
 void setup () {
   size(2200,1000); 
   smooth();

 }
 void draw () {
   background(250,117,73);
   stroke (229,23,99);
   strokeWeight (5); 
strokeCap(PROJECT);
line(0,300,2200,300);
strokeCap(ROUND);

{
  if(mouseX < 600) {
    cursor(MOVE);
  } else {
    cursor(HAND);
  }
}

PImage brownies;
brownies = loadImage ("brownies.jpg");
image (brownies,50,70,130,130); 


 PImage smore;
smore = loadImage ("smore.jpg");
image (smore,130,420,130,130);

PImage choc;
choc= loadImage ("cookiemilk.jpg");
image(choc,250,130,130,130); 

PImage pie;
pie = loadImage ("willpie.jpg");
image (pie,450,420,130,130); 

PImage icecream;
icecream = loadImage ("icecream.jpg");
image (icecream,640,130,130,130); 
  
  PImage cake;
cake = loadImage ("rosecake.Jpg");
image (cake,750,420,130,130); 

PImage jello;
jello = loadImage ("greenjello.jpg");
image (jello,880,130,130,130); 

PImage fondue;
fondue = loadImage ("fondue.jpg");
image (fondue,960,420,130,130); 

PImage pine;
pine = loadImage ("upside.jpg");
image (pine,1050,130,130,130); 

PImage cheese;
cheese = loadImage ("cherry.jpg");
image (cheese,1150,420,130,130); 

PImage froyo;
froyo = loadImage ("froyo.jpg");
image (froyo,1280,130,130,130); 

PImage crepes;
crepes = loadImage ("crepes.jpg");
image (crepes,1410,420,130,130); 

PImage funnel;
funnel = loadImage ("funnel.jpg");
image (funnel,1455,130,130,130); 

PImage cupcake;
cupcake = loadImage ("velvet.jpg");
image (cupcake,1620,420,130,130); 

PImage nacho;
nacho = loadImage ("nachos2.jpg");
image (nacho,1730,130,130,130);

PImage cake2;
cake2 = loadImage ("wedcake.jpg");
image(cake2,2015,60,150,150);
 
PImage sprinkles;
sprinkles = loadImage ("sprinkles.jpg");
image(sprinkles,2015,215,150,150);

PImage sundae;
sundae = loadImage ("sundae.jpg");
image(sundae,2015,370,150,185);


  r.update (mouseX,mouseY); //rollover, could be a button 
  r.display();
  PFont font;
    font = loadFont ("Cen.vlw");
    textFont(font,18);
    text("Brownies",50,85);

  textFont(font,12);
   text( "Born:1892 in Chicago, IL by a chef at Chicago's Palmer House Hotel",50,68);
  text("*The confection was created after Bertha Palmer requested a dessert for ladies attending the fair; it should be, she said, smaller than a piece of cake, though still retaining cake-like characteristics and easily eaten from boxed lunches. These first brownies featured an apricot glaze and walnuts.*Trivia:Chocolate became popular because it was made more easily ready.",10,580);
  
 
  r2.update (mouseX,mouseY);
  r2. display ();
    textFont(font,18);
    text("S'mores",130,438);
    textFont(font,12);
   text( "Born:1927 for the Girl Scout Handbook", 130,450);
   text( "Trivia: S'mores are associated with recreational camping.Making s'mores in this manner is so popular in the United States that supermarkets often carry graham crackers, marshmallows, and huge chocolate bars in the same shelf section during the summer months.",50,600);

  
  r3.update (mouseX,mouseY);
  r3. display ();
    textFont(font,16);
    text("Chocolate Chip Cookies",190,255);
    textFont(font,12);
   text( "Born:1937 @ the Tollhouse Restaurant in Whitman,MA",75,275);
   text("*Ruth was making 'Butter Drop Do' cookies and the recipe called for baker's chocolate. Ruth didn't have any but found some semisweet chocolate,chopped it up,and stirred the chunks of chocolate into the cookie dough. She assumed that the chocolate would melt,but instead the chocolate bits held their shape. She called her new creation the Toll House Crunch Cookies.", 10,620);
  
  r4.update (mouseX,mouseY);
  r4. display ();
    textFont(font,18);
    text("Pies",450,435);
    textFont(font,12);
   text( "Trivia: Pies take center stage in the '40s. Wartime rationing means more at-home baking, but at least ready-made pie crust mix and instant whip make it easier.The word 'pie' is derived from the magpie bird since they collect miscellaneous objects in its nest. In the state of Kansas, it was once illegal to serve ice cream on cherry pie. Early Americans called pie fillings 'timber'.", 10,640);
  
  r5.update (mouseX,mouseY);
  r5. display ();
    textFont(font,18);
    text("Ice Cream",640,145);
    textFont(font,12);
   text( "Trivia:The U.S. enjoys an average of 48 pints of ice cream per person, per year, more than any other country.The ice cream cone's invention links to the 1904 World's Fair in St. Louis. An ice cream vendor reportedly didn't have enough dishes to keep up with the demand, so he teamed up with a waffle vendor who rolled his waffles into cones.Ice cream is an $11 billion retail industry.",10,660);
 
  r6.update (mouseX,mouseY);
  r6. display ();
    textFont(font,18);
    text("Cakes",750,543);
   textFont(font,12);
   text ("Trivia: Cakes were considered a symbol of well being by early American cooks on the east coast, with each region of the country having their own favorites.",50,680);
 
  r7.update (mouseX,mouseY);
  r7. display ();
  textFont(font,18);
    text("Jell-o",880,255);
    textFont(font,12);
   text ("Born:1845-47 in New York by Peter Cooper & Pearle B. Wait",880,275);
  text ("*Peter Cooper dabbled with and patented a product which was 'set' with gelatin. In 1897, Pearle Wait, a carpenter in LeRoy, was putting up a cough remedy and laxative tea in his home. He experimented with gelatine and came up with a fruit flavored dessert which his wife, May, named Jell-O. In 1899, he sold his formula to a fellow townsman for the sum of $450.",10,700);

  r8.update (mouseX,mouseY);
  r8. display ();
    textFont(font,16);
    text("Chocolate Fondue",945,435);
     textFont(font,12);
   text ("Born:July 4, 1964 @ the Chalet Suisse Restaurant in Mahattan,NY by Konrad Egli", 945,418);
      text("* Egli noticed that many of his diet-conscious customers avoided his rich chocolate desserts. He consulted with his public-relations agent, Beverly Allen, and came up with a chocolate fondue into which one dipped pieces of cake, fruit, or cream-puff pastry.",50,720);
  
  r9.update (mouseX,mouseY);
  r9. display ();
    textFont(font,16);
    text("Pineapple Desserts",1050,145);
     textFont(font,12);
   text ("Born:1920s,Pineapple Upside Cake by Jim Dole",1050,125);
  
  r10.update (mouseX,mouseY);
  r10. display ();
    textFont(font,18);
    text("Cheesecake",1150,542);
    textFont(font,12);
   text ("Born:1929 @ the Turf Restaurant in NYC by Arnold Reuben",1150,558);
   text("*Reuben went to a party where cheese pie was served. He was so intrigued with it he played around with various recipes until he found the perfect, sweet cheesecake.", 50,740);

  r11.update (mouseX,mouseY);
  r11. display ();
    textFont(font,18);
    text("Frozen Yogurt",1280,255);
    textFont(font,12);
   text ("Born:1978 @ the Brigham's Ice Cream Co. in Boston,MA",1280,275);
  
  r12.update (mouseX,mouseY);
  r12. display ();
    textFont(font,18);
    text("Crepes",1410,435);
    textFont(font,12);
   text ("Born:1895 @ Monte Carlo's Café de Paris by Henri Charpentier",1408,418);
   text( "Henri was a 14 year old waiter, who worked with his uncle, the famous chef Escoffier.",50,760);

  
  r13.update (mouseX,mouseY);
  r13. display ();
    textFont(font,18);
    text("Funnel Cake",1455,145);
     textFont(font,12);
   text ("Born:1879 by German immigrants that came to Pennsylvania",1455,125);
  
  r14.update (mouseX,mouseY);
  r14. display ();
    textFont(font,18);
    text("Cupcakes",1620,543);
  textFont(font,12);
   text ("Born:1796 by Amelia Simms",1620,558);
   text("Trivia:December 15th = national cupcake day.Cupcakes can be referred to as fairy cakes in Britain or patty cakes in Australia.",50,780);
 
  r15.update (mouseX,mouseY);
  r15. display ();
    textFont(font,18);
    text("Dessert Nachos",1730,248);
   textFont(font,12);
   text ("Born:2007 @ the Treats Truck in NY by Kim Ima",1730,275);
   text("Trivia: Ingredients = Chocolate & caramel creme cookie “chips” with brownies, bars & crispy treat toppings, chocolate sauce, whipped cream, & sprinkles.",50,800);


 
//ellipse(100,300,15,15); //Brownies
//ellipse (200,300,15,15); // S'mores
//ellipse(300,300,15,15);  // Chocolate Chip Cookies
//ellipse(550,300,15,15);  // Pies/Cobblers/Crisps
//ellipse(730,300,15,15);  // Ice Cream/Sundaes/Floats/Shakes 
//ellipse(850,300,15,15);  //Cake
//ellipse(950,300,15,15); // Jell-o
//ellipse(1030,300,15,15); // Chocolate Fondue
//ellipse(1100, 300,15,15); // Pineapple
//ellipse(1200, 300,15,15); // Cheesecake
//ellipse( 1350,300,15,15) ; // Fro Yo
//ellipse( 1480, 300,15,15); // Crepes
//ellipse( 1580, 300,15,15); // Funnel Cake
//ellipse(1680, 300,15,15); // Cupcakes
//ellipse(1780, 300,15,15); // Dessert Nachos
//fill(255);
   


fill(144,31,216);
font = loadFont("Flow.vlw"); 
textFont(font,55);

text("Decades in Desserts : Popular Trends", 500, 85); 
textFont(font,12);
fill(67,237,68);
text("Early on, it was all berries & honey, but with the introduction of refined sugar, the dessert was born.",1580,20);
text("Dessert comes from the French word ‘desservir,’ ‘to clear away’ - in this case, the dinner table.",1590,50);
text("By 1909, the average American consumed 65 lbs of sugar annually.",1605,80);

fill(0);
font = loadFont("School.vlw"); 
textFont(font,40); 
text("THEN",15, 400);
text("1920", 20, 230); 


text("1930", 200, 400); 

text("1940", 400, 230); 

text("1950", 600, 400); 

text("1960", 800, 230); 

text("1970", 1000, 400); 

text("1980", 1200, 230); 

text("1990", 1400, 400); 

text("2000", 1600, 230);

text("NOW", 1780, 400); 


 

 

//PImage shaker;
//shaker = loadImage ("Smooth.JPG");
//tint(255,120);  
//image(shaker,0,0,1900,600);

 }
 
void mousePressed() {
  

}
 

class OverRect {
  int x,y;
  int rectSize;
  int grey;
  boolean over; //clickable button
  
  //constructor 
  OverRect(int _x, int _y, int _rectSize) {
   x = _x;
  y = _y;
 rectSize = _rectSize;
 grey = 0;
 over = false;
 
  }
  void update (int mx, int my){ // m= mouse positions
  if((mx > x) && (mx < x + rectSize) && (my > y) && (my < y + rectSize))
    {
   grey = 255; 
   over = true;
  } else {
    grey = 0;
    over = false;
   }
    //x++; //makes objects move  
    //y++;
 }
   void display() {
     fill(grey); 
     rect (x,y, rectSize, rectSize); 
     
   }
   boolean press (){
     if (over) {
       return true;
     }else {
       return false;
     }
   }
}



 
 
 // viz is automated / processing js 
 //1. download processing js 2. index.html (open with text wrangler for code) 
 //interactive aspect
 //explore original representation 
 // analysis,looking at the data, make discoveries 

