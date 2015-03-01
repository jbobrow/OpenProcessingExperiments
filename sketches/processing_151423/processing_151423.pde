
ovulo[] ovulos;


int cantidad;

void setup(){
    


size(600,600);
smooth();
colorMode(HSB);
background(0);

cantidad = 120;


ovulos = new ovulo[cantidad];



for (int i =0; i < cantidad; i++){


    ovulos[i] = new ovulo();
    ovulos[i].draw();

}





}




void draw(){
    
    background(0);
    
    for (int i =0; i < cantidad; i++){
        
    ovulos[i].move();
    ovulos[i].draw();


}


}







class ovulo {



float posX;
float posY;
float sizeX;
float sizeY;
color c;




    ovulo(){


        posX = random(width);
        posY = random(height);
        sizeX = 80;
        sizeY = 80;
        c = color (random(230,255),random(100,200),random(50,255));

        




    }


        void draw(){

            stroke(c);
            strokeWeight(random(1,5));
            noFill();
            ellipse(posX,posY,sizeX,sizeY);



}

        void move(){


                    posX = posX + random(-1,1);
                    posY = posY + random(-1,1);


                }   


}











