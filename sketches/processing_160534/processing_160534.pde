
color a,b,c,d,e,f,g ;

void setup() {
  size(600, 600);
  noStroke();
  a = color(44,55,68); //background
  b = color(0,0,0); //blcak
  c = color(252,181,20);  //orange
  d = color(255,0,0); //red
  e = color(255,255,255); //white
  f = color(20,132,244); //blue
  g = color(26,244,20); //green
  noLoop();  
}


void draw() {
  background(a);
  

  fill(c);
  ellipse(100,270,150,150);
  
  fill(g);
  ellipse(460,270,120,120);
  
  fill(b);
  rect(0, 250, 550, 30);  //horizn_Rectan
  
  fill(b);
  rect(100, 150, 10, 300);
  
  fill(d);
  rect(100, 150, 10, 100);
  
 
  
  
  fill(d);
  rect(100, 345, 10, 110);
  
  fill(b);
  rect(450, 10, 30, 500);
  
  fill(e,100);
  ellipse(200,300,170,170);
  
  fill(b);
  ellipse(200,300,70,70);
  
  fill(b);
  rect(205, 50, 15, 550);
  
  fill(d);
  rect(240,400,240,140);

  fill(c);
  rect(270, 360, 30, 40);
  
  fill(c);
  rect(240, 400, 40, 40);
  
  fill(e);
  rect(270, 400, 30, 40);
  
  fill(a);
  rect(300, 400, 50, 40);
  
  fill(a);
  rect(300, 400, 50, 40);
  
  fill(f);
  rect(350, 400, 50, 40);  
  
  fill(g);
  rect(400, 400, 30, 40);    
  
  fill(233,200,120);
  rect(430, 400, 70, 40);  
  
  fill(10,80,45);
  rect(240, 440, 30, 40); 
  
  fill(b);
  rect(300, 440, 30, 40); 
  
  fill(g);
  rect(270, 440, 30, 40); 
  
  fill(255,243,9);
  rect(350, 440, 30, 40);
  
  fill(g);
  rect(385, 440, 30, 40);
  
  fill(a);
  rect(440, 440, 40, 40);
  
  fill(a);
  rect(240, 480, 145, 40);
  
  
  fill(c);
  rect(390, 480, 30, 40);
  
  fill(f);
  rect(420, 480, 30, 40);
  
  fill(b);
  rect(450, 480, 30, 40);
  
  fill(b);    //long,slim line
  rect(380, 350, 5, 300);
  
  fill(e);
  rect(180, 520, 70, 20);
  
  fill(b);
  rect(280, 520, 70, 20);
  
  fill(e);
  rect(340, 520, 20, 20);
  
  fill(f);
  rect(360, 520, 20, 20);
   
  fill(g);
  rect(390, 520, 20, 20);
  
  fill(130,23,255);
  rect(440, 520, 20, 20);
  
  
  
  strokeWeight(2);
  stroke(b);
  line(0,285,600,285);
  
  
  
  
  
  
  
  //strokeWeight(2);
  //stroke(b);
  //line(180,280,600,600);
  //line(180,280,580,600);
  //line(180,280,560,600);
  //line(180,280,540,600);
  //line(180,280,520,600);
  //line(180,280,500,600);
  
  
   
   //Arc 
   noFill();
   stroke(b);
   strokeWeight(3);
   arc(200, 200, 200, 200, radians(250), radians(380));
   
   noFill();
   stroke(b);
   strokeWeight(5);
   arc(200, 200, 160, 160, radians(250), radians(380));
   
   

  
  




    
 }

