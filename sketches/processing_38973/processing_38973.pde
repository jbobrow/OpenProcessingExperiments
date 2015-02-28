


/**
 * A Boid is a Element of the Flock.
 * @author Gruppe -> Patrik Schulze
 */
 
 //Class of the Boids
public class Boid
{
    private float           auraF         = 5.0f;           // the aura factor used for rules
    private float           maxSpeed      = 2;              // the maximalspeed to be used
    private float           maxSteerForce = 0.5f;           // the maximal steering force
    private int             mySize;                         // the size of the boid 
    private int             myColor;                        // the color of the boid
    private float           maxDistanceF;                   // the maxDistance which is used for collide etc...
    private PVector         speed         = new PVector();  // the speed which is added to acc for movement
    private PVector         acc;                            // the acc is used for movement
    private float           alignmentF;                     // the factor of aligment 
    private float           cohesionF;                      // the factor of cohesion
    private PApplet         parent;                         // the PApplet of main holder
    private PVector         position;                       // the Positionvector of the boid
    private float           seperationF;                    // the factor of seperation
    private final static int   maxSize=10;                  // the maximal size of the boid
    private ArrayList theList;                              // the ArraList of boids      
    
    //Constructor of a Boid
    public Boid(PApplet _parentApplet, ArrayList _theList) 
    {
        setParent(_parentApplet);//sets parent to given PApplet

        setPosition(new PVector(getParent().random(getParent().width),getParent().random(getParent().height)));//setting a Start position of the boid randomly
        theList      = _theList;  //sets the list to the given one
        speed        = new PVector(getParent().random(-1, 1), getParent().random(-1, 1)); //initialize the speed
        acc          = new PVector(0, 0);//initialize the acc 
        maxDistanceF = 30;  
        seperationF  = 1;
        alignmentF   = 1;
        cohesionF    = 1;
    }

    /** Sets the Color for this particular Boid */
    public void setColor(int myColor)
    {
        this.myColor = myColor;
    }
  
    /** Intern Processing */
    public void setParent(PApplet parent)
    {
        this.parent = parent;
    }

    /** Sets the Position for this particular Boid */
    public void setPosition(PVector position)
    {
        this.position = position;
    }
    
    /** Sets the Size for this particular Boid */
    public void setSize(int _size)
    {
        this.mySize = _size;
    }

    /** Gets the Color of this particular Boid */
    public int getColor()
    {
        return myColor;
    }

    /** Sets the auraFactor for this particular Boid */
    public void setAuraF(float auraF)
    {
        this.auraF = auraF;
    }

    /** Intern Processing */
    public PApplet getParent()
    {
        return parent;
    }

    /** Gets the Position of this particular Boid */
    public PVector getPosition()
    {
        return position;
    }

    /** Gets the Size of this particular Boid */
    public int getSize()
    {
        return mySize;
    }

    /** Sets the alignment Factor for this particular Boid */
    public void setAlignmentF(float alignmentF)
    {
        this.alignmentF = alignmentF;
    }

    /** Sets the cohesion Factor for this particular Boid */
    public void setCohesion(float cohesionI)
    {
        this.setCohesionF(cohesionI);
    }

    /** Sets the seperation Factor for this particular Boid */
    public void setSeperationI(float seperationI)
    {
        this.setSeperationF(seperationI);
    }


    /**
     * @return the cohesianF
     */
    public float getCohesionF()
    {
        return cohesionF;
    }

    /**
     * @param cohesianF the cohesianF to set
     */
    public void setCohesionF(float cohesionF)
    {
        this.cohesionF = cohesionF;
    }

    /**
     * @return the seperationF
     */
    public float getSeperationF()
    {
        return seperationF;
    }

    /**
     * @param seperationF the seperationF to set
     */
    public void setSeperationF(float seperationF)
    {
        this.seperationF = seperationF;
    }

    /**
     * @return the aligmentI
     */
    public float getAligmnentF()
    {
        return alignmentF;
    }

    /**
     * @return the acc
     */
    public PVector getAcc()
    {
        return acc;
    }

    /**
     * @param acc the acc to set
     */
    public void setAcc(PVector acc)
    {
        this.acc = acc;
    }

    /**
     * @return the theList
     */
    public ArrayList getTheList()
    {
        return theList;
    }

