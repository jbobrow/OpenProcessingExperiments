
// TODO: Move PID loop to the microcontroller once hardware is set up

public class Actuator {
  public float length;
  public float goalLength;
  public float speed;
  
  public float maxLength;
  public float minLength;
  public float maxSpeed;
  
  public PID control;
  public float power;
  
  private float drift; 
  private float noise;
  
  Actuator(float imaxLength, float iminLength, float imaxSpeed) {
    this.maxLength = imaxLength;
    this.minLength = iminLength;
    this.maxSpeed = imaxSpeed;
    this.length = (this.maxLength - this.minLength) / 2 + this.minLength;  // Default to half-extended
    //this.length = this.minLength;
    this.goalLength = this.length;
    
    this.noise = 0;
    this.drift = 0;
    
    //this.control = new PID(.1,.00001,0,10);
    this.control = new PID(.1*this.maxSpeed, .0001*this.maxSpeed, 0, 10*this.maxSpeed);
    this.power = 0;
  }
  
  boolean setPos(float goal) {
    if(goal > this.minLength && goal < this.maxLength) {
      this.goalLength = goal;  
      return true;
    }
    else
      return false;
  }
  
  boolean possible(float goal) {
    if(goal > this.minLength && goal < this.maxLength)
      return true;
    else
      return false;
  }      
  
  void setDrift(float d) {
    this.drift = d;  
  }
  void setNoise(float n) {
    this.noise = n;
  }
  
  void updatePos() {
    this.length += this.drift;
    this.power = control.update(this.length, this.goalLength);
    if(abs(this.power) > this.maxSpeed)
      this.power = (this.power < 0 ? -1 : 1) * this.maxSpeed;
    this.power *= (1-random(0,this.noise));
    this.length += this.power;
  }
  
  PGraphics draw(float xscale, float yscale) {
      PGraphics i = createGraphics(int(this.maxLength * xscale * 1.2), int(yscale * 3 * 1.2), JAVA2D);
      i.beginDraw();
      i.smooth();
      i.colorMode(HSB);   
      // Draw max extension
      i.noFill();
      i.stroke(0,0,255); //white
      i.strokeWeight(1);
      i.rect(0, 0, this.maxLength * xscale, yscale);

      // Draw current length
      i.noStroke();
      i.fill(70,140,220);  // light green
      i.rect(0,0, this.length*xscale, yscale);

      // Draw line at goal
      i.stroke(150,140,220); // light blue
      i.strokeWeight(1);
      i.line(this.goalLength * xscale, 0, this.goalLength*xscale, 3*yscale);
      
      // Draw body outline
      i.fill(0,0,50);  // light red
      i.noStroke();
      i.rect(0,0, this.minLength * xscale, 3 * yscale);
      
      // Draw power meter
      i.pushMatrix();
      i.translate(1.5*yscale, 1.5*yscale);
      i.noFill();
      i.stroke(0,0,255);
      i.ellipse(0, 0, yscale*3, yscale*3);
      if(this.power < 0)
        i.fill(0,150,255);
      else
        i.fill(80,150,255);
      i.noStroke();
      pushMatrix();
      if(this.power < 0) i.scale(1,-1);
      i.arc(0, 0, yscale*3, yscale*3, PI, abs(this.power) / this.maxSpeed * PI + PI);
      popMatrix();
      
      i.endDraw();
      return i;      
  }
    
}

