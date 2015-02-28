
PImage man, ghost, run ,bus;

int card = 0; 
PFont f; 
int x = 60;
int y = 30;
int w = 200;
int h = 100;


void setup() {
  size(600, 600);
  f = loadFont("CopperplateGothic-Bold-32.vlw");
  textFont(f);
  smooth();
}

void draw() {

  noStroke();

  background(255);  

  smooth();  




  if (card == 0) {
    background(200);
    text("Glasses thought..",width/3, height/2);

    glasses_(50,10,1,0, 255,255,255);
  }  
  else if (card == 1) {  
    man = loadImage("image1.jpg");  

    image (man, -30, -25,658,658);

    glasses(173,150,0.8,0, 100,200,180);
 text("Glasses",width/2.5, height/1.5);
  } 

  else if (card  == 2) {  

    glasses(10,-30,1,20, 225,205,125);  

    glasses_(250,220,0.8,180, 200,200,230);
    glasses_(30,520,1,315, 100,200,230);

    glasses_(580,620,1.5,225, 200,250,230);  
    glasses_(450,40,1,90, 250,250,200);
    glasses_(270,250,1,135, 180,255,180);  
    glasses(500,310,1,270, 200,250,200); 

    glasses(10,550,1,315, 250,250,150);


    glasses(360,450,0.8,45, 150,250,150);
    glasses(-50,80,6,0, 230,230,200); 

    glasses_(315,365,0.4,45, 230,0,0);
  
text("Red",width/4, height/1.7);

}
  else if (card  == 3) { 
    glasses_(100,-30,1,35, 230,0,0);
    glasses_(30,250,1,-12, 100,255,255);
    glasses(0,400,1,0, 155,155,155);
  }
  else if (card  == 4) {  
   background(30);
    ghost = loadImage("image2.png");  

    image (ghost, 100, 100,50,100);
    image (ghost, 150, 150,150,300);
    image (ghost, 350, 230,30,60);
    
  glasses(-330,0,5.8,0, 150,25,25);
  text("Ghost",width/1.25, height/1.15);
  } 

  else if (card  == 5) {  
     background(80);
    run = loadImage("image3.png");  
    image (run, 20, 250,300,270);
    glasses_(175,290,-0.25,0, 230,10,15);
 bus = loadImage("image4.png");  
    image (bus, 430, 120,350,350);

text("red",width/1.25, height/1.1);

} 

  else if (card  == 6) {  
    background(0);
    text(" ",width/2, height/2+20);
    fill(0, 255, 255);
    ellipse(x, y, 40, 40);
  } 

  else if (card == 7) {  
    background(0);
   
    fill(100, 255, 255);
    ellipse(x, y, 40, 40);
  }

  else if (card == 8) {  
    background(0);
   
    fill(0, 100, 255);
    ellipse(x, y, 40, 40);
  }

  else if (card == 9) {  
    background(0);
    text("Next Page->",width/2, height/2+20);
    fill(0, 255, 100);
    ellipse(x, y, 40, 40);
  }
}


void glasses(int x, int y,float s,float r,int c, int b,int d) {    

  pushMatrix();    

  translate(x,y);    

  scale(s);    

  rotate(radians(r));    

  fill(c,b,d);    
  smooth();    

  beginShape();  


  int a= 40;  

  stroke(c,b,d);   
  smooth();  

  noFill();

  strokeWeight(30);  
  line(a-3, a, 45,a);  
  line(265, a, 273,a);  

  strokeWeight(20);  
  beginShape();  
  vertex(140, a);  
  bezierVertex(140,a, 155, 30, 170, a);  
  endShape();  


  strokeWeight(13);  
  line(30, 45, 35,85);  
  line(280, 45, 275,85);  


  strokeWeight(10);  
  ellipse(95, 50, 90, 80);  
  ellipse(215, 50, 90, 80); 

  noStroke();
  fill(255);
  ellipse(35,35,10,5);
  ellipse(275,35,10,5);


  endShape();  
  popMatrix();
} 
void glasses_(int x, int y,float s,float r,int c, int b,int d) {    


  pushMatrix();    

  translate(x,y);    

  scale(s);    

  rotate(radians(r));    

  fill(c,b,d);    
  smooth();    

  beginShape();  


  int a= 40;  

  stroke(70,20,0);   
  smooth();  


  //glass__
  strokeWeight(25);  
  line(115, 60, 128,53);  
  strokeWeight(22);
  line(221, 17, 223,17);  


  //bridge
  strokeWeight(15);  
  beginShape();  
  vertex(170, a+10);  
  bezierVertex(170,a+10, 180, 45, 200, 33);  
  endShape();  



  //leg
  strokeWeight(16);  
  line(10, 66, 120,63);  
  line(10, 66, -10,80);
  strokeWeight(14);  
  line(110, 19, 228,14);  
  line(110, 19, 95,29); 

  //glass
  strokeWeight(9);  
  ellipse(150, 75, 50, 85);  
  strokeWeight(7);  
  ellipse(210, 48, 30, 75); 

  //dot
  noStroke();
  fill(255);
  ellipse(115,58,7,9);
  ellipse(227,12,5,7);



  endShape();  
  popMatrix();
}








void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h))
    {
      card = 1;
    } 
    else card = 0;
  }

  else if (card == 1) {  

    if((mouseX > 190) && (mouseX < 410) && (mouseY > 150) && (mouseY < 230)) 

    {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    float d = dist(mouseX, mouseY, 333, 418);
    if (d < 32) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    if((mouseX > x-10) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h+20))
    {
      card = 4;
    }
    
 else   if((mouseX > x-10) && (mouseX < x + w) && (mouseY > y+185) && (mouseY < y+ 300))
    {
      card = 8;
    }
    
 else if((mouseX > x-20) && (mouseX < x + w+20) && (mouseY > y+385) && (mouseY < y+460))
    {
      card = 9;
    }
    
 
    
    
  else card = 3;
}  



else if (card == 4) { 

  float d = dist(mouseX, mouseY, x+160, y+350);
  if (d < 80) {
    card = 5;
  }
  else card = 4;
   }  
else if (card == 5) { 

  float d = dist(mouseX, mouseY, x+85, y+238);
  if (d < 29) {
    card = 06;
  }
  else card = 5;
} 
else if (card == 6) {

  float d = dist(mouseX, mouseY, x, y);
  if (d < 20) {
    card = 0;
  }
  else card = 6;
}

else if (card == 8) {

  float d = dist(mouseX, mouseY, x, y);
  if (d < 20) {
    card = 0;
  }
  else card = 8;
}

else if (card == 9) {

  float d = dist(mouseX, mouseY, x, y);
  if (d < 20) {
    card = 0;
  }
  else card = 9;
}
}

