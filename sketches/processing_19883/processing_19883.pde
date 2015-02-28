
boolean eaterRight = true;

boolean eaterUp = true;

int eaterRad = 100;

PVector [] fishiesPoses = new PVector [10];
PVector [] fishiesSwimDist = new PVector [10];

boolean [] fishiesRight = new boolean [10];

boolean [] fishiesUp = new boolean [10];

boolean [] fishiesEated = new boolean [10];

PVector eaterPos = new PVector ();

PVector fishPos = new PVector ();

boolean fishRight = true;

boolean fishUp = true;

boolean fishEaten = false;

int fishRad = 20;

int stomachWidth = 95;

int stomachHeight = 95;

void setup () {
  
    size (600, 500);
    eaterPos.x = random (width);
    eaterPos.y = random (height);
    /*fishPos.x = stomachWidth/2;
    fishPos.y = stomachHeight/2;*/
    
    for (int i = 0; i<fishiesPoses.length; i++){
        fishiesPoses [i] = new PVector (random (width), random (height));
        
        if ( random(2) > 1 ) {
            fishiesRight [i] = true;
        } else {
            fishiesRight [i] = false;
        }
        
        if ( random(2) > 1 ) {
            fishiesUp [i] = true;
        } else {
            fishiesUp [i] = false;
        }
        
        fishiesEated [i] = false;
        fishiesSwimDist [i] = new PVector (random(2), random(2));
    }
}

