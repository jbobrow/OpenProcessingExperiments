
int sonne = 0;
int sonneX = 185;
int sonneY = 510;
int sonneSize = 150;

float bodenR = 185;
float bodenG = 164;
float bodenB = 109;

float himmelR = 187;
float himmelB = 230;


void setup(){
  size(600,600);
  smooth();
  frameRate(15);
}


void mousePressed(){
  //println(mouseX+" "+mouseY);
  saveFrame("Vogel.jpg");
}


void draw(){
  background(himmelR,himmelB,231);
  himmelR = himmelR - 0.3;
  himmelB = himmelB - 0.3;
  
  //Sonne
    noStroke();
    fill(255,255,sonne);
    ellipse(sonneX,sonneY,sonneSize,sonneSize);
    sonne = sonne + 1;
    sonneY = sonneY - 1;
  
  //Boden
    noStroke();
    fill(bodenR,bodenG,bodenB);
    rectMode(CORNER);
    rect(0,500,600,100);  
    bodenR = bodenR - 0.3;
    bodenG = bodenG - 0.3;
    bodenB = bodenB - 0.3;
    
  //Flügel vorn
    stroke(150);
    strokeWeight(3);
    fill(0);
    arc(315,210,130,400,PI/2, PI);
   
  //Schwanz
    noStroke();
    fill(0);
    quad(440,290,520,310,540,280,510,270);
    
    noStroke();
    fill(0);
    quad(440,305,530,300,550,320,520,330);
    
    noStroke();
    fill(0);
    quad(440,315,520,330,530,355,490,360);
 
  //Körper
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(340,280,240,220);
    
    noStroke();
    fill(200);
    ellipseMode(CENTER);
    ellipse(300,310,120,130);
    //drehen?
    
  //Beine
    noStroke();
    fill(255,243,109);
    ellipseMode(CENTER);
    ellipse(380,380,15,15);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(380,380,420,470);
    
    noStroke();
    fill(255,243,109);
    ellipseMode(CENTER);
    ellipse(420,470,15,15);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(420,470,380,560);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(380,560,420,560);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(380,560,320,560);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(380,560,330,570);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(380,560,330,550);
  
    // zweites Bein
    noStroke();
    fill(255,243,109);
    ellipseMode(CENTER);
    ellipse(330,390,15,15);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(330,390,340,460);
    
    noStroke();
    fill(255,243,109);
    ellipseMode(CENTER);
    ellipse(340,460,15,15);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(340,460,310,550);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(310,550,345,550);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(310,550,255,555);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(310,550,270,565);
    
    stroke(255,243,109);
    strokeWeight(6);
    fill(255,243,109);
    line(310,550,265,545);
    
  //Kopf
    float kopfX = 300;
    float kopfY = 160;
    kopfX = kopfX + random(-20,20);
    
    float schnabelX = kopfX - 50;
    float schnabely = kopfY - 10;
    
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(kopfX,kopfY,160,120);
    
    //Augen
    stroke(150);
    strokeWeight(3);
    fill(0);
    ellipseMode(CENTER);
    ellipse(kopfX,kopfY-10,15,15);
    
    stroke(150);
    strokeWeight(3);
    fill(0);
    ellipseMode(CENTER);
    ellipse(kopfX-70,kopfY-10,15,15);
    
    //Schnabel
    noStroke();
    fill(208,169,101);
    quad(schnabelX, schnabely, schnabelX+50, schnabely+20, schnabelX+30, schnabely+50, schnabelX-30, schnabely+25);
    
    noStroke();
    fill(255,243,109);
    quad(schnabelX, schnabely+10, schnabelX+40, schnabely+25, schnabelX+30, schnabely+50, schnabelX-90, schnabely+65);
  
  //Flügel vorn
    stroke(150);
    strokeWeight(3);
    fill(0);
    translate(390,210);  
    rotate(radians(340));
    arc(0,0,130,400,PI/2, PI);
}


void keyPressed(){
  sonne = 0;
  sonneX = 185;
  sonneY = 510;
  sonneSize = 150;
  
  bodenR = 185;
  bodenG = 164;
  bodenB = 109;
  
  himmelR = 187;
  himmelB = 230;
}

