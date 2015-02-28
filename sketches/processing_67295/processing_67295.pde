
PImage myImage = loadImage("owl.jpg");

float timeOffMax = 0.5;
int timeOnMax = 1;
int timeOffCurrent;
int timeOnCurrent;
int lastSavedTime;
boolean lightIsOn = false;

PFont font;

float hourX;
float minuteX;
float secondX;

void setup()
{
    size(500, 489);
    lastSavedTime = second();
    myImage = loadImage("owl.jpg");
    
    font = createFont("Helvetica", 24);
    noStroke();
}

void draw()
{
    background(255);
    image(myImage, 0, 0);
    
    fill(84, 65, 38);
    textFont(font);
    
    if( String.valueOf( minute() ).length() == 1 )
    {
        if( String.valueOf( second() ).length() == 1 )
        {
            text((hour()%12+":0"+minute()+":0"+second()), 210, 423);
        } else {
            text((hour()%12+":0"+minute()+":"+second()), 210, 423);
        }
    } else if( String.valueOf( second() ).length() == 1 ) {
        text((hour()%12+":"+minute()+":0"+second()), 210, 423);
    } else {
        text((hour()%12+":"+minute()+":"+second()), 210, 423);
    }
    
    if(lightIsOn == true) {
        fill(255, 255, 0);
        timeOnCurrent = second() - lastSavedTime;
        
        if (timeOnCurrent < timeOnMax) {
            lightIsOn = false;
            lastSavedTime = second();
        }
    }
    else {
        noFill();
        timeOffCurrent = second() - lastSavedTime;
        
        if (timeOffCurrent > timeOffMax) {
          lightIsOn = true;
          lastSavedTime = second();
        }
    }
    ellipse(219.5, 72, 12.5, 12.5);
    ellipse(251, 72, 12.5, 12.5);
    ellipse(196.5, 198, 35, 35);
    ellipse(278.5, 198, 35, 35);
}

