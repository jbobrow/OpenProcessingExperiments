
void setup() {
  size(600,600);
  background(111,111,111);
  smooth(); }
   
void draw() {
  println(mouseX + " : " + mouseY);

  
  /*귀*/
  
  noStroke();
  fill(247,143,11);
  triangle(190,100,290,100,240,30);
  
   noStroke();
  fill(247,143,11);
  triangle(310,100,410,100,360,30);
  
   /*다리*/
  fill(70,45,42);
  quad(260,530,260,480,270,480,270,530);
  fill(70,45,42);
  triangle(255,550,265,530,275,550);
   
  fill(70,45,42);
  quad(340,530,340,480,350,480,350,530);
  fill(70,45,42);
  triangle(335,550,345,530,355,550);
  

  /*몸통*/

   noStroke();
  fill(247,143,11);
  ellipse(300,400,200,200);

 
  /*얼굴*/ 
  
  noStroke();
  fill(247,143,11);
  ellipse(300,200,300,300);
  
   noStroke();
  fill(247,177,87);
  ellipse(300,200,220,220);
  
   noStroke();
  fill(1000,1000,1000);
  ellipse(300,200,200,200);
 
  
  /*왼쪽눈*/
  
  noStroke();
  fill(19,22,11);
  ellipse(245,190,70,70);
  
  noStroke();
  fill(100,100,100);
  ellipse(245,190,40,40);
  
  noStroke();
  fill(1000,1000,1000);
  ellipse(245,190,30,30);

  /*오른쪽눈*/
  
    noStroke();
  fill(19,22,11);
  ellipse(350,190,70,70);
  
  noStroke();
  fill(100,100,100);
  ellipse(350,190,40,40);
  
  noStroke();
  fill(1000,1000,1000);
  ellipse(350,190,30,30);

 /*입*/
  noStroke();
  fill(19,22,11);
  triangle(285,240,305,240,295,230);
  
  noStroke();
  fill(19,22,11);
  triangle(285,240,305,240,295,260);

 /*날개*/
 
  noStroke();
  fill(247,143,11);
  triangle(250,300,250,430,150,430);
  
  noStroke();
  fill(247,143,11);
  triangle(350,300,450,430,350,430);
 


  }