void draw () {

  PVector stomachPos = new PVector ();
    
    stomachPos.x = (eaterPos.x)-20;
    stomachPos.y = (eaterPos.y)-50;

noStroke ();  
fill (153, 255, 204);
rect (0, 0, 600, 200);

fill (153, 204, 255);
ellipse (20, 100, 200, 200);
ellipse (180, 100, 200, 200);
ellipse (340, 100, 200, 200);
ellipse (500, 100, 200, 200);
ellipse (660, 100, 200, 200);

fill (153, 255, 204);
ellipse (20, 190, 200, 200);
ellipse (180, 190, 200, 200);
ellipse (340, 190, 200, 200);
ellipse (500, 190, 200, 200);
ellipse (660, 190, 200, 200);

fill (153, 204, 255);
ellipse (20, 250, 200, 200);
ellipse (180, 250, 200, 200);
ellipse (340, 250, 200, 200);
ellipse (500, 250, 200, 200);
ellipse (660, 250, 200, 200);

fill (153, 255, 204);
ellipse (20, 340, 200, 200);
ellipse (180, 340, 200, 200);
ellipse (340, 340, 200, 200);
ellipse (500, 340, 200, 200);
ellipse (660, 340, 200, 200);

fill (153, 204, 255);
ellipse (20, 400, 200, 200);
ellipse (180, 400, 200, 200);
ellipse (340, 400, 200, 200);
ellipse (500, 400, 200, 200);
ellipse (660, 400, 200, 200);

fill (153, 255, 204);
ellipse (20, 490, 200, 200);
ellipse (180, 490, 200, 200);
ellipse (340, 490, 200, 200);
ellipse (500, 490, 200, 200);
ellipse (660, 490, 200, 200);

fill (153, 204, 255);
ellipse (20, 550, 200, 200);
ellipse (180, 550, 200, 200);
ellipse (340, 550, 200, 200);
ellipse (500, 550, 200, 200);
ellipse (660, 550, 200, 200);

    noStroke ();
    smooth ();

    
    
    noStroke ();
    fill (255, 102, 51);
    triangle ((eaterPos.x)+80, eaterPos.y, (eaterPos.x)+140, (eaterPos.y)+80, (eaterPos.x)+120, eaterPos.y);
    triangle ((eaterPos.x)+80, eaterPos.y, (eaterPos.x)+140, (eaterPos.y)-80, (eaterPos.x)+120, eaterPos.y);
    triangle ((eaterPos.x)-30, (eaterPos.y)+95, (eaterPos.x)+30, (eaterPos.y)+120, (eaterPos.x)+30, (eaterPos.y)+90);
    triangle ((eaterPos.x)-30, (eaterPos.y)-95, (eaterPos.x)+30, (eaterPos.y)-120, (eaterPos.x)+30, (eaterPos.y)-90);
    ellipse (eaterPos.x, eaterPos.y, 200, 200);
    fill (255, 204, 51);
    ellipse ((eaterPos.x)-5, (eaterPos.y)-5, 180, 180);
    fill (255, 153, 153);
    rect ((eaterPos.x)-20, eaterPos.y-50, 95, 95);
    fill (255, 255, 153);
    ellipse ((eaterPos.x)-60, (eaterPos.y)-30, 50, 50);
    fill (000, 000, 000);
    ellipse ((eaterPos.x)-65, (eaterPos.y)-30, 40, 40);
    fill (255, 255, 255);
    ellipse ((eaterPos.x)-75, (eaterPos.y)-30, 10, 10);
    ellipse ((eaterPos.x)-65, (eaterPos.y)-30, 5, 5);
    fill (255, 102, 51);
    ellipse ((eaterPos.x)-10, (eaterPos.y)-70, 30, 30);
    fill (255, 204, 51);
    ellipse ((eaterPos.x)-15, (eaterPos.y)-70, 30, 30);
    fill (255, 102, 51);
    ellipse ((eaterPos.x)+30, (eaterPos.y)-73, 20, 20);
    fill (255, 204, 51);
    ellipse ((eaterPos.x)+25, (eaterPos.y)-73, 20, 20);
    fill (255, 102, 51);
    ellipse ((eaterPos.x)-10, (eaterPos.y)+65, 30, 30);
    fill (255, 204, 51);
    ellipse ((eaterPos.x)-15, (eaterPos.y)+65, 30, 30);
    fill (255, 102, 51);
    ellipse ((eaterPos.x)-100, eaterPos.y, 30, 80);
    fill (204, 102, 51);
    ellipse ((eaterPos.x)-105, eaterPos.y, 10, 60);
    fill (255, 102, 51);
    triangle ((eaterPos.x)-30, (eaterPos.y)-95, (eaterPos.x)-30, (eaterPos.y)+95, (eaterPos.x)-20, (eaterPos.y)+95);
    
    
    
    
    
    if (eaterRight == true) {
        eaterPos.x++;
        if (eaterPos.x >= width-eaterRad) {
            eaterRight = false;
        }
    } else { 
        eaterPos.x--;
        if (eaterPos.x <= eaterRad) {
            eaterRight = true;
        }
    }



    if (eaterUp ==true) {
        eaterPos.y++;
        if (eaterPos.y >= height-eaterRad) {
            eaterUp = false;
        }
    } else {
        eaterPos.y--;
        if (eaterPos.y <= eaterRad) {
            eaterUp = true;
        }
    }
    
    int numEated = 0;
    
    for (int i = 0; i < fishiesPoses.length; i++) {
    
        noStroke();
        
        if (fishiesEated[i] == false) {
            fill (102, 0, 153);
            triangle ((fishiesPoses[i].x)-18, (fishiesPoses[i].y)-8, (fishiesPoses[i].x)+5, (fishiesPoses[i].y)-30, (fishiesPoses[i].x)+5, (fishiesPoses[i].y)-8);
            triangle ((fishiesPoses[i].x)-18, (fishiesPoses[i].y)+8, (fishiesPoses[i].x)+5, (fishiesPoses[i].y)+30, (fishiesPoses[i].x)+5, (fishiesPoses[i].y)+8);
            triangle ((fishiesPoses[i].x)+8, fishiesPoses[i].y, (fishiesPoses[i].x)+30, (fishiesPoses[i].y)+20, (fishiesPoses[i].x)+20, fishiesPoses[i].y);
            triangle ((fishiesPoses[i].x)+8, fishiesPoses[i].y, (fishiesPoses[i].x)+30, (fishiesPoses[i].y)-20, (fishiesPoses[i].x)+20, fishiesPoses[i].y);
            ellipse (fishiesPoses[i].x, fishiesPoses[i].y, 40, 40);
            fill (102, 0, 255);
            ellipse ((fishiesPoses[i].x)-3, (fishiesPoses[i].y)-2, 30, 30);
            fill (000, 000, 000);
            ellipse ((fishiesPoses[i].x)-4, (fishiesPoses[i].y)-6, 15, 15);
            fill (255, 255, 255);
            ellipse ((fishiesPoses[i].x)-7, (fishiesPoses[i].y)-6, 5, 5);
            stroke (102, 0, 153);
            strokeWeight (3);
            line ((fishiesPoses[i].x)-8, (fishiesPoses[i].y)+5, (fishiesPoses[i].x)-15, (fishiesPoses[i].y)+5);
        } else {
            fill (102, 0, 153);
            triangle (((fishiesPoses[i].x)-18)+stomachPos.x, ((fishiesPoses[i].y)-8)+stomachPos.y, ((fishiesPoses[i].x)+5)+stomachPos.x, ((fishiesPoses[i].y)-30)+stomachPos.y, ((fishiesPoses[i].x)+5)+stomachPos.x, ((fishiesPoses[i].y)-8)+stomachPos.y);
            triangle (((fishiesPoses[i].x)-18)+stomachPos.x, ((fishiesPoses[i].y)+8)+stomachPos.y, ((fishiesPoses[i].x)+5)+stomachPos.x, ((fishiesPoses[i].y)+30)+stomachPos.y, ((fishiesPoses[i].x)+5)+stomachPos.x, ((fishiesPoses[i].y)+8)+stomachPos.y);
            triangle (((fishiesPoses[i].x)+8)+stomachPos.x, (fishiesPoses[i].y)+stomachPos.y, ((fishiesPoses[i].x)+30)+stomachPos.x, ((fishiesPoses[i].y)+20)+stomachPos.y, ((fishiesPoses[i].x)+20)+stomachPos.x, (fishiesPoses[i].y)+stomachPos.y);
            triangle (((fishiesPoses[i].x)+8)+stomachPos.x, (fishiesPoses[i].y)+stomachPos.y, ((fishiesPoses[i].x)+30)+stomachPos.x, ((fishiesPoses[i].y)-20)+stomachPos.y, ((fishiesPoses[i].x)+20)+stomachPos.x, (fishiesPoses[i].y)+stomachPos.y);
            ellipse ((fishiesPoses[i].x)+stomachPos.x, (fishiesPoses[i].y)+stomachPos.y, 40, 40);
            fill (102, 0, 255);
            ellipse (((fishiesPoses[i].x)-3)+stomachPos.x, ((fishiesPoses[i].y)-2)+stomachPos.y, 30, 30);
            fill (000, 000, 000);
            ellipse (((fishiesPoses[i].x)-4)+stomachPos.x, ((fishiesPoses[i].y)-6)+stomachPos.y, 15, 15);
            fill (255, 255, 255);
            ellipse (((fishiesPoses[i].x)-7)+stomachPos.x, ((fishiesPoses[i].y)-6)+stomachPos.y, 5, 5);
            stroke (102, 0, 153);
            strokeWeight (3);
            line (((fishiesPoses[i].x)-8)+stomachPos.x, ((fishiesPoses[i].y)+5)+stomachPos.y, ((fishiesPoses[i].x)-15)+stomachPos.x, ((fishiesPoses[i].y)+5)+stomachPos.y);
        }
        
        
        if (fishiesEated [i] == false) {
            if (fishiesRight [i] == true) {
                fishiesPoses [i].x += fishiesSwimDist[i].x;
                if (fishiesPoses [i].x >= width-fishRad) {
                    fishiesRight [i] = false;
                }
            } else { 
                fishiesPoses [i].x -= fishiesSwimDist[i].x;
                if (fishiesPoses [i].x <= fishRad) {
                    fishiesRight [i] = true;
                }
            }
            
            
            if (fishiesUp [i] == true) {
                fishiesPoses [i].y-=fishiesSwimDist[i].y;
                if (fishiesPoses [i].y <= fishRad) {
                    fishiesUp [i] = false;
                }
            } else {
                fishiesPoses [i].y+=fishiesSwimDist[i].y;
                if (fishiesPoses [i].y >= height-fishRad) {
                    fishiesUp [i] = true;
                }
            }
        } else {
            if (fishiesRight [i] == true) {
                fishiesPoses [i].x += fishiesSwimDist[i].x * 2;
                if (fishiesPoses [i].x >= stomachWidth-fishRad) {
                    fishiesRight [i] = false;
                }
            } else { 
                fishiesPoses [i].x -= fishiesSwimDist[i].x * 2;
                if (fishiesPoses [i].x <= fishRad) {
                    fishiesRight [i] = true;
                }
            }
            
            
            if (fishiesUp [i] ==true) {
                fishiesPoses [i].y -= fishiesSwimDist[i].y * 2;
                if (fishiesPoses [i].y <= fishRad) {
                    fishiesUp [i] = false;
                }
            } else {
                fishiesPoses [i].y += fishiesSwimDist[i].y * 2;
                if (fishiesPoses [i].y >= stomachHeight-fishRad) {
                    fishiesUp [i] = true;
                }
            }
        }
        
        
        float fishCollide = sqrt (((eaterPos.x-fishiesPoses [i].x)*(eaterPos.x-fishiesPoses [i].x))+((eaterPos.y-fishiesPoses [i].y)*(eaterPos.y-fishiesPoses [i].y)));
        
        if (fishiesEated [i] == false && fishCollide < (eaterRad+fishRad) ) {
            fishiesEated [i] = true;
            fishiesPoses [i].x = stomachWidth/2;
            fishiesPoses [i].y = stomachHeight/2;
        }
        
        if ( fishiesEated[i] == true ) {
            numEated++;
        }
    }
    
    if ( numEated == 10 ) {
        for (int i = 0; i<fishiesPoses.length; i++){
            fishiesPoses [i] = new PVector (random (width), random (height));
            
            if ( random(2) > 1 ) {
                fishiesRight [i] = true;
            } else {
                fishiesRight [i] = false;
            }
            
            if ( random(2) > 1 ) {
                fishiesUp [i] = true;
            } else {
                fishiesUp [i] = false;
            }
            
            fishiesEated [i] = false;
            fishiesSwimDist [i] = new PVector (random(2), random(2));
        }
    }
}
                
                
