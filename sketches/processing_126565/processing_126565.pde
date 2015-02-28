
final int STAGE_WIDTH = 800;
    final int STAGE_HEIGHT = 600;
    final PVector CENTER_STAGE = new PVector(STAGE_WIDTH/2, STAGE_HEIGHT/2);
   final int NB_SQUARES = 80;
    final float RADIUS_STEP = 5;
    final float RADIUS_MIN = 4;
    final double MAX_ROTATION_SPEED = PI / 10;    
    final double MAX_ANGLE = PI * .1;
    final double MIN_ANGLE = -1 * MAX_ANGLE;
    final double MAX_DEFAULT_ANGLE = PI / 550;
    final double MIN_DEFAULT_ANGLE = -1 * MAX_DEFAULT_ANGLE;
    final double ANGLE_FRICTION = .7;
    
    double[] tabAngles;
    double[] tabDeltaAngles;
    double[] tabAngleSpeed;

    float[] tabColorsR;
    float[] tabColorsG;
    float[] tabColorsB;


    double originalRotation = MIN_ANGLE + (MAX_ANGLE - MIN_ANGLE) * random(1);
    float originalColor = 256/2;
    double defaultAngle = MIN_DEFAULT_ANGLE + (MAX_DEFAULT_ANGLE - MIN_DEFAULT_ANGLE)*random(1);
    double defaultAngleStart = MIN_DEFAULT_ANGLE + (MAX_DEFAULT_ANGLE - MIN_DEFAULT_ANGLE)*random(1);
    double defaultAngleEnd = MIN_DEFAULT_ANGLE + (MAX_DEFAULT_ANGLE - MIN_DEFAULT_ANGLE)*random(1);
    
    float MIN_TWEEN_DURATION = 3;
    float MAX_TWEEN_DURATION = 5;
    final int MOUSE_MODE     = 0;
    final int AUTO_MODE      = 1;
    int currentMode          = AUTO_MODE;
     
    void setup()
    {
        size(STAGE_WIDTH, STAGE_HEIGHT, P2D);
        frameRate(500); //jawzt
        background(random(250), random(250), random(250));
        strokeWeight(1);
        
        tabAngles      = new double[NB_SQUARES];
        tabDeltaAngles = new double[NB_SQUARES];     
  
        tabColorsR     = new float[NB_SQUARES];
        tabColorsG     = new float[NB_SQUARES];
        tabColorsB     = new float[NB_SQUARES];
        tabAngleSpeed = new double[NB_SQUARES];
        
        tabAngles[0] = originalRotation;
        tabColorsR[0] = (random(255));
        tabColorsG[0] = (random(255));
        tabColorsB[0] = (random(255));
        for(int i = 0; i < NB_SQUARES; i++)
        {  
           tabAngles[i] = tabAngles[0] + i * defaultAngle;
           tabAngleSpeed[i] = 0;
        }
    }
   
    void changeAngle()
    {
      tabColorsR[0] += 10*(1 - random(6));//jawzt
      tabColorsG[0] += 10*(1 - random(1));
      tabColorsB[0] += 10*(1 - random(6));
      switch(currentMode)
      {
        case AUTO_MODE:
          tabAngles[0] = tweenValue((float)tabAngles[0], (float)originalRotation, random(.1));
          if(abs((float)tabAngles[0] - (float)originalRotation) < .000001)
          {
              tabAngles[0] = originalRotation;
              originalRotation = MIN_ANGLE + (MAX_ANGLE - MIN_ANGLE) * random(1);
          }
          defaultAngle = tweenValue((float)defaultAngle, (float)defaultAngleEnd, random(.2));
          if(abs((float)defaultAngle - (float)defaultAngleEnd) < .00001)
          {
              defaultAngleEnd = MIN_DEFAULT_ANGLE + (MAX_DEFAULT_ANGLE - MIN_DEFAULT_ANGLE)*random(1);
          }
          break;
        case MOUSE_MODE:
          tabAngles[0] = MIN_ANGLE + (MAX_ANGLE - MIN_ANGLE) * mouseX / STAGE_WIDTH;
          defaultAngle = MIN_DEFAULT_ANGLE + (MAX_DEFAULT_ANGLE - MIN_DEFAULT_ANGLE) * mouseY / STAGE_HEIGHT;
          break;
        default:
          print("unexpected case");
          break;
      }
      
      for(int i = 1; i < NB_SQUARES; i++)
      {
        double prevAngle = tabAngles[i-1];
        double currAngle = tabAngles[i];
        tabDeltaAngles[i] = prevAngle - currAngle;
        tabAngleSpeed[i] = (tabDeltaAngles[i] + defaultAngle) * ANGLE_FRICTION;
                        
        if(tabAngleSpeed[i] > MAX_ROTATION_SPEED)
        {
          tabAngleSpeed[i] = MAX_ROTATION_SPEED;
        }else if(tabAngleSpeed[i] < -MAX_ROTATION_SPEED)
        {
          tabAngleSpeed[i] = -MAX_ROTATION_SPEED;
        }
        tabAngles[i] += tabAngleSpeed[i];
        
        tabColorsR[i] += (tabColorsR[i-1] - tabColorsR[i]) + 0x000003;
        tabColorsG[i] += (tabColorsG[i-1] - tabColorsG[i]) + 0x000003;
        tabColorsB[i] += (tabColorsB[i-1] - tabColorsB[i]) + 0x000003;
      }
    }
 
    void draw()
    {      
      background(0,0,235); //jawzt
      translate(CENTER_STAGE.x, CENTER_STAGE.y);
      changeAngle();
     
      for(int i = NB_SQUARES-1; i >= 0; i--)
      {        
        stroke(0); 
        fill(tabColorsR[i], tabColorsG[i], tabColorsB[i]);
      
        double myRadius = RADIUS_MIN + i * RADIUS_STEP;
        double myAngle = tabAngles[i];
        double cosAngle = myRadius * Math.cos(myAngle);
        double sinAngle = myRadius * Math.sin(myAngle);

        rotate((float)myAngle);
        rectMode(CENTER);
        rect(0, 0, (float)myRadius, (float)myRadius);
      }
    }
    
    void mousePressed()
    {
      currentMode = (currentMode == MOUSE_MODE) ? AUTO_MODE : MOUSE_MODE;
    }
    
    public float tweenValue(float p_from, float p_to, float factor) 
    {
      float result = p_to - p_from;
      result *= factor;
      result += p_from;
      return result;
    }
