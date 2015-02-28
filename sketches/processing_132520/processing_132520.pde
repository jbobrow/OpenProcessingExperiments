
abstract class Juego {

    abstract public void _draw();
    
    abstract public void _mousePressed();
}

class Juego1 extends Juego {

    Juego1() {
        background(255, 0, 0);
    }

    public void _draw() {
        ellipseMode(CENTER);
        stroke(0, 40);
        fill(0, 20);
        ellipse(mouseX, mouseY, 10, 10);
    }
    
    public void _mousePressed() {
        juegoActivo = new Menu();
    }
    
    
}

class Juego2 extends Juego {

    private float alfa;
    
    Juego2() {
        background(80);
        alfa = height;
    }
    public void _draw() {
        fill(80, 120, 220);
        rect(0, alfa, width, height - alfa);
    }
    
    public void _mousePressed() {
        if (alfa > 0) {
            alfa -= 20;
        } else {
            juegoActivo = new Menu();
        }
    }
}

class Menu extends Juego {
    public void _draw() {
        noStroke();
        fill(255, 0, 0);
        rect(0, 0, width * .5, height);
        fill(0);
        rect(width * .5, 0, width * .5, height);
        
    }
    
    public void _mousePressed() {
        if(mouseX < width * .5) {
            juegoActivo = new Juego1();
        } else {
            juegoActivo = new Juego2();
        }
    }
}

Juego juegoActivo;

void setup() {
    juegoActivo = new Menu();
}

void draw() {
    juegoActivo._draw();
    }
    
void mousePressed() {
    juegoActivo._mousePressed();
   }
    
    
