

//Fireball aBall = new Fireball ( 20, 0 );
Fireball [] flames = new Fireball [150];

float FIRE_X_START_VELO_LOW = 15;
float FIRE_X_START_VELO_HIGH = 20;

float FIRE_Y_START_VELO_LOW = -2;
float FIRE_Y_START_VELO_HIGH = 6;

float HEART_X_START_VELO_LOW = 7;
float HEART_X_START_VELO_HIGH = 10;

float HEART_Y_START_VELO_LOW = -2;
float HEART_Y_START_VELO_HIGH = 8;

float VOMIT_X_START_VELO_LOW = 4.5;
float VOMIT_X_START_VELO_HIGH = 10;

float VOMIT_Y_START_VELO_LOW = -8;
float VOMIT_Y_START_VELO_HIGH = -5;

int MIN_FIREBALL_SIZE = 10;
int MAX_FIREBALL_SIZE = 50;

float MIN_FIREBALL_REDUX = 5;
float MAX_FIREBALL_REDUX = 8;

int xsub = 85;
int ysub = 110;

float SPARKLE_SCALE = 9;

PVector flameOrigin = new PVector ( 230, 475 ); 

int breathType = 0;

void setup () {
    size (800, 700);
    for (int i = 0; i<flames.length; i++) {
        flames [i] = new Fireball (random(FIRE_X_START_VELO_LOW, FIRE_X_START_VELO_HIGH), random(FIRE_Y_START_VELO_LOW, FIRE_Y_START_VELO_HIGH), i, random (MIN_FIREBALL_SIZE, MAX_FIREBALL_SIZE), random (MIN_FIREBALL_REDUX, MAX_FIREBALL_REDUX));
    }
}


void draw () {
    background (000, 000, 000);
    smooth ();
    noStroke ();
    drawDragon ();
    
    drawFireballs();
}


