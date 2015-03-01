
float num = 8;

void setup(){
    size(500,500);
    background(255);
    smooth();
}

void draw(){
    float dist = width/num;
    
    for(float i=1;i<num;i++){
        for (float n=1;n<num;n++){
            noFill();
            stroke(#cccccc);
            redondel(n*dist,i*dist,dist+n*4);
            redondel(n*dist,i*dist,dist*0.66-n*4);
            // or remove +- n*4 for uniform grid
            redondel(n*dist+dist/2, i*dist+dist/2,dist*0.75);
        }
        
    }
    
    if(keyPressed == true | key == 's'){
        saveFrame("img.jpg");
    }
}

void redondel(float tempX, float tempY, float tempSz){
    float x=tempX;
    float y=tempY;
    float sz=tempSz;
    
    ellipse(x,y,sz,sz);

}