    /**
     * @param theList the theList to set
     */
    public void setTheList(ArrayList theList)
    {
        this.theList = theList;
    }
    

    
    /**
    * avoid the given PVector 
    */
    public PVector avoidElement(PVector objPos)
    {
        PVector sepPV = new PVector(0, 0);//init a new PVector
        PVector pulse;//init a new PVector for pulse 

                pulse = PVector.sub(getPosition(), objPos);//Subtracts position of actual boid from given Pvector
                pulse.normalize();//normalize it ||
                pulse.div(PVector.dist(getPosition(), objPos));//Divides the vector by a scalar by actual boid from given Pvector 
                sepPV.add(pulse);//add the pulse to seperation
       return sepPV;
    }
    
/**
* Makes the boids in aura*MaxdistanceF go with  the same speed in the same direction
*/
public PVector alignment()
{
        PVector velSum = new PVector(0, 0);
        int     count  = 0;

        for (int i = 0; i < getTheList().size(); i++)
        {
            Boid boid = (Boid) getTheList().get(i);

            if ((PVector.dist(getPosition(), boid.getPosition()) > 0) && (PVector.dist(getPosition(), boid.getPosition()) <=  maxDistanceF* auraF))
            {
                velSum.add(boid.speed);
                count++;
            }
        }

        if (count > 0)
        {
            velSum.div((float) count);
            velSum.limit(maxSteerForce);
        }

        return velSum;
    }
    
    
/**
* Makes the boids in aura*MaxdistanceF stick together
*/
    public PVector cohesion()
    {
        PVector posSum = new PVector(0, 0),
                steer  = new PVector(0, 0);
        int     count  = 0;

        for (int i = 0; i < getTheList().size(); i++)
        {
            Boid b = (Boid) getTheList().get(i);

            if ((PVector.dist(getPosition(), b.getPosition()) > 0) && (PVector.dist(getPosition(), b.getPosition()) <= maxDistanceF * auraF))
            {
                posSum.add(b.getPosition());
                count++;
            }
        }

        if (count > 0)
        {
            posSum.div((float) count);
        }

        steer = PVector.sub(posSum, getPosition());
        steer.limit(maxSteerForce);

        return steer;
    }
    
    
/**
* makes the boids in aura*MaxdistanceF  avoid each other
*/
    public PVector seperation()
    {
        PVector avgPv = new PVector(0, 0);
        PVector repulse;

        for (int i = 0; i < getTheList().size(); i++)
        {
            Boid boid = (Boid) getTheList().get(i);
           
            if ((PVector.dist(getPosition(), boid.getPosition()) > 0) && (PVector.dist(getPosition(), boid.getPosition()) <= maxDistanceF * auraF))
            {
                repulse = PVector.sub(getPosition(), boid.getPosition());
                repulse.normalize();
                repulse.div(PVector.dist(getPosition(), boid.getPosition()));
                avgPv.add(repulse);
                //acc.add(PVector.mult(avoidElement(boid.position), boid.size/2));
            }
        }

        return avgPv;
    }
  /**
  * let the boids come to the mouse
  */
    public PVector goToTheMouse(PVector objPos)
    {
        PVector steer2 = new PVector(0, 0);

        for (int i = 0; i < getTheList().size(); i++)
        {
            Boid b = (Boid) getTheList().get(i);

            steer2 = PVector.sub(objPos, getPosition());
            steer2.limit(maxSteerForce);
        }

        return steer2;
    }
  /**
  * return the rectangle around the boid
  */
    public java.awt.Rectangle getBoidRect()
    {
        return new java.awt.Rectangle((int)position.x,(int)position.y,mySize,mySize);
    }
/**
* computes the whole stuff like mousepressed,obstacles,cohesion,separation,aligment, and sets the new position of boid
*/
    public void compute(float mousexF, float mouseyF, boolean pressed, Obstacle[] obstacles)
    {
        if (pressed)
        {
            if (((parent.mouseButton == PApplet.LEFT) && (PVector.dist(new PVector(mousexF, mouseyF), position)) < 50))
            {
                acc.add(PVector.mult(avoidElement(new PVector(mousexF, mouseyF)), 50));//avoid the mouse
            }
            else if(parent.mouseButton == PApplet.RIGHT)
            {
                acc.add(PVector.mult(goToTheMouse(new PVector(mousexF, mouseyF)), 50));//come to mouse
            }
        }
        //obstacles
        for(int i=0;i<Obstacle.TOTAL;i++)
        {

            if (obstacles[i] != null)
            {
                Obstacle obstacle = obstacles[i];
                if((getBoidRect().intersects(obstacle.getRect()))&&obstacle.feed) //if its feed and is intersected
                {
                    while(obstacle.mySize>0)
                    {
                      //decrease obstacle size
                      obstacle.mySize--;
                    }
                    
                    if(mySize<maxSize)
                    {
                      mySize++;//add to size of boid
                    }
                }
                
                if(obstacle.mySize==0)
                {
                  obstacles[i]=null;
                }
                
                if(obstacle.feed)//if its feed
                {
                    if (PVector.dist(obstacle.pos, position) <=80 )//and distance is <=80
                    {
                        acc.add(PVector.mult(goToTheMouse(new PVector(obstacle.pos.x+obstacle.mySize,obstacle.pos.y+obstacle.mySize)),10));//go to the feed and yum yum
                    }
                }
                else //if no feed
                {
                    if (PVector.dist(obstacle.pos, position) <=obstacle.mySize )//if ibstacle is hit..
                    {
                        acc.add(PVector.mult(avoidElement(obstacle.pos), 50));//avoid it with aura 50
                    }
               }
            }
        }

        getAcc().add(PVector.mult(alignment(), getAligmnentF()));
        getAcc().add(PVector.mult(cohesion(), getCohesionF()));
        getAcc().add(PVector.mult(seperation(), getSeperationF()));
        speed.add(getAcc());
        speed.limit(maxSpeed);
        getPosition().add(speed);
        getAcc().mult(0);
    }


}


