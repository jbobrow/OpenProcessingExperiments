
int NUM_GENES = 20;
float EAT_COLOR_RANGE = 15;
float FRICTION = 0.99;
float MAX_VELOCITY = 10;
float[] baseMutationRate = new float[NUM_GENES];
float SUICIDE_RATE = 800;
int MAX_PLANTS = 1600;
int MAX_ANIMALS = 500;
int NUM_PLANTS = 0;
int NUM_ANIMALS = 0;
float MAX_LIFE = 10000;

color AVERAGE_ANIMAL_COLOR = color(0,0,0);
color AVERAGE_PLANT_COLOR = color(0,0,0);

ArrayList ORGANISMS = new ArrayList();

class Org
{
    public float[] m_genome = new float[NUM_GENES];
    public float m_energy = 100.0;
    public float m_size = 0.0;
    
    public float m_age = 0.0;
    

    public color m_color = color(100, 100, 100);
    public color m_eatColor = color(100, 100, 100);    
    
    public float m_kp = 1.0;
    public float m_kd = 0.1;
    public float m_ki = 0.0;
    public float m_reproductionThreshold = 1000;
    public float m_energyGiven = 0.4;
    public float m_biteForce = 100;
    public int m_babiesToProduce = 4;
    public float m_dispersalRate = 1.0;
    
    public PVector m_position = new PVector(0,0,0);
    public PVector m_velocity = new PVector(0,0,0);
    public PVector m_prevDiff = new PVector(0,0,0);
    public PVector m_sumDiff = new PVector(0,0,0);
    public boolean m_isPlant = false;
    public boolean m_isDead = false;
    public PVector rotation = new PVector(0, 0, 0);
    public int m_numBabies = 0;
    Org m_target = null;
    
    public Org(float[] genome, boolean isPlant)
    {
        for(int i = 0; i < NUM_GENES; i++)
        {
            m_genome[i] = genome[i];   
        }
        
        m_isPlant = isPlant;
        ApplyGenome();
        rotation = new PVector(random(-3.14, 3.14), random(-3.14, 3.14), random(-3.14, 3.14));
        
        if(isPlant)
        {
            NUM_PLANTS++;  
        }
        else
        {
            NUM_ANIMALS++;  
        }
        
    }
    
    public void ApplyGenome()
    {
        m_size = min(max(m_genome[0] - m_genome[2] + m_genome[3] * m_genome[4], 0.0), 10000);
        m_color = color(min(max(m_genome[2] * 255, 0), 255) , min(max(m_genome[3] * 255, 0), 255) , min(max(m_genome[4] * 255, 0), 255), 255);
        m_eatColor = color(min(max(m_genome[5] * 255.0, 0), 255) ,min(max(m_genome[6] * 255.0, 0), 255), min(max(m_genome[7] * 255.0, 0), 255), 100);
        m_kp = min(max(m_genome[8] * m_genome[11], 0.0), 100);
        m_kd = min(max(m_genome[9] * m_genome[11], 0.0), 100);
        m_ki = min(max(m_genome[10] * m_genome[11], 0.0), 100);
        m_energyGiven = min(max(m_genome[12], 0.5), 1.0);
        m_reproductionThreshold = min(max(m_genome[13], 100), 10000);
        m_biteForce = min(max(m_genome[14] * m_size, 0), 10000);
        m_babiesToProduce = min(max((int)m_genome[15], 0), 10);
        m_dispersalRate = m_genome[15];
        if(m_reproductionThreshold < 10)
        {
            m_reproductionThreshold = 10;   
        }
    }
    
    public void Mutate()
    {
        for(int i = 0; i < NUM_GENES; i++)
        {
            m_genome[i] = m_genome[i] + m_genome[i] * random(-baseMutationRate[i], baseMutationRate[i]) + random(-0.001, 0.001);
            
            if((int)random(0, 20) == 2)
            {
                m_genome[i] = random(0, m_genome[i] * 2);   
            }
        }   
        ApplyGenome();
    }
    