void drawFireballs () {

    for (int i = 0; i<flames.length; i++) {
        if ( breathType == 0 ) {
            flames [i].update( -0.1, -0.3 );
        } else if ( breathType == 1 ) {
            flames [i].update( -0.05, -0.15 );
        }
        else if ( breathType == 2 ) {
            flames [i].update( -0.05, 0.15 );
        }
        
        
        PVector displayPos = new PVector ( flames [i].pos.x + flameOrigin.x, flames [i].pos.y + flameOrigin.y );
        
        
        if ( flames[i].framesToDelay == 0 ) {
            
            float scale = random (1, 3);    
            
            if (breathType == 0) {
                fill (255, 177, 40, flames [i].opacity);
                ellipse (((100-100)/scale)+displayPos.x, ((100-100)/scale)+displayPos.y, (50/scale), (50/scale));
                triangle (((78-100)/scale)+displayPos.x, ((90-100)/scale)+displayPos.y, ((100-100)/scale)+displayPos.x, ((50-100)/scale)+displayPos.y, ((123-100)/scale)+displayPos.x, ((90-100)/scale)+displayPos.y);
                fill (255, 000, 000, flames [i].opacity);
                ellipse (((100-100)/scale)+displayPos.x, ((100-100)/scale)+displayPos.y, (40/scale), (40/scale));
                fill (255, 237, 40, flames [i].opacity);
                ellipse (((100-100)/scale)+displayPos.x, ((105-100)/scale)+displayPos.y, (30/scale), (30/scale));
            } else if (breathType == 1) {
                if (flames [i].displayType == 0) {
                    smooth ();
                    fill (236, 129, 202);
                    ellipse (((70-xsub)/scale)+displayPos.x, ((100-ysub)/scale)+displayPos.y, 30/scale, 30/scale);
                    ellipse (((100-xsub)/scale)+displayPos.x, ((100-ysub)/scale)+displayPos.y, 30/scale, 30/scale);
                    triangle (((55-xsub)/scale)+displayPos.x, ((105-ysub)/scale)+displayPos.y, ((115-xsub)/scale)+displayPos.x, ((105-ysub)/scale)+displayPos.y, ((85-xsub)/scale)+displayPos.x, ((150-ysub)/scale)+displayPos.y);
                    ellipse (((85-xsub)/scale)+displayPos.x, ((115-ysub)/scale)+displayPos.y, 30/scale, 30/scale);
                }
                
                else if (flames [i].displayType == 1) {
            
                    fill (255, 255, 255); 
                    quad (((50-100)/SPARKLE_SCALE)+displayPos.x, ((100-100)/SPARKLE_SCALE)+displayPos.y, ((100-100)/SPARKLE_SCALE)+displayPos.x, ((50-100)/SPARKLE_SCALE)+displayPos.y, ((150-100)/SPARKLE_SCALE)+displayPos.x, ((100-100)/SPARKLE_SCALE)+displayPos.y, ((100-100)/SPARKLE_SCALE)+displayPos.x, ((150-100)/SPARKLE_SCALE)+displayPos.y);
                }
            }
            
            else if (breathType == 2) {
            
                if (flames [i].displayType == 0) {
                    
                    rectMode (CENTER);
                    fill (110, 110, 110);
                    rect (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 20/2, 70/2);
                    triangle (((90-100)/2)+displayPos.x, ((65-100)/2)+displayPos.y, ((100-100)/2)+displayPos.x, ((50-100)/2)+displayPos.y, ((110-100)/2)+displayPos.x, ((65-100)/2)+displayPos.y);
                    fill (231, 216, 135);
                    rect (((100-100)/2)+displayPos.x, ((135-100)/2)+displayPos.y, 35/2, 10/2);
                    rect (((100-100)/2)+displayPos.x, ((145-100)/2)+displayPos.y, 15/2, 30/2);
                    ellipse (((100-100)/2)+displayPos.x, ((165-100)/2)+displayPos.y, 20/2, 20/2);
                    fill (222, 23, 3);
                    ellipse (((100-100)/2)+displayPos.x, ((165-100)/2)+displayPos.y, 10/2, 10/2);
                }
                    
                else if (flames [i].displayType == 1) {
                    
                    rectMode (CENTER);
                    fill (110, 110, 110);
                    rect (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 80/2, 100/2);
                    fill (231, 216, 135);
                    rect (((100-100)/2)+displayPos.x, ((110-100)/2)+displayPos.y, 30/2, 80/2);
                    rect (((100-100)/2)+displayPos.x, ((95-100)/2)+displayPos.y, 50/2, 30/2);
                    fill (000, 000, 000);
                    rect (((100-100)/2)+displayPos.x, ((113-100)/2)+displayPos.y, 20/2, 75/2);
                    rect (((100-100)/2)+displayPos.x, ((95-100)/2)+displayPos.y, 40/2, 20/2);
                }   
                    
                else if (flames [i].displayType == 2) {
                    fill (231, 216, 135);
                    ellipse (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 120/2, 120/2);
                    fill (222, 23, 3);
                    ellipse (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 100/2, 100/2);
                    rectMode (CENTER);
                    fill (231, 216, 135);
                    rect (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 20/2, 60/2);
                    rect (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 60/2, 20/2);
                }
                    
                else if (flames [i].displayType == 3) {
                    fill (110, 110, 110);
                    rect (((100-100)/2)+displayPos.x, ((100-100)/2)+displayPos.y, 30/2, 60/2);
                    
                    fill (225, 195, 161);
                    ellipse (((100-100)/2)+displayPos.x, ((65-100)/2)+displayPos.y, 35/2, 35/2);
                    ellipse (((80-100)/2)+displayPos.x, ((65-100)/2)+displayPos.y, 20/2, 10/2);
                    ellipse (((92-100)/2)+displayPos.x, ((45-100)/2)+displayPos.y, 10/2, 30/2);
                    ellipse (((103-100)/2)+displayPos.x, ((42-100)/2)+displayPos.y, 10/2, 30/2);
                    ellipse (((115-100)/2)+displayPos.x, ((47-100)/2)+displayPos.y, 10/2, 30/2);
                    
                    fill (175, 13, 13);
                    ellipse (((90-100)/2)+displayPos.x, ((130-100)/2)+displayPos.y, 10/2, 10/2);
                    ellipse (((100-100)/2)+displayPos.x, ((135-100)/2)+displayPos.y, 20/2, 12/2);
                    ellipse (((110-100)/2)+displayPos.x, ((130-100)/2)+displayPos.y, 10/2, 20/2);
                }
                
                else {
                    fill (195, 223, 100);
                    ellipse (displayPos.x, displayPos.y, random (20, 30), random (20, 30));
                }
            }
        }
        if ( ( displayPos.x < 0 || displayPos.x > 800 ) || ( displayPos.y < 0 || displayPos.y > 700 ) ) {
            if ( breathType == 0 ) {
                flames [i] = new Fireball (random(FIRE_X_START_VELO_LOW, FIRE_X_START_VELO_HIGH), random(FIRE_Y_START_VELO_LOW, FIRE_Y_START_VELO_HIGH), i, random (MIN_FIREBALL_SIZE, MAX_FIREBALL_SIZE), random (MIN_FIREBALL_REDUX, MAX_FIREBALL_REDUX));
                
            } else if ( breathType == 1 ) {
                flames [i] = new Fireball (random(HEART_X_START_VELO_LOW, HEART_X_START_VELO_HIGH), random(HEART_Y_START_VELO_LOW, HEART_Y_START_VELO_HIGH), i, random (MIN_FIREBALL_SIZE, MAX_FIREBALL_SIZE), random (MIN_FIREBALL_REDUX, MAX_FIREBALL_REDUX));
                flames [i].displayType = round (random (0, 1));
                
            } else if (breathType == 2) {
                flames [i] = new Fireball (random(VOMIT_X_START_VELO_LOW, VOMIT_X_START_VELO_HIGH), random(VOMIT_Y_START_VELO_LOW, VOMIT_Y_START_VELO_HIGH), i, random (MIN_FIREBALL_SIZE, MAX_FIREBALL_SIZE), random (MIN_FIREBALL_REDUX, MAX_FIREBALL_REDUX));
                flames [i].displayType = round (random (0, 60));
            }
        }
    }
}


