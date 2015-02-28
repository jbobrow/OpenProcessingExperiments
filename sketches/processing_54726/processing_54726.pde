
int x = 5;
float b = 400;
PFont myfont;

void setup(){
  size(800,800);
  myfont = loadFont("Impact-48.vlw");
}

void draw(){
  if(frameCount < 1) return;
  fill(0,0,0,10);
  rect(0,0,800,800);
  noStroke();
      
  textFont(myfont);
  textSize(500);
  fill(255,255,255,80);
  text("RISD",10,300);
  text("COLLEGE HILL",100,900);
  
  textFont(myfont);
  textSize(50);
  fill(255,3,7,75);
  text("WATERMAN STREET",350,b);
  
  textFont(myfont);
  textSize(50);
  fill(100,80,35,10);
  text("BENEFIT STREET",150,100);
  text("ANGEL STREET",20,40);
  text("HOPE STREET",700,500);
  textFont(myfont);
  textSize(50);
  fill(82,118,41,20);
  text("THAYER STREET",500,700);
  text("SOUTH MAIN STREET",100,600);
  
  textFont(myfont);
  textSize(120);
  fill(41,113,113,40);
  text("CANAL STREET",80,220);
  text("MEETING STREET",5,600);
  text("WICKENDEN STREET",300,440);
  text("GEORGE STREET",70,60);
  text("KENNEDY PLAZA",100,100);
  
  textFont(myfont);
  textSize(140);
  fill(41,90,113,47);
  text("PARKING GARAGE",10,660);
  text("STOP",300,700);
  text("RISD STORE",50,500);
  
  textFont(myfont);
  textSize(230);
  fill(185,182,182,10);
  text("3D STORE",150,700);
  text("CHASE CENTRE",50,400);
  text("PROVIDENCE PLACE",400,200);
  text("FEDERAL HILL",300,300);
  text("WESTMINSTER",200,550);
}


