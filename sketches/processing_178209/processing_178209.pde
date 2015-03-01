

//global variables: available colors, color specifier characters
//and the user defined color identifier
color[] colorPalette={#000000,#7A3910,#F2DA91,#FFFFFF};
char colorData[] = {'k','r','l','w'};
int userColor=0;
//images
PImage monalisa;
PImage chevron;
PImage dali;
PImage horseshoe;

//starting positions of the mustaches
float chevronX=0.;
float chevronY=0.;
float daliX=0.;
float daliY=54.;
float horseshoeX=0.;
float horseshoeY=130.;

//setup a screen with the Mona_Lisa2.jpg background, and load all the images
void setup() {
  size(600,894);
  monalisa = loadImage("Mona_Lisa.jpg");
  //mustaches
  chevron = loadImage("chevron_final.png");
  dali = loadImage("dali_final.png");
  horseshoe = loadImage("horseshoe_final.png");
  background(monalisa);
  //setup the menus
  setupMenu();

}

//setup the colormenu bar and mustache menu
void setupMenu() {
    //init values
    image(monalisa,0,0);
    image(chevron,chevronX,chevronY);
    image(dali,daliX,daliY);
    image(horseshoe,horseshoeX,horseshoeY);
    
    //color menu
    stroke(colorPalette[0]);
    strokeWeight(1);
    for(int i=0;i<4;i++) {
      fill(colorPalette[i]);
      rect(400+i*30,0,30,30);
      fill(#FFFFFF);
      if(i==3) fill(#000000);
      textSize(20);
      text(colorData[i],400+i*30+10,20);
    }
    //set back the original user asked color
    stroke(colorPalette[userColor]);

}

//the draw function is simple drawing a continous line while the mouse is pressed
// and the choice for picking a mustache
void draw() {
  
  strokeWeight(3);
  stroke(colorPalette[userColor]);
  // actions taken when mouse is pressed
    if(mousePressed){
       if(mouseX>0 && mouseX<120 && mouseY>0 && mouseY<54) {
         image(chevron,200,255);       //setting the image on Mona Lisa
      }
       else if(mouseX>0 && mouseX<250 && mouseY>54 && mouseY<130){
         image(dali,162,227);          //setting the image on Mona Lisa
       }
       else if(mouseX>0 && mouseX<100 && mouseY>130 && mouseY<200){
         image(horseshoe,215,255);     //setting the image on Mona Lisa
       }
      else {line(mouseX,mouseY,pmouseX,pmouseY);}    //everywhere else draw a line
    }
}

//defining the available functionality
//backspace and delete erases the screen
//k,r,l,w changes the color respectively to 
//black, brown, blonde and white
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) {
    setup();
    setupMenu();
  }
  if (key == 'k' || key=='K') userColor=0;
  if (key == 'r' || key=='R') userColor=1;
  if (key == 'l' || key=='L') userColor=2;
  if (key == 'w' || key=='W') userColor=3;
}

