
public class Ball {
  float XPOS;
  float YPOS;
  float X0;
  float Y0;
  float theXRadius;
  float theYRadius;
  float theMass;
  float milDeductTime = 0;
  float VY0;
  
  
  public Ball(float X, float Y, float V0, float Xrad, float Yrad, float mass){
    X0 = X;
    Y0 = Y;
    VY0 = V0;
    theXRadius = Xrad;
    theYRadius = Yrad;
    theMass = mass;
  }
  
  public float[] getInitalValues(){
    float[] values = new float[3];
    values[0] = X0;
    values[1] = Y0;
    values[2] = VY0;
    
    return values;
    
  }  
  
  public float[] getBallProperties(){
    float[] values = new float[3];
    values[0] = theXRadius;
    values[1] = theYRadius;
    values[2] = theMass;
    
    return values;
    
  }   
  
    public float[] getBallPosition(){
    float[] values = new float[2];
    values[0] = XPOS;
    values[1] = YPOS;
    
    return values;
    
  }  
  
  public void setPosition(float X, float Y){
    
   XPOS = X;
   YPOS = Y;   
  
  }
  
    public void setRadius(float X, float Y){
    
   theXRadius = X;
   theYRadius = Y;   
  
  }
  
  public void setInitialValues(float X, float Y, float V){
    
   X0 = X;
   Y0 = Y;   
   VY0 = V; 
  
  }
  
   public void setYVelocity(float V){
    
   VY0 = V;
  
  }
  
  public float getYVelocity(float Time, float g){

    return (float) VY0 + g*Time;
    
  }
  
  public float getFreeFallTime(boolean reset){
    
      if (!reset){
      return (float) (millis() - milDeductTime)/1000;
      } else {
      milDeductTime = millis();
      return (float) (millis() - milDeductTime)/1000;
      }
  }
  

}

 Ball myBall = new Ball(100,50,0,20,20,1);
 float[] ballProperties = myBall.getBallProperties();

void setup() {
  
  size(300, 300);
  background(0);
  fill(100);
  

}
float gravity = 200;
float[] ballPosition;
float newXPOS;
float newYPOS;
float Time;

void draw(){
  ellipseMode(RADIUS);
  background(0);

  ballPosition = myBall.getBallPosition();
  float[] initialValues = myBall.getInitalValues();
  
  Time = myBall.getFreeFallTime(false);
  println("Time:  "+Time);
  
 // println(ballProperties[1]);
  
  newXPOS = (float) initialValues[0];
  
  
  if (((ballPosition[1] + ballProperties[0]) > 297) && ((ballPosition[1] + ballProperties[0]) < 303)){ 

    myBall.setInitialValues(ballPosition[0], ballPosition[1]-5, -1*myBall.getYVelocity(Time,gravity) + 7);
    Time = myBall.getFreeFallTime(true);
    
    for(float index = 0; index < .05656; index = index + 0.001){
      ballProperties[1] = 20*((25*index-.707)*(25*index-.707) + 0.5);
      
////DELAY?
        
      ellipse(ballPosition[0], ballPosition[1], ballProperties[0], ballProperties[1]);
      println(ballProperties[1]);
    }
    println("-------------BOUNCE-------------");
  } else {
    ballProperties = myBall.getBallProperties();  
  }
  
  
  newYPOS = (float) initialValues[1] + (float) initialValues[2]*Time +  (float) .5*gravity*Time*Time;
  
  println("VY0:"+initialValues[2]+"        YPOS: "+newYPOS);
      println();
      println("instVelocity:  "+myBall.getYVelocity(Time, gravity));

  myBall.setPosition(newXPOS, newYPOS);
  ellipse(ballPosition[0], ballPosition[1], ballProperties[0], ballProperties[1]);  
  
  

}