class Fireball { 
    PVector pos = new PVector (0,0);
    float xVelo, yVelo;
    int framesToDelay = 0;
    float flameSize = 0;
    float opacity = 255;
    float opacityRedux = 0;
    int displayType = 0;
    
    
    Fireball ( float xVeloIn, float yVeloIn, int framesToDelayIn, float flameSizeIn, float opacityReduxIn ) {
        xVelo = xVeloIn;
        yVelo = yVeloIn;
        framesToDelay = framesToDelayIn;
        flameSize = flameSizeIn;
        opacityRedux = opacityReduxIn;
    }
    
    void update ( float xVeloMod, float yVeloMod ) {
        if ( framesToDelay == 0 ) {
            xVelo += xVeloMod;
            yVelo += yVeloMod;
            
            if ( xVelo <= 0 ) {
                xVelo = 0;
            }
            
            opacity -= opacityRedux;
            
            pos.x += xVelo;
            pos.y += yVelo;
        } else {
            framesToDelay--;
        }
    }
}


void drawDragon () {
    float div = 2.0;
    PVector dragPos = new PVector (000, 350);
    
    fill (102, 0, 0);
    ellipse (dragPos.x + (130/div), dragPos.y + (550/div), (240/div), (170/div)); //tail shadow
    fill (204, 0, 0);
    ellipse (dragPos.x + (125/div), dragPos.y + (530/div), (200/div), (150/div)); //tail main color
    fill (000, 000, 000);
    ellipse (dragPos.x + (120/div), dragPos.y + (480/div), (200/div), (150/div)); //tail cutout
    
    
    fill (102, 0, 0);
    triangle ((200/div)+dragPos.x, (300/div)+dragPos.y, (120/div)+dragPos.x, (250/div)+dragPos.y, (50/div)+dragPos.x, (300/div)+dragPos.y);
    triangle ((170/div)+dragPos.x, (290/div)+dragPos.y, (130/div)+dragPos.x, (350/div)+dragPos.y, (90/div)+dragPos.x, (290/div)+dragPos.y);
    triangle ((100/div)+dragPos.x, (300/div)+dragPos.y, (80/div)+dragPos.x, (330/div)+dragPos.y, (70/div)+dragPos.x, (300/div)+dragPos.y);
    
    
    fill (102, 0, 0);
    ellipse (dragPos.x + (300/div), dragPos.y + (450/div), (350/div), (400/div)); //body shadow
    
    fill (102, 0, 0);
    triangle (dragPos.x + (240/div), dragPos.y + (240/div), dragPos.x + (260/div), dragPos.y + (140/div), dragPos.x + (110/div), dragPos.y + (95/div));
    
    fill (51, 0, 0);
    triangle (dragPos.x + (270/div), dragPos.y + (180/div), dragPos.x + (290/div), dragPos.y + (110/div), dragPos.x + (140/div), dragPos.y + (60/div)); //back ear horn
    
    fill (102, 0, 0);
    ellipse (dragPos.x + (320/div), dragPos.y + (200/div), (300/div), (250/div)); //head shadow
    fill (204, 0, 0);
    ellipse (dragPos.x + (300/div), dragPos.y + (430/div), (300/div), (350/div)); //body main color
    fill (204, 0, 0);
    ellipse (dragPos.x + (325/div), dragPos.y + (190/div), (270/div), (220/div)); //head main color
    fill (102, 0, 0);
    ellipse (dragPos.x + (310/div), dragPos.y + (100/div), (90/div), (80/div)); //eyebrow shadow
    fill (204, 0, 0);
    ellipse (dragPos.x + (310/div), dragPos.y + (110/div), (90/div), (75/div)); //eyebrow main color
    fill (000, 000, 000);
    ellipse (dragPos.x + (470/div), dragPos.y + (250/div), (150/div), (50/div)); //open mouth shadow
    fill (102, 0, 0);
    ellipse (dragPos.x + (370/div), dragPos.y + (530/div), (230/div), (230/div)); //haunch shadow
    fill (204, 0, 0);
    ellipse (dragPos.x + (360/div), dragPos.y + (520/div), (220/div), (220/div)); //haunch main color
    
    triangle (dragPos.x + (250/div), dragPos.y + (200/div), dragPos.x + (270/div), dragPos.y + (150/div), dragPos.x + (120/div), dragPos.y + (100/div));
    
    
    
    rectMode (CENTER);
    fill (50, 50, 50);
    triangle (dragPos.x + (550/div), dragPos.y + (490/div), dragPos.x + (585/div), dragPos.y + (470/div), dragPos.x + (550/div), dragPos.y + (440/div));
    
    fill (51, 0, 0);
    ellipse (dragPos.x + (530/div), dragPos.y + (465/div), (70/div), (70/div)); //behind toe
    
    fill (120, 120, 120);
    triangle (dragPos.x + (545/div), dragPos.y + (480/div), dragPos.x + (570/div), dragPos.y + (460/div), dragPos.x + (535/div), dragPos.y + (432/div));
    
    fill (102, 0, 0);
    rect (dragPos.x + (510/div), dragPos.y + (530/div), (60/div), (150/div)); //foot shadow
    
    ellipse (dragPos.x + (515/div), dragPos.y + (459/div), (70/div), (70/div)); //toe shadow
    
    fill (120, 120, 120);
    triangle ((545/div)+dragPos.x, (620/div)+dragPos.y, (545/div)+dragPos.x, (590/div)+dragPos.y, (570/div)+dragPos.x, (610/div)+dragPos.y);
         
    
    //fill(255, 255, 255);
    //triangle (535, 635, 500, 580, 550, 620);
    fill (102, 0, 0);
    ellipse (dragPos.x + (515/div), dragPos.y + (600/div), (70/div), (70/div)); //back toe shadow
    fill (204, 0, 0);
    rect (dragPos.x + (507/div), dragPos.y + (530/div), (45/div), (150/div)); //foot main color
    
    ellipse (dragPos.x + (512/div), dragPos.y + (463/div), (60/div), (60/div)); //toe main color
    
    ellipse (dragPos.x + (512/div), dragPos.y + (600/div), (60/div), (60/div)); //back toe main color
    
    //fill (255, 255, 255);
    //strokeWeight (1);
    //stroke (000, 000, 000);
    
    fill (255, 255, 51);
    ellipse (dragPos.x + (310/div), dragPos.y + (140/div), (80/div), (100/div));
    fill (255, 255, 102);
    ellipse (dragPos.x + (310/div), dragPos.y + (140/div), (30/div), (98/div));
    fill (000, 000, 000);
    ellipse (dragPos.x + (313/div), dragPos.y + (130/div), (70/div), (80/div));
    fill (204, 204, 204);
    ellipse (dragPos.x + (305/div), dragPos.y + (135/div), (20/div), (30/div));
    fill (255, 255, 255);
    ellipse (dragPos.x + (307/div), dragPos.y + (135/div), (10/div), (20/div));
    fill (204, 204, 204);
    ellipse (dragPos.x + (320/div), dragPos.y + (110/div), (15/div), (15/div));
    fill (255, 255, 255);
    ellipse (dragPos.x + (322/div), dragPos.y + (110/div), (7/div), (7/div));
    //eye
    
    
    fill (102, 0, 0);
    ellipse (dragPos.x + (400/div), dragPos.y + (190/div), (30/div), (20/div));
    fill (204, 0, 0);
    ellipse (dragPos.x + (405/div), dragPos.y + (195/div), (25/div), (15/div));
    fill (51, 0, 0);
    ellipse (dragPos.x + (405/div), dragPos.y + (195/div), (15/div), (10/div));
    //nostril
    
    fill (120, 120, 120);
    triangle ((400/div)+dragPos.x, (350/div)+dragPos.y, (400/div)+dragPos.x, (370/div)+dragPos.y, (430/div)+dragPos.x, (360/div)+dragPos.y);
    triangle ((400/div)+dragPos.x, (370/div)+dragPos.y, (380/div)+dragPos.x, (380/div)+dragPos.y, (395/div)+dragPos.x, (400/div)+dragPos.y);
    
    
    fill (102, 0, 0);
    ellipse (dragPos.x + (370/div), dragPos.y + (360/div), (90/div), (50/div));
    fill (204, 0, 0);
    ellipse (dragPos.x + (350/div), dragPos.y + (360/div), (80/div), (40/div));
    //arm
}


