
void setup () {
    size(500, 500);
    smooth();
    frameRate(5);
}

void draw() {
    background(12, 50, 130);
    
    //mit dieser for Schleife würden die Delphine immer die selbe Farbe haben
//    for (int i = 70; i <= 200; i = i + 15) {
//        color mycolor = color(random(0,12), random(-50,120), random(i,255));
//        fill( mycolor );
//    }

    //fill( 12, 50, 130 + random(-10, 10) );
    dolphin(20, 50);    
    //fill( 12, 50, 130 + random(-10, 10) );
    dolphin(100, 100);  
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(350, 280);
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(200, 250);
    //fill( 12, 50, 130 + random(-10, 10) );      
    dolphin(270, 70);
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(60, 320);  
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(280, 420);
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(420, 220);
    //fill( 12, 50, 130 + random(-10, 10) );  
    dolphin(380, -10);
}



void dolphin(int x, int y) {  //meine eigene Funktion
    pushMatrix();
    translate(x, y);
    
    //hier platziert hat jeder Delphine eine andere Farbe!
    for (int i = 70; i <= 200; i = i + 15) {
      fill(random(-10,10), random(-50,i/2), 130 +random(-10,i)); // random farbe
    }
    noStroke();

    //wenn Maus gedrückt kleine Flosse zeichnen
    if (mousePressed) {
        //fill(0,116,255); // ersetzt durch fill(blue); s.o.
        ellipse(50,50,45,110); //body
        ellipse(50,0,13,50); //mouth
        arc(50,60,70,70,PI,TWO_PI); //two vertical fins
       
        //Flosse hinten wird kleiner
        ellipse(50,110,10,40); //flipper small part
        arc(50,133,28,60,PI,TWO_PI); //flipper middle part
       
        //links oben
        beginShape();
        vertex(54,110);
        bezierVertex(35,110,20,124,20,142);
        endShape();
       
        //links unten
        beginShape();
        vertex(50,111);
        bezierVertex(50,130,35,145,16,144);
        endShape();
       
        //rechts oben
        beginShape();
        vertex(45,110);
        bezierVertex(65,109,80,125,80,142);
        endShape();
       
        //rechts unten
        beginShape();
        vertex(50,111);
        bezierVertex(50,130,65,145,83,145);
        endShape();
       
        stroke(12,50,130);
        ellipse(50,20,3,6); //nose aka blowhole
        //dolphin small fin figure ends
    }
    // Wenn Maus NICHT gedrückt große Flosse zeichnen
    else {
        //fill(0,116,255);
        ellipse(50,50,45,110);          //body
        ellipse(50,0,13,50);            //mouth
        arc(50,60,70,70,PI,TWO_PI);     //two vertical fins
       
        //Flosse hinten
        ellipse(50,110,10,40);          //flipper small part
        arc(50,145,35,75,PI,TWO_PI);    //flipper middle part
       
        //links oben
        beginShape();
        vertex(54,115);
          bezierVertex(30,115,13,133,13,155);
        endShape();
       
        //links unten
        beginShape();
        vertex(50,117);
          bezierVertex(50,140,30,157,8,158);
        endShape();
       
        //rechts oben
        beginShape();
        vertex(45,115);
          bezierVertex(70,115,86,132,86,155);
        endShape();
       
        //rechts unten
        beginShape();
        vertex(50,117);
          bezierVertex(50,140,68,158,91,158);
        endShape();
       
        stroke(12,50,130);
        ellipse(50,20,3,6);       //nose aka blowhole
        //dolphin figure ends
    }
   
    popMatrix();
}

