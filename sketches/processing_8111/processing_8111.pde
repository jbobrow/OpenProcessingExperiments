
int [] waarden = new int[10];
int r;
int g;
int b;
int a;
int c;


void setup() {
  size(500, 500);
  smooth();
  noLoop();
  for(int i=0; i<10; i++)
  { waarden[i]=100*int(random(0,5));
  } 
}

void draw() {
  background(255);
  // i=i+1 ==  i++
  for(int i=0;i<10; i++)
  {//println(i);
    
    int xpositie = 100*int(random(0,5)); //i*100;
    //int ypositie = 100*int(random(0,5)); //0;
    //int ypositie = 100;
    
    //int xpositie = waarden[i];
    int ypositie = waarden[i];
    
    /*if(i>4) 
  { xpositie = (i-5)*100;
    ypositie = waarden [i];
  }*/
    fill (a,b,c);
    //beine
    stroke(0);
    strokeWeight(2);
    line(mouseX-10,mouseY+2,pmouseX-10,pmouseY+20);
    line(mouseX+10,mouseY+13,pmouseX+10,pmouseY+25);
    line(mouseX+50,mouseY+13,pmouseX+50,pmouseY+25);
    line(mouseX+60,mouseY+10,pmouseX+60,pmouseY+25);
    //schwanz
    line(mouseX+70,mouseY-10,mouseX+100,mouseY+20);
    //körper
    strokeWeight(1);
    ellipse(pmouseX+30,pmouseY-10,100,50);
    //ohr hinten
    ellipse(pmouseX-20,pmouseY-30,40,50);
    //nase
    triangle(pmouseX-60,pmouseY-20,pmouseX-40,pmouseY-30,pmouseX-40, pmouseY-10);
    //kopf
    ellipse(pmouseX-20,pmouseY-20,50,40);
   //ohr vorne
    ellipse(pmouseX,pmouseY-30,40,50);
    fill(255);
    ellipse(pmouseX-30,pmouseY-30,15,15);
    fill(255);
    ellipse(pmouseX-32,pmouseY-30,3,3);
    tekenOiliphant(xpositie, ypositie);
    //tekenMouse(mouseX,mouseY);
  }  
}

void mousePressed() {
  loop();
    a=int(random(100,255));
    c=int(random(100,255));
    r=int(random(0,255));
    g=int(random(0,255));
    b=int(random(0,255));
}

void mouseReleased() {
  noLoop();
}

void tekenOiliphant ( int x, int y) {
    //frameRate(3); // schnelligkeit zum wechseln
    stroke(1);  
    //beine
    fill(100);
    rect(x+30, y+52, 15, 30);
    rect(x+55, y+52, 15, 30);
    //körper
    fill(100);
    ellipse(x+50, y+52, 50, 50);
    //ohren
    fill(r,g,b);
    ellipse(x+40, y+40, 20, 30);
    ellipse(x+60, y+40, 20, 30);
    //kopf
    fill(200);
    ellipse(x+50, y+40, 25, 25);
    //augen
    fill(255);
    ellipse(x+45, y+35, 6, 6);
    ellipse(x+55, y+35, 6, 6);
    fill(0);
    ellipse(x+47, y+36, 2, 2);
    ellipse(x+54, y+36, 2, 2);
    //rüssel
    noStroke();
    fill(200);
    rect(x+47.5, y+40, 5, 25);
}

