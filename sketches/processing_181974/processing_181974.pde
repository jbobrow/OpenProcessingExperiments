
float xUfo1;
float yUfo1= 0;
float xUfo2;
float yUfo2=0;
float xUfo3;
float yUfo3= 0;
float xUfo4;
float yUfo4= 0;
float xUfo5;
float yUfo5 = 0;
float snelheidUfo;
int score = 0;

PImage lucht;
PImage steen;
PImage ufo;
PImage UfoVerovering;
PImage Aliens;


void setup () {

 size (1100, 700);

 lucht = loadImage("Hemel.jpg");
 steen = loadImage("Steen.jpg");
 ufo = loadImage("Ufo.png");
 UfoVerovering = loadImage ("UfoVerovering.jpg");
 Aliens = loadImage ("Aliens.png");
// startsnelheid

 snelheidUfo= 0.021;

// de x-positie van de ufo's zijn willekeurig

 xUfo1 = random (70, 1030); 
 xUfo2 = random (70, 1030); 
 xUfo3 = random (70, 1030); 
 xUfo4 = random (70, 1030); 
 xUfo5 = random (70, 1030); 


}

void draw () { 
  
  
  // de ufo zullen steeds sneller gaan
  
  snelheidUfo= snelheidUfo + 0.003;
  
  // de achtergrond, het platform en het kanon verschijnen in beeld
  
  imageMode (CENTER); image(lucht, 550, 350, 1100, 700);
  imageMode (CENTER); image(steen, mouseX,690, 400, 20);
  stroke (0); fill (50); rectMode (CENTER); rect (mouseX,667,8,26);
   
   // de ufo's komen in beeld
   
  imageMode (CENTER); image(ufo, xUfo1, yUfo1 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo2, yUfo2 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo3, yUfo3 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo4, yUfo4 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo5, yUfo5 , 70, 38);
  
  
  // de ufo's kunnen naar beneden zweven
  
  yUfo1 = yUfo1  + snelheidUfo;
  yUfo2 = yUfo2  + snelheidUfo;
  yUfo3 = yUfo3  + snelheidUfo;
  yUfo4 = yUfo4  + snelheidUfo;
  yUfo5 =yUfo5 + snelheidUfo;
  
  // Als de ufo geraakt wordt, krijg je een punt en verschijnt de ufo ergens anders:
  
  if ((dist(xUfo1,yUfo1,mouseX,mouseY) <19) && (mousePressed == true)) {yUfo1= 0; xUfo1 = random (70, 1030); score ++;}
  if ((dist(xUfo2,yUfo2,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo2= 0; xUfo2 = random (70, 1030); score ++;}
  if ((dist(xUfo3,yUfo3,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo3= 0; xUfo3 = random (70, 1030); score ++;}
  if ((dist(xUfo4,yUfo4,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo4= 0; xUfo4 = random (70, 1030); score ++;}
  if ((dist(xUfo5,yUfo5,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo5= 0; xUfo5 = random (70, 1030); score ++;}
  
  //Niet valsspelen door muis ingedrukt houden & platform en kanon volgen de muis
  
  if (mousePressed == true){ imageMode (CENTER); image(lucht, 550, 350, 1100, 700);
      image(steen, mouseX,690, 400, 20);
      stroke (0); fill (50); rectMode (CENTER); rect (mouseX,667,8,26); }
  
  // de richting van je schot
  
  strokeWeight (3); stroke (255); line(mouseX,651, mouseX, mouseY+19); stroke (mouseX, mouseY, random(0,255)); line(mouseX-18,mouseY,mouseX+18, mouseY); line(mouseX,mouseY-18,mouseX, mouseY+18); 
  noFill ();  ellipse(mouseX, mouseY, 38, 38); ellipse (mouseX, mouseY, 20, 20);
  
  //dood gaan
  
  if  ((yUfo1 >750) || (yUfo2 >750) || (yUfo3 >750) || (yUfo4 >750) || (yUfo5 >750)) { imageMode (CENTER); image (UfoVerovering, 550, 350, 1100, 700); textAlign(CENTER, CENTER); textSize (29);
       text("Aliens: Well done! We've captured the earth, thanks to you!", 550, 30); text("Do you want to battle us again? Press enter!", 550,65);  } 
  
  // score bijhouden
  
  fill (255); textSize (20);textAlign (CENTER); text("Score:" + score, 65, 40); 
  
  // beginscherm
  
  if (key == ENTER == false) {background (0); textAlign (CENTER); textSize (17); text("Hello, we're the aliens. We're going to capture you world. You can try to kill us, but we all know you can't win!", 550, 40);    
      textSize (34); textAlign (CENTER); text("PRESS ENTER TO START", 550, 590); textSize (20); text("and kill the aliens by clicking", 550, 650);imageMode (CENTER); image (Aliens, 550, 300, 325, 290); }
      
}

  //Hiermee kan het spel opnieuw staren
  
void keyPressed(){
  if(key==ENTER){
    yUfo1 =0;
    yUfo2 =0;
    yUfo3 =0;
    yUfo4 =0;
    yUfo5 =0;
  size (1100, 700);
  lucht = loadImage("Hemel.jpg");
  steen = loadImage("Steen.jpg");
  ufo = loadImage("Ufo.png");
  UfoVerovering = loadImage ("UfoVerovering.jpg");
  snelheidUfo= 0.021;
  xUfo1 = random (70, 1030); 
  xUfo2 = random (70, 1030); 
  xUfo3 = random (70, 1030); 
  xUfo4 = random (70, 1030); 
  xUfo5 = random (70, 1030); 
  snelheidUfo= snelheidUfo + 0.003;
  imageMode (CENTER); image(lucht, 550, 350, 1100, 700);
  imageMode (CENTER); image(steen, mouseX,690, 400, 20);
  stroke (0); fill (50); rectMode (CENTER); rect (mouseX,667,8,26);
  imageMode (CENTER); image(ufo, xUfo1, yUfo1 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo2, yUfo2 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo3, yUfo3 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo4, yUfo4 , 70, 38);
  imageMode (CENTER); image(ufo, xUfo5, yUfo5 , 70, 38);
   yUfo1 = yUfo1  + snelheidUfo;
   yUfo2 = yUfo2  + snelheidUfo;
   yUfo3 = yUfo3  + snelheidUfo;
   yUfo4 = yUfo4  + snelheidUfo;
   yUfo5 =yUfo5 + snelheidUfo;
   if ((dist(xUfo1,yUfo1,mouseX,mouseY) <19) && (mousePressed == true)) {yUfo1= 0; xUfo1 = random (70, 1030);}
   if ((dist(xUfo2,yUfo2,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo2= 0; xUfo2 = random (70, 1030);}
   if ((dist(xUfo3,yUfo3,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo3= 0; xUfo3 = random (70, 1030);}
   if ((dist(xUfo4,yUfo4,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo4= 0; xUfo4 = random (70, 1030);}
   if ((dist(xUfo5,yUfo5,mouseX,mouseY) <38) && (mousePressed == true)) {yUfo5= 0; xUfo5 = random (70, 1030);}
   if (mousePressed == true){ imageMode (CENTER); image(lucht, 550, 350, 1100, 700);
   imageMode (CENTER); image(steen, mouseX,690, 400, 20);
   stroke (0); fill (50); rectMode (CENTER); rect (mouseX,667,8,26); }
   strokeWeight (3);  line(mouseX,651, mouseX, mouseY+19); stroke (mouseX, mouseY, random(0, 255)); line(mouseX-18,mouseY,mouseX+18, mouseY); line(mouseX,mouseY-18,mouseX, mouseY+18); 
   noFill ();  ellipse(mouseX, mouseY, 38, 38); ellipse (mouseX, mouseY, 20, 20);
   if  ((yUfo1 >750) || (yUfo2 >750) || (yUfo3 >750) || (yUfo4 >750) || (yUfo5 >750)) { imageMode (CENTER); image (UfoVerovering, 550, 350, 1100, 700); textAlign(CENTER, CENTER); textSize (29);
    text("Aliens: Well done! We've captured the earth, thanks to you!", 550, 30); text("Do you want to battle us again? Press enter!", 550,65);  } 
   fill (255); textSize (20); textAlign (CENTER);text("Score:" + score, 65, 40); 
   score =0;
 
 } 
   
 }
 
     




