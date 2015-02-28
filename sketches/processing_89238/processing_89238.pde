
/*
* Creado por Christian Muñoz Chaparro
* Alumno de 1º de DAM del centro de estudios roca de barcelona
* 
* Este sketck crea unos vertices de medidas aleatorios de colores y transparencias aleatorias, 
* siempre y cuando la gente interactúe con éste.
*
*/ 

x=[30,30];
y=[30,30];

void setup() {
    //this is the size of the mediafacade, leave it unchanged
    size(192, 157);
    noStroke();
    frameRate(25);
    background(0);
    tracking.connect(); //start tracking
 
}
 
void draw () {
    background(0);
    /*
    here is were you can get the tracked blobs
    we recommend you to open de console of your
    web browser so you can see more details
    */

    tracking.getBlobs(function(blobs) {
        //  console.log(blobs);  
        for(int i = 0; i < blobs.length; i++ ){
            x[i] = blobs[i].x;
            y[i] = blobs[i].y;
          
            fill(random(255),random(255),random(255),random(100));
            beginShape();
            vertex(x[i], y[i]);
            bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
            endShape();
        }
    }); //end tracking 
}
