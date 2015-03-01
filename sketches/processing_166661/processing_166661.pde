
int myState = 0 ;

PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage words;

void setup() {
  one = loadImage("scene1.jpeg");
  two = loadImage("scene2.jpeg");
  three = loadImage("scene3.jpeg");
  four = loadImage("scene4.jpeg");
  five = loadImage("scene5.jpeg");
  words = loadImage("paper.jpg");
size(900, 600);

}




void draw() {
 
  background(0) ;
  println(myState) ;
 
  
  if (mouseY < 520) {
  myState = 0 ;
  }
  
  if (mouseX < 300 && mouseY > 520) {
    myState = 1 ;
  }
  
  if (mouseX > 300 && mouseX < 600 && mouseY > 520) {
    myState = 2 ;
  }
  
  if (mouseX > 600 && mouseX < 900 && mouseY > 520) {
    myState = 3;
  }
  

   
  
 
 
switch(myState) {
  
  case 0: 
  
  image(one, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 350, 100, 6);
  fill(255);
  
  textSize(20);
  fill(255, 0, 0);
  rect(0, 520, 300, 80, 3);
  fill(0);
  text("Shit on TV I watched", 20, 570);
  
  fill(0, 0, 255);
  rect(300, 520, 300, 80, 3);
  fill(255);
  text("Energy Drinks I drank", 340, 570);
  
  fill(0, 255, 61);
  rect(600, 520, 300, 80, 3);
  fill(0);
  text("How Long I typed", 650, 570);
 
  
  fill(255);
  textSize(12);
  text("So you want to get to know me? Well,", 35, 45);
text("how about I show some data about myself?", 35, 60);
text("To make things easier, I'll visualize it for you!", 35, 75);
text("So, which category would you like to know about?", 35, 90);
text("(Hover over box to view data, move mouse up to return.)", 35, 105);
break;


case 1:


fill(255);
rect(0, 0, width, height);

fill(155, 110);
rect(60, 60, 300, 120, 6);
fill(0);
textSize(12);
text("The names of TV shows and other series that", 65, 75);
text("are finished are in blue. Anything I have NOT", 65, 90);
text("finished will be in red. Also, the larger", 65, 105);
text("fonts mean longer shows, and vice-a-versa.", 65, 120);
text("For example, a font size of 13 pixels means", 65, 135);
text("the series is 13 episodes in length!", 65, 150);


textSize(6);
fill(0, 0, 255);
text("Fooly Cooly (FLCL)", 100, 300);

textSize(13);
fill(0, 0, 255);
text("Effects of Hell's Angels Meth", 220, 360);

textSize(50);
fill(255, 0, 0);
text("Shows With Meth", 400, 420);


textSize(51);
fill(0, 0, 255);
text("SOA", 200, 250);

textSize(26);
fill(255, 0, 0);
text("Trigun", 20, 330);

textSize(51);
fill(255, 0, 0);
text("TWD <33333", 345, 520);

textSize(52);
fill(0, 0, 255);
text("Pokemon", 5, 440);


textSize(25);
fill(0, 0, 255);
text("A", 15, 550);

textSize(25);
fill(255, 0, 0);
text("Breaking Bad", 30, 30);

textSize(291);
fill(255, 0, 0);
text("DBZ", 365, 180);



break;

case 2: 
image(four, 0, 0, width, height);
fill(0, 155);
rect(0, 0, width, height);
fill(155, 110);
  rect(60, 60, 350, 100, 6);
  fill(255);
  textSize(12);
text("Each day of the week is marked below.", 65, 75);
text("The circles on this graph represent", 65, 90);
text("how many energy drinks I consume based", 65, 105);
text("on an average week during the semester.", 65, 120);
text("This helps me see which days are perceived", 65, 135);
text("as my busiest days of the week for a semester.", 65, 150);
  
  fill(0,255, 61, 200);
  rect(50, 380, 800, 200, 7);
 fill(0);
 textSize(24);
 text("Monday", 70, 410);
 text("Tuesday", 70, 450);
 text("Wednesday", 70, 490);
 text("Thursday", 70, 530);
 text("Friday", 470, 410);
 text("Saturday", 470, 450);
 text("Sunday", 470, 490);
 text("Total", 470, 530);
 
 textSize(76);
 text(".", 200, 400);
 text(".", 200, 440);
 text("..", 200, 520);
 text("..", 600, 440);
 text("......", 600, 520);
 
break;

case 3:

image(words, 0, 0, width, height);

fill(0);
textSize(24);
text("Data Visuals: Word Count!", 90, 40);

textSize(12);
text("Author: That one guy who always sits by the", 560, 30);
text("window in class because every anime protagonist does", 560, 50);
text("this, so now this project will be awesome!", 560, 70);

textSize(16);
text("Categories for every piece of writing I have completed are listed below. Each category will display the", 90, 105);
text("average number of words written or typed for each piece/project/assignment/etc.", 90, 125);
text("________________________________________________________", 150, 145);

rect(80, 500, width, 5);
rect(80, 120, 5, 380);

textSize(12);
fill(255, 0, 0);
rect(120, 300, 50, 200);
fill(0);
text("1276", 130, 280);

fill(0, 255, 0);
rect(220, 430, 50, 70);
fill(0);
text("530", 240, 410);

fill(0, 0, 255);
rect(320, 496, 50, 4);
fill(0);
text("29", 330, 476);

fill(255, 255, 0);
rect(420, 451, 50, 49);
fill(0);
text("218", 440, 431);

fill(255, 0, 255);
rect(520, 170, 50, 330);
fill(0);
text("2000+", 530, 160);

text("Exams/Reports", 90, 520);
text("Short Essays", 190, 520);
text("Applications", 290, 520);
text("Reviews", 410, 520);
text("Stories", 510, 520);




break;



}

}











