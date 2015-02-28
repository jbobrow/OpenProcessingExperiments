


//homework 12 rwandrew
//copyright russell andrews 2012

//data taken from http://acharts.us/performer/beyonce

int [] weeks = {86, 300, 254, 107, 27, 203, 20, 217, 215, 20, 375, 28,
                118, 363, 18, 22, 7, 6, 506, 407, 54, 667, 2, 430, 65, 
                6, 89, 541, 23, 35, 10, 193, 6, 249, 1, 6, 1, 76, 38, 40};
                
int [] peak = {4, 1, 1, 4, 13, 3, 57, 1, 1, 11, 1, 14, 1, 45, 12, 18, 
               18, 1, 1, 1, 19, 1, 67, 1, 8, 5, 1, 4, 26, 18, 25, 9, 
               46, 25, 62, 42, 48, 13, 28, 35};
               
String [] songs = {"Bonnie and Clyde", "Crazy in Love", "Baby Boy",
                 "Me Myself and I", "Fighting Temptation", "Naughty Girl",
                 "Dangerously In Love", "Check on It", "Deja Vu", "Ring the Alarm",
                 "Irreplaceable", "Upgrade U", "Listen", "Beautiful Liar",
                 "Love in the Club Part II", "Get Me Bodied", "Green Light", 
                 "Green Light(Remix)", "If I Were a Boy", "Single Ladies",
                 "Diva", "Halo", "At Last", "Sweet Dreams", "Ego", "Radio",
                 "Broken-Hearted Girl", "Telephone", "Videophone",
                 "Put it in a Love Song", "Why Don't You Love Me?",
                 "Run the World (Girls)", "1+1", "Best Thing I Never Had",
                 "End of Time", "I Was Here", "Lift Off", "Love on Top", "Party",
                 "Countdown"};
PImage background;

PImage [] albums;
               
float x, y;

float topEdge, bottomEdge, rightEdge, leftEdge;

float dia[];

color orange, lightblue, lightgray, darkgray;



PFont bodoni;

void setup(){
  size(880, 572);
  smooth();
  topEdge = 50;
  bottomEdge = height-85;
  rightEdge = width - 50;
  leftEdge = 75;
  orange = color(250, 105, 0);
  lightblue = color(74, 181, 187);
  lightgray = color(#aaaaaa);
  darkgray = color(50);
  dia = new float[40];
  
  albums = new PImage[40];
  
 
  
  bodoni = loadFont("bodoni.vlw");
  
  background = loadImage("background.jpg");
  
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
}

void draw(){
  prepScreen();
  drawCircle();
  growCircle();
  typeTitle();
  drawAxis();
}

void prepScreen(){
  noStroke();
  image(background, width/2, height/2);
  fill(255,50);
  rect(width/2, height/2, width, height);
}

void drawCircle(){
  for(int i = 0; i < weeks.length; i++){
  float x = map(i, 0, weeks.length, leftEdge, rightEdge);
  float y = map(weeks[i], max(weeks), min(weeks), topEdge, bottomEdge);
  noStroke();
  fill(orange);
  ellipse(x, y, dia[i], dia[i]);
  }
}

void growCircle(){
  for(int i = 0; i < weeks.length; i++){
    float x = map(i, 0, weeks.length, leftEdge, rightEdge);
    float y = map(weeks[i], max(weeks), min(weeks), topEdge, bottomEdge);
  if(dist(mouseX, mouseY, x, y) <= 15/2){  
    dia[i] = dia[i] + 4;
 
    albums[i] = loadImage(i + ".png");
    
    image(albums[i], x, y, dia[i]*.85, dia[i]*.85);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(bodoni, 26);
    String speak = nf(peak[i], 1);
    text("#"+peak[i], x, y);
    textSize(14);
    if(y > 500){ 
    fill(darkgray);} else{fill(darkgray);}
    textAlign(CENTER);
    text("\"" + songs[i] + "\"", x, y+65);
    String sweeks = nf(weeks[i], 1);
    text(weeks[i] + " weeks", x, y+85);
  }else{
    dia[i] = dia[i] - 4;
  }
  if(dia[i] > 100){
    dia[i] = 100;
  }
  if(dia[i] < 12){
    dia[i] = 12;
  }
  }
}

void typeTitle(){
  textFont(bodoni, 38);
  textAlign(LEFT);
  fill(orange);
  text("Mapping\nBeyoncé's Success.", 40, 65);
  textSize(22);
  fill(lightblue);
  text("Number of weeks spent\non the billboard charts\nand peak position.", 40, 160);
}

void drawAxis(){
  stroke(#cccccc);
  strokeWeight(1);
  line(rightEdge+20, topEdge-20, rightEdge+20, bottomEdge+20);
  line(leftEdge-20, bottomEdge+20, rightEdge+20, bottomEdge+20);
  fill(orange);
  text("2003", leftEdge-30, bottomEdge + 45);
  text("2012", rightEdge - 30, bottomEdge + 45);
}


