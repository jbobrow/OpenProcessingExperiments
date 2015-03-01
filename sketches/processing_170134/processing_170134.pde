
int responsible = 270, caring = -440, drop = 0;
int da = 2, db = 2, dc = 2;
int clicked = 0;

void setup(){
  size(500, 500);
  ying_yang = loadImage("ying_yang.png");
  kaushan = createFont("KaushanScript-Regular.ttf");
  piano = loadImage("piano.jpg");
  ESRR = loadImage("ESRR.png");
  treble = loadImage("treble_cleff.gif");
  six = loadImage("sixteenth_notes.png");
  half = loadImage("half_note.png");
  eigth = loadImage("eight_note.png");
  
}

void draw(){
 
//background
  fill(#FFFFFF);
  noStroke();
  rect(0, 0, 500, 500);
  
//ying yang background
  ying_yang.resize(500, 500);
 tint(255, 126);
  image(ying_yang, 0, 0);
  
//Triangles
  strokeWeight(2);
  stroke(#000000);
  noFill();
  triangle(248, 80, 80, 440, 410, 440);

//triangle 2
  strokeWeight(2);
  stroke(#000000);
  noFill();
  triangle(248, 10, 20, 480, 470, 480);
  
//Base of the triangle text
  textSize(25);
  fill(#000000);
  text("Joseph Walker  Joe  Skyrunner", 70, 470);
  
//Left side of the triangle text
  rotate(radians(-65));
  translate(-90, 350);
  fill(random(255), 0, 0);
  text("Dread Locks", -275, -100);
  text("Black/Mix", 20 , -100);
  text("Hazel Eyes", -120, -100);
  
//Right side of the triangle text
  rotate(radians(130));
  translate(-205, -90);
  fill(0, 0, random(255));
  text("Musician/Actor", 50, 50);
  text("Programmer", 220 ,50);
  text("Christian", 360, 50);

//Responsible 
  rotate(radians(-15));
  responsible = responsible + da;
    if(responsible < 100){
    da = 2;
  }
    if(responsible > 270){
    da = -2;
  }
  //textFont(kaushan);
  fill(random(255), random(255), random(255));
  text("Responsible", responsible, 190);

//Caring
  rotate(radians(-100));
  caring = caring + db;
  if(caring > -210){
    db = -2;
  }
  if(caring < -440){
    db = 2;
  }
  text("Caring", caring, 150);
  
//Friendlly
  rotate(radians(50));
  text("Friendly", -70, 400);
  
//Who am I?
  fill(#000000);
  translate(-270, 30);
  text("Who am I?", mouseX, mouseY);

//I am a musician
  if(keyPressed){
    if(key == 'a' || key == 'A'){
      
      //piano
        piano.resize(500, 500);
        noTint();
        translate( -4, -36);
        image(piano, 0, 0);
        
      //I'm a classical pianist
        fill(#FFFFFF);
        text("I'm a classical pianist", 0, 50);
    }
  }

//I live for the drop
  if(keyPressed){
    if(key == 'b' || key == 'B'){
      
      //Eat. Sleep. Rave. Repeat.
        noTint();
        translate( -4, -36);
        ESRR.resize(500, 500);
        image(ESRR, 0, 0);
      
      //I live for the drop.
        if(drop < 0){
          dc = 2;
        }
        if(drop > width - 287){
          dc = -2;
        }
        drop = drop + dc;
        fill(#FFFFFF);
        text("But I also live for the drop!", drop, 450 );

    }
  }
}