void keyPressed() {
    if (keyCode == UP) {
        if (breathType < 2) {
            breathType++;
        }
    } else if ( keyCode == DOWN ) {
        if ( breathType > 0 ) {
            breathType--;
        }
    }
    
    if ( breathType == 1 ) {
        for (int i = 0; i<flames.length; i++) {
            flames [i].displayType = round (random (0, 1));
        }
    } else if ( breathType == 2 ) { 
        for (int i = 0; i<flames.length; i++) {
            flames [i].displayType = round (random (0, 80));
        }
    }
}



















/*void drawDragon () {
    fill (102, 0, 0);
    ellipse (130, 550, 240, 170); //tail shadow
    fill (204, 0, 0);
    ellipse (125, 530, 200, 150); //tail main color
    fill (000, 000, 000);
    ellipse (120, 480, 200, 150); //tail cutout
    
    fill (102, 0, 0);
    ellipse (300, 450, 350, 400); //body shadow
    
    fill (102, 0, 0);
    triangle (240, 240, 260, 140, 110, 95);
    
    fill (51, 0, 0);
    triangle (270, 180, 290, 110, 140, 60); //back ear horn
    
    fill (102, 0, 0);
    ellipse (320, 200, 300, 250); //head shadow
    fill (204, 0, 0);
    ellipse (300, 430, 300, 350); //body main color
    fill (204, 0, 0);
    ellipse (325, 190, 270, 220); //head main color
    fill (102, 0, 0);
    ellipse (310, 100, 90, 80); //eyebrow shadow
    fill (204, 0, 0);
    ellipse (310, 110, 90, 75); //eyebrow main color
    fill (000, 000, 000);
    ellipse (470, 250, 150, 50); //open mouth shadow
    fill (102, 0, 0);
    ellipse (370, 530, 230, 230); //haunch shadow
    fill (204, 0, 0);
    ellipse (360, 520, 220, 220); //haunch main color
    
    triangle (250, 200, 270, 150, 120, 100);
    
    
    
    rectMode (CENTER);
    fill (50, 50, 50);
    triangle (550, 490, 585, 470, 550, 440);
    
    fill (51, 0, 0);
    ellipse (530, 465, 70, 70); //behind toe
    
    fill (120, 120, 120);
    triangle (545, 480, 570, 460, 535, 432);
    
    fill (102, 0, 0);
    rect (510, 530, 60, 150); //foot shadow
    
    ellipse (515, 459, 70, 70); //toe shadow
    
    //fill(255, 255, 255);
    //triangle (535, 635, 500, 580, 550, 620);
    ellipse (515, 600, 70, 70); //back toe shadow
    fill (204, 0, 0);
    rect (507, 530, 45, 150); //foot main color
    
    ellipse (512, 463, 60, 60); //toe main color
    
    ellipse (512, 600, 60, 60); //back toe main color
    
    //fill (255, 255, 255);
    //strokeWeight (1);
    //stroke (000, 000, 000);
    
    fill (255, 255, 51);
    ellipse (310, 140, 80, 100);
    fill (255, 255, 102);
    ellipse (310, 140, 30, 98);
    fill (000, 000, 000);
    ellipse (313, 130, 70, 80);
    fill (204, 204, 204);
    ellipse (305, 135, 20, 30);
    fill (255, 255, 255);
    ellipse (307, 135, 10, 20);
    fill (204, 204, 204);
    ellipse (320, 110, 15, 15);
    fill (255, 255, 255);
    ellipse (322, 110, 7, 7);
    //eye
    
    
    fill (102, 0, 0);
    ellipse (400, 190, 30, 20);
    fill (204, 0, 0);
    ellipse (405, 195, 25, 15);
    fill (51, 0, 0);
    ellipse (405, 195, 15, 10);
    //nostril
    
    
    fill (102, 0, 0);
    ellipse (350, 360, 90, 50);
    fill (204, 0, 0);
    ellipse (330, 360, 80, 40);
    //arm
}*/





















                
                
