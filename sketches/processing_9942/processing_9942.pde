
int card = 0;
PFont font;
PImage arrow;
PImage wolf;
PImage redhood;
PImage fonty;
PImage twofriends;
PImage fonty2;
PImage texty;
PImage veg;
PImage race;
PImage redbed;
PImage dessert;
PImage pet;
PImage eat;
PImage creepy;
PImage yikes;
PImage last;
PImage petty;
void setup () {
  size(640,480);
  smooth();
  font= loadFont ("LucidaBlackletter-90.vlw");
  textFont(font);
  arrow= loadImage("arrow.png");
  wolf= loadImage("23.png");
  redhood= loadImage("13.png");
  fonty= loadImage("3.png");
  twofriends= loadImage("5.png");
  fonty2= loadImage ("44.png");
  texty= loadImage ("7.png");
  veg= loadImage ("26.png");
  race= loadImage("8.png");
  redbed= loadImage("9.png");
  dessert= loadImage("88.png");
  pet= loadImage("73.png");
  eat= loadImage("39.png");
  creepy= loadImage("11.png");
  yikes= loadImage("12.png");
  last= loadImage ("10.png");
  petty= loadImage("27.png");
  

}

void draw() {
  background(255);
  println(card);
  if (card == 0) {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }

    fill(0);
    textSize(50);
    text("Once Upon A Time...",71,200);
    image (arrow,212,266);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 336;
      int bottom = 356;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 2;
      }
    }
  } // end card 0

  else if (card == 2) {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    textSize(48);
    text ("wait, are you hungry?",98,122);
    text ("YES", 90,284);
    text ("NO", 408,284);
    if (mousePressed) {
      int left=80;
      int right=235;
      int top = 211;
      int bottom= 281;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 23;
      }

      left= 408;
      right = 529;
      top =217;
      bottom= 281;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 13;
      } 
    }
  } // end card 2

  else if (card == 23) {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(wolf, 0,0);
    textSize(90);
    text ("Yes??", 155,168);
    textSize(48);
    text ("you are wolf!",116,228);

    image (arrow,212,266);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 336;
      int bottom = 356;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 3;
      }
    }

  }

  else if (card==13) {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(redhood,0,0);
    textSize(90);
    text("No??", 57,122);
    textSize(48);
    text("you are little red",61,182);
    text("ridinghood!",114,241);

    image (arrow,212,266);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 336;
      int bottom = 356;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 33;
      }
    }
  }



  else if (card==3){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(fonty,0,0);
    image (arrow,212,290);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 353;
      int bottom = 370;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 4;
      }
    }
  }


  else if (card==33){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(fonty,0,0);
    image (arrow,212,290);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 353;
      int bottom = 370;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 44;
      }
    }
  }



  else if (card==4){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(twofriends,0,0);
    image(fonty2,0,-100);


    image (arrow,212,270);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 340;
      int bottom = 360;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 6;
      }
    }

  }
  else if (card==44){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(twofriends,0,0);
    image(fonty2,0,-100);


    image (arrow,212,270);
    if (mousePressed){
      int left=235;
      int right= 393;
      int top = 340;
      int bottom = 360;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 77;

      }

    }
  }

  else if (card==6) {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(veg,0,0);
    if(mousePressed){
      int left=399;
      int right=492;
      int top=42;
      int bottom=142;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 7;
      }
    }
    if(mousePressed){
      int left=440;
      int right=519;
      int top=168;
      int bottom=323;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 27;
      }
    }

  }

  else if (card==7){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(texty,0,0);
    image (arrow,453,355);
    if (mousePressed){
      int left=400;
      int right= 622;
      int top = 410;
      int bottom = 440;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 88;

      }
    }

  }
  else if (card==88){
      background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
     
    }
    image (dessert,0,0);
    if (mousePressed){
      int left=12;
      int right=310;
      int top= 170;
      int bottom= 215;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
      }
    }
    if (mousePressed){
      int left= 492;
      int right= 596;
      int top= 166;
      int bottom= 209;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 39;
      }
    }
  }
  else if (card==73){
      background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image (pet,0,0);
    if (mousePressed){
      int left=437;
      int right= 607;
      int top= 264;
      int bottom= 299;
    if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
    }
    }
  }
  else if (card==11){
  background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(creepy,0,0);
    if (mousePressed){
      int left=39;
      int right=200;
      int top= 428;
      int bottom= 463;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
    }
    }
  }
  else if (card==12){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image (yikes,0,0);
    if (mousePressed){
      int left= 39;
      int right= 200;
      int top= 398;
      int bottom= 438;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
      }
    }
  }
    
      
  else if (card==39){
background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image (eat,0,0);
    if (mousePressed){
      int left=75;
      int right=235;
      int top= 194;
      int bottom=225;
     if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
     }
    }
  }
  else if (card==77){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(texty,0,0);
    image (arrow,453,355);
    if (mousePressed){
      int left=400;
      int right= 622;
      int top = 410;
      int bottom = 440;

      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 8;
      }
    }
  }

  else if (card==8){
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(race,0,0);
    if (mousePressed){
      int left=55;
      int right=190;
      int top=228;
      int bottom=288;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 9;
      }
    }

    if (mousePressed){
      int left=475;
      int right=574;
      int top=234;
      int bottom=282;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 10;
      }   
    }
  }
  
  else if (card==27){
     background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(petty,0,0);
    if (mousePressed){
      int left= 440;
      int right=604;
      int top= 263;
      int bottom= 303;
        if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
      }
    }
  } 
    
    
  
  else if (card==10){
       background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(last,0,0);
    if (mousePressed){
      int left= 492;
      int right=592;
      int top= 408;
      int bottom= 447;
        if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 0;
      }
    }
  } 

  else if (card==9)   {
    background(198,22,22);
    for (float i =0; i<height; i++){
      color r = color(198,22,22);
      color w = color(250,25,82);
      color c = lerpColor(r, w, i/width);
      stroke(c);
      line(0, i, width, i);
    }
    image(redbed,0,0);
    if (mousePressed){
      int left= 57;
      int right= 251;
      int top= 268;
      int bottom=327;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 11;
      }
    }

    if (mousePressed){
      int left=320;
      int right=429;
      int top=269;
      int bottom=319;
      if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 12;
      }
    }

  } 
}