    public Org Reproduce(float energyGiven)
    {
        if(m_isDead || m_energy < 1)
        {
            return null;   
        }
        
        Org baby = new Org(m_genome, m_isPlant);
        baby.Mutate();
        
        baby.m_position = new PVector(this.m_position.x, this.m_position.y, this.m_position.z);
        baby.m_position.add(new PVector(random(-m_size * m_dispersalRate, m_size * m_dispersalRate), random(-m_size * m_dispersalRate, m_size * m_dispersalRate), random(-m_size * m_dispersalRate, m_size * m_dispersalRate)));
        energyGiven = max(min(energyGiven, 0.5), 0.0);
        
        baby.m_energy = m_energy * energyGiven;
        m_energy = m_energy * (1.0 - energyGiven) * 0.8;
        
        if(m_energy < 1)
        {
            m_isDead = true;    
        }
        
        if(baby.m_energy < 1)
        {
            baby.m_isDead= true;   
        }
        
        return baby;
    }
    
    
    public void SetTarget(Org target)
    {
        m_target = target;
        m_sumDiff = new PVector(0,0,0);
        m_prevDiff = new PVector(0,0,0);   
    }
    
    public void UpdateForces()
    {
        PVector force = new PVector(random(-0.5, 0.5), random(-0.5, 0.5), random(-0.5, 0.5));
        if(m_target != null)
        {
            PVector diff = new PVector(m_target.m_position.x - m_position.x, m_target.m_position.y - m_position.y, m_target.m_position.z - m_position.z);
            PVector dDiff = new PVector(diff.x - m_prevDiff.x, diff.y - m_prevDiff.y, diff.z - m_prevDiff.z);
            m_prevDiff = new PVector(diff.x, diff.y, diff.z);
            m_sumDiff.add(diff);
            
            PVector scaledSumDiff = new PVector(m_sumDiff.x, m_sumDiff.y, m_sumDiff.z);
            
            scaledSumDiff.mult(m_ki);
            dDiff.mult(m_kd);
            diff.mult(m_kp);
            
            force.add(diff);
            force.add(dDiff);
            force.add(scaledSumDiff);
            
        }   
        
        m_velocity.add(force);
        
        if(m_velocity.mag() > MAX_VELOCITY)
        {
            m_velocity.normalize();
            m_velocity.mult(MAX_VELOCITY);   
        }
        
        m_velocity.mult(FRICTION);
        
        m_position.add(m_velocity);
        
        
    }
    
    public void SearchForTarget()
    {
        if(m_target == null || m_target.m_isDead)
        {
            m_target = null;
        }   
        
        if(m_target == null)
        {
            float closestDist = 100000;
            Org closest = null;
            for(int i = 0; i < ORGANISMS.size(); i++)
            {
                Org org = (Org)ORGANISMS.get(i);
                
                if(org == this)
                {
                    continue; 
                }   
                else
                {
                    if(Eats(org))
                    {
                        float di =  m_position.dist(org.m_position);
                        
                        if(di < closestDist && (int)(random(0, 3)) == 1) 
                        {
                            closest = org;
                            closestDist = di;
                        }
                    }
                }
            }
            
            SetTarget(closest);
        }
    }
    
    public boolean Eats(Org other)
    {
        float colorDiff = abs(red(m_eatColor) - red(other.m_color)) + abs(green(m_eatColor) - green(other.m_color)) + abs(blue(m_eatColor) - blue(other.m_color));   
        return colorDiff < EAT_COLOR_RANGE;
    }
    
    public ArrayList GetCollisions()
    {
        ArrayList toReturn = new ArrayList();
        for(int i = 0; i < ORGANISMS.size(); i++)
        {
            Org org = (Org)ORGANISMS.get(i);
            
            if(this == org)
            {
                continue;   
            }
            
            if(org.m_position.dist(m_position) < (m_size + org.m_size) / 2.0)
            {
                toReturn.add(org);   
            }
        }  
       
       return toReturn; 
    }
    
    public void EatCollisions()
    {
        ArrayList collisions = GetCollisions();
     
        for(int i = 0; i < collisions.size(); i++)
        {
            Org org = (Org)collisions.get(i);
            if(Eats(org))
            {
                if(m_biteForce < 0)
                {
                    m_biteForce = 0;   
                }
                
                org.m_energy -= m_biteForce * random(1.0, 1.01) + org.m_energy * random(0, 0.5);
                m_energy += org.m_size * random(0.3, 1.01) + org.m_energy * random(0, .5);   
                org.m_size -= m_biteForce * random(0.01, 0.02);
                
                if(org.m_size < 0)
                {
                    org.m_size = 0; 
                    org.m_isDead = true;   
                }
                
                m_velocity.mult(0.1);
                
            }
        }   
    }
    
