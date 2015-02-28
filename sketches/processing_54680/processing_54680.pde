
int x = 5;
float b = 400;
PFont myfont;

void setup(){
 line(100,100,375,275);
  size(1000,600);
 myfont = loadFont("Zapfino-90.vlw");

   
  
}

void draw(){
  
  triangle(140, 450, 700, 190, 726, 550);
   fill(140,30,50);
   
    line(670,500,650,280);
   
   ellipse(610,400,70,70);
   
    ellipse(560,340,70,70);
    
     ellipse(285,430,70,70);
     
       ellipse(520,470,70,70);
 
  ellipse(400,400,b,b);
 fill(b,150,10);
 textFont(myfont);
 textSize(b);
 text("Queen of the Pizza",10,b);
  
}


void mousePressed(){
  
  b = b - 10;
 background(random(255),random(255),random(255));
 


  
  
}

void keyPressed(){
  //fill(random(255),0,0);
}


