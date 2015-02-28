


char keyP;
//---------------ImageOriginal
PImage info1, info2, mainPhoto, photoeyes, printedPic, dumbPic;
float x, y;

//----------------colorEye()
PShape eyes;
color c = 255;
int h = 0;
int s = 0;

void setup(){
  size (600, 800);
  smooth();
  colorMode(HSB);
  background(255);

  //----------------ImageOriginal
  info1 = loadImage("info1.JPG");
  info2 = loadImage("info2.JPG");
  mainPhoto = loadImage("mainwork.JPG");
  photoeyes = loadImage("photoeyes.JPG");
  printedPic = loadImage("printedpicture.jpg");
  dumbPic = loadImage("dumbpic.JPG");
  x = 0;
  y = height/3;
  key = 'm';

  //----------------colorEye()
  eyes = loadShape("MoMAeyes 3.svg");



}

void draw(){

  if (key == 'c')
    keyP = 'c';

  originalPiece();

  if (keyP == 'c')
    colorEye();

}

void originalPiece (){
  background(255);
  image(info1, x, y);
  image(info2, x+400, y-400);
  image(mainPhoto, x+400, y-100);
  image(photoeyes, x+400, y-1700);
  image(printedPic, x+1300, y-100);
  image(dumbPic, x+1300, y+500);




  
  //MOUSE
  if (mousePressed == true)
{  
    if ((mouseY < height/3) && (mousePressed == true)) {
      y += 10;
    }
    else if ((mouseY > height*.75) && (mousePressed == true)){
      y -= 10;
    }
    if ((mouseX > width*.75) && (mousePressed == true)) {
      x -= 10;
    }
    else if ((mouseX < width/3) && (mousePressed == true)) {
      x += 10;
    }
}

}

void colorEye(){
  background(c);
  noStroke();
  fill((h+180)%360, s, 360);
  ellipse(243, 285, 268, 150);
  shape(eyes, 0, 0, width, height);
  c = color(h, s, 360);

  if (mousePressed == true){
    h+=5;
    if (s < 360)
      s += 5;
    else
      s = 360;
  }

  if (h > 360)
    h = 0;



  if (key == '1'){
    h = 160;
    s = 360;
    key = ' ';
  }
  else if(key == '2'){
    h = 200;
    s = 360;
    key = ' ';
  }
  else if (key == '3'){
    h = 270;
    s = 360;
    key = ' ';
  }
  else if (key == '4'){
    h = 45;
    s = 360;
    key = ' ';
  }
  else if (key == '5'){
    h = 85;
    s = 360;
    key = ' ';
  }
  if (key == 'w'){
  s = 0;
  key = ' ';
  }
  
  if (key == 'm'){
  keyP = 'm';
  key = ' ';
  }


}





