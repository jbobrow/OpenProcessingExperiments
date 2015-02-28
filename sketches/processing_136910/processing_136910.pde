
// Project Final
// For this project are used Mapuche music and
//photography of Mapuche chief


import ddf.minim.*;
Minim minim;
AudioPlayer mapuche3;

PImage mapuche;


void setup () {
  size (600,800);
  mapuche = loadImage ("mapuche.jpg");
  minim = new Minim (this);
  mapuche3 = minim.loadFile ("mapuche 3.wav");
  mapuche3.play ();
  
}

void draw () {
  image (mapuche,1,17);
 
 //By clicking the mouse on the picture, 
 //the program drew circles destellean imitating the rhythm of the music.

//These circles are varying in color and diameter.

// The circles mimic sound waves.


 
 if(mousePressed) {
    int size = int(random(350));
    float rojo = map(mouseX, 0, width, 100, 355);
    float azul = map(mouseY, 0, height, 100, 300);
    float verde = map(mouseX, 0, width, 100 , 355);
    strokeWeight(int(random(3)));
    stroke(rojo,verde,azul);
    noFill(); 
    line(width/2+((width/2)-pmouseX),pmouseY,width/2+((width/2)-mouseX),mouseY);
    ellipse(pmouseX,height/2+((height/2)-pmouseY),size,size);
    noStroke();
    fill(rojo,verde,azul,120);
    ellipse(mouseX, mouseY, size, size);
    
  }   
}

//Holding down (without releasing) the letter "W" capitalized or miniscula, 
//the program will write information of the image and a few lines of the song.

void keyPressed(){
if (key == 'w' || key == 'W') {
    fill (#FA0303);
    stroke (20);
    textSize (12);
    text ("LONGKO or chief, with traditional dress", 350,60);
    text ("1895", 350,80);
    text ("photographer Heffer Bissett, Odber", 350, 100);
    textSize (20);
    text ("MAPUCEGEN, Mapuche are", 150,220);
    text ("RANGIÑ TVWUN, half origin", 150,250);
    text ("RANGIÑ KWPALME, half lineage", 150,280);
     
    
  }
}


