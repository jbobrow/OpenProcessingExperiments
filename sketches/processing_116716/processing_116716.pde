
import java.util.Calendar;

int s;
int s2;
int m;
void setup()

{

  size(500, 500);

  background(16, 67, 155);

  smooth();

  

  

    fill(255, 255, 255);

  stroke(0);

  strokeWeight(3);

  

  bezier(200, 100, 220, 30, 280, 30, 300, 100);

  bezier(200, 100, 220, 150, 280, 150, 300, 100);

  

  bezier(75, 200, 95, 130, 155, 130, 175, 200);

  bezier(75, 200, 95, 250, 155, 250, 175, 200);

  

  bezier(325, 200, 345, 130, 405, 130, 425, 200);

  bezier(325, 200, 345, 250, 405, 250, 425, 200);

  

  fill(177, 28, 46);

  noStroke();

  triangle(250, 300, 210, 270, 155, 350);

  triangle(250, 300, 290, 270, 345, 350);

  quad(210, 360, 290, 360, 290, 410, 210, 410);

  triangle(210, 360, 210, 410, 155, 350);

  triangle(290, 360, 290, 410, 345, 350);

  

  noStroke();

  fill(180, 86, 86);

  ellipse(250, 100, 70, 70);

  ellipse(125, 200, 70, 70);

  ellipse(375, 200, 70, 70);

  

}




void draw()

{

  noStroke();

  

  fill(234, 178, 178);

  ellipse(250, 100, 65, 65);

  ellipse(125, 200, 65, 65);

  ellipse(375, 200, 65, 65);
  
  fill(216, 28, 28, 70);
  ellipse(250, 100, 40, 40);

  

  fill(0);
  textSize(40);
  text(minute(), 225, 115);
  
  fill(245, 202, 138);
  textSize(45);
  text(hour(), 225, 260);
  
  /*fill(245, 202, 138);
  textSize(40);
  text(day(), 200, 300);
  /*
  if (s>=1){
  ellipse(250, 100, 10, 10);}
  if (s>=2){
  ellipse(250, 85, 10, 10);}
  if (s>=3){
  ellipse(250, 115, 10, 10);}
  if (s>=4){
  ellipse(235, 100, 10, 10);}
  if (s>=5){
  ellipse(265, 100, 10, 10);}
  if (s>=6){
  ellipse(235, 85, 10, 10);}
  if (s>=7){
  ellipse(265, 115, 10, 10);}
  if (s>=8){
  ellipse(265, 85, 10, 10);}
  if (s>=9){
  ellipse(235, 115, 10, 10);}*/

  fill(0);
  s = second()/10;
  if (s>=1){
  ellipse(125, 200, 10, 10);}
  if (s>=2){
  ellipse(125, 185, 10, 10);}
  if (s>=3){
  ellipse(125, 215, 10, 10);}
  if (s>=4){
  ellipse(110, 200, 10, 10);}
  if (s>=5){
  ellipse(140, 200, 10, 10);}
/*
  ellipse(110, 185, 10, 10);

  ellipse(140, 215, 10, 10);

  ellipse(140, 185, 10, 10);

  ellipse(110, 215, 10, 10);
*/
  
   s = second();
  if (s>=1){
  ellipse(375, 200, 10, 10);}
  if (s>=2){
  ellipse(375, 185, 10, 10);}
  if (s>=3){
  ellipse(375, 215, 10, 10);}
  if (s>=4){
  ellipse(360, 200, 10, 10);}
  if (s>=5){
  ellipse(390, 200, 10, 10);}
  if (s>=6){
  ellipse(360, 185, 10, 10);}
  if (s>=7){
  ellipse(390, 215, 10, 10);}
  if (s>=8){
  ellipse(390, 185, 10, 10);}
  if (s>=9){
  ellipse(360, 215, 10, 10);}
  
  
   Calendar calendar = Calendar.getInstance();
  int day = calendar.get(Calendar.DAY_OF_WEEK);
  fill(255, 255, 255);
  textSize(30);
  if (day==1)
  {
    text("Sunday", 190, 350);
  }
  if (day==2)
  {
    text("Monday", 190, 350);
  }
    if (day==3)
  {
    text("Tuesday", 190, 350);
  }
  if (day==4)
  {
    text("Wednesday", 190, 350);
  }
    if (day==5)
  {
    text("Thursday", 190, 350);
  }
  if (day==6)
  {
    text("Friday", 190, 350);
  }
  if (day==7)
  {
    text("Saturday", 190, 350);
  }
}
