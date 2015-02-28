
ParticleEmitter emitter;

void setup()
{
    size(1280, 720, P2D);
    frameRate(60);
    emitter = new ParticleEmitter(8000);
}

void draw()
{
    background(0);

    emitter.fire();
}

class Particle {
    
    PVector m_position;
    PVector m_acceleration;
    PVector m_velocity;

    int     m_age;
    float   m_lifespan;
    boolean m_dead;

    int     m_color;
    float   m_radius;

    float   m_multiplier;

    Particle(){}

    Particle( PVector position )
    {
        m_position = position;
        m_acceleration = new PVector();
        m_velocity = new PVector( random(-7, 7), random(-7, 7) );

        m_multiplier = 30;

        m_color = 255;
        m_radius = 0.5f * m_multiplier;

        m_lifespan = 100.0f * m_multiplier;
    }

    void update()
    {
        if( m_lifespan > 0.0 ) {

            m_velocity.add( m_acceleration );
            m_position.add( m_velocity );

            m_lifespan -= 0.5f;
            
            m_color = (int)map(m_lifespan, 1, m_lifespan, 0, 255);

            if( m_radius > 0.01 ) {
                m_radius = m_radius - 0.01 * m_multiplier;
            }
        }

        m_lifespan -= 0.1f * m_multiplier;
    }

    void draw()
    {
        pushStyle();
          noStroke();
          fill( m_color );
          ellipse( m_position.x, m_position.y, m_radius, m_radius );
        popStyle();
    }

    void emit()
    {
        update();
        draw();
    }

    boolean isDead() {
        if(m_lifespan < 0.0) {
            return true;
        } else {
            return false;
        }
    }
}

class ParticleEmitter {

    ArrayList<Particle> m_particles;

    ParticleEmitter(){}

    ParticleEmitter(int numberOfParticles)
    {
        m_particles = new ArrayList();

        for( int i = 0; i < numberOfParticles; i++) {
            
            m_particles.add( new Particle( new PVector( random(-180, 180)+width/2, random(-180, 180)+height/2 ) ) );
        }
    }

    void fire()
    {
        for( Particle p: m_particles ) {
            p.emit();
        }
    }
}
