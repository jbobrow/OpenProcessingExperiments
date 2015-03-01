
Monster monster;
boolean saveOne = false;

void setup()
{
    size(600, 600);
    noStroke();
    smooth();
    monster = new Monster(14, 400);
    
}

void draw()
{
    smooth();
    background(255);
    translate(width/2, height/2);
    
    monster.draw();
    
    if (saveOne) {
        saveFrame("renders/blackmonster-#######.png");
        saveOne = false;
    }
}

void keyPressed()
{
    if (key == 's') {
        saveOne = true;
    }
}
class Eye
{
    float eyeSize;
    float pupilSize;
    float eyeDistance;
    float eyeX;
    float eyeY;
    float pupilX;
    float pupilY;
    
    Eye(float x, float y, float e)
    {
        eyeSize = 40;
        pupilSize = 15;
        eyeX = x;
        eyeY = y;
        eyeDistance = e;
        
        pupilX = eyeX;
        pupilY = eyeY;
    }
    
    void update()
    {
        float mY = map(mouseY, 0, height, -eyeSize/4, eyeSize/4);
        pupilY = eyeY + mY;

        float mX = map(mouseX, 0, height, -eyeSize/4, eyeSize/4);
        pupilX = eyeX + mX;
    }
    
    void draw()
    {
        // stroke around eyeball
        fill(0);
        ellipse(eyeX, eyeY, eyeSize + 4, eyeSize + 4);
        
        // eyeball
        fill(255);
        ellipse(eyeX, eyeY, eyeSize, eyeSize);
        
        // pupil
        fill(0);
        ellipse(pupilX, pupilY, pupilSize, pupilSize);    
    }
}
class Monster
{
    int maxMonsterSize;
    int numEyes;
    float angle;
    
    Eye[] eyes;

    Monster(int nEyes, int mSize)
    {
        numEyes = nEyes;
        maxMonsterSize = mSize;
        
        angle = 360 / numEyes;
        
        eyes = new Eye[nEyes];
        
        for (int i = 0; i < numEyes; i++) {
            float eyeDistance = random(100, 250);
            float x = cos(radians(i*angle)) * eyeDistance;
            float y = sin(radians(i*angle)) * eyeDistance;
            eyes[i] = new Eye(x, y, eyeDistance);
        }
    }
        
    void draw()
    {
        // monster body
        fill(0);
        ellipse(0, 0, 100, 100);
        
        // tentacles start
        for (int i = 0; i < numEyes; i++) {
            float x = cos(radians(i*angle)) * 40;
            float y = sin(radians(i*angle)) * 40;
            ellipse(x, y, 30, 30);
        }
        
        // tentacles
        stroke(0);
        strokeWeight(6);
        noFill();
        for (int i = 0; i < numEyes; i++) {
            float x1 = cos(radians(i*angle)) * 45;
            float y1 = sin(radians(i*angle)) * 45;
            
            float cx1 = cos(radians(i*angle)) * (45 + random(eyes[i].eyeDistance/2));
            float cy1 = sin(radians(i*angle)) * (45 + random(eyes[i].eyeDistance/2));

            float cx2 = cos(radians(i*angle)) * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
            float cy2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - random(eyes[i].eyeDistance/2));
            
            float x2 = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
            float y2 = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
            
            if (cy1 == 0.0) {
                cy1 = y1 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
            }
            
            if (cy2 == 0.0) {
                cy2 = y2 + random(eyes[i].eyeDistance/2); // stiff tentacle problem
            }

            bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
        }
        noStroke();
            
        // tentacles end
        fill(0);
        for (int i = 0; i < numEyes; i++) {
            float x = cos(radians(i*angle)) * (eyes[i].eyeDistance - 10);
            float y = sin(radians(i*angle)) * (eyes[i].eyeDistance - 10);
            ellipse(x, y, 30, 30);
        }
        
        // monster eyes
        for (int i = 0; i < numEyes; i++) {
            eyes[i].update();
            eyes[i].draw();
        }
        
        // monster mouth
        fill(255);

        beginShape();
        for (int i = 0; i < 30; i++) {
            float teethAngle = 360/30;
             if (i % 2 == 0) {
                 float x = cos(radians(i*teethAngle)) * 40;
                 float y = sin(radians(i*teethAngle)) * 40;
                 vertex(x, y);
             } else {
                 float teethSize = random(20, 22);
                 float x = cos(radians(i*teethAngle)) * teethSize;
                 float y = sin(radians(i*teethAngle)) * teethSize;
                 vertex(x, y);
             }
         }
         endShape(CLOSE);
 
    }
}


