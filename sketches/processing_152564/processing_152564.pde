
ArrayList<Component> components;
ArrayList<Component> creationList;
ArrayList<Component> destroyList;

abstract class Component
{
    color componentColor;
    PVector position;
    PVector velocity;
    
    abstract void draw();
    
    Component(float x, float y)
    {
        this.position = new PVector(x, y);
        this.velocity = new PVector(0, 0);
    }
    
    void update()
    {
        this.position.add(velocity);
    }
    
    void setVelocity(float x, float y)
    {
        this.velocity.x = x;
        this.velocity.y = y;
    }
    
    void setPosition(float x, float y)
    {
        this.position.x = x;
        this.position.y = y;
    }
    
    void destroy()
    {
        destroyList.add(this);
    }
}

class AnimatedBlip extends Component
{
    /* Blip will radiate from its center until it reaches this 
    radius, at which point it will dissapear */
    float maxRadius; 
    
    /* How many frames have already been played */
    float count;
    
    /* The opacity of this blip will decrease by this amount each 
    time update is called, until it dissapears */
    float opacityDelta;
    
    /* The current opacity of this blip */
    float opacity;
    
    /* The radius of this blip will increase by this amount each 
    time update is called, until it reaches maxRadius */
    float radiusDelta;
    
    /* The current radius of this blip */
    float radius;
    
    AnimatedBlip(float x, float y)
    {
        super(x, y);
    }
    
    void update()
    {
        super.update();
        updateRadius();
        if (updateOpacity())
            destroy();
    }
    
    boolean updateRadius()
    {
        this.radius += radiusDelta;
        this.radius = (radius > maxRadius) ? maxRadius : radius;
        return (radius >= maxRadius);
    }
    
    boolean updateOpacity()
    {
        this.opacity -= opacityDelta;
        this.opacity = (opacity < maxRadius) ? 0 : opacity;
        return (opacity <= 0);
    }
}

// setup function called initially, only once
void setup() 
{
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

// Draw function called once per frame
void draw() 
{
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) 
  { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else 
  {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
