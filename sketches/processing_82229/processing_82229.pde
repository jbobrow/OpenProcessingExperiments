
//build

float a=mouseY;
float b=mouseY;
float c=mouseY;
float d=mouseY;
float e=mouseY;

void setup(){
  size(660,450);
  background(255);
}

void draw(){
  pushMatrix();
  translate(0,75);
  scale(0.6);
  
  background (255);
  
  //d
  if(mouseY < 100); if (mouseX < 650) {
  a=mouseY;
  } 
  fill(110);
  noStroke();
  quad(690,(a-90),690,350,880,390,880,(a-60));
  fill(100);
  quad(885,(a-25),885,428,772,405,772,(a-45));
  fill(210);
  quad(885,428,885,(a-25),980,(a-48),980,395);
  fill(160);
  quad(772,(a-45),885,(a-25),980,(a-48),880,(a-65));
  quad(980,(a-48),725,(a-93),690,(a-90),900,(a-50));
  
  //l 
  if(mouseY < 100); if (mouseX < 525) {
  b=mouseY;
  } 
  fill(90);
  noStroke();
  quad(550,385,825,445,825,(b-15),550,(b-70));
  fill(215);
  quad(825,(b-15),825,445,850,438,850,(b-20));
  fill(165);
  quad(550,(b-70),825,(b-15),850,(b-20),570,(b-73));
  
  //i
  if(mouseY < 100); if (mouseX < 475) {
c=mouseY;
} 
  fill(80);
  noStroke();
  quad(660,450,750,470,750,c,660,(c-20));
  fill(220);
  quad(750,470,780,460,780,(c-8),750,(c-3));
  fill(170);
  quad(750,c,660,(c-20),695,(c-25),780,(c-7));
  
  //u
  if(mouseY < 100); if (mouseX < 425) {
  d=mouseY;
  } 
  fill(70);
  noStroke();
  quad(570,(d-10),570,(d+20),640,(d+5),570,(d-10));
  fill(60);
  quad(500,(d+3),500,490,600,515,600,(d+30));
  fill(225);
  quad(600,(d+31),600,515,700,485,700,(d+6));
  fill(175);
  quad(500,(d+3),600,(d+30),630,(d+23),530,(d-2));
  quad(630,(d+23),700,(d+7),660,(d),570,(d+15));
  quad(700,(d+7),600,(d-15),570,(d-10),660,(d+10));
  
  //b
  if(mouseY < 100); if (mouseX < 350) {
  e=mouseY;
  } 
  fill(50);
  noStroke();
  quad(100,e,100,485,400,580,400,(e+80));
  fill(230);
  quad(400,(e+80),400,580,550,530,550,(e+45));
  fill(185);
  quad(100,e,140,(e-7),450,(e+65),400,(e+83));
  quad(300,(e+44),400,(e+83),550,(e+45),440,e+17);
  
  popMatrix();
}
