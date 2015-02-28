
//basado en la caratula de la revista https://mitpress.mit.edu/books/little-known-story-about-movement-magazine-and-computer’s-arrival-art
 
//pinta circulos en el canvas y toma el rrelleno de manera aleatoria
 
var radius = 20;
var nextX = radius/2;
var nextY = radius/2;
 
void setup() {
    background(1);
    size(800, 400); 
    smooth();
    frameRate(30);
    strokeWeight(2);
    stroke(255);
} 
 
void draw() {    
    //random fill
    if(round(random(1)) == 1 ){
        fill(1);
    }else{
        fill(200);//noFill();
    }    
    
    ellipse(nextX, nextY, radius, radius);
    
    //step to front
    nextX += radius + (radius/3);
    
    //step to bottom
    if(nextX >= width){
        nextX = radius/2;
        nextY += radius+(radius/3);
        
        //step to begin
        if(nextY >= height){
            nextY = radius/2;
            noLoop();
        }
    }
}
 
//restart the program
void mousePressed(){
    nextX = radius/2;
    nextY = radius/2;
    background(1);
    loop();
}
