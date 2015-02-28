
void setup() {

size(1000, 800);
background(#36EAE6);

  // lines //
strokeWeight(2) ;
line(52, 756, 999, 1) ;
line(52, 756, 999, 756) ;


  // ellipse 01 //
fill(#0DAD00);
ellipse(45, 738, 32, 32);

  // ellipse 02 //
fill(#61ED37);
ellipse(175, 612, 70, 70);

  // ellipse 03 //
fill(#FFE600) ;
ellipse(334, 450, 125, 125) ;

  // ellipse 04 //
fill(#FC7208) ;
ellipse(527, 258, 185, 185) ;

  // ellipse 05 //
fill(#D32C0B) ;
ellipse(743, 20, 290, 290) ;

  // house 01 //
fill(#F06F96) ;
strokeWeight(2) ;
rect(170, 725, 35, 30);
 // door
fill(0);
rect(187, 740, 10, 15);

  // house 02 //
fill(#F06F96) ;
strokeWeight(2) ;
rect(255, 725, 35, 30) ;
 // door
fill(0);
rect(263, 740, 10, 15);

  // house 03 //
fill(#F06F96) ;
strokeWeight(2) ;
rect(212, 689, 35, 30);
  // door
fill(0);
rect(224, 702, 10, 15);

  // roof 01 //
stroke(#BF490D) ;
strokeWeight(3) ;
line(167, 727, 187, 707) ;
line(187, 707, 207, 725) ;

  // roof 02 //
stroke(#BF490D) ;
strokeWeight(3) ;
line(252, 727, 272, 707) ;
line(293, 727, 272, 707) ;

  // roof 03 //
stroke(#BF490D) ;
strokeWeight(3) ;
line(209, 689, 229, 671) ;
line(229, 671, 248, 689) ;

   // text //
 //ellipse 01
textSize(38) ;
text("U.S. Government Spending:", 51, 47); 
text("$10 billion, 460 million...", 90, 95);
text("per DAY!", 655, 95);


 // ellipse 02
textSize(34);
text("Average Top CEO Pay: ", 21, 227);
text("$14.1 million per year", 49, 275);


 // ellipse 03
textSize(30);
text("Average NBA Player Income:", 495, 452);
text("$5.15 million per year", 540, 492);

 // ellipse 04
textSize(24);
text("Average Grade School Teacher Salary:", 272, 615);
text("$49,000 per year", 460, 645);

 // ellipse 05
textSize(15);
text("Min Wage", 14, 710);
text("Full-Time", 14, 690);
text("$15,080 per year:", 14, 670); 
  
 // houses
textSize(20);
text("Average American Household:", 315, 720);
text("$52,100 per year", 400, 752);

  // pyramid
line(700, 696, 922, 485);
line(922, 485, 999, 567);
line(915, 730, 923, 485);
line(700, 696, 915, 730);
line(915, 730, 999, 677);

textSize(18);
text("Building the Great Pyramid", 695, 752);
text("$5 bllion today", 770, 660);



}

void draw() {
  println(mouseX + ", " + mouseY) ;
}


