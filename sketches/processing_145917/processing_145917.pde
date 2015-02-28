
final int NMUELLES = 4;

final int Tam_Vent_X = 630, Tam_Vent_Y = 100;
float[] vE = new float[Tam_Vent_X];             // Energia del sistema (t)

int lmuelle = 60;                               // Longitud del muelles                     
int t = 0;

final Vector GRAVITY_EARTH = new Vector(0, 9.8, 0);


void setup() {
    size(640, 1024);

    for (int i = 0; i < NMUELLES; i++) {
        Spring s = new Spring(new Vector(width*0.5 + (i+1)*lmuelle, height*0.3), 15);
        if (i > 0) {
            s.previous = (Spring)particleArray.get(i-1);

            if (i < NMUELLES)
                s.previous.next = s;
        }
    }

    for (int i = 0; i < NMUELLES; i++) {
        Spring s = (Spring)particleArray.get(i);
        print(s + " prev: " + s.previous + "\n" + s + " next: " + s.next + "\n");
    }
}

void draw() {
    background(255); 
    float Etotal = 0;
    float velocity_acumulator = 0;

    for (int i = 0; i < particleArray.size(); i++) {
        Particle p = particleArray.get(i);
        if (i == 0)
            ((Spring)p).previous_position = ((Spring)p).fixed_point.get();
        if (((Spring)p).next != null)
            ((Spring)p).next.previous_position     = ((Spring)p).position.get();
        p.step();
        p.draw();
        velocity_acumulator += p.velocity.magSq(); // Velocidad al cuadrado
    }


    vE[t] =  particleArray.get(0).mass/2.0 * velocity_acumulator; // Se supone todos los extremos con la misma masa
    text("E " + vE[t], 300, 300); 

    plot_func(t, 5, 5, Tam_Vent_X, Tam_Vent_Y);
    t = (t + 1)%Tam_Vent_X;
}

void mousePressed() {
}

void mouseReleased() {
}

void plot_func(int time, int cx, int cy, int rx, int ry) {
    stroke(200, 10, 0);
    strokeWeight(3);
    fill(153);
    rect(cx, cy, rx, ry);
    stroke(200, 210, 0);


    strokeWeight(1);
    stroke(255);

    for (int i=0;i<time;i++)
        point (i, Tam_Vent_Y*0.5 - (vE[i]/6.5e4)*Tam_Vent_Y) ;
}

static public class DSA {
    static class Color {
        final static int[] RED = new int[] {
            255, 0, 0
        };
        final static int[] GREEN = new int[] {
            0, 255, 0
        };
        final static int[] BLUE = new int[] {
            0, 0, 255
        };
        final static int[] MAGENTA = new int[] {
            255, 0, 255
        };
        final static int[] CYAN = new int[] {
            0, 255, 255
        };
        final static int[] BLACK = new int[] {
            0, 0, 0
        };
        final static int[] WHITE = new int[] {
            255, 255, 255
        };
        final static int[] YELLOW = new int[] {
            255, 255, 0
        };
        final static int[] ORANGE = new int[] {
            255, 127, 0
        };

        static int[] RGBshiftHUE(int[] colour, float H) {
            float R = colour[0]/255.0;
            float G = colour[1]/255.0;
            float B = colour[2]/255.0;

            float U = cos(radians(H));
            float W = sin(radians(H));

            float[] retF = new float[] {
                0, 0, 0
            };
            retF[0] = (.701*U+.168*W)*R             + (-.587*U+.330*W)*G             + (-.114*U-.497*W)*B;
            retF[1] = (-.299*U-.328*W)*R                + (.413*U+.035*W)*G                + (-.114*U+.292*W)*B;
            retF[2] = (-.3*U+1.25*W)*R                + (-.588*U-1.05*W)*G                + (.886*U-.203*W)*B;

            return new int[] {
                int(retF[0]*255), int(retF[1]*255), int(retF[2]*255)
            };
        }
    }
}

public static class Vector {
    public float x, y, z;
    private boolean is3D;

    Vector(Vector v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        is3D = true;
    }

    Vector(PVector v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        is3D = true; //?
    }
    
    Vector(float x, float y) {
        this.x = x;
        this.y = y;
        is3D = false;
        this.z = 0;
    }

    Vector(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
        is3D = true;
    }

    public PVector toPVector() {
        if (is3D)
            return new PVector(this.x, this.y, this.z);
        else
            return new PVector(this.x, this.y);
    }

    public Vector get() {
        return new Vector(this);
    }