    public void Update()
    {
        
        // random chance to die of disease
        if((int)random(0, 10000) < m_size)
        {
            m_isDead = true;   
        }
        
        
        // Dying from no energy.
        if(m_energy < 0.0 || m_size < 1)
        {
            m_isDead = true;   
        }
        
        
        if(m_isDead)
        {
            return;   
        }
        
        if(m_position.x > MAX_X)
        {
            m_position.x = MAX_X;   
            m_velocity.x *= -1;
        }
        else if(m_position.x < MIN_X)
        {
            m_position.x = MIN_X;
            m_velocity.x *= -1;   
        }
        
        if(m_position.y > MAX_Y)
        {
            m_position.y = MAX_Y; 
            m_velocity.y *= -1;  
        }
        else if(m_position.y < MIN_Y)
        {
            m_position.y = MIN_Y;   
            m_velocity.y *= -1;
        }
        
        if(m_position.z > MAX_Z)
        {
            m_position.z = MAX_Z;
            m_velocity.z *= -1;   
        }
        else if(m_position.z < MIN_Z)
        {
            m_position.z = MIN_Z;   
            m_velocity.z *= -1;
        }
        
        m_age += random(1, 2);
        
        if(!m_isPlant)
        {
            UpdateForces();

            // Gestation period
            if(m_age < 20)
            {
                m_size += random(0, 0.01);
                return;   
            }
        
            SearchForTarget();
            EatCollisions();
            m_energy -= m_size * random(0, 0.01) *  m_velocity.mag()  + random(0, 0.001)*(m_size * m_size * m_size);
        }
        else
        {
            // Gestation period
            if(m_age < 100)
            {
                m_size += random(0, 0.01);
                return;   
            }
            
            m_energy += random(1, 5) * m_size;  
            m_energy -= random(1, 2);
        }
        
        // Reproduction.
        if(m_energy > m_reproductionThreshold)
        {
            for(int i = 0; i < m_babiesToProduce; i++)
            {
                if(m_isPlant && NUM_PLANTS > MAX_PLANTS)
                {
                    continue;
                }
                else if (!m_isPlant && NUM_ANIMALS > MAX_ANIMALS)
                {
                    continue;
                }
                
                m_numBabies ++;
                
                Org bab = Reproduce(m_energyGiven);
                
                if(bab != null)
                ORGANISMS.add(bab);  
            } 
        }
        
        // Arbitrary, limits growth.
        if(m_numBabies > 10)
        {
            m_isDead = true;   
        }
        
        // Another check to make sure.
        if(m_energy < 0.0)
        {
            m_isDead = true;   
        }
        
        if(m_energy > MAX_LIFE)
        {
            m_energy = MAX_LIFE;   
        }
        
        if(m_age > SUICIDE_RATE)
        {
            m_isDead = true;   
        }
        
    }
    
    public void Render()
    {
        if(m_isDead)
        {
            return;    
        }
        
        if(m_target != null)
        {
            stroke(m_eatColor);
            PVector diff = new PVector(m_target.m_position.x, m_target.m_position.y, m_target.m_position.z);
            diff.sub(m_position);
            
            if(diff.mag() > 20)
            {
                diff.normalize();
                diff.mult(20);
            }
            line(m_position.x, m_position.y,m_position.z,
                 m_position.x + diff.x,
                 m_position.y + diff.y,
                 m_position.z + diff.z);    
        }
        
        pushMatrix();
        fill(m_color);
        noStroke();
        translate(m_position.x, m_position.y, m_position.z);
        rotateX(rotation.x);
        rotateY(rotation.y);
        rotateZ(rotation.z);
        
        if(m_isPlant)
            ellipse(0, 0, m_size * min((SUICIDE_RATE / (m_age * 5.5)), 1.0), m_size * min((SUICIDE_RATE / (m_age * 5.5)), 1.0));
        else
            box(m_size);
        
        popMatrix();   
    }
    
}

