
//text  
PFont font;  
PFont Designer;  
PFont Write;  
String letters = "";  

//easing
float x = 0.0;  
float y = 0.0;  
float easing = 0.1;//0.0 -1  

void setup() {
  size(600,600);
}

void draw() {
  background(0); 
  smooth(); 
  fill(0);
  noStroke();

  //background 
  float mapColorB = map(mouseX, 0, 600, 0,255);
  float mapColorC = map(mouseY, 0, 600, 0,255);
  fill(255, mapColorC, mapColorB);
  rect(100,380,20,20);//black line

  rect(100,380,20,20);
  rect(140,400,20,20);
  rect(180,340,20,20);
  rect(180,420,20,20);

  rect(480,380,20,20);
  rect(440,400,20,20);
  rect(400,340,20,20);
  rect(400,420,20,20);


  rect(220,380,60,60);
  rect(320,380,60,60);

  rect(260,460,80,20);

  ellipse(300,510,20,20); 

  rect(120,190,40,40);
  rect(80,210,40,40);
  rect(40,230,40,40);

  rect(440,190,40,40);
  rect(480,210,40,40);
  rect(520,230,40,40);


  rect(200,110,40,80);
  rect(240,130,40,40);
  rect(160,130,40,40);

  rect(360,110,40,80);
  rect(320,130,40,40);
  rect(400,130,40,40);


  quad(260, 190, 340, 190, 320, 210, 280, 210);

  quad(20, 320, 60, 320, 100, 360, 60, 360);
  quad(40, 280, 80, 280, 120, 320, 80, 320);
  quad(100, 340, 140, 340, 200, 400, 160, 400);

  quad(540, 320, 580, 320, 540, 360, 500, 360);
  quad(520, 280, 560, 280, 520, 320, 480, 320);
  quad(460, 340, 500, 340, 440, 400, 400, 400);


  line(20,0,20,600);
  line(0,20,600,20);

  //1  
  {  
    if (mousePressed == true) {  
      if (mouseButton == LEFT)  
        fill(0,255,255);  
      else if (mouseButton == RIGHT)  
        fill(0,0,255);
    }  
    else {  
      noFill();
      smooth();  
      noStroke();
    }  

    rect(200,110,40,80);
    rect(240,130,40,40);
    rect(160,130,40,40);

    rect(360,110,40,80);
    rect(320,130,40,40);
    rect(400,130,40,40);

    quad(260, 190, 340, 190, 320, 210, 280, 210);

    ellipse(300,510,20,20);
  }  



  //easing
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  noFill();  
  stroke(255);  
  strokeWeight(2);
  ellipse(mouseX,mouseY,80,80);  
  ellipse(mouseX,mouseY,50,50);
  ellipse(x,y,10,10);
  line(mouseX,mouseY,mouseX + 50, mouseY );
  line(mouseX,mouseY,mouseX, mouseY + 50);
  line(mouseX,mouseY,mouseX -50, mouseY);
  line(mouseX,mouseY,mouseX, mouseY - 50 );


//text  
  PFont font;  
  font = loadFont("Cambria-Bold-48.vlw");   
  textFont(font);  
  stroke(3);  
  fill(255);  
  text(letters, 0, 0, 600, 600);  
  if( keyPressed == true ) {  
    letters = letters + key;  
  }  
}