    public void set(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    
    public void set(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public float projection(Vector v) {
        float modA = mag();
        float modB = v.mag();

        if (modA == 0 || modB == 0)
            return 0;
        else
            return ( this.dot(v)/modB );
    }

    public boolean isNormalized() {
        return ( (x*x + y*y + z*z) == 1 );
    }

    public Vector para(final float n) {
        return this.unit().mult(n);
    }

    public Vector addScaled(final Vector v, final float n) {
        return this.add(v.mult(n));
    }

    public float angleBetween(final Vector v) {
        Vector v2 = this.get();
        if ( !v2.isNormalized() )
            v2.normalize();
        if ( !v.isNormalized() )
            v.normalize();

        return acos( v2.dot(v) );
    }

    public float dot(final Vector v) {
        return (this.x*v.x + this.y*v.y + this.z*v.z);
    }

    public Vector subtract(Vector v) {
        return new Vector(x - v.x, y - v.y, z - v.z);
    }

    public Vector sub(Vector v) {
        return subtract(v);
    }

    public Vector add(Vector v2) {
        return new Vector(x+v2.x, y+v2.y, z+v2.z);
    }
    
    public static Vector add(Vector v1, Vector v2) {
        return new Vector(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
    }

    public Vector mult(float n) {
        return new Vector(x*n, y*n, z*n);
    }

    public Vector div(float n) {
        return new Vector(x/n, y/n, z/n);
    }

    public float mag() {
        return sqrt( magSq() );
    }

    public float magSq() {
        return x*x + y*y + z*z;
    }

    public Vector project(final Vector v) {
        return v.para(this.projection(v));
    }

    public void normalize() {
        float mod = this.mag();
        if (mod == 0)
            return;
        this.x /= mod;
        this.y /= mod;
        this.z /= mod;
    }

    public Vector unit() {
        Vector v = this.get();
        v.normalize();
        return v;
    }

    public String getInfo() {
        return "[x: " + this.x + ", y: " + this.y + ", z: " + this.z + "]\n";
    }
}

static float dt = 0.95; // Diferencial de tiempo

static class Integrator {
    /***********************************************************************************\
     Euler clásico o explícito
     \***********************************************************************************/
    static public void eulerExplicit(Particle part) {
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass); // Por si la posición o velocidad se ha cambiado entre steps
        /** Punto i+1 **/
        part.position     = part.position.add( part.velocity.mult(dt) );     // Utiliza velocidad en i
        part.velocity     = part.velocity.add( part.acceleration.mult(dt) ); // Utiliza aceleración en i
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
    }

    /***********************************************************************************\
     Euler semi-implícito (implícito en velocidad)
     \***********************************************************************************/
    static public void eulerSemiimplicit(Particle part) {
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass); // Por si la posición o velocidad se ha cambiado entre steps
        /** Punto i+1 **/
        part.velocity     = part.velocity.add( part.acceleration.mult(dt) ); // Utiliza aceleración en i
        part.position     = part.position.add( part.velocity.mult(dt) );     // Utiliza velocidad en i+1
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
    }

    /***********************************************************************************\
     Euler semi-implícito (implícito en aceleración)
     \***********************************************************************************/
    static public void eulerSemiimplicitAcc(Particle part) {
        /** Punto i+1 **/
        part.position     = part.position.add( part.velocity.mult(dt) );     // Utiliza velocidad en i
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
        part.velocity     = part.velocity.add( part.acceleration.mult(dt) ); // Utiliza aceleración en i+1
    }

    /***********************************************************************************\
     Euler implícito
     \***********************************************************************************/
    static public void euler_implicit(Particle part) {
        /** Punto i+1 **/
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
        part.velocity     = part.velocity.add( part.acceleration.mult(dt) ); // Utiliza aceleración en i+1
        part.position     = part.position.add( part.velocity.mult(dt) );     // Utiliza velocidad en i+1
    }

    /***********************************************************************************\
     Heun
     \***********************************************************************************/
    static public void heun(Particle part) {
        Vector[] p = new Vector[2], v = new Vector[2], a = new Vector[2];

        /** Punto i **/
        p[0] = part.position;
        v[0] = part.velocity;
        a[0] = part.forcesSummatory(p[0], v[0]).div(part.mass);

        /** Punto i+1 con pendiente de i **/
        p[1] = p[0].add( v[0].mult(dt) );
        v[1] = v[0].add( a[0].mult(dt) );
        a[1] = part.forcesSummatory(p[1], v[1]).div(part.mass);

        /** Punto i+1 con pendiente (i + i+1)/2 **/
        part.position  = part.position.add( ( v[0].add(v[1]) ).mult(dt/2) );
        part.velocity  = part.velocity.add( ( a[0].add(a[1]) ).mult(dt/2) );
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
    }

    /***********************************************************************************\
     Runge-Kutta 2
     \***********************************************************************************/
    static public void RK2(Particle part) {
        Vector[] p = new Vector[2], v = new Vector[2], a = new Vector[2];

        /** k1: Punto i**/
        p[0] = part.position;
        v[0] = part.velocity;
        a[0] = part.forcesSummatory(p[0], v[0]).div(part.mass);

        /** k2: Punto i + 1/2, con pendiente de k1 **/
        p[1] = p[0].add( v[0].mult(dt/2) );
        v[1] = v[0].add( a[0].mult(dt/2) );
        a[1] = part.forcesSummatory(p[1], v[1]).div(part.mass);

        /** Punto i+1, con pendiente de k2 **/
        part.position  = part.position.add( v[1].mult(dt) );
        part.velocity  = part.velocity.add( a[1].mult(dt) );
        part.acceleration = part.forcesSummatory(part.position, part.velocity).div(part.mass);
    }

    /***********************************************************************************\
     Runge-Kutta 4
     \***********************************************************************************/
    static public void RK4(Particle part) {
        Vector[] p = new Vector[4], v = new Vector[4], a = new Vector[4];

        /** k1: Punto i **/
        p[0] = part.position.get();
        v[0] = part.velocity.get();
        a[0] = part.forcesSummatory(p[0].get(), v[0].get()).div(part.mass);

        /** k2: Punto i + 1/2, con pendiente de k1 **/
        p[1] = p[0].add( v[0].mult(dt/2) );
        v[1] = v[0].add( a[0].mult(dt/2) );
        a[1] = part.forcesSummatory(p[1].get(), v[1].get()).div(part.mass);

        /** k3: Punto i + 1/2, con pendiente de k2 **/
        p[2] = p[0].add( v[1].mult(dt/2) );
        v[2] = v[0].add( a[1].mult(dt/2) );
        a[2] = part.forcesSummatory(p[2].get(), v[2].get()).div(part.mass);

        /** k4: Punto i + 1, con pendiente de k3 **/
        p[3] = p[0].add( v[2].mult(dt) );
        v[3] = v[0].add( a[2].mult(dt) );
        a[3] = part.forcesSummatory(p[3].get(), v[3].get()).div(part.mass);

        /** Punto en i+1, con pendiente  (k1 + 2*k2 + 2*k3 + k4)/6 **/
        part.position  = part.position.add( ( v[0].add( v[1].mult(2) ).add( v[2].mult(2) ).add( v[3] ) ).mult(dt/6) );
        part.velocity  = part.velocity.add( ( a[0].add( a[1].mult(2) ).add( a[2].mult(2) ).add( a[3] ) ).mult(dt/6) );
        part.acceleration = part.forcesSummatory(part.position.get(), part.velocity.get()).div(part.mass);
    }

    /***********************************************************************************\
     Runge-Kutta Genérico
     \***********************************************************************************/
    /*static public void RK(Particle part, const DSA::TypeAccuracy A[], const DSA::TypeAccuracy B[], unsigned n) {
        TypeAccuracy sum;
        Vector3 p[n], v[n], a[n];
        Vector3 pk_accumulator, vk_accumulator, 
        p_pendiente, v_pendiente;

        for (int i = 0; i < n; i++) {
            pk_accumulator = Vector3(0, 0, 0);
            vk_accumulator = Vector3(0, 0, 0);

            for (unsigned j = 0; j < i; j++) {
                pk_accumulator += A[i*n+j] * v[j];
                vk_accumulator += A[i*n+j] * a[j];
            }

            p[i] = part.getPosition() + pk_accumulator * dt;
            v[i] = part.getVelocity() + vk_accumulator * dt;
            a[i] = part.forcesSummatory(p[i], v[i]) / part.mass;

            p_pendiente += B[i]*v[i];
            v_pendiente += B[i]*a[i];
        }

        part.position     += p_pendiente * dt;
        part.velocity     += v_pendiente * dt;
        part.acceleration  = part.forcesSummatory(part.position, part.velocity) / part.mass;
    }*/
}


class Extremo { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 15, dt = 1.25;
  PVector gravity;
  float Ec, Ep;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.95;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Extremo(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    gravity = new PVector(0, 9.8);
  } 

