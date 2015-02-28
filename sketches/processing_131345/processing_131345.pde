

//variables
float angle = 0.0;

void setup(){
    size(500, 500);
    background(0);
    smooth();
    
}

void draw(){

    //Dibujar al click
    if (mousePressed){

        translate(mouseX, mouseY);
        rotate(angle);
        rect(-15, -15, random(10, 40), random(10, 40));
        angle += 0.1;
        
    }

    //Determinar el color por cuadrante.
    if (mouseX < 250 && mouseY < 250){
        fill(random(0, 255), random(0, 255), random(0, 255),random(0, 255));
    } 

    else if (mouseX > 250 && mouseY < 250) {
        fill(0, 255, 255);  
    }

    else if (mouseX < 250 && mouseY > 250) {
        fill(255, 180, 0);  
    }

    else if (mouseX > 250 && mouseY > 250){
        fill(255, 150, 150);
    }
            
}


