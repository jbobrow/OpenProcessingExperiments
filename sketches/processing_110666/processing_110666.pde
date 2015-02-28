
//Simple Particle System
//This skecth is based on this particle sytem tutorial by Seb Lee-Delisle
//http://www.openprocessing.org/sketch/49196
//Credits to the original author above for the excellent tutorial



Particle[] particleArr = new Particle[0];

PImage particleImg;

boolean clicked = true;

int maxParticles = 100;

void setup(){
    
    size(400,200);
    background(0);
    smooth();
    noStroke();

}//end of setup

void draw(){

    background(0);

    for(int i =0; i < 2 ; i++)
        particleArr = (Particle[]) append(particleArr , new Particle());
    
    for(int i = 0; i < particleArr.length; i++)
        particleArr[i].update();
        
    while(particleArr.length > maxParticles)
        particleArr = (Particle[]) subset(particleArr , 1);
        
    
}//end of draw


void mousePressed(){
    clicked = !clicked;
    
    if(clicked)
        noLoop();
    else
        loop();
}


// Start Class Definition

class Particle {
    
    float x;
    float y;
    
    float velX;
    float velY;
    
    float drag;
    
    color c;
    
    float size;
    float shrink;
    
    float gravity,opacity;
    int fade;
    
    Particle(){
        x = mouseX;
        y = mouseY;
        
        velX = random(-2 , 2);
        velY = random(-2 , 2);
        
        drag = 0.97;
        
        c = color(255);
        
        size = random(2 , 10);
        shrink = 1.04;
        
        gravity = -0.20;
        opacity = 255;
        fade = 5;
       
    }//end of constructor
    
    void update(){
        
        velX *= drag;
        velY *= drag;
        
        velY += gravity;
        
        x += velX;
        y += velY;
        
        size *= shrink;
        
        opacity -= fade;
        
        c = color(255 - fade , map(255 - size, 0 , width ,10 , 255), 255 - mouseX);
        
        if(opacity > 0){
            fill(c , opacity);
            ellipse( x , y , size , size);
            //rect( x - 10 , y , size, size);
        }
    
    }//end of update
    

}//end of class
