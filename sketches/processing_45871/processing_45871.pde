
void setup() {
   size(650, 550);
   background(255);
   smooth();
   LineGraphSetup();
}
 
void LineGraphSetup(){
 
//titel + jaartallen x-as
fill(0);
text("Groei Wereldbevolking in miljarden", 150, 50);
text("1900", 100, 520);
text("1950", 220, 520);
text("2000", 335, 520);
text("2050", 450, 520);
 
stroke(0);
 
line(50,100,50,500);
line(50,500,500,500);
line(30,400,70,400);
line(30,300,70,300);
line(30,200,70,200);
line(30,100,70,100);
 
//miljarden y-as
fill(0);
text("2,5", 30, 400);
text("5", 30, 300);
text("7,5", 30, 200);
text("10", 30, 100);

stroke(0,137,137);
strokeWeight(5);
  
line(52,480,110,430);

line(110,430,230,400);

line(230,400,340,260);

line(340,260,465,120);

stroke(200,0,0);

line(340,260,400,300);

line(400,300,460,285);

text("indien 3e wereldoorlog", 470, 280);
}


