
//en klocka där h, m, s representeras av en arc

void setup(){
  size(600, 600);
smooth();
//noFill();
noStroke();
}

void draw(){
 background(191);
 klocka();

}

void klocka() {
  float h = hour();//hour();
float m = minute();
float s = second();

//sekundvisare
fill(64);
float varvS = map(s, 0, 60, 0, 360);
varvS = radians(varvS);
if (s == 0){
 varvS = 360; 
}
arc(width/2, height/2, (height/2)*1.4, (height/2)*1.4, TWO_PI - HALF_PI, (TWO_PI - HALF_PI)+varvS);


//minutvisare
fill(128);
float varvM = map(m, 0, 60, 0, 360);
varvM = radians(varvM);
if (m == 0){
 varvM = 360; 
}
arc(width/2, height/2, (height/2)*1.2, (height/2)*1.2, TWO_PI - HALF_PI, (TWO_PI - HALF_PI)+varvM);


//timvisare
fill(255);
if(h > 12){ //konverterar till 12timmars klocka
  h = h - 12;
}
float varvH = map(h, 0, 12, 0, 360);
varvH = radians(varvH);
if (h == 0){
 varvH = 360; 
}
arc(width/2, height/2, height/2, height/2, TWO_PI - HALF_PI, (TWO_PI - HALF_PI)+varvH);
}