  // Métodos de integracion:: A completar por el alumn@
  void update(int mode) { 
  
    switch(mode)
    {
      case 0:
        location.x = location.x + velocity.x * dt;
        location.y = location.y + velocity.y * dt;
        velocity.x = velocity.x + acceleration.x * dt;
        velocity.y = velocity.y + acceleration.y * dt;
        break;
      case 1:
        velocity.x = velocity.x + acceleration.x * dt;
        velocity.y = velocity.y + acceleration.y * dt;
        location.x = location.x + velocity.x * dt;
        location.y = location.y + velocity.y * dt;
        break;
      case 2: // Heun
        float v2x = velocity.x + acceleration.x * dt;
        float v2y = velocity.y + acceleration.y * dt;
        velocity.x = (velocity.x + v2x) / 2;
        velocity.y = (velocity.y + v2y) / 2;
        location.x = location.x + velocity.x;
        location.y = location.y + velocity.y;
        break;   
    }
    acceleration = new PVector(0, 0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  // Draw 
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175,120);
    if (dragging) {
      fill(50);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  } 

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

ArrayList<Particle> particleArray = new ArrayList<Particle>();

abstract class Particle {
    Vector position, velocity, acceleration;

    float mass;

    Particle(Vector p, float m) {
        position = p;
        mass = m;
        particleArray.add(this);

        velocity     = new Vector(0, 0);
        acceleration = new Vector(0, 0);
    }

    void step() {
        Integrator.RK4(this);
    }
    
    abstract Vector forcesSummatory(Vector position, Vector velocity);

    abstract void draw();

    void destroy() {
        particleArray.remove(this);
    }
}

class Spring extends Particle {
    float length;
    Spring previous, next;

    float ks;
    float kd;
    Vector previous_position;
    Vector fixed_point = new Vector(width*0.5, height*0.3, 0);

    Spring(Vector p, float m) {
        super(p, m);

        length = lmuelle;
        ks = 10.9;//0.52;
        kd = 0;//0.95;

        previous = null;
        next = null;
    }

    Vector forcesSummatory(Vector p, Vector v) {
        Vector previous_displacement, previous_extension, previous_restoring;

        previous_position     = (previous == null) ? fixed_point : previous.position;
        previous_displacement = p.sub(previous_position);
        previous_extension    = previous_displacement.sub( previous_displacement.unit().mult(length) );
        previous_restoring    = previous_extension.mult(-ks);

        Vector next_position, next_displacement, next_extension, next_restoring = new Vector(0, 0, 0);
        if (next != null) {
            next_position     = next.position.get();
            next_displacement = p.sub(next_position);
            next_extension    = next_displacement.sub( next_displacement.unit().mult(length) );
            next_restoring    = next_extension.mult(-next.ks);
        }

        Vector weight = GRAVITY_EARTH.mult(mass);
        Vector damping = v.mult(-kd); // Se va a oponer siempre a la velocidad

            return weight.add(damping).add(previous_restoring).add(next_restoring);
    }

    void draw() {
        stroke(0);
        strokeWeight(2);
        line(position.x, position.y, previous_position.x, previous_position.y);
        fill(175, 120);
        ellipse(position.x, position.y, mass*2, mass*2);
    }

    void destroy() {
        particleArray.remove(this);
    }
}


class SpringController { 

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.52, Epe;
  
  Extremo a;
  Extremo b;

  // Constructor
  SpringController(Extremo a_, Extremo b_, int l) {
    a = a_;
    b = b_;
    len = l;
  } 

  // Calcular la fuerza del muelle: A completar por el alumn@
  void update(){
   
   anchor = new PVector(b.location.x, b.location.y);
   PVector force_a = new PVector();
   PVector force_b = new PVector();
 
   anchor.sub(a.location);
   
   float d = sqrt(anchor.x * anchor.x + anchor.y * anchor.y);
   anchor.normalize();
   float l = d - len;
   
   
   force_a.x = k*l*anchor.x/* - a.damping * a.velocity.x*/;
   force_a.y = k*l*anchor.y/* - a.damping * a.velocity.y*/;
   
   force_b.x = -k*l*anchor.x/* - a.damping * a.velocity.x*/;
   force_b.y = -k*l*anchor.y /*- a.damping * a.velocity.y*/;
   
   force_a.add(a.gravity);
   force_b.add(b.gravity);
   
   a.applyForce(force_a);
   b.applyForce(force_b);
   
   
  }


  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}


