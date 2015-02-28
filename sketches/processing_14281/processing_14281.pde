
void setup() {

  size(600,600);  
  noStroke();
  background(219,189,252);  

  smooth();
}

void draw() {
  noStroke();

  float mapColorR = map(mouseX, 0, 600, 0, 240);
  float mapColorB = map(mouseY, 0, width, 0, 255);
  fill(mapColorR,0, mapColorB);
  rect(0, 0, width, height);

  for (int y=0; y <= height; y +=40) {  

    for (int x= 0; x <= width; x +=40) {  

      fill (196,242,235,144);  

      ellipse(x,y,40,40);
    }
  }  



  smooth();  

  fill(255,116,118);
  quad(20,100,100,100,100,140,20,140);  



  fill(255,90,162);  



  quad(80,320,120,280,140,300,100,340);  

  quad(120,360,180,300,300,440,240,500);  



  fill(147,22,76);  



  quad(60,360,340,600,300,600,40,380);  



  fill(77,6,37);  



  quad(20,530,600,530,600,570,20,570);  



  fill(49,5,31);  



  quad(100,480,200,580,180,600,80,500);  





  fill(242,54,120);
  beginShape();  

  vertex(300,240);  

  vertex(600,180);  

  vertex(600,320);  

  vertex(400,600);  

  vertex(300,540);  

  vertex(300,240);  

  endShape();  



  fill(227,94,203);  

  beginShape();  

  vertex(380,180);  

  vertex(420,180);  

  vertex(420,220);  

  vertex(460,220);  

  vertex(460,260);  

  vertex(420,260);  

  vertex(420,300);  

  vertex(380,300);  

  vertex(380,260);  

  vertex(340,260);  

  vertex(340,220);  

  vertex(380,220);  

  vertex(380,180);  

  endShape();  




  fill(126,13,106);  



  quad(240,80,600,80,600,100,240,100);  

  quad(360,120,600,120,600,140,360,140);  



  fill(250,154,199);  



  quad(400,60,500,6,560,80,460,180);  



  fill(250,172,208);  

  quad(220,240,240,240,240,340,220,340);  


  fill(204,103,255);  

  ellipse(440,410,100,100);  


  fill(247,153,130);  

  noStroke();  
 
   
  ellipse(300,200,40,40); 
  if(mousePressed == true) {  

    fill(161,46,240);  
    for (int x = 300; x <= width-10; x += 50) {  

      for (int y = 200; y <= height-10; y += 50) {  



        ellipse(x,y,20,20);
      }
    }
  }  



  int x = 20;
  int y = 40;
  int w =80;
  int h = 40;


  if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
    fill(154,96,250);
  }
  else {
    fill(255,116,118);
  }
  rect(x, y, w, h);


 int radius = 20;


  ellipseMode(RADIUS);

  float d = dist(width/2, height/2,mouseX, mouseY);
  fill(204,103,255);

  if ( d < radius) {
    fill(247,179,75);
    radius++;
  }  
  else if (mousePressed && (d > radius) && (radius > 20)) {
    fill(66,195,252);
    radius--;
    println(radius);
  } 
  ellipse(width/2, height/2, radius, radius);

int a = 20;
int b = 100;
int c = 80;
int t = 40;



  if((mouseX > a) && (mouseX < a + c) && (mouseY > b) && (mouseY < b+ t)) {
    fill(154,96,250);
  }
  else {
    fill(255,116,118);
  }
  rect(a, b, c, t);
}





