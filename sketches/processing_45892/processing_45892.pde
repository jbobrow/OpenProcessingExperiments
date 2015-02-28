





import processing.video.*;



Movie movie;





PImage after, before, hiro1, hiro2,afga1,afga2,ww1,ww12,father,father2,fin;


int x=0;
int y=0;


int drop=0;
int space= 0;

int drop2=0;
int space2=0;

int drop3=0;
int space3=0;

int drop4=0;
int space4=0;

int drop5=0;
int space5=0;

void setup() {

  frameRate(300);

 loop();


ww1=loadImage("ww1.jpg");
ww1.loadPixels();

ww12=loadImage("ww12.jpg");
ww12.loadPixels();

fin=loadImage("fin.jpg");
fin.loadPixels();

father=loadImage("father.jpg");
father.loadPixels();

father2=loadImage("father2.jpg");
father2.loadPixels();
  
before=loadImage("beirut1.jpg");
before.loadPixels();

hiro1=loadImage("hiro1.jpg");
hiro1.loadPixels();

hiro2=loadImage("hiro2.jpg");
hiro2.loadPixels();

after=loadImage("beirut2.jpg");
after.loadPixels();

afga1=loadImage("afga1.jpg");


afga2=loadImage("afga2.jpg");
afga2.loadPixels();
//after=loadImage("beirut2.jpg");
//after.loadPixels();

image(before,0,0);


//size(before.width,before.height);
//framerate(5);
size(253,340);
background(loadImage("beirut1.jpg"));
movie = new Movie (this, "memories.wav");
}


//location of source 






void draw(){


  
  


if (space>253) {
  
  
space=0;
drop=drop+5;

}

if (drop>340) {
  
  drop=0;
  
}


if (space2>253) {
  
  
space2=0;
drop2=drop2+5;

}

if (drop2>340) {
  
  drop2=0;
  
}

if (space3>253) {
  
  
space3=0;
drop3=drop3+5;

}

if (drop3>340) {
  
  drop3=0;
  
}


if (space4>253) {
  
  
space4=0;
drop4=drop4+5;

}

if (drop4>340) {
  
  drop4=0;
  
}

if (space5>253) {
  
  
space5=0;
drop5=drop5+5;

}

if (drop5>340) {
  
  drop5=0;
  
}




if(keyPressed) {
   
 if (key=='m' || key=='M'){
  
 image(before,0,0);
int halfImage = 0;
PImage myImage4 = loadImage("m.jpg");
image(myImage4, 0, 201);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, SOFT_LIGHT);
}
updatePixels();
 }

 
if (key== 'n' ||key== 'N'){
space5=space5+5;

copy(father2,space5, drop5, 5, 5, space5, drop5, 5, 5);


  }
 
  if (key == 'q' || key == 'Q') {
 space= space + 5; 

  copy(after,space, drop, 5, 5, space, drop, 5, 5);  
  
int halfImage = 0;
PImage myImage = loadImage("q.jpg");
image(myImage, 0, 0);


 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage, 0, 0, 33, 100, 67, 0, 33, 100, OVERLAY);



}
updatePixels();
  
}


if (key=='u' || key=='U'){
  
 image(hiro1,0,0);


int halfImage = 0;
PImage myImage2 = loadImage("u.jpg");
image(myImage2, 0, 21);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage2, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}

updatePixels();
}

if (key== 'a' ||key== 'A'){
space2=space2+5;

copy(hiro2,space2, drop2, 5, 5, space2, drop2, 5, 5);

int halfImage = 0;
PImage myImage3 = loadImage("a.jpg");
image(myImage3, 0, 41);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage3, 0, 0, 33, 100, 67, 0, 33, 100, HARD_LIGHT);
}

updatePixels();
}





if (key=='s' || key=='S'){
  
 image(afga1,0,0);

int halfImage = 0;
PImage myImage4 = loadImage("s.jpg");
image(myImage4, 0, 61);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, SOFT_LIGHT);
}
//for dupilicating letters!
image(myImage4, 0, 261);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, SOFT_LIGHT);
}

updatePixels();
}


if (key== 'i' ||key== 'I'){
space3=space3+5;

copy(afga2,space3, drop3, 5, 5, space3, drop3, 5, 5);

int halfImage = 0;
PImage myImage4 = loadImage("i.jpg");
image(myImage4, 0, 81);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, SOFT_LIGHT);
}
//for dupilicating letters!
image(myImage4, 0, 221);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, SOFT_LIGHT);
}

updatePixels();
}
  
  
  
  if (key=='e' || key=='E'){
  
 image(ww1,0,0);

int halfImage = 0;
PImage myImage4 = loadImage("e.jpg");
image(myImage4, 0, 101);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}
updatePixels();
  }

if (key== 'c' ||key== 'C'){
space4=space4+5;

copy(ww12,space4, drop4, 5, 5, space4, drop4, 5, 5);


int halfImage = 0;
PImage myImage4 = loadImage("c.jpg");
image(myImage4, 0, 121);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}
//for dupilicating letters!
image(myImage4, 0, 241);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}

updatePixels();
}


  if (key=='o' || key=='O'){
  
 image(father,0,0);


int halfImage = 0;
PImage myImage4 = loadImage("o.jpg");
image(myImage4, 0, 141);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}
//for dupilicating letters!
image(myImage4, 0, 181);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}

updatePixels();
}

if (key== 'n' ||key== 'N'){
space5=space5+5;

copy(father2,space5, drop5, 5, 5, space5, drop5, 5, 5);

int halfImage = 0;
PImage myImage4 = loadImage("n.jpg");
image(myImage4, 0, 161);
 loadPixels();
for (int i = 0; i < halfImage; i++) {
  pixels[i+halfImage] = pixels[i];
blend(myImage4, 0, 0, 33, 100, 67, 0, 33, 100, BURN);
}
updatePixels();
  }


}



}





void keyReleased() {
  if (key == 'q') {
    keyPressed = true;
    movie.stop();
    movie.play();
   movie = new Movie (this, "9.wav");
  }
  if (key == 'u') {
    keyPressed = true;
      movie = new Movie (this, "8.wav");
    movie.stop();
    movie.play();
  }
   if (key == 'a') {
    keyPressed = true;
     movie = new Movie (this, "7.wav");
   movie.stop();
    movie.play();
  } 
     if (key == 's') {
    keyPressed = true;
    movie = new Movie (this, "6.wav");
    movie.stop();
    movie.play();
} 
     if (key == 'i') {
    keyPressed = true;
   movie = new Movie (this, "5.wav");
   movie.stop();
    movie.play();
  } 
     if (key == 'm') {
    keyPressed = true;
 

   movie.stop();
    movie.play();  
} 


 if (key == 'e') {
    keyPressed = true;
movie = new Movie (this, "7.wav");
  movie.stop();
    movie.play();  
} 

     if (key == 'c') {
    keyPressed = true;
movie = new Movie (this, "3.wav");
  movie.stop();
    movie.play();  
} 
     if (key == 'o') {
    keyPressed = true;
 
 movie = new Movie (this, "2.wav");
  movie.stop();
    movie.play();
  } 
     if (key == 'n') {
    keyPressed = true;
  
  movie = new Movie (this, "1.wav");
   movie.stop();
    movie.play();  
} 




  }
void mousePressed(){
  
}



