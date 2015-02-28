
class Particle{
    PVector posiz;
    PVector velocita;
    color colore;
    float diametro;
    float raggio;
    boolean eliminaParticella;
    int age;
 
    Particle(PVector p, PVector v, color c, float d){
        posiz = p;
        velocita = PVector.add(PVector.div(v,2), new PVector(random(-3,3), random(-3, 3)));
        colore = c;
        diametro = d;
        raggio = d/2;
        eliminaParticella = false;
        age = (int)random(20, 60);
    }
 
    void move_(){
        move();
        display();
        if(age <= 0){
            eliminaParticella = true;
        }
    }
 
    void move(){
        posiz.add(velocita);
        age = age - 1;
    }
 
    void display(){
        fill(colore, map(age, 0 ,100, 0, 100) );
        ellipse(posiz.x, posiz.y, raggio, raggio);
    }
}
        

