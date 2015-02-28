

float sizeRandom;
float rando = 25;
int x = 0;


void setup(){
  size(1000,1000);
  translate(100,100);
  background(232,82,82);
  repeatShape();

}

void draw(){
}

void repeatShape(){
  noStroke();
  for (int i=0; i < 25; i++){
    rando = random(0,255);
    sizeRandom = random(25,80);
    photo();
    translate(200,0);
    x++;
    if (x == 5){
      x = 0;
      translate (-1000,200);
      
    }
  }
}

void photo(){
  
    fill(241,0,0);
    strokeWeight(2);
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(0,0,100,100);
    fill(170,250,243);
    ellipse(0,0,200,200);
    fill(0,0,0);
    ellipse(0,0,150,150);
    fill(170,250,243);
    ellipse(0,0,80,80);
    fill(0,0,0);
    ellipse(0,0,50,50);
    fill(170,250,243);
    ellipse(0,0,25,25);
    fill(0,0,0);
    ellipse(0,0,5,5);
    fill(170,250,243);
 
    ellipse(0,0,100,100);
    fill(255,239,157);
    ellipse(0,0,sizeRandom,sizeRandom);
    fill(0,0,0);
    ellipse(0,0,10,10);
       /*
    fill(0,24,232);

    triangle(0,55,-55,250,55,250);
    fill(255,226,180);
    ellipse(0,0,250,150);
    strokeWeight(3);
    stroke(255,255,255);
    fill(97,224,229);

    ellipse(-37.5,-30,30,30);
    ellipse(37.5,-30,30,30);
    noStroke();
    fill(0,0,0);
    ellipse(-37.5,-30,20,20);
    ellipse(37.5,-30,20,20);
    fill(255,255,255);
    ellipse(-34,-25,5,5);
    ellipse(40,-25,5,5);
    fill(229,97,122);
    arc(-8, 35, 60, 50, 0, PI+QUARTER_PI, CHORD);
    fill(17,0,219);
    rect(10, -70, 160, 30);
    ellipse(0,-120,150,110);
    ellipse(-56,-106,50,90);
    fill(225,226,180);
    noStroke();
    fill(240,189,196);
    ellipse(-90,10,44,44);
    ellipse(90,10,44,44);
    noStroke();
    fill(240,229,189);
    triangle(0,-20,-15,10,15,10);
    fill(0,0,0);
    ellipse(-5,5,3,5);
    ellipse(5,5,3,5); 
    */
  
}




