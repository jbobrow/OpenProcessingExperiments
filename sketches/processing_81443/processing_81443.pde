
PImage img2;
PImage img4;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;


void setup(){

  img2 = loadImage  ("2.png");
  img4 = loadImage ("icon_palme.png");
  img9 = loadImage ("9.png");
  img10 = loadImage ("10.png");
  img11 = loadImage ("11.png");
  img12 = loadImage ("12.png");
  img13 = loadImage ("Strohhalm.png");
  img14 = loadImage ("Strohhalmklein.png");
  img15 = loadImage ("Sonne.png"); 
  img16 = loadImage ("palme_rechts.png");  
size(600,600);
frameRate(1);
smooth();
}

void draw(){
background(0);
// rectMode(CENTER);


for(int i = 0; i<60;i++){

pushMatrix(); //um befehle zu begrenzen!!
translate(width/2,height/2);
rotate(radians(360/60*i));
rotate(radians(360/60*second()));
fill(255);


if(i%5==0){
image (img2,-50,150,75,100);
image (img9,10,180,75,100);
image (img10,50,200,75,100);
image (img12,-20,240,75,100);
image (img11,80,230,75,100);
image (img16,-10,320,200,150);
image (img16,40,320,200,150);
image (img16,-60,320,180,100);
image (img16,80,320,180,100);
}
else{
fill(random(0),random(255),random(0));
rect(0,150,6,30);
}

popMatrix();
}

//sekundenzeiger
pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*second()));
fill(random(255),random(255),random(255));

ellipse(130,0,20,20);
popMatrix();


//minute
pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*minute())+PI);
fill(200);
//rect(0,-2,130,4);
image(img13,-25,15,50,128);
fill(255);
image(img15,-30,-30,60,60);
popMatrix();

//stunde
pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*hour())+QUARTER_PI);
fill(200);
image(img14,-25,-2,50,128);
fill(255);
image(img15,-30,-30,60,60);
popMatrix();

}


