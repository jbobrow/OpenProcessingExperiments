
float ratio;
    
//fun anim vars
float direction = 1;
int timeLimit = 10;
float time = 0;
int id = 0;
float[] xPositions = new float[120];
float[] yPositions = new float[120];
    
float[] difs = new float[6];
float tempratio;

void setup() {  //setup function called initially, only     
    size(500,500);
    frameRate(30);
    ratio = 6/10;
    
    difs[0] = 0;
    difs[1] = 2;
    difs[2] = 5;
    difs[3] = 10;
    difs[4] = 17;
    difs[5] = 25;
        
    smooth();
}

void draw() {  //draw function loops 
  background(0);
  time += direction;
        if(abs(time)== timeLimit)
        {
            direction = -direction;
        }
        tempratio = time/10;
        print(time);
        print(" , ");
        print(ratio);
        print("\n");
        difs[0] = 0*tempratio;
        difs[1] = 2*tempratio;
        difs[2] = 5*tempratio;
        difs[3] = 10*tempratio;
        difs[4] = 17*tempratio;
        difs[5] = 25*tempratio;
        drawFunAnim();
}

    void drawFunAnim() 
    {
        noStroke();
        
        float angle = 0;
        id = 0;
        for (int i = 0; i < 20; i++) 
        {
            fill(255,255,255, 255);
            drawElipseGroup(80,     angle-(time+difs[5])/4, i, 1);
            fill(255,255,255, 240);
            drawElipseGroup(80+20,  angle-(time+difs[5])/6, i, 2);
            fill(255,255,255, 225);
            drawElipseGroup(80+40,  angle, i, 3);
            fill(255,255,255, 210);
            drawElipseGroup(80+60,  angle+(time+difs[5])/6, i, 4);
            fill(255,255,255, 195);
            drawElipseGroup(80+80,  angle+(time+difs[5])/3, i, 5);
            fill(255,255,255, 180);
            drawElipseGroup(80+100, angle+(time+difs[5])/2, i, 6);
            angle += 18;
        }
    } 
    
    void drawElipseGroup(float radius, float angle, int id, int layerId)
    {
        float xPos;
        float yPos;
//      
        if(id%2 == 0)
        {
            xPos = sin(TWO_PI*angle/360)*radius;
            yPos = cos(TWO_PI*angle/360)*radius;
        }
        else
        {
            xPos = sin(TWO_PI*(angle+layerId*4/5*tempratio)/360)*(radius+10);
            yPos = cos(TWO_PI*(angle+layerId*4/5*tempratio)/360)*(radius+10);
            
        }
//      
//      xPos = sin(TWO_PI*angle/360)*radius;
//      yPos = cos(TWO_PI*angle/360)*radius;
        
        ellipse((xPos + width/2),(yPos + height/2) , 10 + 2*(layerId-1), 10+ 2*(layerId-1));
        
        id ++;
    }               
