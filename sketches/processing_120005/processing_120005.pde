
void setup()
{
  size(500, 500);
}

void draw()
{ 
  background (0);

    translate(width/2, height/2);
    
    ellipse(0,0,30,30);

    float sec= map(second(), 0, 60, 0, 360);

    pushMatrix();
    rotate(radians(sec)); // Um i rotieren
    translate(0, -200); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
    rect(0, 0, 3, 200);
    noStroke();
    popMatrix();
    
    
    float min= map(minute(), 0, 60, 0, 360);

    pushMatrix();
    rotate(radians(min)); // Um i rotieren
    translate(0, -200); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
    rect(0, 0, 5, 200);
    popMatrix();
    
        float std= map(hour(), 0, 12, 0, 360);

    pushMatrix();
    rotate(radians(std)); // Um i rotieren
    translate(0, -200); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
    rect(0, 0, 7, 200);
    popMatrix();
    
        for (int i=0; i<360; i+=30) { // 360 Grad in 20° Schritten
    pushMatrix();
    rotate(radians(i)); // Um i rotieren
    translate(0, -200); // Um Radius verschieben, je größer die Zahl, desto größer der Radius
    ellipse(0, 0, 40, 40);
    popMatrix();
  }
}

